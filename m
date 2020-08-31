Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38626E2CA
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 15:10:07 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 31 Aug 2020 18:09:49 +0300
Message-Id: <20200831150951.357727-7-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
References: <20200831150951.357727-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 6/8] lib/i915/perf: add AsyncCompute
 metrics
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Those metrics are mostly about exposing the amount of FPU usage with a
compute filter in the FLEX EU per registers.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml            |   9 +
 lib/i915/perf-configs/mdapi-xml-convert.py |   4 +-
 lib/i915/perf-configs/oa-bxt.xml           | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-cflgt2.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-cflgt3.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-icl.xml           | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-kblgt2.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-kblgt3.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-sklgt2.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-sklgt3.xml        | 312 ++++++++++++++++++++-
 lib/i915/perf-configs/oa-sklgt4.xml        | 312 ++++++++++++++++++++-
 11 files changed, 2809 insertions(+), 12 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index b41b72f1..169c7885 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -88,6 +88,7 @@
     <guid config_hash="0c77cba2d8886c18df9f382ce90eac66" mdapi_config_hash="a66f0092b99ca3a8ce29e0ce4be513ff" id="9d4643f8-aa05-482e-8193-070a8ab0d117" chipset="bxt" name="TDL_2" />
     <guid config_hash="e6d52ba7af730de63eeaa8d727b36ed7" mdapi_config_hash="6898bc10a62600907cc6c47d1f7004a0" id="c9f5fa3a-d14f-400c-a89a-211206b00ee7" chipset="bxt" name="GpuBusyness" />
     <guid config_hash="6d13f443205926fd1351ae5adeae8965" mdapi_config_hash="24f384a77963d7d64c324b3d89eeb498" id="d49cd0d8-8c7f-4465-94fc-51e08c9050bc" chipset="bxt" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="d3c38c785083f96af147bcda8d43af4c" id="b890cb09-42f7-4644-8aac-a7beca4b9181" chipset="bxt" name="AsyncCompute" />
     <guid config_hash="fc79f102b841df08ac154ddebc634bf6" mdapi_config_hash="3c97b92455702ca6f6a6f846dcc1ebd3" id="07b25942-d9fd-4fce-bd58-e29abd66b7de" chipset="sklgt2" name="RenderBasic" />
     <guid config_hash="3e0e14aef4a2cf7e61098928c034caff" mdapi_config_hash="ecb641130c942e71d5a9de8adb51c7f6" id="00b80b4c-d215-4378-9015-da3dda3b61ea" chipset="sklgt2" name="ComputeBasic" />
     <guid config_hash="d757768d43838dd04e2db7e9928c87d9" mdapi_config_hash="79c6baee9374a6c43b8e0fabda2c1a39" id="2a0c0933-37e7-427c-9951-ded42a78bb27" chipset="sklgt2" name="RenderPipeProfile" />
@@ -109,6 +110,7 @@
     <guid config_hash="ee7996e47cdaf7722422397285763cdc" mdapi_config_hash="ada812fc71ebbabd1e746dbab67881b1" id="c44a5cf7-886d-477b-bebd-2d738923e4c3" chipset="sklgt2" name="GpuBusyness" />
     <guid config_hash="cec6202194db96d6a09fed71808bb7de" mdapi_config_hash="df4b9b85ed61f457a0b71b03299b282d" id="e0b2aae4-9b8f-4211-8df0-f8e8cb203209" chipset="sklgt2" name="FfBottlenecks" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="e7f3f72cad542f3a17c09686e65487fc" id="27871149-2fa9-40ba-aa73-350d60c03a09" chipset="sklgt2" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="49ad49a8e0837b1075ea7c1eff407d7f" id="ea700484-6e4d-4765-94a3-7867fba6805a" chipset="sklgt2" name="AsyncCompute" />
     <guid config_hash="a7f1b241b23898785166ab10ca4ce1bf" mdapi_config_hash="ae3528402606bbb21a08da7ef5ea1530" id="21fef15a-83f4-4ffa-bb81-7da6e38b8e4b" chipset="sklgt3" name="RenderBasic" />
     <guid config_hash="ede53df6549f788495f7fca90475b6dd" mdapi_config_hash="87390c127ce809c3cfab64388ddebd14" id="4320492b-fd03-42ac-922f-dbe1ef3b7b58" chipset="sklgt3" name="ComputeBasic" />
     <guid config_hash="0f8eee02ed3e457362ffdc38ed10036c" mdapi_config_hash="2d95f03caa28b40e2a25f3bc8ac38b55" id="bd2d9cae-b9ec-4f5b-9d2f-934bed398a2d" chipset="sklgt3" name="RenderPipeProfile" />
@@ -129,6 +131,7 @@
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="d05fe58178a1882edcb81d86070551e3" id="2b985803-d3c9-4629-8a4f-634bfecba0e8" chipset="sklgt3" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="0c5058ff-fdf4-4e0d-81fb-c0310fb76525" chipset="sklgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c889fd93-8dc7-4ba5-9451-de34a8b5ea3f" chipset="sklgt3" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2acbf308-143d-4846-a976-6ad7cc83148a" chipset="sklgt3" name="AsyncCompute" />
     <guid config_hash="0a80b2a2caa3386ecce110a7904eb1c1" mdapi_config_hash="61d002ce457b9ce087613d986e6b0544" id="95322a71-bb05-4437-bc27-f7dd7b27d136" chipset="sklgt4" name="RenderBasic" />
     <guid config_hash="898ee42bb4b359d4c0eb97c5919cfd7f" mdapi_config_hash="d596d8f326e5378b871b825eb954e95c" id="7277228f-e7f3-4743-945a-6a2049d11377" chipset="sklgt4" name="ComputeBasic" />
     <guid config_hash="48b5556f95fc27dceb10c65556a16613" mdapi_config_hash="95e3f2b556fe9795e0d0e0d3b0c5ee00" id="463c668c-3f60-49b6-8f85-d995b635b3b2" chipset="sklgt4" name="RenderPipeProfile" />
@@ -149,6 +152,7 @@
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="051007cbfaffa4151d7c9365edde7bff" id="882fa433-1f4a-4a67-a962-c741888fe5f5" chipset="sklgt4" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="4e5b1599-5b01-4b3d-89fa-6b26a25fe02b" chipset="sklgt4" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="befe9fd6-474e-4a3d-b98e-cd793715cf91" chipset="sklgt4" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="93685e9d-f4ba-4f30-a087-a4f56246fc70" chipset="sklgt4" name="AsyncCompute" />
     <guid config_hash="afbe2cb999a8303f52eea075f3b8687e" mdapi_config_hash="966416aaaf33b0bce90c0daa51217242" id="99c1a40e-a090-4354-86e3-4d068bb1917e" chipset="kblgt2" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="c72d95bf362111446018c52210ec48b6" id="12994724-3a5a-4303-bb3c-ba0175d2c200" chipset="kblgt2" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="7ee27e7f11eea3282e62abde604b61a2" id="d7a17a3a-ca71-40d2-a919-ace80d50633f" chipset="kblgt2" name="RenderPipeProfile" />
@@ -169,6 +173,7 @@
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="5f4afc2f159098e96b8fd90a85979ae3" id="baa3c7e4-52b6-4b85-801e-465a94b746dd" chipset="kblgt2" name="TestOa" />
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="6c66fe6e-2988-454a-bfae-7fca3bbcbec2" chipset="kblgt2" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="b49aa434-4958-4d98-9e6f-443ff27ca74d" chipset="kblgt2" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2f0740b8-da7c-47ff-b7ec-cc7bbf2057a0" chipset="kblgt2" name="AsyncCompute" />
     <guid config_hash="73805d7acd1298aa6d81d3e2278ee411" mdapi_config_hash="9111e46468492c1c14a331510c18a49b" id="17b4f3e0-d578-4ae3-b7a8-98d756d1e0df" chipset="kblgt3" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="ac97e9ebaf2a55476a86ab2559e5ecab" id="a5dc0bc5-d6fa-4f3a-9979-d3248c786042" chipset="kblgt3" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="808e46d786103380f58d1e8f91402c4c" id="c7c735f3-ce58-45cf-aa04-30b183f1faff" chipset="kblgt3" name="RenderPipeProfile" />
@@ -189,6 +194,7 @@
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="817cb7526b5399e772ed721e062325b3" id="f1792f32-6db2-4b50-b4b2-557128f1688d" chipset="kblgt3" name="TestOa" />
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="b55ecba1-2aa9-422e-89ff-b9e30f03d447" chipset="kblgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="85bc2e4f-2563-4388-921b-dc0dad879cf3" chipset="kblgt3" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="cad0e478-5fec-44cc-ad01-76d4c61f52ad" chipset="kblgt3" name="AsyncCompute" />
     <guid config_hash="c01efa1ec2a11ea9aaab8b0a8e548174" mdapi_config_hash="7867725687bd177e4e8b8b8443b04355" id="d72df5c7-5b4a-4274-a43f-00b0fd51fc68" chipset="glk" name="RenderBasic" />
     <guid config_hash="cde046a01aba9c56d6fa44bf2c0f26c2" mdapi_config_hash="84d270fda538f1061067316b19b9cac9" id="814285f6-354d-41d2-ba49-e24e622714a0" chipset="glk" name="ComputeBasic" />
     <guid config_hash="1669463a6836f6d057cbf3e41506923b" mdapi_config_hash="66b8f785edc91d1cf3952fc842114671" id="07d397a6-b3e6-49f6-9433-a4f293d55978" chipset="glk" name="RenderPipeProfile" />
@@ -225,6 +231,7 @@
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="e2f162ae-5732-4af0-8b11-69510f57094a" chipset="cflgt2" name="GpuBusyness" />
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="5f4afc2f159098e96b8fd90a85979ae3" id="74fb4902-d3d3-4237-9e90-cbdc68d0a446" chipset="cflgt2" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="5ccbf9fb-6bf2-456b-a749-bdff7b1aff13" chipset="cflgt2" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="d642768d-65a2-458d-9233-d15ff6f717e9" chipset="cflgt2" name="AsyncCompute" />
     <guid config_hash="73805d7acd1298aa6d81d3e2278ee411" mdapi_config_hash="5d3d4bcf1e36569409cfd84a7e137ade" id="b316bcab-212f-4228-97de-af6b5a1a2ea1" chipset="cflgt3" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="4a9628256274ffe348e8dc21f0f22f3b" id="d2eec5b1-4dd8-4170-ae83-9531abd0692f" chipset="cflgt3" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="498feca145a69e7fcec55b79d239d005" id="9875e050-b1bc-45e6-a6ab-665594601df9" chipset="cflgt3" name="RenderPipeProfile" />
@@ -245,6 +252,7 @@
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="22b7e0c2-cade-425f-b099-34479768c72a" chipset="cflgt3" name="GpuBusyness" />
     <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="228710e94277d74bd4be0c2536a3edd4" id="577e8e2c-3fa0-4875-8743-3538d585e3b0" chipset="cflgt3" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c11af8d1-858b-4f8b-98fb-8d683ba8bda0" chipset="cflgt3" name="PMA_Stall" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="4a97c6cf-8e84-4854-a031-6c6e7b42e07c" chipset="cflgt3" name="AsyncCompute" />
     <guid config_hash="428ad0859c9dac4ba85dd73106f5b2de" mdapi_config_hash="7baf473e87d0838b628bd2ed289f4783" id="2d975e19-7130-41d2-b06f-79d74f91e7c8" chipset="cnl" name="RenderBasic" />
     <guid config_hash="7365cff2873ed22304dcb350ca19d834" mdapi_config_hash="174f9ff2125d06a7886a258304ba4eae" id="eed14f91-5f03-4e3a-8281-ac38030ac573" chipset="cnl" name="ComputeBasic" />
     <guid config_hash="1878c620a9f0cc5100fba47c83a1457c" mdapi_config_hash="f1baa55e099488db74fd02c9560df40b" id="0666ccac-f5aa-4dc2-aa12-c6e058f383f3" chipset="cnl" name="RenderPipeProfile" />
@@ -279,6 +287,7 @@
     <guid config_hash="d2188fa3c865ef430532b127a3fd87a5" mdapi_config_hash="ff33e47c767f6f81d9a779153aae6fdb" id="fd25ec19-3ed1-40c9-8648-1d2387449a92" chipset="icl" name="TDL_3" />
     <guid config_hash="b421b29d8557dbbf0fe3068c82b3d8dd" mdapi_config_hash="cc850ab4463c23e6017f069d67785c31" id="40dc79f2-88c8-47c6-8f86-f509e39fbe5d" chipset="icl" name="GpuBusyness" />
     <guid config_hash="7480125fc0806a347f975dc714568e92" mdapi_config_hash="c6b1c7a22e3c2f456cbfdae1bfe394ac" id="3c0bf614-5d67-4326-887f-a24eb8a58244" chipset="icl" name="TestOa" />
+    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="7d863af6-be13-4f00-822d-33f58c8df9e7" chipset="icl" name="AsyncCompute" />
     <guid config_hash="25380f09a9ab454374c78f1b5d1c4ddf" mdapi_config_hash="4d28665f4702ddf38239e5c47384dc15" id="a95112cc-804a-4c80-b57b-2870e56cc240" chipset="ehl" name="RenderBasic" />
     <guid config_hash="bf521fa74e9f5285bc3e9a7215cdadd2" mdapi_config_hash="bf085a519814344b241b08064f256921" id="54449e8a-196b-4c43-8ecd-540b0504b5c1" chipset="ehl" name="ComputeBasic" />
     <guid config_hash="9b6d58e5047c130f47999e04b92151e8" mdapi_config_hash="7bf6ffff6913e5536d4ad4dc4fa3b03b" id="05700b63-f044-4c79-b8ae-676972114745" chipset="ehl" name="ComputeExtended" />
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 65d59b12..1d36000e 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -134,7 +134,6 @@ default_set_blacklist = { "RenderDX1x", # TODO: rename to something non 'DX'
                                         # usefull
                           "RenderBalance", # XXX: missing register config
                           "PipelineTimestamps", # Covered by API timestamp queries
-                          "AsyncCompute",
                         }
 
 counter_blacklist = {
@@ -485,8 +484,7 @@ def process_mux_configs(mdapi_set):
         mux_config_id_groups = [mux_config_id_groups[0]]
 
     if len(mux_config_id_groups) == 0 or mux_config_id_groups[0]['configs'] == 0:
-        print_err("ERROR: MUX register configs missing: MetricSet=\"" + mdapi_set.get('ShortName'))
-        sys.exit(1)
+        return ()
 
     mux_configs = mux_config_id_groups[0]['configs']
     assert isinstance(mux_configs, list)
diff --git a/lib/i915/perf-configs/oa-bxt.xml b/lib/i915/perf-configs/oa-bxt.xml
index 3acaaf6d..7bf8f098 100644
--- a/lib/i915/perf-configs/oa-bxt.xml
+++ b/lib/i915/perf-configs/oa-bxt.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="BXT"
        symbol_name="RenderBasic"
@@ -9592,4 +9592,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="BXT"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="b890cb09-42f7-4644-8aac-a7beca4b9181"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-cflgt2.xml b/lib/i915/perf-configs/oa-cflgt2.xml
index 65b9ac53..1c021cde 100644
--- a/lib/i915/perf-configs/oa-cflgt2.xml
+++ b/lib/i915/perf-configs/oa-cflgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT2"
        symbol_name="RenderBasic"
@@ -10863,4 +10863,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="CFLGT2"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="d642768d-65a2-458d-9233-d15ff6f717e9"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-cflgt3.xml b/lib/i915/perf-configs/oa-cflgt3.xml
index 2a568f48..94396984 100644
--- a/lib/i915/perf-configs/oa-cflgt3.xml
+++ b/lib/i915/perf-configs/oa-cflgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT3"
        symbol_name="RenderBasic"
@@ -10930,4 +10930,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="CFLGT3"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="4a97c6cf-8e84-4854-a031-6c6e7b42e07c"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index eac32092..cbcd647d 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598349212" merge_md5="">
+<metrics version="1598356969" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
@@ -11866,4 +11866,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="ICL"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="7d863af6-be13-4f00-822d-33f58c8df9e7"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-kblgt2.xml b/lib/i915/perf-configs/oa-kblgt2.xml
index 5db53751..f7b80f9f 100644
--- a/lib/i915/perf-configs/oa-kblgt2.xml
+++ b/lib/i915/perf-configs/oa-kblgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT2"
        symbol_name="RenderBasic"
@@ -10863,4 +10863,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="KBLGT2"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="2f0740b8-da7c-47ff-b7ec-cc7bbf2057a0"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-kblgt3.xml b/lib/i915/perf-configs/oa-kblgt3.xml
index 1a7e29a8..2ff35b51 100644
--- a/lib/i915/perf-configs/oa-kblgt3.xml
+++ b/lib/i915/perf-configs/oa-kblgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT3"
        symbol_name="RenderBasic"
@@ -10930,4 +10930,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="KBLGT3"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="cad0e478-5fec-44cc-ad01-76d4c61f52ad"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-sklgt2.xml b/lib/i915/perf-configs/oa-sklgt2.xml
index 1354a3cf..78aefae2 100644
--- a/lib/i915/perf-configs/oa-sklgt2.xml
+++ b/lib/i915/perf-configs/oa-sklgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1598356967" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT2"
        symbol_name="RenderBasic"
@@ -11892,4 +11892,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="SKLGT2"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="ea700484-6e4d-4765-94a3-7867fba6805a"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-sklgt3.xml b/lib/i915/perf-configs/oa-sklgt3.xml
index 1ce6c406..1d1d4d6f 100644
--- a/lib/i915/perf-configs/oa-sklgt3.xml
+++ b/lib/i915/perf-configs/oa-sklgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1598356967" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT3"
        symbol_name="RenderBasic"
@@ -10930,4 +10930,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="SKLGT3"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="2acbf308-143d-4846-a976-6ad7cc83148a"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
diff --git a/lib/i915/perf-configs/oa-sklgt4.xml b/lib/i915/perf-configs/oa-sklgt4.xml
index 3197ce82..eac1984c 100644
--- a/lib/i915/perf-configs/oa-sklgt4.xml
+++ b/lib/i915/perf-configs/oa-sklgt4.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124704" merge_md5="">
+<metrics version="1598356968" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT4"
        symbol_name="RenderBasic"
@@ -10953,4 +10953,314 @@
     </register_config>
   </set>
 
+  <set name="AsyncCompute"
+       chipset="SKLGT4"
+       symbol_name="AsyncCompute"
+       underscore_name="async_compute"
+       mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
+       hw_config_guid="93685e9d-f4ba-4f30-a087-a4f56246fc70"
+       >
+    <counter name="GPU Time Elapsed"
+             symbol_name="GpuTime"
+             underscore_name="gpu_time"
+             description="Time elapsed on the GPU during the measurement."
+             data_type="uint64"
+             units="ns"
+             semantic_type="duration"
+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Core Clocks"
+             symbol_name="GpuCoreClocks"
+             underscore_name="gpu_core_clocks"
+             description="The total number of GPU core clocks elapsed during the measurement."
+             data_type="uint64"
+             units="cycles"
+             semantic_type="event"
+             equation="GPU_CLOCK 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="AVG GPU Core Frequency"
+             symbol_name="AvgGpuCoreFrequency"
+             underscore_name="avg_gpu_core_frequency"
+             description="Average GPU Core Frequency in the measurement."
+             data_type="uint64"
+             max_equation="$GpuMaxFrequency"
+             units="hz"
+             semantic_type="event"
+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GPU Busy"
+             symbol_name="GpuBusy"
+             underscore_name="gpu_busy"
+             description="The percentage of time in which the GPU has been processing GPU commands."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Tier1 Overview System Frame"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Threads Dispatched"
+             symbol_name="VsThreads"
+             underscore_name="vs_threads"
+             description="The total number of vertex shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 1 READ"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Threads Dispatched"
+             symbol_name="HsThreads"
+             underscore_name="hs_threads"
+             description="The total number of hull shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 2 READ"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Threads Dispatched"
+             symbol_name="DsThreads"
+             underscore_name="ds_threads"
+             description="The total number of domain shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 3 READ"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Threads Dispatched"
+             symbol_name="GsThreads"
+             underscore_name="gs_threads"
+             description="The total number of geometry shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 5 READ"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="FS Threads Dispatched"
+             symbol_name="PsThreads"
+             underscore_name="ps_threads"
+             description="The total number of fragment shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 6 READ"
+             mdapi_group="EU Array/Fragment Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Threads Dispatched"
+             symbol_name="CsThreads"
+             underscore_name="cs_threads"
+             description="The total number of compute shader hardware threads dispatched."
+             data_type="uint64"
+             units="threads"
+             semantic_type="event"
+             equation="A 4 READ"
+             mdapi_group="EU Array/Compute Shader"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU0 Pipe Active"
+             symbol_name="Fpu0Active"
+             underscore_name="fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU0 Pipe Active"
+             symbol_name="VsFpu0Active"
+             underscore_name="vs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU0 Pipe Active"
+             symbol_name="PsFpu0Active"
+             underscore_name="ps_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU0 Pipe Active"
+             symbol_name="CsFpu0Active"
+             underscore_name="cs_fpu0_active"
+             description="The percentage of time in which EU FPU0 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU1 Pipe Active"
+             symbol_name="Fpu1Active"
+             underscore_name="fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU1 Pipe Active"
+             symbol_name="VsFpu1Active"
+             underscore_name="vs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU1 Pipe Active"
+             symbol_name="PsFpu1Active"
+             underscore_name="ps_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU1 Pipe Active"
+             symbol_name="CsFpu1Active"
+             underscore_name="cs_fpu1_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 16 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Thread Occupancy"
+             symbol_name="EuThreadOccupancy"
+             underscore_name="eu_thread_occupancy"
+             description="The percentage of time in which hardware threads occupied EUs."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="8 A 17 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Stall"
+             symbol_name="EuStall"
+             underscore_name="eu_stall"
+             description="The percentage of time in which the Execution Units were stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="OA">
+        <register type="OA" address="0x00002740" value="0x00000000" />
+        <register type="OA" address="0x00002710" value="0x00000000" />
+        <register type="OA" address="0x00002714" value="0x00800000" />
+        <register type="OA" address="0x00002720" value="0x00000000" />
+        <register type="OA" address="0x00002724" value="0x00800000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
+        <register type="FLEX" address="0x0000E658" value="0x00051050" />
+        <register type="FLEX" address="0x0000E758" value="0x00011010" />
+        <register type="FLEX" address="0x0000E45C" value="0x00061060" />
+        <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+    </register_config>
+  </set>
+
 </metrics>
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
