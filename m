Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AB810E5B5
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 16:15:47 +0000 (UTC)
Date: Mon, 13 Mar 2023 17:15:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313161542.zgs5kozghvjs7ts5@kamilkon-desk1>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-23-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215004648.2100655-23-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 22/31] lib/perf: Update MTL GT3 metrics
 for OAM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh,

here you have 
description="Number of read requests from stand alone media "
so 'samedia' is 'stan alone media' ?

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

On 2023-02-14 at 16:46:39 -0800, Umesh Nerlige Ramappa wrote:
> Add OAM metrics configurations and update MTL GT3 metrics.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  lib/i915/perf-configs/guids.xml     |   23 +-
>  lib/i915/perf-configs/oa-mtlgt3.xml | 1328 ++++++++++++++++++++++-----
>  2 files changed, 1133 insertions(+), 218 deletions(-)
> 
> diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
> index 0b96aa91..510450f8 100644
> --- a/lib/i915/perf-configs/guids.xml
> +++ b/lib/i915/perf-configs/guids.xml
> @@ -2507,12 +2507,12 @@
>      <guid config_hash="21fd6477790dc8803dd6331b8c41dd24" mdapi_config_hash="48c076d960ec7e094bc846058a20264f" id="9604dfeb-2724-459c-a25b-5e5e06d93fd8" chipset="mtlgt3" name="TDL3" />
>      <guid config_hash="95b5a166dff16d27293d7d657c146c20" mdapi_config_hash="742195ae50b801b9c5d680a5a9558cb0" id="b5333a47-add0-46a5-82d9-e62dcee14e81" chipset="mtlgt3" name="TDL4" />
>      <guid config_hash="269711b73f95981cabbcdee5a96a9ccb" mdapi_config_hash="c4289990e5c8cbd4918e9c2c333f251c" id="7272a7b8-6df2-4180-a95f-2ef7ad4412cc" chipset="mtlgt3" name="TestOa" />
> -    <guid config_hash="d439e67a55ee3ca7a70a35714c53bb52" mdapi_config_hash="8247df78555a4b792c33f0efa550952f" id="682c3520-dffc-4a76-8e17-1d9effc01a1a" chipset="mtlgt3" name="Ext1" />
> +    <guid config_hash="6d1cd0ed097d034869eb468b43dd879a" mdapi_config_hash="d6e43578c93c9c1ba32a063e36fa10cc" id="682c3520-dffc-4a76-8e17-1d9effc01a1a" chipset="mtlgt3" name="Ext1" />
>      <guid config_hash="e06924155d4acde10c45e89e6c65868d" mdapi_config_hash="eb6499f1a47dad7eae75cdb85b0bef2a" id="b24b7052-70a1-4ef7-b61d-7ee4d7e159ab" chipset="mtlgt3" name="Ext3" />
>      <guid config_hash="fc06c18d17085caa964777920a316cf4" mdapi_config_hash="e80db872fee6810d6f47a683a4a1c9ce" id="205ab9ab-56fd-4fdc-b3b3-91dc57be0fd3" chipset="mtlgt3" name="Ext4" />
>      <guid config_hash="939e13be9335004538a9e1d6944b4836" mdapi_config_hash="71a1bb2c5722c63fcf7176f6c61975a4" id="26cb7ee1-a26d-410a-9283-e07d6ced5fce" chipset="mtlgt3" name="Ext5" />
>      <guid config_hash="6e82d13da5cd70235fefab3b43e9e4c9" mdapi_config_hash="561b960bd69e9823d50cfae86614fabd" id="e62c9cd7-ada7-487d-87aa-b1ad4ab9a2c5" chipset="mtlgt3" name="Ext6" />
> -    <guid config_hash="070c9de0d068a9aacf8674c062374e05" mdapi_config_hash="1293975723eab282470ebaa4c97faa70" id="714e9d80-e4e3-40e6-9e79-2ca6d1d0a5a5" chipset="mtlgt3" name="Ext7" />
> +    <guid config_hash="baa81cf9fb16c0a5e738fc023f371350" mdapi_config_hash="614db897903581ee199202e79c94ca6c" id="714e9d80-e4e3-40e6-9e79-2ca6d1d0a5a5" chipset="mtlgt3" name="Ext7" />
>      <guid config_hash="5660b1f0e0ba49d22c1eaef513c8b58a" mdapi_config_hash="31ab651e5dc06042c8d2248f65a75d73" id="30499dfb-3977-4808-a34c-93e7b50e0454" chipset="mtlgt3" name="Ext8" />
>      <guid config_hash="b3b01ef016a1c55d9d932400511dd7cc" mdapi_config_hash="b4c689c289687c4df0e2523faf70cc4f" id="417618f2-7a87-4745-bccd-6ba14d17bfa4" chipset="mtlgt3" name="Ext9" />
>      <guid config_hash="97c49cf8f71f5bf86035d3bf6cb690c9" mdapi_config_hash="e25449627d90b790133b98f4a92657e1" id="443c32c7-e5e4-43da-b4f2-77efe45a60ed" chipset="mtlgt3" name="Ext10" />
> @@ -2698,14 +2698,14 @@
>      <guid config_hash="25302806331fba9bc9f3450e0e642e96" mdapi_config_hash="d5a07d5812d1d12b522960872fd28137" id="f6e20d5b-52be-4035-85c2-818a690bf601" chipset="mtlgt3" name="Ext501" />
>      <guid config_hash="b206b0dc53133698a7ca18febc7e320a" mdapi_config_hash="80d90f8d67609d99b1b85717ee3f9cd2" id="d09cedef-e3e3-41b5-8ce8-ddc3933339ca" chipset="mtlgt3" name="Ext502" />
>      <guid config_hash="2c857922a97a5830183ca8b8efb72008" mdapi_config_hash="dbc6d492e27a8a6cfa2063ba2ca11edf" id="96067625-3663-4f9a-8b26-74e47ab1aff4" chipset="mtlgt3" name="Ext503" />
> -    <guid config_hash="c77afaf69426cacf0d39b737afa6cbac" mdapi_config_hash="09e22d191f45567e982863a37d9c382d" id="2bc8b90d-997c-4d62-b101-fe1aa74036e5" chipset="mtlgt3" name="Ext508" />
> -    <guid config_hash="530cf98a637fc90c254c75c3bd9dedfb" mdapi_config_hash="25f6d07bddccffeaab56aadb24ae6be5" id="79252877-1dcd-4700-b4bd-58bce74b796d" chipset="mtlgt3" name="Ext509" />
> -    <guid config_hash="e8ab95f7c69adc8f259904c1de459856" mdapi_config_hash="2c1390b1ce682645b58f2396701c0d4b" id="68ac1770-b062-48cd-94f4-44c6ae16867a" chipset="mtlgt3" name="Ext510" />
> -    <guid config_hash="a15516d4ed73424ae36e6d4d1b95a200" mdapi_config_hash="59c1035f145bb7e00fb0b0d622feace5" id="443b8a84-7e77-4e9f-8a2a-56743897cba3" chipset="mtlgt3" name="Ext511" />
> -    <guid config_hash="ae9653c036a3dc324743f6ccac40eb92" mdapi_config_hash="285cd0a99124ba6a244a47577c34e3eb" id="68581669-8e57-4ff9-bb70-71a99f8454c8" chipset="mtlgt3" name="Ext512" />
> -    <guid config_hash="a1122c9120f4a345403dcb9be51afc13" mdapi_config_hash="26f2e86d15758105a9406c379bc83b80" id="1b49d31f-4d7c-4dd7-ad31-030ccb59649e" chipset="mtlgt3" name="Ext513" />
> -    <guid config_hash="54126b539d950f606053619014452c83" mdapi_config_hash="06e7700eb4e4ba08285b4fc0316db6ad" id="1b0ce68b-c301-4d05-8659-85fad0825057" chipset="mtlgt3" name="Ext514" />
> -    <guid config_hash="8667c4542c2ece365f0439a3659c4267" mdapi_config_hash="c5d806b0e6a6c7be6d1ad75a69a2527b" id="fde32e67-1a87-4946-bf96-c1ff68105749" chipset="mtlgt3" name="Ext515" />
> +    <guid config_hash="b89becafa0012d0119ce4251d4266b2c" mdapi_config_hash="83261cb3061414efb24e04580990df45" id="2bc8b90d-997c-4d62-b101-fe1aa74036e5" chipset="mtlgt3" name="Ext508" />
> +    <guid config_hash="aec3fc91255b37e4f7a9f5019f5a01e0" mdapi_config_hash="993dc808e586668f20473bfc21356dae" id="79252877-1dcd-4700-b4bd-58bce74b796d" chipset="mtlgt3" name="Ext509" />
> +    <guid config_hash="059b5bdee62d6b61c00848beeb2751e2" mdapi_config_hash="624661deaf5382d8c447936b0760f2ac" id="68ac1770-b062-48cd-94f4-44c6ae16867a" chipset="mtlgt3" name="Ext510" />
> +    <guid config_hash="2c302efab54ba8133e020e08c44f19e5" mdapi_config_hash="0d150ac4cdc7a15a37706b2499af5490" id="443b8a84-7e77-4e9f-8a2a-56743897cba3" chipset="mtlgt3" name="Ext511" />
> +    <guid config_hash="d01972b09245455a8a53df3ee5b0de48" mdapi_config_hash="1b6e276e805087093a4002d1a2fc59d4" id="68581669-8e57-4ff9-bb70-71a99f8454c8" chipset="mtlgt3" name="Ext512" />
> +    <guid config_hash="980fc02bcda49523aae80255d30dd8d9" mdapi_config_hash="9083f055e06214711443b1aa92209a51" id="1b49d31f-4d7c-4dd7-ad31-030ccb59649e" chipset="mtlgt3" name="Ext513" />
> +    <guid config_hash="d4c01604867190e57eb85b43ea35b19d" mdapi_config_hash="f0cc4cfd7a9d70f2d1c3464dedad851d" id="1b0ce68b-c301-4d05-8659-85fad0825057" chipset="mtlgt3" name="Ext514" />
> +    <guid config_hash="019a6367c845719ff7381414a99781ff" mdapi_config_hash="2b95a32768f0449b837fb9915ed514d9" id="fde32e67-1a87-4946-bf96-c1ff68105749" chipset="mtlgt3" name="Ext515" />
>      <guid config_hash="5ad38daa6cb00090cfb6658a43d30d06" mdapi_config_hash="ba325785aeb3c90926c9955686094006" id="bf950c5b-7250-47f4-aa59-d97b22db02ff" chipset="mtlgt3" name="Ext516" />
>      <guid config_hash="5093d322d1b278f2e323e259408c7b30" mdapi_config_hash="2e6f2f19cb9752141887cbe4bd057819" id="9027ff05-4348-4061-a434-0befaba7c379" chipset="mtlgt3" name="Ext517" />
>      <guid config_hash="9d968609fbc2e37f71dca7e2b5eddea6" mdapi_config_hash="b2cbdc9610f599b7c65f6100260049f0" id="6ad0dee9-17bf-4b54-8b70-e30afcc8710b" chipset="mtlgt3" name="Ext518" />
> @@ -2743,4 +2743,7 @@
>      <guid config_hash="482cebdeeb78bb56e67b42d24644c8db" mdapi_config_hash="11e33e01a371bf15e59b9786f4fe1050" id="de84260e-32ac-4863-ba4f-998a685174a2" chipset="mtlgt2" name="MediaSet1" />
>      <guid config_hash="5bfab887a79b99cf34a606dcca5f4f8a" mdapi_config_hash="1c238e39e5c73eefd870cef2fb7a18af" id="b9d5c6d5-39f2-4069-b343-e7a886353b89" chipset="mtlgt2" name="MediaSet2" />
>      <guid config_hash="44bcb438bea8b46b57779739bebfbd69" mdapi_config_hash="fbbd97d1f3b60c17eae57bbd3c42e7fe" id="a1700053-56bc-4b7e-87b9-e29b07a08f62" chipset="mtlgt2" name="TestOam" />
> +    <guid config_hash="482cebdeeb78bb56e67b42d24644c8db" mdapi_config_hash="11e33e01a371bf15e59b9786f4fe1050" id="4d9b2817-19b9-4461-a54b-dc9fdb7d69cb" chipset="mtlgt3" name="MediaSet1" />
> +    <guid config_hash="5bfab887a79b99cf34a606dcca5f4f8a" mdapi_config_hash="1c238e39e5c73eefd870cef2fb7a18af" id="651a6694-0ac1-4bd5-a4a1-94bcf479d4f4" chipset="mtlgt3" name="MediaSet2" />
> +    <guid config_hash="44bcb438bea8b46b57779739bebfbd69" mdapi_config_hash="fbbd97d1f3b60c17eae57bbd3c42e7fe" id="bac01106-5869-489c-a306-67303a434173" chipset="mtlgt3" name="TestOam" />
>  </guids>
> diff --git a/lib/i915/perf-configs/oa-mtlgt3.xml b/lib/i915/perf-configs/oa-mtlgt3.xml
> index 400e1ff4..5e173865 100644
> --- a/lib/i915/perf-configs/oa-mtlgt3.xml
> +++ b/lib/i915/perf-configs/oa-mtlgt3.xml
> @@ -1,10 +1,11 @@
>  <?xml version="1.0"?>
> -<metrics version="1669276497" merge_md5="">
> +<metrics version="1675300133" merge_md5="">
>    <set name="Render Metrics Basic"
>         chipset="MTLGT3"
>         symbol_name="RenderBasic"
>         underscore_name="render_basic"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1124d1b6-6182-4b5a-950b-27b38ef7c996"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -579,6 +580,7 @@
>         symbol_name="ComputeBasic"
>         underscore_name="compute_basic"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="522743d7-4e01-461a-8600-7904e8ddc80c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -1132,6 +1134,7 @@
>         symbol_name="AsyncCompute"
>         underscore_name="async_compute"
>         mdapi_supported_apis="OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d9edd254-60e8-4ce0-82b1-7b3de3bc79a6"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -1474,6 +1477,7 @@
>         symbol_name="XveActivity"
>         underscore_name="xve_activity"
>         mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="703a9693-1444-4e7c-a235-1c4d6ee01943"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -1772,6 +1776,7 @@
>         symbol_name="GpuBusyness"
>         underscore_name="gpu_busyness"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="edae72d3-bb06-47af-87b4-7585274c6076"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -2030,6 +2035,7 @@
>         symbol_name="HDCAndSF1"
>         underscore_name="hdc_and_sf1"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e1a408d6-aece-4bde-8bbd-1c7fbfff02cf"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -2233,6 +2239,7 @@
>         symbol_name="HDCAndSF2"
>         underscore_name="hdc_and_sf2"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="374e8aa3-09df-4d69-ad32-3133f6ad3c86"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -2438,6 +2445,7 @@
>         symbol_name="L3"
>         underscore_name="l3"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="580d5311-4e9d-4210-b419-37259ffcd3f2"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -2816,6 +2824,7 @@
>         symbol_name="RasterizerAndPixelBackend1"
>         underscore_name="rasterizer_and_pixel_backend1"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="4286bd8f-f9db-45e5-aa37-51dd7067f751"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -3060,6 +3069,7 @@
>         symbol_name="RasterizerAndPixelBackend2"
>         underscore_name="rasterizer_and_pixel_backend2"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ac90f98d-14a6-4dcc-b5d7-31ee157bb6e2"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -3261,6 +3271,7 @@
>         symbol_name="RenderPipeProfile1"
>         underscore_name="render_pipe_profile1"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f15b97f6-eb1b-43a8-839c-7bd956c143c4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -3655,6 +3666,7 @@
>         symbol_name="RenderPipeProfile2"
>         underscore_name="render_pipe_profile2"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="86b9199d-8a44-4694-bbde-6fd35bada236"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -4049,6 +4061,7 @@
>         symbol_name="Sampler"
>         underscore_name="sampler"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ae70a69c-341d-492a-b703-afa08a3497ba"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -4482,6 +4495,7 @@
>         symbol_name="TDL1"
>         underscore_name="tdl1"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cf27081a-d750-4c9d-8a19-154f976992ee"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -4833,6 +4847,7 @@
>         symbol_name="TDL2"
>         underscore_name="tdl2"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fa292653-8b18-448b-b57e-8e8ff92fac11"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -5179,6 +5194,7 @@
>         symbol_name="TDL3"
>         underscore_name="tdl3"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9604dfeb-2724-459c-a25b-5e5e06d93fd8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -5532,6 +5548,7 @@
>         symbol_name="TDL4"
>         underscore_name="tdl4"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b5333a47-add0-46a5-82d9-e62dcee14e81"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -5880,6 +5897,7 @@
>         symbol_name="TestOa"
>         underscore_name="test_oa"
>         mdapi_supported_apis="VK OGL OCL MEDIA IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7272a7b8-6df2-4180-a95f-2ef7ad4412cc"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -6104,6 +6122,7 @@
>         symbol_name="Ext1"
>         underscore_name="ext1"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="682c3520-dffc-4a76-8e17-1d9effc01a1a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -6153,7 +6172,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 7 READ 128 UMUL"
> +             equation="B 2 READ 128 UMUL"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6166,7 +6185,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 6 READ 128 UMUL"
> +             equation="B 3 READ 128 UMUL"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6179,7 +6198,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 5 READ"
> +             equation="B 4 READ"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6192,7 +6211,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 4 READ"
> +             equation="B 5 READ"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6218,7 +6237,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 3 READ C 2 READ UADD"
> +             equation="B 6 READ B 7 READ UADD"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6231,7 +6250,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 1 READ C 0 READ UADD"
> +             equation="C 0 READ C 1 READ UADD"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6257,7 +6276,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 7 READ 128 UMUL"
> +             equation="C 2 READ 128 UMUL"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6270,7 +6289,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 6 READ 128 UMUL"
> +             equation="C 3 READ 128 UMUL"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6284,7 +6303,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
> +             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6298,7 +6317,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
> +             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6364,7 +6383,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
> +             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6378,7 +6397,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
> +             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
>               mdapi_supported_apis=""
> @@ -6387,36 +6406,36 @@
>      <register_config type="NOA">
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
> -        <register type="NOA" address="0x00009888" value="0x15010007" />
> -        <register type="NOA" address="0x00009888" value="0x17053400" />
> -        <register type="NOA" address="0x00009888" value="0x15210007" />
> -        <register type="NOA" address="0x00009888" value="0x17253400" />
> -        <register type="NOA" address="0x00009888" value="0x0007BBE0" />
> -        <register type="NOA" address="0x00009888" value="0x0207BBAF" />
> +        <register type="NOA" address="0x00009888" value="0x150100E0" />
> +        <register type="NOA" address="0x00009888" value="0x17051000" />
> +        <register type="NOA" address="0x00009888" value="0x152100E0" />
> +        <register type="NOA" address="0x00009888" value="0x17251000" />
> +        <register type="NOA" address="0x00009888" value="0x0007AEE0" />
> +        <register type="NOA" address="0x00009888" value="0x0207BEEF" />
>          <register type="NOA" address="0x00009888" value="0x0001AAA0" />
>          <register type="NOA" address="0x00009888" value="0x0201AAAA" />
>          <register type="NOA" address="0x00009888" value="0x03010004" />
> -        <register type="NOA" address="0x00009888" value="0x09010180" />
> -        <register type="NOA" address="0x00009888" value="0x0B010380" />
> -        <register type="NOA" address="0x00009888" value="0x0F010147" />
> -        <register type="NOA" address="0x00009888" value="0x110103C0" />
> -        <register type="NOA" address="0x00009888" value="0x13010340" />
> -        <register type="NOA" address="0x00009888" value="0x01010004" />
> +        <register type="NOA" address="0x00009888" value="0x07010005" />
> +        <register type="NOA" address="0x00009888" value="0x09010007" />
> +        <register type="NOA" address="0x00009888" value="0x0B0103CD" />
> +        <register type="NOA" address="0x00009888" value="0x0F010006" />
> +        <register type="NOA" address="0x00009888" value="0x1101000E" />
> +        <register type="NOA" address="0x00009888" value="0x01018000" />
>          <register type="NOA" address="0x00009888" value="0x03050004" />
> -        <register type="NOA" address="0x00009888" value="0x07050080" />
> +        <register type="NOA" address="0x00009888" value="0x15050005" />
>          <register type="NOA" address="0x00009888" value="0x01050000" />
>          <register type="NOA" address="0x00009888" value="0x03210004" />
> -        <register type="NOA" address="0x00009888" value="0x09210006" />
> -        <register type="NOA" address="0x00009888" value="0x0B21000E" />
> -        <register type="NOA" address="0x00009888" value="0x0D210147" />
> -        <register type="NOA" address="0x00009888" value="0x1121000F" />
> -        <register type="NOA" address="0x00009888" value="0x1321000D" />
> -        <register type="NOA" address="0x00009888" value="0x01210008" />
> +        <register type="NOA" address="0x00009888" value="0x07210140" />
> +        <register type="NOA" address="0x00009888" value="0x092101C0" />
> +        <register type="NOA" address="0x00009888" value="0x0D2103CD" />
> +        <register type="NOA" address="0x00009888" value="0x0F210180" />
> +        <register type="NOA" address="0x00009888" value="0x11210380" />
> +        <register type="NOA" address="0x00009888" value="0x01214000" />
>          <register type="NOA" address="0x00009888" value="0x03250004" />
> -        <register type="NOA" address="0x00009888" value="0x09250002" />
> +        <register type="NOA" address="0x00009888" value="0x13250140" />
>          <register type="NOA" address="0x00009888" value="0x01250000" />
>          <register type="NOA" address="0x00009888" value="0x56010000" />
> -        <register type="NOA" address="0x00009888" value="0x58010000" />
> +        <register type="NOA" address="0x00009888" value="0x58010201" />
>          <register type="NOA" address="0x00009888" value="0x5A010010" />
>          <register type="NOA" address="0x00009888" value="0x5C010201" />
>          <register type="NOA" address="0x00009888" value="0x5E010010" />
> @@ -6425,7 +6444,7 @@
>          <register type="NOA" address="0x00009888" value="0x4E010010" />
>          <register type="NOA" address="0x00009888" value="0x50010201" />
>          <register type="NOA" address="0x00009888" value="0x52010010" />
> -        <register type="NOA" address="0x00009888" value="0x54010201" />
> +        <register type="NOA" address="0x00009888" value="0x54010000" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
>          <register type="NOA" address="0x00009888" value="0x72010002" />
>      </register_config>
> @@ -6446,6 +6465,7 @@
>         symbol_name="Ext3"
>         underscore_name="ext3"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b24b7052-70a1-4ef7-b61d-7ee4d7e159ab"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -6692,6 +6712,7 @@
>         symbol_name="Ext4"
>         underscore_name="ext4"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="205ab9ab-56fd-4fdc-b3b3-91dc57be0fd3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -7049,6 +7070,7 @@
>         symbol_name="Ext5"
>         underscore_name="ext5"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="26cb7ee1-a26d-410a-9283-e07d6ced5fce"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -7401,6 +7423,7 @@
>         symbol_name="Ext6"
>         underscore_name="ext6"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e62c9cd7-ada7-487d-87aa-b1ad4ab9a2c5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -7824,6 +7847,7 @@
>         symbol_name="Ext7"
>         underscore_name="ext7"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="714e9d80-e4e3-40e6-9e79-2ca6d1d0a5a5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -7873,7 +7897,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 7 READ"
> +             equation="B 0 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7887,7 +7911,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 6 READ"
> +             equation="B 1 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7901,7 +7925,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 5 READ"
> +             equation="B 2 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7915,7 +7939,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 4 READ"
> +             equation="B 3 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7929,7 +7953,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 3 READ"
> +             equation="B 4 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7943,7 +7967,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 2 READ"
> +             equation="B 5 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7957,7 +7981,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 1 READ"
> +             equation="B 6 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7971,7 +7995,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="C 0 READ"
> +             equation="B 7 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7985,7 +8009,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 7 READ"
> +             equation="C 7 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -7999,7 +8023,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 6 READ"
> +             equation="C 6 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8013,7 +8037,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 5 READ"
> +             equation="C 5 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8027,7 +8051,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 4 READ"
> +             equation="C 4 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8041,7 +8065,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 3 READ"
> +             equation="C 3 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8055,7 +8079,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 2 READ"
> +             equation="C 2 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8069,7 +8093,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 1 READ"
> +             equation="C 1 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8083,7 +8107,7 @@
>               data_type="uint64"
>               units="events"
>               semantic_type="event"
> -             equation="B 0 READ"
> +             equation="C 0 READ"
>               availability="$SliceMask 3 0 2 UMUL &lt;&lt; AND"
>               mdapi_group="GTI/L3"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -8094,9 +8118,9 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
>          <register type="NOA" address="0x00009888" value="0x03010000" />
> -        <register type="NOA" address="0x00009888" value="0x0B010040" />
> +        <register type="NOA" address="0x00009888" value="0x0B010000" />
>          <register type="NOA" address="0x00009888" value="0x03210000" />
> -        <register type="NOA" address="0x00009888" value="0x0B210001" />
> +        <register type="NOA" address="0x00009888" value="0x0B210000" />
>          <register type="NOA" address="0x00009888" value="0x03410000" />
>          <register type="NOA" address="0x00009888" value="0x0B410000" />
>          <register type="NOA" address="0x00009888" value="0x03610000" />
> @@ -8106,56 +8130,55 @@
>          <register type="NOA" address="0x00009888" value="0x03A10000" />
>          <register type="NOA" address="0x00009888" value="0x0BA10000" />
>          <register type="NOA" address="0x00009888" value="0x03C10000" />
> -        <register type="NOA" address="0x00009888" value="0x0BC10000" />
> +        <register type="NOA" address="0x00009888" value="0x0BC10006" />
>          <register type="NOA" address="0x00009888" value="0x03E10000" />
> -        <register type="NOA" address="0x00009888" value="0x0BE10000" />
> -        <register type="NOA" address="0x00009888" value="0x00025500" />
> +        <register type="NOA" address="0x00009888" value="0x0BE10180" />
> +        <register type="NOA" address="0x00009888" value="0x00020055" />
>          <register type="NOA" address="0x00009888" value="0x02025500" />
> -        <register type="NOA" address="0x00009888" value="0x00820055" />
> +        <register type="NOA" address="0x00009888" value="0x00825500" />
>          <register type="NOA" address="0x00009888" value="0x02820055" />
> -        <register type="NOA" address="0x00009888" value="0x01010004" />
> -        <register type="NOA" address="0x00009888" value="0x13010380" />
> -        <register type="NOA" address="0x00009888" value="0x01210004" />
> -        <register type="NOA" address="0x00009888" value="0x1321000E" />
> -        <register type="NOA" address="0x00009888" value="0x01410004" />
> -        <register type="NOA" address="0x00009888" value="0x09410040" />
> -        <register type="NOA" address="0x00009888" value="0x11410380" />
> -        <register type="NOA" address="0x00009888" value="0x01610004" />
> -        <register type="NOA" address="0x00009888" value="0x09610001" />
> -        <register type="NOA" address="0x00009888" value="0x1161000E" />
> -        <register type="NOA" address="0x00009888" value="0x00015000" />
> -        <register type="NOA" address="0x00009888" value="0x0201009C" />
> +        <register type="NOA" address="0x00009888" value="0x01010040" />
> +        <register type="NOA" address="0x00009888" value="0x05010006" />
> +        <register type="NOA" address="0x00009888" value="0x13010200" />
> +        <register type="NOA" address="0x00009888" value="0x01210040" />
> +        <register type="NOA" address="0x00009888" value="0x05210180" />
> +        <register type="NOA" address="0x00009888" value="0x13210008" />
> +        <register type="NOA" address="0x00009888" value="0x01410040" />
> +        <register type="NOA" address="0x00009888" value="0x07410006" />
> +        <register type="NOA" address="0x00009888" value="0x11410200" />
> +        <register type="NOA" address="0x00009888" value="0x01610040" />
> +        <register type="NOA" address="0x00009888" value="0x07610180" />
> +        <register type="NOA" address="0x00009888" value="0x11610008" />
> +        <register type="NOA" address="0x00009888" value="0x00010B1A" />
>          <register type="NOA" address="0x00009888" value="0x04013940" />
>          <register type="NOA" address="0x00009888" value="0x06010002" />
> -        <register type="NOA" address="0x00009888" value="0x01810004" />
> -        <register type="NOA" address="0x00009888" value="0x07810040" />
> -        <register type="NOA" address="0x00009888" value="0x0F810380" />
> -        <register type="NOA" address="0x00009888" value="0x01A10004" />
> -        <register type="NOA" address="0x00009888" value="0x07A10001" />
> -        <register type="NOA" address="0x00009888" value="0x0FA1000E" />
> -        <register type="NOA" address="0x00009888" value="0x01C10004" />
> -        <register type="NOA" address="0x00009888" value="0x05C10040" />
> -        <register type="NOA" address="0x00009888" value="0x0DC10380" />
> -        <register type="NOA" address="0x00009888" value="0x01E10004" />
> -        <register type="NOA" address="0x00009888" value="0x05E10001" />
> -        <register type="NOA" address="0x00009888" value="0x0DE1000E" />
> -        <register type="NOA" address="0x00009888" value="0x008104E5" />
> -        <register type="NOA" address="0x00009888" value="0x02814A00" />
> +        <register type="NOA" address="0x00009888" value="0x01810040" />
> +        <register type="NOA" address="0x00009888" value="0x09810006" />
> +        <register type="NOA" address="0x00009888" value="0x0F810200" />
> +        <register type="NOA" address="0x00009888" value="0x01A10040" />
> +        <register type="NOA" address="0x00009888" value="0x09A10180" />
> +        <register type="NOA" address="0x00009888" value="0x0FA10008" />
> +        <register type="NOA" address="0x00009888" value="0x01C10040" />
> +        <register type="NOA" address="0x00009888" value="0x0DC10200" />
> +        <register type="NOA" address="0x00009888" value="0x01E10040" />
> +        <register type="NOA" address="0x00009888" value="0x0DE10008" />
> +        <register type="NOA" address="0x00009888" value="0x00812000" />
> +        <register type="NOA" address="0x00009888" value="0x02814B63" />
>          <register type="NOA" address="0x00009888" value="0x04810013" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
> -        <register type="NOA" address="0x00009888" value="0x00050F0F" />
> +        <register type="NOA" address="0x00009888" value="0x00050FF0" />
>          <register type="NOA" address="0x00009888" value="0x0002FFFF" />
>          <register type="NOA" address="0x00009888" value="0x00015555" />
>          <register type="NOA" address="0x00009888" value="0x02015555" />
> -        <register type="NOA" address="0x00009888" value="0x0003AA55" />
> +        <register type="NOA" address="0x00009888" value="0x000355AA" />
>          <register type="NOA" address="0x00009888" value="0x0203AA55" />
> -        <register type="NOA" address="0x00009888" value="0x00040F0F" />
> -        <register type="NOA" address="0x00009888" value="0x4C010000" />
> -        <register type="NOA" address="0x00009888" value="0x56010020" />
> -        <register type="NOA" address="0x00009888" value="0x58010401" />
> -        <register type="NOA" address="0x00009888" value="0x5A010030" />
> -        <register type="NOA" address="0x00009888" value="0x5C010804" />
> -        <register type="NOA" address="0x00009888" value="0x5E010020" />
> +        <register type="NOA" address="0x00009888" value="0x00040FF0" />
> +        <register type="NOA" address="0x00009888" value="0x4C010400" />
> +        <register type="NOA" address="0x00009888" value="0x56010040" />
> +        <register type="NOA" address="0x00009888" value="0x58010604" />
> +        <register type="NOA" address="0x00009888" value="0x5A010020" />
> +        <register type="NOA" address="0x00009888" value="0x5C010401" />
> +        <register type="NOA" address="0x00009888" value="0x5E010000" />
>          <register type="NOA" address="0x00009888" value="0x06010000" />
>          <register type="NOA" address="0x00009888" value="0x60010400" />
>          <register type="NOA" address="0x00009888" value="0x4E010010" />
> @@ -8182,6 +8205,7 @@
>         symbol_name="Ext8"
>         underscore_name="ext8"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="30499dfb-3977-4808-a34c-93e7b50e0454"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -8536,6 +8560,7 @@
>         symbol_name="Ext9"
>         underscore_name="ext9"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="417618f2-7a87-4745-bccd-6ba14d17bfa4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -8756,6 +8781,7 @@
>         symbol_name="Ext10"
>         underscore_name="ext10"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="443c32c7-e5e4-43da-b4f2-77efe45a60ed"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -9110,6 +9136,7 @@
>         symbol_name="Ext11"
>         underscore_name="ext11"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3833e442-880a-4746-9df1-6347b7e5a081"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -9464,6 +9491,7 @@
>         symbol_name="Ext12"
>         underscore_name="ext12"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="931bb082-6f87-450e-8910-fd6a4ab206f7"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -9828,6 +9856,7 @@
>         symbol_name="Ext13"
>         underscore_name="ext13"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f7fdd159-e273-47ab-99bc-f4fc410c6053"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -10058,6 +10087,7 @@
>         symbol_name="Ext14"
>         underscore_name="ext14"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="423732fb-f20a-4549-b632-53ac587668d9"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -10290,6 +10320,7 @@
>         symbol_name="Ext15"
>         underscore_name="ext15"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0fa8f991-d412-4014-a7a7-be08ccf5fc4c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -10530,6 +10561,7 @@
>         symbol_name="Ext16"
>         underscore_name="ext16"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e37de2da-c16f-4b2a-82bc-e1062fabfa2a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -10772,6 +10804,7 @@
>         symbol_name="Ext17"
>         underscore_name="ext17"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e8a60701-f694-496d-95be-34cc80796a46"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -10882,7 +10915,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 7 READ B 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
> +             equation="B 7 READ B 6 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
>               availability="$GtSlice0XeCore0"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -10897,7 +10930,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 1 READ B 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
> +             equation="B 1 READ B 0 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
>               availability="$GtSlice0XeCore1"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -10912,7 +10945,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 3 READ B 2 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
> +             equation="B 3 READ B 2 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
>               availability="$GtSlice0XeCore2"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -10927,7 +10960,7 @@
>               max_equation="100"
>               units="percent"
>               semantic_type="duration"
> -             equation="B 5 READ B 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
> +             equation="B 5 READ B 4 READ FADD 2 FDIV 100 UMUL $GpuCoreClocks FDIV"
>               availability="$GtSlice0XeCore3"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -11020,6 +11053,7 @@
>         symbol_name="Ext18"
>         underscore_name="ext18"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1c957158-09ff-4a89-aa5b-3c1b4e46f9ba"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -11270,6 +11304,7 @@
>         symbol_name="Ext21"
>         underscore_name="ext21"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a0b46166-6078-4045-8321-6df39b8e8ced"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -11514,6 +11549,7 @@
>         symbol_name="Ext22"
>         underscore_name="ext22"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="92371114-aa03-46d8-ab34-6e843fc92123"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -11760,6 +11796,7 @@
>         symbol_name="Ext23"
>         underscore_name="ext23"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c7cd47a5-39e8-4c58-9b4f-a9c6df869db8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -11954,6 +11991,7 @@
>         symbol_name="Ext24"
>         underscore_name="ext24"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2adf2c05-e151-4fa7-9e77-2331bd94235e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -12150,6 +12188,7 @@
>         symbol_name="Ext28"
>         underscore_name="ext28"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1fcdcf0a-54da-4397-8832-c884d8d0b3ff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -12394,6 +12433,7 @@
>         symbol_name="Ext29"
>         underscore_name="ext29"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9701aca8-76a6-49ee-96c9-ff983f24d29e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -12640,6 +12680,7 @@
>         symbol_name="Ext31"
>         underscore_name="ext31"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f47e74cf-7966-43ea-bbac-46f9a0d1dc1f"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -12830,6 +12871,7 @@
>         symbol_name="Ext32"
>         underscore_name="ext32"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3e220edc-390e-4964-9e57-4d45f3e01de8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13022,6 +13064,7 @@
>         symbol_name="Ext35"
>         underscore_name="ext35"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d334294d-8dd2-4ae2-ae31-7d0d4acc2b6b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13212,6 +13255,7 @@
>         symbol_name="Ext36"
>         underscore_name="ext36"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b749495f-4fc4-4e54-965e-38990758473b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13404,6 +13448,7 @@
>         symbol_name="Ext39"
>         underscore_name="ext39"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="09c0f842-3711-48f5-bf3e-74c1caa9f791"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13598,6 +13643,7 @@
>         symbol_name="Ext40"
>         underscore_name="ext40"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="be7c864e-0538-420d-916d-ce3aed7742ba"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13794,6 +13840,7 @@
>         symbol_name="Ext43"
>         underscore_name="ext43"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="86cf3d13-947b-4f7f-9685-1ff59ec342dd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -13974,6 +14021,7 @@
>         symbol_name="Ext44"
>         underscore_name="ext44"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7675136e-a91e-4bf8-b206-32591b878339"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -14156,6 +14204,7 @@
>         symbol_name="Ext45"
>         underscore_name="ext45"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e953dbdb-3451-4912-80ae-241ecc56a59e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -14331,6 +14380,7 @@
>         symbol_name="Ext46"
>         underscore_name="ext46"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="94219d74-6a23-4b93-bf62-88c9ad4ed4bd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -14508,6 +14558,7 @@
>         symbol_name="Ext51"
>         underscore_name="ext51"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cab52f96-c6bf-48ca-a34e-17e52cadc8a6"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -14759,6 +14810,7 @@
>         symbol_name="Ext53"
>         underscore_name="ext53"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e4597eb9-ffa4-4da5-a180-5e12299f22cc"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -14949,6 +15001,7 @@
>         symbol_name="Ext54"
>         underscore_name="ext54"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0a11c113-298b-4f77-a085-1b7cac225015"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -15141,6 +15194,7 @@
>         symbol_name="Ext57"
>         underscore_name="ext57"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6f983509-03f1-463a-be88-3e4a40de40b4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -15331,6 +15385,7 @@
>         symbol_name="Ext58"
>         underscore_name="ext58"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="75d3fdde-e74d-4ec2-a7f0-f88fe5971af3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -15523,6 +15578,7 @@
>         symbol_name="Ext61"
>         underscore_name="ext61"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="98c25532-687f-489a-b070-667edd3c41f9"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -15717,6 +15773,7 @@
>         symbol_name="Ext62"
>         underscore_name="ext62"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6ee28b50-5390-4655-af96-9d99569aee82"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -15913,6 +15970,7 @@
>         symbol_name="Ext65"
>         underscore_name="ext65"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="89a4a65b-cbfa-4c75-99fb-e5d7f0def495"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16060,6 +16118,7 @@
>         symbol_name="Ext66"
>         underscore_name="ext66"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="99e44f76-928f-4835-866f-663e25c69f66"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16202,6 +16261,7 @@
>         symbol_name="Ext67"
>         underscore_name="ext67"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f45dfc0c-70ef-48bd-83a2-30cf4a6ba0d5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16351,6 +16411,7 @@
>         symbol_name="Ext68"
>         underscore_name="ext68"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="eab0942c-5181-4caf-aeec-44d9a0b69ada"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16493,6 +16554,7 @@
>         symbol_name="Ext73"
>         underscore_name="ext73"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d9d0c398-6429-4ba8-bc08-6e8556a5880f"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16640,6 +16702,7 @@
>         symbol_name="Ext74"
>         underscore_name="ext74"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d91bf24f-08af-4d1d-b957-c2293923c9a4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16780,6 +16843,7 @@
>         symbol_name="Ext75"
>         underscore_name="ext75"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b5c2eaef-cffa-490b-a80e-de2b37ca63d8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -16929,6 +16993,7 @@
>         symbol_name="Ext76"
>         underscore_name="ext76"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d5cdafcf-483d-40f7-8dc9-feca73e94246"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17071,6 +17136,7 @@
>         symbol_name="Ext77"
>         underscore_name="ext77"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="240802cf-de55-472f-9e0a-710270ae9487"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17260,6 +17326,7 @@
>         symbol_name="Ext78"
>         underscore_name="ext78"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3dd49211-aa69-4711-87c2-97289ff9cfff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17451,6 +17518,7 @@
>         symbol_name="Ext79"
>         underscore_name="ext79"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="64aeba75-9dbe-4231-81f6-8c991b84c070"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17608,6 +17676,7 @@
>         symbol_name="Ext80"
>         underscore_name="ext80"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3b293ce5-af38-4ae2-96f4-a542d3c68d5e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17758,6 +17827,7 @@
>         symbol_name="Ext81"
>         underscore_name="ext81"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="09516dce-66a0-499f-8457-97f78bb921e6"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -17917,6 +17987,7 @@
>         symbol_name="Ext82"
>         underscore_name="ext82"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c0bdc35b-af55-4ac9-8078-f22578201756"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -18069,6 +18140,7 @@
>         symbol_name="Ext83"
>         underscore_name="ext83"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7f4b6bdf-4a28-4e6b-a67b-c9a0d320ddb8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -18455,6 +18527,7 @@
>         symbol_name="Ext85"
>         underscore_name="ext85"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e19c5430-c632-43eb-b27f-eeb3d405bfd8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -18709,6 +18782,7 @@
>         symbol_name="Ext86"
>         underscore_name="ext86"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d379e5f5-32f3-4a6b-957f-5ccf607dda00"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -18964,6 +19038,7 @@
>         symbol_name="Ext87"
>         underscore_name="ext87"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3e86ea71-8695-4815-ac18-0fd4510541a1"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -19148,6 +19223,7 @@
>         symbol_name="Ext88"
>         underscore_name="ext88"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="31ad28aa-7425-4bb4-b1a3-423821d98d84"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -19332,6 +19408,7 @@
>         symbol_name="Ext91"
>         underscore_name="ext91"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a1963e82-2bad-44e2-9bb1-ee18657c09cd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -19516,6 +19593,7 @@
>         symbol_name="Ext92"
>         underscore_name="ext92"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fdf0722d-cb2e-46bd-8c1f-a85c6fbca3ff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -19700,6 +19778,7 @@
>         symbol_name="Ext93"
>         underscore_name="ext93"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e0810ece-3bb5-4786-871b-b504faa00ba7"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -19857,6 +19936,7 @@
>         symbol_name="Ext94"
>         underscore_name="ext94"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="8697d9f7-3085-4ae7-b88d-e77697972732"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20007,6 +20087,7 @@
>         symbol_name="Ext95"
>         underscore_name="ext95"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d059b804-fc25-4cbc-9682-ebc806a0d423"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20166,6 +20247,7 @@
>         symbol_name="Ext96"
>         underscore_name="ext96"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ca3c5e8c-b83a-474f-85fa-af7572a1ce27"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20318,6 +20400,7 @@
>         symbol_name="Ext97"
>         underscore_name="ext97"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fbed5532-2b4f-4194-b856-0404c387b2e4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20576,6 +20659,7 @@
>         symbol_name="Ext98"
>         underscore_name="ext98"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="4c975484-c2f5-4f29-b8fa-8ec1068de77a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20769,6 +20853,7 @@
>         symbol_name="Ext99"
>         underscore_name="ext99"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="13017c9d-9d3a-41d1-8f9c-2eafdcbefab4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -20964,6 +21049,7 @@
>         symbol_name="Ext100"
>         underscore_name="ext100"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a7ef0e01-74c3-48c5-8d0f-00241111cf69"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -21233,6 +21319,7 @@
>         symbol_name="Ext101"
>         underscore_name="ext101"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7e86b43f-715e-419a-83eb-e8777fd7c77a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -21504,6 +21591,7 @@
>         symbol_name="Ext102"
>         underscore_name="ext102"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1fb36f5f-04a3-412f-a6ca-80233bf408a0"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -21889,6 +21977,7 @@
>         symbol_name="Ext103"
>         underscore_name="ext103"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="5228137b-8e8d-4d67-b195-d5f64a88f5f0"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -22274,6 +22363,7 @@
>         symbol_name="Ext104"
>         underscore_name="ext104"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="5503160a-7b2a-4099-9ec6-0d3a551cb388"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -22446,6 +22536,7 @@
>         symbol_name="Ext105"
>         underscore_name="ext105"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="418f87f0-b6d8-4684-883e-4f10a79c5070"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -22618,6 +22709,7 @@
>         symbol_name="Ext106"
>         underscore_name="ext106"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f5b7256f-9bf6-4c95-94c1-4044cfad0ea6"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -22789,6 +22881,7 @@
>         symbol_name="Ext107"
>         underscore_name="ext107"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="28d75db6-0eb3-4651-b820-513a76013504"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -22960,6 +23053,7 @@
>         symbol_name="Ext108"
>         underscore_name="ext108"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="080da0b6-29a4-416b-b20f-ece0e2527f60"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -23131,6 +23225,7 @@
>         symbol_name="Ext109"
>         underscore_name="ext109"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="75a9e66d-9bbe-46d7-971e-71ca8ef680ff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -23300,6 +23395,7 @@
>         symbol_name="Ext110"
>         underscore_name="ext110"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ae5589a9-7e09-4343-a611-3161977315d5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -23473,6 +23569,7 @@
>         symbol_name="Ext111"
>         underscore_name="ext111"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a5e1e738-1338-4d76-a6a7-5517111cc852"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -23646,6 +23743,7 @@
>         symbol_name="Ext113"
>         underscore_name="ext113"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1a24edc7-8187-43b6-86aa-fcf56c223893"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -23961,6 +24059,7 @@
>         symbol_name="Ext114"
>         underscore_name="ext114"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="32565d07-8ac7-41c3-89a3-66d0c1100616"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -24278,6 +24377,7 @@
>         symbol_name="Ext116"
>         underscore_name="ext116"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f725009a-c5e7-4418-9adf-ddb70cb2edde"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -24463,6 +24563,7 @@
>         symbol_name="Ext117"
>         underscore_name="ext117"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f633497f-c116-461f-a0e9-bb3fdcef7683"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -24650,6 +24751,7 @@
>         symbol_name="Ext118"
>         underscore_name="ext118"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="bae9e67e-4b5c-4fb9-b21d-21a6966bed46"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -24897,6 +24999,7 @@
>         symbol_name="Ext119"
>         underscore_name="ext119"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="95c08faf-813c-4b71-9062-09569c5ff432"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -25146,6 +25249,7 @@
>         symbol_name="Ext120"
>         underscore_name="ext120"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="045ee54e-4e02-4877-adb1-5bd14ba49100"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -25333,6 +25437,7 @@
>         symbol_name="Ext121"
>         underscore_name="ext121"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2e3894b5-2b6a-49c4-b2b6-0dde7375cb7b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -25520,6 +25625,7 @@
>         symbol_name="Ext122"
>         underscore_name="ext122"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="25ca1237-2ed3-447a-9767-1a85da89daef"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -25823,6 +25929,7 @@
>         symbol_name="Ext123"
>         underscore_name="ext123"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cf41fd07-c4c2-466c-9d85-774dcde02359"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -26136,6 +26243,7 @@
>         symbol_name="Ext124"
>         underscore_name="ext124"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2445e8f0-04c4-43f5-87ff-e2f99a2528ed"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -26424,6 +26532,7 @@
>         symbol_name="Ext125"
>         underscore_name="ext125"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="446192f5-9062-4f1e-a99e-1be87cdcd0b8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -26714,6 +26823,7 @@
>         symbol_name="Ext126"
>         underscore_name="ext126"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9a0ec3ea-1d61-413e-8b9c-169cdec1f9b3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -26937,6 +27047,7 @@
>         symbol_name="Ext127"
>         underscore_name="ext127"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1f70ab0a-6efd-461b-b06e-3b47d3602f36"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27162,6 +27273,7 @@
>         symbol_name="Ext128"
>         underscore_name="ext128"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9eedb03f-340b-40ec-8a66-43d01973003e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27310,6 +27422,7 @@
>         symbol_name="Ext129"
>         underscore_name="ext129"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0e5ffe58-83b2-445b-a439-9ee7a01642d4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27461,6 +27574,7 @@
>         symbol_name="Ext130"
>         underscore_name="ext130"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="78925a28-3e52-4d74-b03b-cb27c6a4401a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27594,6 +27708,7 @@
>         symbol_name="Ext131"
>         underscore_name="ext131"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1e91d8d9-ced4-4240-bf9e-fdd7d015c058"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27720,6 +27835,7 @@
>         symbol_name="Ext132"
>         underscore_name="ext132"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1cacf022-b4d4-401c-abec-acc0a3353adc"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27855,6 +27971,7 @@
>         symbol_name="Ext133"
>         underscore_name="ext133"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3c15657a-b3da-4513-8b9c-08bcc1ca0226"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -27983,6 +28100,7 @@
>         symbol_name="Ext134"
>         underscore_name="ext134"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="da34c79f-d1c6-4d15-b848-2085528bb86b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28099,6 +28217,7 @@
>         symbol_name="Ext135"
>         underscore_name="ext135"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="33ceab81-26bc-49f3-a124-5dbb2d592a87"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28206,6 +28325,7 @@
>         symbol_name="Ext136"
>         underscore_name="ext136"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d8b7d2f7-7c3a-4a68-b6c1-48d197b22945"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28324,6 +28444,7 @@
>         symbol_name="Ext137"
>         underscore_name="ext137"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="01d6bd34-b8d1-4412-b53b-0d16b327abec"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28433,6 +28554,7 @@
>         symbol_name="Ext138"
>         underscore_name="ext138"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7485f9ec-ac5f-4c6d-8c5f-6a023e7d29d5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28549,6 +28671,7 @@
>         symbol_name="Ext139"
>         underscore_name="ext139"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="944dc12b-b2fd-4bf5-a59d-540e2b280cdd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28656,6 +28779,7 @@
>         symbol_name="Ext140"
>         underscore_name="ext140"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="5c97330a-b407-4ef8-908f-7fdeec216f81"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28774,6 +28898,7 @@
>         symbol_name="Ext141"
>         underscore_name="ext141"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="65e4ac2a-db8f-4918-bdd6-ac4d85de160e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28883,6 +29008,7 @@
>         symbol_name="Ext142"
>         underscore_name="ext142"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0eb11775-ad71-44d4-ad2c-c2fa6431b144"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -28999,6 +29125,7 @@
>         symbol_name="Ext143"
>         underscore_name="ext143"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d7736d53-f1cb-4899-8f3d-d8aaad1f1c67"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29106,6 +29233,7 @@
>         symbol_name="Ext144"
>         underscore_name="ext144"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="496219cc-316b-4945-9fc4-180e60331262"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29224,6 +29352,7 @@
>         symbol_name="Ext145"
>         underscore_name="ext145"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c7e6721e-51f9-40af-ba8b-0520a1082855"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29333,6 +29462,7 @@
>         symbol_name="Ext146"
>         underscore_name="ext146"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0e9b064c-9fa7-4e85-8aaa-cc871010117d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29449,6 +29579,7 @@
>         symbol_name="Ext147"
>         underscore_name="ext147"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="44d73f02-f843-4717-a3d5-3d1dfbd3f106"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29556,6 +29687,7 @@
>         symbol_name="Ext148"
>         underscore_name="ext148"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b84f370e-1b64-41d1-a4d8-f095fb79e5f8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29674,6 +29806,7 @@
>         symbol_name="Ext149"
>         underscore_name="ext149"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="772a2c24-0a03-480e-baca-72f2f55a5422"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29783,6 +29916,7 @@
>         symbol_name="Ext150"
>         underscore_name="ext150"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="953d3bf8-af3d-4287-ac22-dcd122c5eb51"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -29897,6 +30031,7 @@
>         symbol_name="Ext151"
>         underscore_name="ext151"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="dbb009c2-98ad-4af0-905a-e7808ac5424c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30003,6 +30138,7 @@
>         symbol_name="Ext152"
>         underscore_name="ext152"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="16fd8981-676d-4cbc-b010-8d731ba66a06"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30119,6 +30255,7 @@
>         symbol_name="Ext153"
>         underscore_name="ext153"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7bcdd766-98a5-461a-ac8e-d8c648958364"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30227,6 +30364,7 @@
>         symbol_name="Ext154"
>         underscore_name="ext154"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c0459fa8-1790-46b8-a0f8-3064baf7c670"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30532,6 +30670,7 @@
>         symbol_name="Ext155"
>         underscore_name="ext155"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="304d9439-4bdd-48a9-a82e-15b3533afaf4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30667,6 +30806,7 @@
>         symbol_name="Ext156"
>         underscore_name="ext156"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="90691d58-782d-459c-a242-f6e515fe9567"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -30803,6 +30943,7 @@
>         symbol_name="Ext158"
>         underscore_name="ext158"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cf34a431-3cc9-4b70-a84e-0d31a71170f0"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -31070,6 +31211,7 @@
>         symbol_name="Ext159"
>         underscore_name="ext159"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ad3cd014-8897-4613-8653-6d80c6eaff88"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -31271,6 +31413,7 @@
>         symbol_name="Ext160"
>         underscore_name="ext160"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="aa12de63-7d11-4acf-af96-be89807729f7"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -31474,6 +31617,7 @@
>         symbol_name="Ext161"
>         underscore_name="ext161"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ac013132-7e0c-4143-bc34-ea6428ce3082"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -31675,6 +31819,7 @@
>         symbol_name="Ext162"
>         underscore_name="ext162"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b9d8323a-7bb4-41b5-b99b-43ed99e23590"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -31878,6 +32023,7 @@
>         symbol_name="Ext163"
>         underscore_name="ext163"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6ae2c19e-672c-4ad6-9d59-0a391af1af4f"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -32079,6 +32225,7 @@
>         symbol_name="Ext164"
>         underscore_name="ext164"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c76b6b40-9d7f-48f6-b6da-595252c884f4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -32282,6 +32429,7 @@
>         symbol_name="Ext165"
>         underscore_name="ext165"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a85da4d8-d984-45f3-8dbe-c8678eac8aae"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -32483,6 +32631,7 @@
>         symbol_name="Ext166"
>         underscore_name="ext166"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fbc7362e-4d05-451d-833e-f0ce5e7ad8e3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -32686,6 +32835,7 @@
>         symbol_name="Ext167"
>         underscore_name="ext167"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="881454da-d271-41ba-9dfb-0cc354fb5aea"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -32887,6 +33037,7 @@
>         symbol_name="Ext168"
>         underscore_name="ext168"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9f2b827b-01c6-4e82-b283-dfe91af30d88"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -33090,6 +33241,7 @@
>         symbol_name="Ext169"
>         underscore_name="ext169"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c6b40da2-4783-45d7-8252-9a4f1f75faf4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -33291,6 +33443,7 @@
>         symbol_name="Ext170"
>         underscore_name="ext170"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b5883529-3595-412d-b40f-b7ade9cc3304"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -33494,6 +33647,7 @@
>         symbol_name="Ext171"
>         underscore_name="ext171"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2455c20b-95bb-4e9f-8db2-597ba9447025"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -33871,6 +34025,7 @@
>         symbol_name="Ext172"
>         underscore_name="ext172"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ec18cd0b-7caa-48d0-9a16-418ecbe1096e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -34250,6 +34405,7 @@
>         symbol_name="Ext173"
>         underscore_name="ext173"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3628b2de-d9f9-4db2-a74f-32a314e591c5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -34472,6 +34628,7 @@
>         symbol_name="Ext174"
>         underscore_name="ext174"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d35ecd39-0a9d-48f7-bf87-d3c318b8fadd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -34694,6 +34851,7 @@
>         symbol_name="Ext175"
>         underscore_name="ext175"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d0d0e9cc-494c-4b01-8a43-683aae5beaff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -34911,6 +35069,7 @@
>         symbol_name="Ext176"
>         underscore_name="ext176"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c5fde834-52c8-411b-854e-8d3197def109"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -35123,6 +35282,7 @@
>         symbol_name="Ext177"
>         underscore_name="ext177"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="55830ebd-062b-40e8-8d5c-e921429957ff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -35347,6 +35507,7 @@
>         symbol_name="Ext178"
>         underscore_name="ext178"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9603d88f-e5bf-47b4-85fd-fbbb68f42632"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -35571,6 +35732,7 @@
>         symbol_name="Ext179"
>         underscore_name="ext179"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b05bd7bd-387f-4fd7-a1b4-06a1dab5bc14"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -35790,6 +35952,7 @@
>         symbol_name="Ext180"
>         underscore_name="ext180"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="49dc9023-be7b-4102-a4a2-d31b9a6b1ce4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36004,6 +36167,7 @@
>         symbol_name="Ext181"
>         underscore_name="ext181"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="871d8a6b-7c73-4cd7-a4ed-4bdb58d5b6ee"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36183,6 +36347,7 @@
>         symbol_name="Ext182"
>         underscore_name="ext182"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="25a2f80d-147e-4363-a0cb-53584b7a837d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36364,6 +36529,7 @@
>         symbol_name="Ext183"
>         underscore_name="ext183"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="71863fcf-d57c-433b-858f-87f5f11ec3da"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36585,6 +36751,7 @@
>         symbol_name="Ext184"
>         underscore_name="ext184"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c29640d9-39eb-4a03-9043-2a54eb5a3112"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36808,6 +36975,7 @@
>         symbol_name="Ext185"
>         underscore_name="ext185"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="00882747-d1dd-4ba5-9b72-96df25dad7bd"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -36998,6 +37166,7 @@
>         symbol_name="Ext186"
>         underscore_name="ext186"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="89aea44f-ffa6-43cc-9a9c-103b4930e103"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -37190,6 +37359,7 @@
>         symbol_name="Ext188"
>         underscore_name="ext188"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="11e92a4a-d605-499c-9159-e79797c230de"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -37380,6 +37550,7 @@
>         symbol_name="Ext189"
>         underscore_name="ext189"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="27c2ef51-6689-4ffc-acaa-3f46a8e834cf"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -37572,6 +37743,7 @@
>         symbol_name="Ext190"
>         underscore_name="ext190"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1625df84-2f24-4aed-9ced-e652184c9949"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -37723,6 +37895,7 @@
>         symbol_name="Ext191"
>         underscore_name="ext191"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d98e7947-ecee-46a9-b3ac-619d13d32b1a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -37876,6 +38049,7 @@
>         symbol_name="Ext192"
>         underscore_name="ext192"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ed973589-e13c-4115-a2b1-08bc443a4e8d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -38154,6 +38328,7 @@
>         symbol_name="Ext193"
>         underscore_name="ext193"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9bb6c40a-ec2c-4292-8ac8-d8b413abd301"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -38434,6 +38609,7 @@
>         symbol_name="Ext195"
>         underscore_name="ext195"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9a911d6f-39b5-425d-aea3-15e49e6395fa"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -38716,6 +38892,7 @@
>         symbol_name="Ext196"
>         underscore_name="ext196"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="814b3516-d465-4faa-b89c-67c30c96a256"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39000,6 +39177,7 @@
>         symbol_name="Ext198"
>         underscore_name="ext198"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3663ed58-377d-40c3-9af0-913cbc5d954b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39181,6 +39359,7 @@
>         symbol_name="Ext199"
>         underscore_name="ext199"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6ce22a01-9025-4afb-b3e9-652ce0c693b5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39366,6 +39545,7 @@
>         symbol_name="Ext200"
>         underscore_name="ext200"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7f59bef3-f0f1-4856-b4f3-e64fa9913956"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39549,6 +39729,7 @@
>         symbol_name="Ext201"
>         underscore_name="ext201"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="8982721e-16cb-42ec-92dd-eb049ae7a503"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39736,6 +39917,7 @@
>         symbol_name="Ext202"
>         underscore_name="ext202"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d86c1224-3af7-4df1-a44d-e4522f22b2ae"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39836,6 +40018,7 @@
>         symbol_name="Ext203"
>         underscore_name="ext203"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="03090380-689d-481a-ace2-9725ea0c10d2"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -39936,6 +40119,7 @@
>         symbol_name="Ext204"
>         underscore_name="ext204"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="78a1b79a-a5fd-4fa0-b33d-2ec51404e3b9"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -40141,6 +40325,7 @@
>         symbol_name="Ext205"
>         underscore_name="ext205"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b3c2bff1-e203-4c90-8719-66546c370005"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -40346,6 +40531,7 @@
>         symbol_name="Ext206"
>         underscore_name="ext206"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="a209e458-76a6-46fc-bb62-29850f38eb0d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -40553,6 +40739,7 @@
>         symbol_name="Ext207"
>         underscore_name="ext207"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="06aea283-f183-4e96-85a5-3bb7193f06c7"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -40760,6 +40947,7 @@
>         symbol_name="Ext212"
>         underscore_name="ext212"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0c6d24a9-2489-4fcd-a9f6-d44380417dee"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -40951,6 +41139,7 @@
>         symbol_name="Ext213"
>         underscore_name="ext213"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="39a43efe-ee39-4fa2-88c4-3dfc34a74f4f"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -41144,6 +41333,7 @@
>         symbol_name="Ext214"
>         underscore_name="ext214"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f3ca645b-a2b3-496b-bf6d-f8f26b1faa86"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -41328,6 +41518,7 @@
>         symbol_name="Ext215"
>         underscore_name="ext215"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="947b168e-df39-4e92-a622-0884c81221b3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -41514,6 +41705,7 @@
>         symbol_name="Ext220"
>         underscore_name="ext220"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0722885e-4df8-4c98-8336-72b5e129e6be"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -41781,6 +41973,7 @@
>         symbol_name="Ext225"
>         underscore_name="ext225"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="db4a27f8-40a0-4cb5-aa3a-5368add92cd5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -41915,6 +42108,7 @@
>         symbol_name="Ext226"
>         underscore_name="ext226"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6b5736f5-a627-4cb6-9078-1c05137bc460"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42051,6 +42245,7 @@
>         symbol_name="Ext227"
>         underscore_name="ext227"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="5e6f4959-c37c-4be0-bb4e-2f1c1aef2bb3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42185,6 +42380,7 @@
>         symbol_name="Ext228"
>         underscore_name="ext228"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fe2d673e-8b2e-47d0-b9db-2c50e10ee53e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42321,6 +42517,7 @@
>         symbol_name="Ext229"
>         underscore_name="ext229"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cb94a696-bfbe-4566-8225-c337f988600c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42461,6 +42658,7 @@
>         symbol_name="Ext230"
>         underscore_name="ext230"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ec3032cb-df12-445c-9eb2-6b1031d2dc86"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42603,6 +42801,7 @@
>         symbol_name="Ext231"
>         underscore_name="ext231"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e5e22fbb-0ff4-44f6-a549-6ed41df0dd27"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42736,6 +42935,7 @@
>         symbol_name="Ext232"
>         underscore_name="ext232"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b6defb71-0fe8-400e-ae27-565ce9067082"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -42871,6 +43071,7 @@
>         symbol_name="Ext236"
>         underscore_name="ext236"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="98d5c3d9-bca6-4699-99e3-7b95a23025ce"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -43099,6 +43300,7 @@
>         symbol_name="Ext237"
>         underscore_name="ext237"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="4256db1d-9083-4497-9000-59bbcf9eee72"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -43399,6 +43601,7 @@
>         symbol_name="Ext239"
>         underscore_name="ext239"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="5ba2bf20-ca4e-4872-86fd-9026c9de8c93"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -43511,6 +43714,7 @@
>         symbol_name="Ext240"
>         underscore_name="ext240"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fe8810c2-457b-47e0-a3b9-50cab24718b4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -43623,6 +43827,7 @@
>         symbol_name="Ext500"
>         underscore_name="ext500"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="ee0cc3d0-9ac8-4608-aaca-b37fd9d18238"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -44036,6 +44241,7 @@
>         symbol_name="Ext501"
>         underscore_name="ext501"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f6e20d5b-52be-4035-85c2-818a690bf601"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -44449,6 +44655,7 @@
>         symbol_name="Ext502"
>         underscore_name="ext502"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d09cedef-e3e3-41b5-8ce8-ddc3933339ca"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -44862,6 +45069,7 @@
>         symbol_name="Ext503"
>         underscore_name="ext503"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="96067625-3663-4f9a-8b26-74e47ab1aff4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45275,6 +45483,7 @@
>         symbol_name="Ext508"
>         underscore_name="ext508"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2bc8b90d-997c-4d62-b101-fe1aa74036e5"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45324,7 +45533,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="B 2 READ 2 B 3 READ UMUL UADD 4 B 4 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 7 READ UMUL UADD 64 C 0 READ UMUL UADD"
> +             equation="B 3 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
>               availability="$GtSlice0XeCore0"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45338,7 +45547,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 1 READ 2 C 2 READ UMUL UADD 4 C 3 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 5 READ UMUL UADD 32 C 6 READ UMUL UADD 64 C 7 READ UMUL UADD"
> +             equation="B 2 READ 2 C 1 READ UMUL UADD 4 C 0 READ UMUL UADD 8 B 7 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 5 READ UMUL UADD 64 B 4 READ UMUL UADD"
>               availability="$GtSlice0XeCore1"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45351,19 +45560,20 @@
>          <register type="NOA" address="0x00009888" value="0x180802B4" />
>          <register type="NOA" address="0x00009888" value="0x182802B4" />
>          <register type="NOA" address="0x00009888" value="0x04080010" />
> -        <register type="NOA" address="0x00009888" value="0x0A080247" />
> -        <register type="NOA" address="0x00009888" value="0x0C0802CA" />
> -        <register type="NOA" address="0x00009888" value="0x0E08034C" />
> -        <register type="NOA" address="0x00009888" value="0x1008000E" />
> +        <register type="NOA" address="0x00009888" value="0x0A0801C0" />
> +        <register type="NOA" address="0x00009888" value="0x1208030D" />
> +        <register type="NOA" address="0x00009888" value="0x1408028B" />
> +        <register type="NOA" address="0x00009888" value="0x16080209" />
>          <register type="NOA" address="0x00009888" value="0x06080000" />
>          <register type="NOA" address="0x00009888" value="0x00080000" />
>          <register type="NOA" address="0x00009888" value="0x02080000" />
>          <register type="NOA" address="0x00009888" value="0x04280010" />
> -        <register type="NOA" address="0x00009888" value="0x102801C0" />
> -        <register type="NOA" address="0x00009888" value="0x12280289" />
> -        <register type="NOA" address="0x00009888" value="0x1428030B" />
> -        <register type="NOA" address="0x00009888" value="0x1628038D" />
> +        <register type="NOA" address="0x00009888" value="0x0A280007" />
> +        <register type="NOA" address="0x00009888" value="0x0C28030D" />
> +        <register type="NOA" address="0x00009888" value="0x0E28028B" />
> +        <register type="NOA" address="0x00009888" value="0x10280209" />
>          <register type="NOA" address="0x00009888" value="0x06280000" />
> +        <register type="NOA" address="0x00009888" value="0x00280000" />
>          <register type="NOA" address="0x00009888" value="0x02280000" />
>          <register type="NOA" address="0x00009884" value="0x00000004" />
>          <register type="NOA" address="0x00009888" value="0x00015550" />
> @@ -45371,8 +45581,8 @@
>          <register type="NOA" address="0x00009888" value="0x00045550" />
>          <register type="NOA" address="0x00009888" value="0x02045555" />
>          <register type="NOA" address="0x00009888" value="0x000BFFFC" />
> -        <register type="NOA" address="0x00009888" value="0x0009AAA0" />
> -        <register type="NOA" address="0x00009888" value="0x0209FFFE" />
> +        <register type="NOA" address="0x00009888" value="0x0009FFB0" />
> +        <register type="NOA" address="0x00009888" value="0x0209AAAF" />
>          <register type="NOA" address="0x00009888" value="0x000AAAA0" />
>          <register type="NOA" address="0x00009888" value="0x020AAAAA" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
> @@ -45415,6 +45625,7 @@
>         symbol_name="Ext509"
>         underscore_name="ext509"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="79252877-1dcd-4700-b4bd-58bce74b796d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45464,7 +45675,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 1 READ 2 C 2 READ UMUL UADD 4 C 3 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 5 READ UMUL UADD 32 C 6 READ UMUL UADD 64 C 7 READ UMUL UADD"
> +             equation="C 7 READ 2 C 6 READ UMUL UADD 4 C 5 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 3 READ UMUL UADD 32 C 2 READ UMUL UADD 64 C 1 READ UMUL UADD"
>               availability="$GtSlice0XeCore0"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45478,7 +45689,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="B 2 READ 2 B 3 READ UMUL UADD 4 B 4 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 7 READ UMUL UADD 64 C 0 READ UMUL UADD"
> +             equation="C 0 READ 2 B 7 READ UMUL UADD 4 B 6 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 4 READ UMUL UADD 32 B 3 READ UMUL UADD 64 B 2 READ UMUL UADD"
>               availability="$GtSlice0XeCore1"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45489,19 +45700,21 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
>          <register type="NOA" address="0x00009888" value="0x1C085400" />
> +        <register type="NOA" address="0x00009888" value="0x1E080014" />
>          <register type="NOA" address="0x00009888" value="0x1C285400" />
> -        <register type="NOA" address="0x00009888" value="0x04080008" />
> -        <register type="NOA" address="0x00009888" value="0x10080000" />
> -        <register type="NOA" address="0x00009888" value="0x12080081" />
> -        <register type="NOA" address="0x00009888" value="0x14080103" />
> -        <register type="NOA" address="0x00009888" value="0x16080185" />
> +        <register type="NOA" address="0x00009888" value="0x1E280014" />
> +        <register type="NOA" address="0x00009888" value="0x04080098" />
> +        <register type="NOA" address="0x00009888" value="0x10080140" />
> +        <register type="NOA" address="0x00009888" value="0x120800C4" />
> +        <register type="NOA" address="0x00009888" value="0x14080042" />
> +        <register type="NOA" address="0x00009888" value="0x160803C0" />
>          <register type="NOA" address="0x00009888" value="0x06080000" />
>          <register type="NOA" address="0x00009888" value="0x02080000" />
> -        <register type="NOA" address="0x00009888" value="0x04280008" />
> -        <register type="NOA" address="0x00009888" value="0x0A280040" />
> -        <register type="NOA" address="0x00009888" value="0x0C2800C2" />
> -        <register type="NOA" address="0x00009888" value="0x0E280144" />
> -        <register type="NOA" address="0x00009888" value="0x10280006" />
> +        <register type="NOA" address="0x00009888" value="0x04280098" />
> +        <register type="NOA" address="0x00009888" value="0x0A280105" />
> +        <register type="NOA" address="0x00009888" value="0x0C280083" />
> +        <register type="NOA" address="0x00009888" value="0x0E280001" />
> +        <register type="NOA" address="0x00009888" value="0x1028000F" />
>          <register type="NOA" address="0x00009888" value="0x06280000" />
>          <register type="NOA" address="0x00009888" value="0x00280000" />
>          <register type="NOA" address="0x00009888" value="0x02280000" />
> @@ -45555,6 +45768,7 @@
>         symbol_name="Ext510"
>         underscore_name="ext510"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="68ac1770-b062-48cd-94f4-44c6ae16867a"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45604,7 +45818,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="B 2 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
> +             equation="B 3 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
>               availability="$GtSlice0XeCore2"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45618,7 +45832,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 1 READ 2 C 0 READ UMUL UADD 4 B 7 READ UMUL UADD 8 B 6 READ UMUL UADD 16 B 5 READ UMUL UADD 32 B 4 READ UMUL UADD 64 B 3 READ UMUL UADD"
> +             equation="B 2 READ 2 C 1 READ UMUL UADD 4 C 0 READ UMUL UADD 8 B 7 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 5 READ UMUL UADD 64 B 4 READ UMUL UADD"
>               availability="$GtSlice0XeCore3"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45629,30 +45843,30 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
>          <register type="NOA" address="0x00009888" value="0x184802B4" />
> -        <register type="NOA" address="0x00009888" value="0x18680295" />
> +        <register type="NOA" address="0x00009888" value="0x186802B4" />
>          <register type="NOA" address="0x00009888" value="0x04480010" />
> -        <register type="NOA" address="0x00009888" value="0x0A480007" />
> -        <register type="NOA" address="0x00009888" value="0x1248034E" />
> -        <register type="NOA" address="0x00009888" value="0x144802CC" />
> -        <register type="NOA" address="0x00009888" value="0x1648024A" />
> +        <register type="NOA" address="0x00009888" value="0x0A4801C0" />
> +        <register type="NOA" address="0x00009888" value="0x1248030D" />
> +        <register type="NOA" address="0x00009888" value="0x1448028B" />
> +        <register type="NOA" address="0x00009888" value="0x16480209" />
>          <register type="NOA" address="0x00009888" value="0x06480000" />
>          <register type="NOA" address="0x00009888" value="0x00480000" />
>          <register type="NOA" address="0x00009888" value="0x02480000" />
>          <register type="NOA" address="0x00009888" value="0x04680010" />
> -        <register type="NOA" address="0x00009888" value="0x0A680180" />
> -        <register type="NOA" address="0x00009888" value="0x0C680105" />
> -        <register type="NOA" address="0x00009888" value="0x0E680083" />
> -        <register type="NOA" address="0x00009888" value="0x106803C1" />
> +        <register type="NOA" address="0x00009888" value="0x0A680007" />
> +        <register type="NOA" address="0x00009888" value="0x0C68030D" />
> +        <register type="NOA" address="0x00009888" value="0x0E68028B" />
> +        <register type="NOA" address="0x00009888" value="0x10680209" />
>          <register type="NOA" address="0x00009888" value="0x06680000" />
>          <register type="NOA" address="0x00009888" value="0x00680000" />
>          <register type="NOA" address="0x00009888" value="0x02680000" />
>          <register type="NOA" address="0x00009884" value="0x00000004" />
> -        <register type="NOA" address="0x00009888" value="0x00010030" />
> +        <register type="NOA" address="0x00009888" value="0x000100C0" />
>          <register type="NOA" address="0x00009888" value="0x0201FFF0" />
> -        <register type="NOA" address="0x00009888" value="0x000A0020" />
> +        <register type="NOA" address="0x00009888" value="0x000A0080" />
>          <register type="NOA" address="0x00009888" value="0x020AAAA0" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
> -        <register type="NOA" address="0x00009888" value="0x0002FFE0" />
> +        <register type="NOA" address="0x00009888" value="0x0002FFB0" />
>          <register type="NOA" address="0x00009888" value="0x0202AAAF" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
>          <register type="NOA" address="0x00009888" value="0x0002FFFC" />
> @@ -45661,7 +45875,7 @@
>          <register type="NOA" address="0x00009888" value="0x0003AAA0" />
>          <register type="NOA" address="0x00009888" value="0x0203AAAA" />
>          <register type="NOA" address="0x00009888" value="0x56010000" />
> -        <register type="NOA" address="0x00009888" value="0x58010400" />
> +        <register type="NOA" address="0x00009888" value="0x58010002" />
>          <register type="NOA" address="0x00009888" value="0x5A010020" />
>          <register type="NOA" address="0x00009888" value="0x5C010402" />
>          <register type="NOA" address="0x00009888" value="0x5E010020" />
> @@ -45691,6 +45905,7 @@
>         symbol_name="Ext511"
>         underscore_name="ext511"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="443b8a84-7e77-4e9f-8a2a-56743897cba3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45740,7 +45955,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="B 2 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
> +             equation="C 7 READ 2 C 6 READ UMUL UADD 4 C 5 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 3 READ UMUL UADD 32 C 2 READ UMUL UADD 64 C 1 READ UMUL UADD"
>               availability="$GtSlice0XeCore2"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45754,7 +45969,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 1 READ 2 C 0 READ UMUL UADD 4 B 7 READ UMUL UADD 8 B 6 READ UMUL UADD 16 B 5 READ UMUL UADD 32 B 4 READ UMUL UADD 64 B 3 READ UMUL UADD"
> +             equation="C 0 READ 2 B 7 READ UMUL UADD 4 B 6 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 4 READ UMUL UADD 32 B 3 READ UMUL UADD 64 B 2 READ UMUL UADD"
>               availability="$GtSlice0XeCore3"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45765,31 +45980,30 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
>          <register type="NOA" address="0x00009888" value="0x1C485400" />
> +        <register type="NOA" address="0x00009888" value="0x1E480014" />
>          <register type="NOA" address="0x00009888" value="0x1C685400" />
> -        <register type="NOA" address="0x00009888" value="0x04480008" />
> -        <register type="NOA" address="0x00009888" value="0x0A480000" />
> -        <register type="NOA" address="0x00009888" value="0x12480146" />
> -        <register type="NOA" address="0x00009888" value="0x144800C4" />
> -        <register type="NOA" address="0x00009888" value="0x16480042" />
> +        <register type="NOA" address="0x00009888" value="0x1E680014" />
> +        <register type="NOA" address="0x00009888" value="0x04480098" />
> +        <register type="NOA" address="0x00009888" value="0x10480140" />
> +        <register type="NOA" address="0x00009888" value="0x124800C4" />
> +        <register type="NOA" address="0x00009888" value="0x14480042" />
> +        <register type="NOA" address="0x00009888" value="0x164803C0" />
>          <register type="NOA" address="0x00009888" value="0x06480000" />
> -        <register type="NOA" address="0x00009888" value="0x00480000" />
>          <register type="NOA" address="0x00009888" value="0x02480000" />
> -        <register type="NOA" address="0x00009888" value="0x04680008" />
> -        <register type="NOA" address="0x00009888" value="0x0A680180" />
> -        <register type="NOA" address="0x00009888" value="0x0C680105" />
> -        <register type="NOA" address="0x00009888" value="0x0E680083" />
> -        <register type="NOA" address="0x00009888" value="0x10680001" />
> +        <register type="NOA" address="0x00009888" value="0x04680098" />
> +        <register type="NOA" address="0x00009888" value="0x0A680105" />
> +        <register type="NOA" address="0x00009888" value="0x0C680083" />
> +        <register type="NOA" address="0x00009888" value="0x0E680001" />
> +        <register type="NOA" address="0x00009888" value="0x1068000F" />
>          <register type="NOA" address="0x00009888" value="0x06680000" />
>          <register type="NOA" address="0x00009888" value="0x00680000" />
>          <register type="NOA" address="0x00009888" value="0x02680000" />
>          <register type="NOA" address="0x00009884" value="0x00000004" />
> -        <register type="NOA" address="0x00009888" value="0x00010030" />
> -        <register type="NOA" address="0x00009888" value="0x0201FFF0" />
> -        <register type="NOA" address="0x00009888" value="0x000A0020" />
> -        <register type="NOA" address="0x00009888" value="0x020AAAA0" />
> +        <register type="NOA" address="0x00009888" value="0x0201FFFC" />
> +        <register type="NOA" address="0x00009888" value="0x020AAAA8" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
> -        <register type="NOA" address="0x00009888" value="0x0002FFE0" />
> -        <register type="NOA" address="0x00009888" value="0x0202AAAF" />
> +        <register type="NOA" address="0x00009888" value="0x0002FFF0" />
> +        <register type="NOA" address="0x00009888" value="0x0202AAAB" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
>          <register type="NOA" address="0x00009888" value="0x0002FFFC" />
>          <register type="NOA" address="0x00009888" value="0x00015550" />
> @@ -45797,12 +46011,12 @@
>          <register type="NOA" address="0x00009888" value="0x0003AAA0" />
>          <register type="NOA" address="0x00009888" value="0x0203AAAA" />
>          <register type="NOA" address="0x00009888" value="0x56010000" />
> -        <register type="NOA" address="0x00009888" value="0x58010400" />
> +        <register type="NOA" address="0x00009888" value="0x58010402" />
>          <register type="NOA" address="0x00009888" value="0x5A010020" />
>          <register type="NOA" address="0x00009888" value="0x5C010402" />
>          <register type="NOA" address="0x00009888" value="0x5E010020" />
>          <register type="NOA" address="0x00009888" value="0x06010000" />
> -        <register type="NOA" address="0x00009888" value="0x60010402" />
> +        <register type="NOA" address="0x00009888" value="0x60010002" />
>          <register type="NOA" address="0x00009888" value="0x4E010000" />
>          <register type="NOA" address="0x00009888" value="0x50010000" />
>          <register type="NOA" address="0x00009888" value="0x52010000" />
> @@ -45827,6 +46041,7 @@
>         symbol_name="Ext512"
>         underscore_name="ext512"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="68581669-8e57-4ff9-bb70-71a99f8454c8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -45876,7 +46091,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 7 READ 2 C 6 READ UMUL UADD 4 C 5 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 3 READ UMUL UADD 32 C 2 READ UMUL UADD 64 C 1 READ UMUL UADD"
> +             equation="B 2 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
>               availability="$GtSlice1XeCore0"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45890,7 +46105,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 0 READ 2 B 7 READ UMUL UADD 4 B 6 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 4 READ UMUL UADD 32 B 3 READ UMUL UADD 64 B 2 READ UMUL UADD"
> +             equation="B 3 READ 2 C 1 READ UMUL UADD 4 C 0 READ UMUL UADD 8 B 7 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 5 READ UMUL UADD 64 B 4 READ UMUL UADD"
>               availability="$GtSlice1XeCore1"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -45900,20 +46115,21 @@
>      <register_config type="NOA">
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
> -        <register type="NOA" address="0x00009888" value="0x18880295" />
> -        <register type="NOA" address="0x00009888" value="0x18A80295" />
> +        <register type="NOA" address="0x00009888" value="0x188802B4" />
> +        <register type="NOA" address="0x00009888" value="0x18A802B4" />
>          <register type="NOA" address="0x00009888" value="0x04880010" />
> -        <register type="NOA" address="0x00009888" value="0x10880180" />
> -        <register type="NOA" address="0x00009888" value="0x12880105" />
> -        <register type="NOA" address="0x00009888" value="0x14880083" />
> -        <register type="NOA" address="0x00009888" value="0x168803C1" />
> +        <register type="NOA" address="0x00009888" value="0x0A880007" />
> +        <register type="NOA" address="0x00009888" value="0x1288030D" />
> +        <register type="NOA" address="0x00009888" value="0x1488028B" />
> +        <register type="NOA" address="0x00009888" value="0x16880209" />
>          <register type="NOA" address="0x00009888" value="0x06880000" />
> +        <register type="NOA" address="0x00009888" value="0x00880000" />
>          <register type="NOA" address="0x00009888" value="0x02880000" />
>          <register type="NOA" address="0x00009888" value="0x04A80010" />
> -        <register type="NOA" address="0x00009888" value="0x0AA80146" />
> -        <register type="NOA" address="0x00009888" value="0x0CA800C4" />
> -        <register type="NOA" address="0x00009888" value="0x0EA80042" />
> -        <register type="NOA" address="0x00009888" value="0x10A8000F" />
> +        <register type="NOA" address="0x00009888" value="0x0AA801C0" />
> +        <register type="NOA" address="0x00009888" value="0x0CA8030D" />
> +        <register type="NOA" address="0x00009888" value="0x0EA8028B" />
> +        <register type="NOA" address="0x00009888" value="0x10A80209" />
>          <register type="NOA" address="0x00009888" value="0x06A80000" />
>          <register type="NOA" address="0x00009888" value="0x00A80000" />
>          <register type="NOA" address="0x00009888" value="0x02A80000" />
> @@ -45923,8 +46139,8 @@
>          <register type="NOA" address="0x00009888" value="0x00245550" />
>          <register type="NOA" address="0x00009888" value="0x02245555" />
>          <register type="NOA" address="0x00009888" value="0x002BFFFC" />
> -        <register type="NOA" address="0x00009888" value="0x0029FFF0" />
> -        <register type="NOA" address="0x00009888" value="0x0229AAAB" />
> +        <register type="NOA" address="0x00009888" value="0x0029FFE0" />
> +        <register type="NOA" address="0x00009888" value="0x0229AAAF" />
>          <register type="NOA" address="0x00009888" value="0x002AAAA0" />
>          <register type="NOA" address="0x00009888" value="0x022AAAAA" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
> @@ -45969,6 +46185,7 @@
>         symbol_name="Ext513"
>         underscore_name="ext513"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1b49d31f-4d7c-4dd7-ad31-030ccb59649e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46043,19 +46260,21 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
>          <register type="NOA" address="0x00009888" value="0x1C885400" />
> +        <register type="NOA" address="0x00009888" value="0x1E880014" />
>          <register type="NOA" address="0x00009888" value="0x1CA85400" />
> -        <register type="NOA" address="0x00009888" value="0x04880008" />
> -        <register type="NOA" address="0x00009888" value="0x10880180" />
> -        <register type="NOA" address="0x00009888" value="0x12880105" />
> -        <register type="NOA" address="0x00009888" value="0x14880083" />
> -        <register type="NOA" address="0x00009888" value="0x16880001" />
> +        <register type="NOA" address="0x00009888" value="0x1EA80014" />
> +        <register type="NOA" address="0x00009888" value="0x04880098" />
> +        <register type="NOA" address="0x00009888" value="0x10880140" />
> +        <register type="NOA" address="0x00009888" value="0x128800C4" />
> +        <register type="NOA" address="0x00009888" value="0x14880042" />
> +        <register type="NOA" address="0x00009888" value="0x168803C0" />
>          <register type="NOA" address="0x00009888" value="0x06880000" />
>          <register type="NOA" address="0x00009888" value="0x02880000" />
> -        <register type="NOA" address="0x00009888" value="0x04A80008" />
> -        <register type="NOA" address="0x00009888" value="0x0AA80146" />
> -        <register type="NOA" address="0x00009888" value="0x0CA800C4" />
> -        <register type="NOA" address="0x00009888" value="0x0EA80042" />
> -        <register type="NOA" address="0x00009888" value="0x10A80000" />
> +        <register type="NOA" address="0x00009888" value="0x04A80098" />
> +        <register type="NOA" address="0x00009888" value="0x0AA80105" />
> +        <register type="NOA" address="0x00009888" value="0x0CA80083" />
> +        <register type="NOA" address="0x00009888" value="0x0EA80001" />
> +        <register type="NOA" address="0x00009888" value="0x10A8000F" />
>          <register type="NOA" address="0x00009888" value="0x06A80000" />
>          <register type="NOA" address="0x00009888" value="0x00A80000" />
>          <register type="NOA" address="0x00009888" value="0x02A80000" />
> @@ -46111,6 +46330,7 @@
>         symbol_name="Ext514"
>         underscore_name="ext514"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1b0ce68b-c301-4d05-8659-85fad0825057"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46160,7 +46380,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 7 READ 2 C 6 READ UMUL UADD 4 C 5 READ UMUL UADD 8 C 4 READ UMUL UADD 16 C 3 READ UMUL UADD 32 C 2 READ UMUL UADD 64 C 1 READ UMUL UADD"
> +             equation="B 2 READ 2 C 7 READ UMUL UADD 4 C 6 READ UMUL UADD 8 C 5 READ UMUL UADD 16 C 4 READ UMUL UADD 32 C 3 READ UMUL UADD 64 C 2 READ UMUL UADD"
>               availability="$GtSlice1XeCore2"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -46174,7 +46394,7 @@
>               data_type="uint64"
>               units="bytes"
>               semantic_type="throughput"
> -             equation="C 0 READ 2 B 7 READ UMUL UADD 4 B 6 READ UMUL UADD 8 B 5 READ UMUL UADD 16 B 4 READ UMUL UADD 32 B 3 READ UMUL UADD 64 B 2 READ UMUL UADD"
> +             equation="B 3 READ 2 C 1 READ UMUL UADD 4 C 0 READ UMUL UADD 8 B 7 READ UMUL UADD 16 B 6 READ UMUL UADD 32 B 5 READ UMUL UADD 64 B 4 READ UMUL UADD"
>               availability="$GtSlice1XeCore3"
>               mdapi_group="GPU"
>               mdapi_usage_flags="Frame Batch Draw"
> @@ -46184,29 +46404,32 @@
>      <register_config type="NOA">
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
> -        <register type="NOA" address="0x00009888" value="0x18C80295" />
> -        <register type="NOA" address="0x00009888" value="0x18E80295" />
> +        <register type="NOA" address="0x00009888" value="0x18C802B4" />
> +        <register type="NOA" address="0x00009888" value="0x18E802B4" />
>          <register type="NOA" address="0x00009888" value="0x04C80010" />
> -        <register type="NOA" address="0x00009888" value="0x10C80180" />
> -        <register type="NOA" address="0x00009888" value="0x12C80105" />
> -        <register type="NOA" address="0x00009888" value="0x14C80083" />
> -        <register type="NOA" address="0x00009888" value="0x16C803C1" />
> +        <register type="NOA" address="0x00009888" value="0x0AC80007" />
> +        <register type="NOA" address="0x00009888" value="0x12C8030D" />
> +        <register type="NOA" address="0x00009888" value="0x14C8028B" />
> +        <register type="NOA" address="0x00009888" value="0x16C80209" />
>          <register type="NOA" address="0x00009888" value="0x06C80000" />
> +        <register type="NOA" address="0x00009888" value="0x00C80000" />
>          <register type="NOA" address="0x00009888" value="0x02C80000" />
>          <register type="NOA" address="0x00009888" value="0x04E80010" />
> -        <register type="NOA" address="0x00009888" value="0x0AE80146" />
> -        <register type="NOA" address="0x00009888" value="0x0CE800C4" />
> -        <register type="NOA" address="0x00009888" value="0x0EE80042" />
> -        <register type="NOA" address="0x00009888" value="0x10E8000F" />
> +        <register type="NOA" address="0x00009888" value="0x0AE801C0" />
> +        <register type="NOA" address="0x00009888" value="0x0CE8030D" />
> +        <register type="NOA" address="0x00009888" value="0x0EE8028B" />
> +        <register type="NOA" address="0x00009888" value="0x10E80209" />
>          <register type="NOA" address="0x00009888" value="0x06E80000" />
>          <register type="NOA" address="0x00009888" value="0x00E80000" />
>          <register type="NOA" address="0x00009888" value="0x02E80000" />
>          <register type="NOA" address="0x00009884" value="0x00000004" />
> -        <register type="NOA" address="0x00009888" value="0x0221FFFC" />
> -        <register type="NOA" address="0x00009888" value="0x022AAAA8" />
> +        <register type="NOA" address="0x00009888" value="0x00210030" />
> +        <register type="NOA" address="0x00009888" value="0x0221FFF0" />
> +        <register type="NOA" address="0x00009888" value="0x002A0020" />
> +        <register type="NOA" address="0x00009888" value="0x022AAAA0" />
>          <register type="NOA" address="0x00009884" value="0x00000008" />
> -        <register type="NOA" address="0x00009888" value="0x0082FFF0" />
> -        <register type="NOA" address="0x00009888" value="0x0282AAAB" />
> +        <register type="NOA" address="0x00009888" value="0x0082FFE0" />
> +        <register type="NOA" address="0x00009888" value="0x0282AAAF" />
>          <register type="NOA" address="0x00009884" value="0x00000000" />
>          <register type="NOA" address="0x00009888" value="0x0005FFFC" />
>          <register type="NOA" address="0x00009888" value="0x0002FFFC" />
> @@ -46216,12 +46439,12 @@
>          <register type="NOA" address="0x00009888" value="0x02035555" />
>          <register type="NOA" address="0x00009888" value="0x0004FFFC" />
>          <register type="NOA" address="0x00009888" value="0x56010000" />
> -        <register type="NOA" address="0x00009888" value="0x58010402" />
> +        <register type="NOA" address="0x00009888" value="0x58010400" />
>          <register type="NOA" address="0x00009888" value="0x5A010020" />
>          <register type="NOA" address="0x00009888" value="0x5C010402" />
>          <register type="NOA" address="0x00009888" value="0x5E010020" />
>          <register type="NOA" address="0x00009888" value="0x06010000" />
> -        <register type="NOA" address="0x00009888" value="0x60010002" />
> +        <register type="NOA" address="0x00009888" value="0x60010402" />
>          <register type="NOA" address="0x00009888" value="0x4E010000" />
>          <register type="NOA" address="0x00009888" value="0x50010000" />
>          <register type="NOA" address="0x00009888" value="0x52010000" />
> @@ -46246,6 +46469,7 @@
>         symbol_name="Ext515"
>         underscore_name="ext515"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="fde32e67-1a87-4946-bf96-c1ff68105749"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46320,19 +46544,21 @@
>          <register type="NOA" address="0x00000D04" value="0x00000200" />
>          <register type="NOA" address="0x00009884" value="0x0000000C" />
>          <register type="NOA" address="0x00009888" value="0x1CC85400" />
> +        <register type="NOA" address="0x00009888" value="0x1EC80014" />
>          <register type="NOA" address="0x00009888" value="0x1CE85400" />
> -        <register type="NOA" address="0x00009888" value="0x04C80008" />
> -        <register type="NOA" address="0x00009888" value="0x10C80180" />
> -        <register type="NOA" address="0x00009888" value="0x12C80105" />
> -        <register type="NOA" address="0x00009888" value="0x14C80083" />
> -        <register type="NOA" address="0x00009888" value="0x16C80001" />
> +        <register type="NOA" address="0x00009888" value="0x1EE80014" />
> +        <register type="NOA" address="0x00009888" value="0x04C80098" />
> +        <register type="NOA" address="0x00009888" value="0x10C80140" />
> +        <register type="NOA" address="0x00009888" value="0x12C800C4" />
> +        <register type="NOA" address="0x00009888" value="0x14C80042" />
> +        <register type="NOA" address="0x00009888" value="0x16C803C0" />
>          <register type="NOA" address="0x00009888" value="0x06C80000" />
>          <register type="NOA" address="0x00009888" value="0x02C80000" />
> -        <register type="NOA" address="0x00009888" value="0x04E80008" />
> -        <register type="NOA" address="0x00009888" value="0x0AE80146" />
> -        <register type="NOA" address="0x00009888" value="0x0CE800C4" />
> -        <register type="NOA" address="0x00009888" value="0x0EE80042" />
> -        <register type="NOA" address="0x00009888" value="0x10E80000" />
> +        <register type="NOA" address="0x00009888" value="0x04E80098" />
> +        <register type="NOA" address="0x00009888" value="0x0AE80105" />
> +        <register type="NOA" address="0x00009888" value="0x0CE80083" />
> +        <register type="NOA" address="0x00009888" value="0x0EE80001" />
> +        <register type="NOA" address="0x00009888" value="0x10E8000F" />
>          <register type="NOA" address="0x00009888" value="0x06E80000" />
>          <register type="NOA" address="0x00009888" value="0x00E80000" />
>          <register type="NOA" address="0x00009888" value="0x02E80000" />
> @@ -46381,6 +46607,7 @@
>         symbol_name="Ext516"
>         underscore_name="ext516"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="bf950c5b-7250-47f4-aa59-d97b22db02ff"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46519,6 +46746,7 @@
>         symbol_name="Ext517"
>         underscore_name="ext517"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="9027ff05-4348-4061-a434-0befaba7c379"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46657,6 +46885,7 @@
>         symbol_name="Ext518"
>         underscore_name="ext518"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="6ad0dee9-17bf-4b54-8b70-e30afcc8710b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46795,6 +47024,7 @@
>         symbol_name="Ext519"
>         underscore_name="ext519"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="2c2ecec8-7f33-475c-9ca4-a7e89f949f58"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -46933,6 +47163,7 @@
>         symbol_name="Ext520"
>         underscore_name="ext520"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="d866e2a8-310e-4691-9edc-f7263b8d5c07"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47066,6 +47297,7 @@
>         symbol_name="Ext521"
>         underscore_name="ext521"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e5a95c15-d54f-4d4f-bbe2-533240392df3"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47199,6 +47431,7 @@
>         symbol_name="Ext522"
>         underscore_name="ext522"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="bba76095-18aa-447d-9a79-00461a06f233"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47327,6 +47560,7 @@
>         symbol_name="Ext523"
>         underscore_name="ext523"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="724a5073-2463-4f7f-aecb-7cdd90c831e1"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47455,6 +47689,7 @@
>         symbol_name="Ext524"
>         underscore_name="ext524"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="3b94a07f-e4d8-4cf2-969e-ea19bb253a8c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47595,6 +47830,7 @@
>         symbol_name="Ext525"
>         underscore_name="ext525"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f4399df4-e808-4a0a-85ff-0c66f9c9e8a4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47735,6 +47971,7 @@
>         symbol_name="Ext526"
>         underscore_name="ext526"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f588aa78-c29a-4187-9818-480b12d5b076"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -47875,6 +48112,7 @@
>         symbol_name="Ext527"
>         underscore_name="ext527"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c0a38cc9-f0e9-40f5-9c1e-a4d7eba30825"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48015,6 +48253,7 @@
>         symbol_name="Ext528"
>         underscore_name="ext528"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="1cb1d3ff-ff5d-4c9b-84c9-89b9d235be36"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48150,6 +48389,7 @@
>         symbol_name="Ext529"
>         underscore_name="ext529"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="4491913e-99ed-4420-9575-75ab7a82c45d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48285,6 +48525,7 @@
>         symbol_name="Ext530"
>         underscore_name="ext530"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="4fe2fe09-1ef2-45ff-87f5-e789f8405713"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48415,6 +48656,7 @@
>         symbol_name="Ext531"
>         underscore_name="ext531"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="856f213d-954d-4b0a-be6c-307b41d39b18"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48545,6 +48787,7 @@
>         symbol_name="Ext540"
>         underscore_name="ext540"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="03eb9c9b-72ee-4c7b-930b-6211dbb60503"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48681,6 +48924,7 @@
>         symbol_name="Ext541"
>         underscore_name="ext541"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="e3bef1e9-f563-4927-9ce8-1be6e151448c"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48817,6 +49061,7 @@
>         symbol_name="Ext542"
>         underscore_name="ext542"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="de587fdf-1740-4816-a5c0-08c1cb6b43eb"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -48948,6 +49193,7 @@
>         symbol_name="Ext543"
>         underscore_name="ext543"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="cea536f3-f7ef-449c-91fe-42c721e54b52"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49074,6 +49320,7 @@
>         symbol_name="Ext544"
>         underscore_name="ext544"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c3586bbc-f20b-4ffc-bd62-21ea68c161f4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49212,6 +49459,7 @@
>         symbol_name="Ext545"
>         underscore_name="ext545"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f3d6345a-b760-4433-844e-e35204b44e09"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49350,6 +49598,7 @@
>         symbol_name="Ext546"
>         underscore_name="ext546"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f5448b6d-cb2a-4aad-804e-b1a285299582"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49483,6 +49732,7 @@
>         symbol_name="Ext547"
>         underscore_name="ext547"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="7b8b6c53-abff-4570-b413-91cc843181d8"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49611,6 +49861,7 @@
>         symbol_name="Ext604"
>         underscore_name="ext604"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="b83befed-d2db-4806-907c-3f952798e117"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -49996,6 +50247,7 @@
>         symbol_name="Ext1000"
>         underscore_name="ext1000"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="0d368afb-b8fd-425d-a704-9a45eaaaed3d"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -50342,6 +50594,7 @@
>         symbol_name="Ext1001"
>         underscore_name="ext1001"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="08bee982-b34c-49c1-bf0c-93c1949ffbe7"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -50745,6 +50998,7 @@
>         symbol_name="Ext1002"
>         underscore_name="ext1002"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="845617a9-5a17-4f1f-9a6f-61ff844065e4"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -51063,6 +51317,7 @@
>         symbol_name="Ext1003"
>         underscore_name="ext1003"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="24e3b1a8-b80e-4c8c-ab21-83640d78f896"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -51410,6 +51665,7 @@
>         symbol_name="Ext1004"
>         underscore_name="ext1004"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="974d6469-d51f-4e4a-a393-32033f9b562e"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -51757,6 +52013,7 @@
>         symbol_name="Ext1005"
>         underscore_name="ext1005"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="c172fb87-e53f-468d-893a-d8528684accc"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -52160,6 +52417,7 @@
>         symbol_name="Ext1006"
>         underscore_name="ext1006"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="f739508f-51b2-48df-839c-e92c14d14c64"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -52506,6 +52764,7 @@
>         symbol_name="Ext1007"
>         underscore_name="ext1007"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="926b1773-807e-4ee5-8561-30c9eb0a6344"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -52795,6 +53054,7 @@
>         symbol_name="Ext1010"
>         underscore_name="ext1010"
>         mdapi_supported_apis="VK OGL OCL IO"
> +       oa_format="256B_GENERIC_NOA16"
>         hw_config_guid="82f69b49-772a-4169-bf9a-b1ef08e0823b"
>         >
>      <counter name="GPU Time Elapsed"
> @@ -52914,4 +53174,656 @@
>      </register_config>
>    </set>
>  
> +  <set name="MediaSet1"
> +       chipset="MTLGT3"
> +       symbol_name="MediaSet1"
> +       underscore_name="media_set1"
> +       mdapi_supported_apis="IO"
> +       oa_format="128B_MPEC8_NOA16"
> +       hw_config_guid="4d9b2817-19b9-4461-a54b-dc9fdb7d69cb"
> +       >
> +    <counter name="GPU Time Elapsed"
> +             symbol_name="GpuTime"
> +             underscore_name="gpu_time"
> +             description="GPU Time Elapsed"
> +             data_type="uint64"
> +             units="ns"
> +             semantic_type="event"
> +             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Batch"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="GPU Core Clocks"
> +             symbol_name="GpuCoreClocks"
> +             underscore_name="gpu_core_clocks"
> +             description="The total number of GPU core clocks elapsed during the measurement."
> +             data_type="uint64"
> +             units="cycles"
> +             semantic_type="event"
> +             equation="GPU_CLOCK 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="AVG GPU Core Frequency"
> +             symbol_name="AvgGpuCoreFrequency"
> +             underscore_name="avg_gpu_core_frequency"
> +             description="Average GPU Core Frequency in the measurement."
> +             data_type="uint64"
> +             max_equation="$GpuMaxFrequency"
> +             units="hz"
> +             semantic_type="event"
> +             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST"
> +             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST"
> +             underscore_name="video_decode_box0_read_request"
> +             description="Number of VDBOX0 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST"
> +             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST"
> +             underscore_name="video_decode_box0_write_request"
> +             description="Number of VDBOX0 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 1 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX1_READ_REQUEST"
> +             symbol_name="VIDEO_DECODE_BOX1_READ_REQUEST"
> +             underscore_name="video_decode_box1_read_request"
> +             description="Number of VDBOX1 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 2 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX1_WRITE_REQUEST"
> +             symbol_name="VIDEO_DECODE_BOX1_WRITE_REQUEST"
> +             underscore_name="video_decode_box1_write_request"
> +             description="Number of VDBOX1 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 3 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_ENHANCEMENT_BOX0_READ_REQUEST"
> +             symbol_name="VIDEO_ENHANCEMENT_BOX0_READ_REQUEST"
> +             underscore_name="video_enhancement_box0_read_request"
> +             description="Number of VEBOX0 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 4 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_ENHANCEMENT_BOX0_WRITE_REQUEST"
> +             symbol_name="VIDEO_ENHANCEMENT_BOX0_WRITE_REQUEST"
> +             underscore_name="video_enhancement_box0_write_request"
> +             description="Number of VEBOX0 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 5 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_ENHANCEMENT_BOX1_READ_REQUEST"
> +             symbol_name="VIDEO_ENHANCEMENT_BOX1_READ_REQUEST"
> +             underscore_name="video_enhancement_box1_read_request"
> +             description="Number of VEBOX1 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 6 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_ENHANCEMENT_BOX1_WRITE_REQUEST"
> +             symbol_name="VIDEO_ENHANCEMENT_BOX1_WRITE_REQUEST"
> +             underscore_name="video_enhancement_box1_write_request"
> +             description="Number of VEBOX1 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 7 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <register_config type="OA">
> +        <register type="OA" address="0x00393200" value="0x00000201" />
> +        <register type="OA" address="0x00393204" value="0x00000000" />
> +        <register type="OA" address="0x00393208" value="0x00000202" />
> +        <register type="OA" address="0x0039320C" value="0x00000000" />
> +        <register type="OA" address="0x00393210" value="0x00000401" />
> +        <register type="OA" address="0x00393214" value="0x00000000" />
> +        <register type="OA" address="0x00393218" value="0x00000402" />
> +        <register type="OA" address="0x0039321C" value="0x00000000" />
> +        <register type="OA" address="0x00393220" value="0x00002201" />
> +        <register type="OA" address="0x00393224" value="0x00000000" />
> +        <register type="OA" address="0x00393228" value="0x00002202" />
> +        <register type="OA" address="0x0039322C" value="0x00000000" />
> +        <register type="OA" address="0x00393230" value="0x00002401" />
> +        <register type="OA" address="0x00393234" value="0x00000000" />
> +        <register type="OA" address="0x00393238" value="0x00002402" />
> +        <register type="OA" address="0x0039323C" value="0x00000000" />
> +        <register type="OA" address="0x00393034" value="0x00000000" />
> +    </register_config>
> +  </set>
> +
> +  <set name="MediaSet2"
> +       chipset="MTLGT3"
> +       symbol_name="MediaSet2"
> +       underscore_name="media_set2"
> +       mdapi_supported_apis="IO"
> +       oa_format="128B_MPEC8_NOA16"
> +       hw_config_guid="651a6694-0ac1-4bd5-a4a1-94bcf479d4f4"
> +       >
> +    <counter name="GPU Time Elapsed"
> +             symbol_name="GpuTime"
> +             underscore_name="gpu_time"
> +             description="GPU Time Elapsed"
> +             data_type="uint64"
> +             units="ns"
> +             semantic_type="event"
> +             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Batch"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="GPU Core Clocks"
> +             symbol_name="GpuCoreClocks"
> +             underscore_name="gpu_core_clocks"
> +             description="The total number of GPU core clocks elapsed during the measurement."
> +             data_type="uint64"
> +             units="cycles"
> +             semantic_type="event"
> +             equation="GPU_CLOCK 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="AVG GPU Core Frequency"
> +             symbol_name="AvgGpuCoreFrequency"
> +             underscore_name="avg_gpu_core_frequency"
> +             description="Average GPU Core Frequency in the measurement."
> +             data_type="uint64"
> +             max_equation="$GpuMaxFrequency"
> +             units="hz"
> +             semantic_type="event"
> +             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="MEDIA_READ_REQUEST"
> +             symbol_name="MEDIA_READ_REQUEST"
> +             underscore_name="media_read_request"
> +             description="Number of read requests from stand alone media "
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="MEDIA_WRITE_REQUEST"
> +             symbol_name="MEDIA_WRITE_REQUEST"
> +             underscore_name="media_write_request"
> +             description="Number of write requests from stand alone media "
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 1 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="COMMAND PARSER VIDEO DECODE_ENGINE0 BUSY"
> +             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE0_BUSY"
> +             underscore_name="command_parser_video_decode_engine0_busy"
> +             description="Percentage of time in which there is a context loaded and active on the media VDBOX0"
> +             data_type="float"
> +             max_equation="100"
> +             units="percent"
> +             semantic_type="duration"
> +             equation="A 2 READ 100 UMUL $GpuCoreClocks FDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="COMMAND_PARSER_VIDEO_DECODE_ENGINE1_BUSY"
> +             symbol_name="COMMAND_PARSER_VIDEO_DECODE_ENGINE1_BUSY"
> +             underscore_name="command_parser_video_decode_engine1_busy"
> +             description="Percentage of time in which there is a context loaded and active on the media VDBOX1"
> +             data_type="float"
> +             max_equation="100"
> +             units="percent"
> +             semantic_type="duration"
> +             equation="A 3 READ 100 UMUL $GpuCoreClocks FDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE0_BUSY"
> +             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE0_BUSY"
> +             underscore_name="command_parser_video_enhancement_engine0_busy"
> +             description="Percentage of time in which there is a context loaded and active on the media VEBOX0"
> +             data_type="float"
> +             max_equation="100"
> +             units="percent"
> +             semantic_type="duration"
> +             equation="A 4 READ 100 UMUL $GpuCoreClocks FDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE1_BUSY"
> +             symbol_name="COMMAND_PARSER_VIDEO_ENHANCEMENT_ENGINE1_BUSY"
> +             underscore_name="command_parser_video_enhancement_engine1_busy"
> +             description="Percentage of time in which there is a context loaded and active on the media VEBOX0"
> +             data_type="float"
> +             max_equation="100"
> +             units="percent"
> +             semantic_type="duration"
> +             equation="A 5 READ 100 UMUL $GpuCoreClocks FDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="COMMAND_PARSER_GRAPHICS_SECURITY_CONTROLLER_BUSY"
> +             symbol_name="COMMAND_PARSER_GRAPHICS_SECURITY_CONTROLLER_BUSY"
> +             underscore_name="command_parser_graphics_security_controller_busy"
> +             description="Percentage of time in which Graphics Security Controller is active."
> +             data_type="float"
> +             max_equation="100"
> +             units="percent"
> +             semantic_type="duration"
> +             equation="A 6 READ 100 UMUL $GpuCoreClocks FDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <register_config type="OA">
> +        <register type="OA" address="0x00393200" value="0x00000001" />
> +        <register type="OA" address="0x00393204" value="0x00000000" />
> +        <register type="OA" address="0x00393208" value="0x00000002" />
> +        <register type="OA" address="0x0039320C" value="0x00000000" />
> +        <register type="OA" address="0x00393210" value="0x00000200" />
> +        <register type="OA" address="0x00393214" value="0x00000000" />
> +        <register type="OA" address="0x00393218" value="0x00000400" />
> +        <register type="OA" address="0x0039321C" value="0x00000000" />
> +        <register type="OA" address="0x00393220" value="0x00002200" />
> +        <register type="OA" address="0x00393224" value="0x00000000" />
> +        <register type="OA" address="0x00393228" value="0x00002400" />
> +        <register type="OA" address="0x0039322C" value="0x00000000" />
> +        <register type="OA" address="0x00393230" value="0x00000003" />
> +        <register type="OA" address="0x00393234" value="0x00000000" />
> +        <register type="OA" address="0x00393034" value="0x00000000" />
> +    </register_config>
> +  </set>
> +
> +  <set name="TestOam"
> +       chipset="MTLGT3"
> +       symbol_name="TestOam"
> +       underscore_name="test_oam"
> +       mdapi_supported_apis="IO"
> +       oa_format="128B_MPEC8_NOA16"
> +       hw_config_guid="bac01106-5869-489c-a306-67303a434173"
> +       >
> +    <counter name="GPU Time Elapsed"
> +             symbol_name="GpuTime"
> +             underscore_name="gpu_time"
> +             description="GPU Time Elapsed"
> +             data_type="uint64"
> +             units="ns"
> +             semantic_type="event"
> +             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Batch"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="GPU Core Clocks"
> +             symbol_name="GpuCoreClocks"
> +             underscore_name="gpu_core_clocks"
> +             description="The total number of GPU core clocks elapsed during the measurement."
> +             data_type="uint64"
> +             units="cycles"
> +             semantic_type="event"
> +             equation="GPU_CLOCK 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="AVG GPU Core Frequency"
> +             symbol_name="AvgGpuCoreFrequency"
> +             underscore_name="avg_gpu_core_frequency"
> +             description="Average GPU Core Frequency in the measurement."
> +             data_type="uint64"
> +             max_equation="$GpuMaxFrequency"
> +             units="hz"
> +             semantic_type="event"
> +             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter0"
> +             symbol_name="Counter0"
> +             underscore_name="counter0"
> +             description="HW test counter 0. Factor: 0.0"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 0 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter1"
> +             symbol_name="Counter1"
> +             underscore_name="counter1"
> +             description="HW test counter 1. Factor: 1.0"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 1 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter2"
> +             symbol_name="Counter2"
> +             underscore_name="counter2"
> +             description="HW test counter 2. Factor: 1.0"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 2 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter3"
> +             symbol_name="Counter3"
> +             underscore_name="counter3"
> +             description="HW test counter 3. Factor: 0.5"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 3 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter4"
> +             symbol_name="Counter4"
> +             underscore_name="counter4"
> +             description="HW test counter 4. Factor: 0.3333"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 4 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter5"
> +             symbol_name="Counter5"
> +             underscore_name="counter5"
> +             description="HW test counter 5. Factor: 0.3333"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 5 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter6"
> +             symbol_name="Counter6"
> +             underscore_name="counter6"
> +             description="HW test counter 6. Factor: 0.16666"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="B 6 READ"
> +             mdapi_group="Test"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="TestCounter8"
> +             symbol_name="Counter8"
> +             underscore_name="counter8"
> +             description="TestCounter8"
> +             data_type="uint64"
> +             units="events"
> +             semantic_type="event"
> +             equation="C 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST_VISA"
> +             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST_VISA"
> +             underscore_name="video_decode_box0_write_request_visa"
> +             description="Number of VDBOX0 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="C 1 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST_VISA"
> +             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST_VISA"
> +             underscore_name="video_decode_box0_read_request_visa"
> +             description="Number of VDBOX0 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="B 7 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Frame Batch Draw"
> +             mdapi_supported_apis=""
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_READ_REQUEST_MPEC"
> +             symbol_name="VIDEO_DECODE_BOX0_READ_REQUEST_MPEC"
> +             underscore_name="video_decode_box0_read_request_mpec"
> +             description="Number of VDBOX0 read requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 0 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <counter name="VIDEO_DECODE_BOX0_WRITE_REQUEST_MPEC"
> +             symbol_name="VIDEO_DECODE_BOX0_WRITE_REQUEST_MPEC"
> +             underscore_name="video_decode_box0_write_request_mpec"
> +             description="Number of VDBOX0 write requests"
> +             data_type="uint64"
> +             units="messages"
> +             semantic_type="event"
> +             equation="A 1 READ"
> +             mdapi_group="GPU"
> +             mdapi_usage_flags="Tier1 Frame Batch Draw"
> +             mdapi_supported_apis="IO"
> +             mdapi_hw_unit_type="gpu"
> +             />
> +    <register_config type="NOA">
> +        <register type="NOA" address="0x0038D114" value="0x00000003" />
> +        <register type="NOA" address="0x0038D100" value="0x00000DE0" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000DE2" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000001C0" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000001C1" />
> +        <register type="NOA" address="0x0038D104" value="0x00000809" />
> +        <register type="NOA" address="0x0038D100" value="0x000001C3" />
> +        <register type="NOA" address="0x0038D104" value="0x00800400" />
> +        <register type="NOA" address="0x0038D100" value="0x000001C4" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x000001C5" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000360" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000361" />
> +        <register type="NOA" address="0x0038D104" value="0x00001819" />
> +        <register type="NOA" address="0x0038D100" value="0x00000362" />
> +        <register type="NOA" address="0x0038D104" value="0x00001C1D" />
> +        <register type="NOA" address="0x0038D100" value="0x00000363" />
> +        <register type="NOA" address="0x0038D104" value="0x02402006" />
> +        <register type="NOA" address="0x0038D100" value="0x00000364" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000365" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x000003A0" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000003A1" />
> +        <register type="NOA" address="0x0038D104" value="0x00001011" />
> +        <register type="NOA" address="0x0038D100" value="0x000003BB" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000003BC" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000004E0" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x000004E1" />
> +        <register type="NOA" address="0x0038D104" value="0x00001819" />
> +        <register type="NOA" address="0x0038D100" value="0x000004E3" />
> +        <register type="NOA" address="0x0038D104" value="0x00000400" />
> +        <register type="NOA" address="0x0038D100" value="0x000004E4" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x000004E5" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000420" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000421" />
> +        <register type="NOA" address="0x0038D104" value="0x00001A1B" />
> +        <register type="NOA" address="0x0038D100" value="0x00000423" />
> +        <register type="NOA" address="0x0038D104" value="0x00000400" />
> +        <register type="NOA" address="0x0038D100" value="0x00000424" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000425" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000540" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000541" />
> +        <register type="NOA" address="0x0038D104" value="0x00001415" />
> +        <register type="NOA" address="0x0038D100" value="0x00000543" />
> +        <register type="NOA" address="0x0038D104" value="0x00000400" />
> +        <register type="NOA" address="0x0038D100" value="0x00000544" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000545" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000660" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000661" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x00000663" />
> +        <register type="NOA" address="0x0038D104" value="0x00000C02" />
> +        <register type="NOA" address="0x0038D100" value="0x00000664" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000665" />
> +        <register type="NOA" address="0x0038D104" value="0x00000000" />
> +        <register type="NOA" address="0x0038D100" value="0x00000669" />
> +        <register type="NOA" address="0x0038D104" value="0x00000001" />
> +        <register type="NOA" address="0x0038D100" value="0x0000066A" />
> +        <register type="NOA" address="0x0038D104" value="0x00000015" />
> +        <register type="NOA" address="0x0038D114" value="0x0000000B" />
> +    </register_config>
> +    <register_config type="OA">
> +        <register type="OA" address="0x00393200" value="0x00000201" />
> +        <register type="OA" address="0x00393204" value="0x00000000" />
> +        <register type="OA" address="0x00393208" value="0x00000202" />
> +        <register type="OA" address="0x0039320C" value="0x00000000" />
> +        <register type="OA" address="0x00393000" value="0x00000000" />
> +        <register type="OA" address="0x00393004" value="0xF0800000" />
> +        <register type="OA" address="0x00393010" value="0x00000000" />
> +        <register type="OA" address="0x00393014" value="0xF0800000" />
> +        <register type="OA" address="0x00393020" value="0x00000000" />
> +        <register type="OA" address="0x00393040" value="0x00000004" />
> +        <register type="OA" address="0x00393044" value="0x0000FFFF" />
> +        <register type="OA" address="0x00393048" value="0x00000003" />
> +        <register type="OA" address="0x0039304C" value="0x0000FFFF" />
> +        <register type="OA" address="0x00393050" value="0x00000007" />
> +        <register type="OA" address="0x00393054" value="0x0000FFFF" />
> +        <register type="OA" address="0x00393058" value="0x00100002" />
> +        <register type="OA" address="0x0039305C" value="0x0000FFF7" />
> +        <register type="OA" address="0x00393060" value="0x00100002" />
> +        <register type="OA" address="0x00393064" value="0x0000FFCF" />
> +        <register type="OA" address="0x00393068" value="0x00100082" />
> +        <register type="OA" address="0x0039306C" value="0x0000FFEF" />
> +        <register type="OA" address="0x00393070" value="0x001000C2" />
> +        <register type="OA" address="0x00393074" value="0x0000FFE7" />
> +        <register type="OA" address="0x00393078" value="0x00002002" />
> +        <register type="OA" address="0x0039307C" value="0x0000F9FF" />
> +        <register type="OA" address="0x00393034" value="0x00000000" />
> +    </register_config>
> +  </set>
> +
>  </metrics>
> -- 
> 2.36.1
> 
