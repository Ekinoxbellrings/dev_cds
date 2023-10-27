@AbapCatalog.sqlViewName: 'ZUEOZER_5936HW2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS HW 2'
define view ZUEOZER_5936_CDS_HW2
  as select from    vbrp

    inner join      vbrk on vbrp.vbeln = vbrk.vbeln

    inner join      mara on mara.matnr = vbrp.matnr

    left outer join vbak on vbak.vbeln = vbrp.aubel

    left outer join kna1 on kna1.kunnr = vbak.kunnr


    left outer join makt on  makt.matnr = makt.matnr
                         and makt.spras = $session.system_language
{
  key vbrp.vbeln,
  key vbrp.posnr,
      vbrp.aubel,
      vbak.kunnr,
      concat_with_space( kna1.name1  , kna1.name2 , 1 ) as ad,
      currency_conversion( 
      amount  => vbrp.netwr ,
      source_currency => vbrk.waerk,
      target_currency =>  vbrk.waerk ,
      exchange_rate_date => vbrk.fkdat ) as  conversion_netwr,
      left(kna1.kunnr,3) as kunnr_left,
      length(mara.matnr) as uzunluk,
      case vbrk.fkart
      when 'FAS' then 'Peşinat talebi iptali'
      when 'FAZ' then  'peşinat talebi'
      else 'Fatura'
      end as fatura_iptal
    ,
    vbrk.fkdat 
      
      
      


} 
