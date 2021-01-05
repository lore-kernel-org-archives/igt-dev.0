Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807846E0E1
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:08 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:49 +0200
Message-Id: <20210105111749.463432-7-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] lib/i915/perf: update Gen9/11
 programming for AsyncCompute
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

Adding a register, similar to what was done for RenderBasic.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml     | 16 ++++++++--------
 lib/i915/perf-configs/oa-cflgt2.xml |  5 +++--
 lib/i915/perf-configs/oa-cflgt3.xml |  5 +++--
 lib/i915/perf-configs/oa-icl.xml    |  5 +++--
 lib/i915/perf-configs/oa-kblgt2.xml |  5 +++--
 lib/i915/perf-configs/oa-kblgt3.xml |  5 +++--
 lib/i915/perf-configs/oa-sklgt2.xml |  5 +++--
 lib/i915/perf-configs/oa-sklgt3.xml |  5 +++--
 lib/i915/perf-configs/oa-sklgt4.xml |  5 +++--
 9 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 58dc4aeea..de3977245 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -110,7 +110,7 @@
     <guid config_hash="ee7996e47cdaf7722422397285763cdc" mdapi_config_hash="ada812fc71ebbabd1e746dbab67881b1" id="c44a5cf7-886d-477b-bebd-2d738923e4c3" chipset="sklgt2" name="GpuBusyness" />
     <guid config_hash="cec6202194db96d6a09fed71808bb7de" mdapi_config_hash="df4b9b85ed61f457a0b71b03299b282d" id="e0b2aae4-9b8f-4211-8df0-f8e8cb203209" chipset="sklgt2" name="FfBottlenecks" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="e7f3f72cad542f3a17c09686e65487fc" id="27871149-2fa9-40ba-aa73-350d60c03a09" chipset="sklgt2" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="49ad49a8e0837b1075ea7c1eff407d7f" id="ea700484-6e4d-4765-94a3-7867fba6805a" chipset="sklgt2" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="5901e5a68332bb5d9c654286b1d3e9a5" id="04769cac-6809-4f2a-af5d-40022435a8b2" chipset="sklgt2" name="AsyncCompute" />
     <guid config_hash="a7f1b241b23898785166ab10ca4ce1bf" mdapi_config_hash="ae3528402606bbb21a08da7ef5ea1530" id="21fef15a-83f4-4ffa-bb81-7da6e38b8e4b" chipset="sklgt3" name="RenderBasic" />
     <guid config_hash="ede53df6549f788495f7fca90475b6dd" mdapi_config_hash="87390c127ce809c3cfab64388ddebd14" id="4320492b-fd03-42ac-922f-dbe1ef3b7b58" chipset="sklgt3" name="ComputeBasic" />
     <guid config_hash="0f8eee02ed3e457362ffdc38ed10036c" mdapi_config_hash="2d95f03caa28b40e2a25f3bc8ac38b55" id="bd2d9cae-b9ec-4f5b-9d2f-934bed398a2d" chipset="sklgt3" name="RenderPipeProfile" />
@@ -131,7 +131,7 @@
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="01fe5ee1b6d1e8e5eee460cb71eeb0d6" id="14cadcfd-fb3a-46a3-8c13-0a4f850a4b18" chipset="sklgt3" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="0c5058ff-fdf4-4e0d-81fb-c0310fb76525" chipset="sklgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c889fd93-8dc7-4ba5-9451-de34a8b5ea3f" chipset="sklgt3" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2acbf308-143d-4846-a976-6ad7cc83148a" chipset="sklgt3" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="9d8e6b6c-c6ec-4591-99b5-7d9983e10d64" chipset="sklgt3" name="AsyncCompute" />
     <guid config_hash="0a80b2a2caa3386ecce110a7904eb1c1" mdapi_config_hash="61d002ce457b9ce087613d986e6b0544" id="95322a71-bb05-4437-bc27-f7dd7b27d136" chipset="sklgt4" name="RenderBasic" />
     <guid config_hash="898ee42bb4b359d4c0eb97c5919cfd7f" mdapi_config_hash="d596d8f326e5378b871b825eb954e95c" id="7277228f-e7f3-4743-945a-6a2049d11377" chipset="sklgt4" name="ComputeBasic" />
     <guid config_hash="48b5556f95fc27dceb10c65556a16613" mdapi_config_hash="95e3f2b556fe9795e0d0e0d3b0c5ee00" id="463c668c-3f60-49b6-8f85-d995b635b3b2" chipset="sklgt4" name="RenderPipeProfile" />
@@ -152,7 +152,7 @@
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="def0e0e3844a4909fa0dec2f8a9f2ca0" id="c1c2d40e-652a-482c-98fc-28bdb7c6ee44" chipset="sklgt4" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="4e5b1599-5b01-4b3d-89fa-6b26a25fe02b" chipset="sklgt4" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="befe9fd6-474e-4a3d-b98e-cd793715cf91" chipset="sklgt4" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="93685e9d-f4ba-4f30-a087-a4f56246fc70" chipset="sklgt4" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="796044f3-8f9d-4439-ab2c-aca5b046a1ef" chipset="sklgt4" name="AsyncCompute" />
     <guid config_hash="afbe2cb999a8303f52eea075f3b8687e" mdapi_config_hash="966416aaaf33b0bce90c0daa51217242" id="99c1a40e-a090-4354-86e3-4d068bb1917e" chipset="kblgt2" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="c72d95bf362111446018c52210ec48b6" id="12994724-3a5a-4303-bb3c-ba0175d2c200" chipset="kblgt2" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="7ee27e7f11eea3282e62abde604b61a2" id="d7a17a3a-ca71-40d2-a919-ace80d50633f" chipset="kblgt2" name="RenderPipeProfile" />
@@ -173,7 +173,7 @@
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="451756d65e43fb07a5f589ccaed0819d" id="cd4b577b-073a-423f-a948-e198dd818c71" chipset="kblgt2" name="TestOa" />
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="6c66fe6e-2988-454a-bfae-7fca3bbcbec2" chipset="kblgt2" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="b49aa434-4958-4d98-9e6f-443ff27ca74d" chipset="kblgt2" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2f0740b8-da7c-47ff-b7ec-cc7bbf2057a0" chipset="kblgt2" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="4032137b-8dcc-4f3f-912d-c0bb14a123bc" chipset="kblgt2" name="AsyncCompute" />
     <guid config_hash="73805d7acd1298aa6d81d3e2278ee411" mdapi_config_hash="9111e46468492c1c14a331510c18a49b" id="17b4f3e0-d578-4ae3-b7a8-98d756d1e0df" chipset="kblgt3" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="ac97e9ebaf2a55476a86ab2559e5ecab" id="a5dc0bc5-d6fa-4f3a-9979-d3248c786042" chipset="kblgt3" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="808e46d786103380f58d1e8f91402c4c" id="c7c735f3-ce58-45cf-aa04-30b183f1faff" chipset="kblgt3" name="RenderPipeProfile" />
@@ -194,7 +194,7 @@
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="befeffb33cb10b61a2f4f0d3d563ab74" id="bb3344bf-2551-40f7-b75f-cbf29e4195f7" chipset="kblgt3" name="TestOa" />
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="b55ecba1-2aa9-422e-89ff-b9e30f03d447" chipset="kblgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="85bc2e4f-2563-4388-921b-dc0dad879cf3" chipset="kblgt3" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="cad0e478-5fec-44cc-ad01-76d4c61f52ad" chipset="kblgt3" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="8d6d28f5-f699-4eec-89f7-216956bf2ed5" chipset="kblgt3" name="AsyncCompute" />
     <guid config_hash="c01efa1ec2a11ea9aaab8b0a8e548174" mdapi_config_hash="7867725687bd177e4e8b8b8443b04355" id="d72df5c7-5b4a-4274-a43f-00b0fd51fc68" chipset="glk" name="RenderBasic" />
     <guid config_hash="cde046a01aba9c56d6fa44bf2c0f26c2" mdapi_config_hash="84d270fda538f1061067316b19b9cac9" id="814285f6-354d-41d2-ba49-e24e622714a0" chipset="glk" name="ComputeBasic" />
     <guid config_hash="1669463a6836f6d057cbf3e41506923b" mdapi_config_hash="66b8f785edc91d1cf3952fc842114671" id="07d397a6-b3e6-49f6-9433-a4f293d55978" chipset="glk" name="RenderPipeProfile" />
@@ -231,7 +231,7 @@
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="e2f162ae-5732-4af0-8b11-69510f57094a" chipset="cflgt2" name="GpuBusyness" />
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="451756d65e43fb07a5f589ccaed0819d" id="d3c99326-e161-4e44-9745-7772bdc579c5" chipset="cflgt2" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="5ccbf9fb-6bf2-456b-a749-bdff7b1aff13" chipset="cflgt2" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="d642768d-65a2-458d-9233-d15ff6f717e9" chipset="cflgt2" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="9802484e-5e21-4ad3-8060-12b7f3bb81fe" chipset="cflgt2" name="AsyncCompute" />
     <guid config_hash="73805d7acd1298aa6d81d3e2278ee411" mdapi_config_hash="5d3d4bcf1e36569409cfd84a7e137ade" id="b316bcab-212f-4228-97de-af6b5a1a2ea1" chipset="cflgt3" name="RenderBasic" />
     <guid config_hash="b1268f0f246efc7ab27f7637fa7193e8" mdapi_config_hash="4a9628256274ffe348e8dc21f0f22f3b" id="d2eec5b1-4dd8-4170-ae83-9531abd0692f" chipset="cflgt3" name="ComputeBasic" />
     <guid config_hash="01f86f590b9b0c0371b0075a5e73b902" mdapi_config_hash="498feca145a69e7fcec55b79d239d005" id="9875e050-b1bc-45e6-a6ab-665594601df9" chipset="cflgt3" name="RenderPipeProfile" />
@@ -252,7 +252,7 @@
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="22b7e0c2-cade-425f-b099-34479768c72a" chipset="cflgt3" name="GpuBusyness" />
     <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="b70188988f7ceb0160bd5eb7ca93559b" id="f240ef8d-4a2e-4961-a63c-cc43b01ed923" chipset="cflgt3" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c11af8d1-858b-4f8b-98fb-8d683ba8bda0" chipset="cflgt3" name="PMA_Stall" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="4a97c6cf-8e84-4854-a031-6c6e7b42e07c" chipset="cflgt3" name="AsyncCompute" />
+    <guid config_hash="3a59319ec73eea8c3de970d027092a2b" mdapi_config_hash="ca820befa034b8cbd1ec23514e739527" id="0c824ec1-af53-4545-84a3-ede5e3572fc1" chipset="cflgt3" name="AsyncCompute" />
     <guid config_hash="428ad0859c9dac4ba85dd73106f5b2de" mdapi_config_hash="7baf473e87d0838b628bd2ed289f4783" id="2d975e19-7130-41d2-b06f-79d74f91e7c8" chipset="cnl" name="RenderBasic" />
     <guid config_hash="53907f43dc0faf4be0bbf614302f4fb3" mdapi_config_hash="b5b46b9273e54ffc6e1959b61bbc3a25" id="0b128ae2-ed06-481e-afe3-2404aab91415" chipset="cnl" name="ComputeBasic" />
     <guid config_hash="1878c620a9f0cc5100fba47c83a1457c" mdapi_config_hash="f1baa55e099488db74fd02c9560df40b" id="0666ccac-f5aa-4dc2-aa12-c6e058f383f3" chipset="cnl" name="RenderPipeProfile" />
@@ -287,7 +287,7 @@
     <guid config_hash="d2188fa3c865ef430532b127a3fd87a5" mdapi_config_hash="ff33e47c767f6f81d9a779153aae6fdb" id="fd25ec19-3ed1-40c9-8648-1d2387449a92" chipset="icl" name="TDL_3" />
     <guid config_hash="b421b29d8557dbbf0fe3068c82b3d8dd" mdapi_config_hash="cc850ab4463c23e6017f069d67785c31" id="40dc79f2-88c8-47c6-8f86-f509e39fbe5d" chipset="icl" name="GpuBusyness" />
     <guid config_hash="3abb2f3338c8d2b6aff2a869ee9030d9" mdapi_config_hash="0b64f16be99304796735d1bd7b6e580a" id="e617cfd5-6cc5-4143-8994-cd36cebb921f" chipset="icl" name="TestOa" />
-    <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="7d863af6-be13-4f00-822d-33f58c8df9e7" chipset="icl" name="AsyncCompute" />
+    <guid config_hash="d3d8f793ecb17c4748ec1b319310b447" mdapi_config_hash="2513e5019806f4754e86a223cf59a7b0" id="eca4858e-27a4-4bcf-a57f-2616e2f08950" chipset="icl" name="AsyncCompute" />
     <guid config_hash="878466bee64e6505fde4118ceadff299" mdapi_config_hash="653d46ab9ef10a2b7f511fe3f067e0ee" id="c693e665-867f-4362-91b6-85337f932010" chipset="ehl" name="RenderBasic" />
     <guid config_hash="ad9a98d85f554b69e9737673594634a9" mdapi_config_hash="f335f856cf2bb4a1d09479fd39aab0ac" id="ae4d01a9-fe55-453c-8c7a-036acd5eacff" chipset="ehl" name="ComputeBasic" />
     <guid config_hash="9b6d58e5047c130f47999e04b92151e8" mdapi_config_hash="7bf6ffff6913e5536d4ad4dc4fa3b03b" id="05700b63-f044-4c79-b8ae-676972114745" chipset="ehl" name="ComputeExtended" />
diff --git a/lib/i915/perf-configs/oa-cflgt2.xml b/lib/i915/perf-configs/oa-cflgt2.xml
index 020eeb5f3..c5b954139 100644
--- a/lib/i915/perf-configs/oa-cflgt2.xml
+++ b/lib/i915/perf-configs/oa-cflgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609841995" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT2"
        symbol_name="RenderBasic"
@@ -10871,7 +10871,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="d642768d-65a2-458d-9233-d15ff6f717e9"
+       hw_config_guid="9802484e-5e21-4ad3-8060-12b7f3bb81fe"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11173,6 +11173,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-cflgt3.xml b/lib/i915/perf-configs/oa-cflgt3.xml
index bcf5ad719..71f00b57b 100644
--- a/lib/i915/perf-configs/oa-cflgt3.xml
+++ b/lib/i915/perf-configs/oa-cflgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842035" merge_md5="">
+<metrics version="1609843831" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT3"
        symbol_name="RenderBasic"
@@ -10938,7 +10938,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="4a97c6cf-8e84-4854-a031-6c6e7b42e07c"
+       hw_config_guid="0c824ec1-af53-4545-84a3-ede5e3572fc1"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11240,6 +11240,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index 7fd0713d0..053507cc8 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609843424" merge_md5="">
+<metrics version="1609843831" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
@@ -11874,7 +11874,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="7d863af6-be13-4f00-822d-33f58c8df9e7"
+       hw_config_guid="eca4858e-27a4-4bcf-a57f-2616e2f08950"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -12176,6 +12176,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-kblgt2.xml b/lib/i915/perf-configs/oa-kblgt2.xml
index 619cda923..93f1e2c37 100644
--- a/lib/i915/perf-configs/oa-kblgt2.xml
+++ b/lib/i915/perf-configs/oa-kblgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842130" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT2"
        symbol_name="RenderBasic"
@@ -10871,7 +10871,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="2f0740b8-da7c-47ff-b7ec-cc7bbf2057a0"
+       hw_config_guid="4032137b-8dcc-4f3f-912d-c0bb14a123bc"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11173,6 +11173,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-kblgt3.xml b/lib/i915/perf-configs/oa-kblgt3.xml
index 64a54e968..c1017a470 100644
--- a/lib/i915/perf-configs/oa-kblgt3.xml
+++ b/lib/i915/perf-configs/oa-kblgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842140" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT3"
        symbol_name="RenderBasic"
@@ -10938,7 +10938,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="cad0e478-5fec-44cc-ad01-76d4c61f52ad"
+       hw_config_guid="8d6d28f5-f699-4eec-89f7-216956bf2ed5"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11240,6 +11240,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-sklgt2.xml b/lib/i915/perf-configs/oa-sklgt2.xml
index 12e01180d..fbd49ba65 100644
--- a/lib/i915/perf-configs/oa-sklgt2.xml
+++ b/lib/i915/perf-configs/oa-sklgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842167" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT2"
        symbol_name="RenderBasic"
@@ -11900,7 +11900,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="ea700484-6e4d-4765-94a3-7867fba6805a"
+       hw_config_guid="04769cac-6809-4f2a-af5d-40022435a8b2"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -12202,6 +12202,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-sklgt3.xml b/lib/i915/perf-configs/oa-sklgt3.xml
index 2e32bc7d8..98c3374bd 100644
--- a/lib/i915/perf-configs/oa-sklgt3.xml
+++ b/lib/i915/perf-configs/oa-sklgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842186" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT3"
        symbol_name="RenderBasic"
@@ -10938,7 +10938,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="2acbf308-143d-4846-a976-6ad7cc83148a"
+       hw_config_guid="9d8e6b6c-c6ec-4591-99b5-7d9983e10d64"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11240,6 +11240,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
diff --git a/lib/i915/perf-configs/oa-sklgt4.xml b/lib/i915/perf-configs/oa-sklgt4.xml
index 570919df7..77415661e 100644
--- a/lib/i915/perf-configs/oa-sklgt4.xml
+++ b/lib/i915/perf-configs/oa-sklgt4.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1609842208" merge_md5="">
+<metrics version="1609843830" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT4"
        symbol_name="RenderBasic"
@@ -10961,7 +10961,7 @@
        symbol_name="AsyncCompute"
        underscore_name="async_compute"
        mdapi_supported_apis="VK OGL OGL4 OCL MEDIA IO BB"
-       hw_config_guid="93685e9d-f4ba-4f30-a087-a4f56246fc70"
+       hw_config_guid="796044f3-8f9d-4439-ab2c-aca5b046a1ef"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11263,6 +11263,7 @@
         <register type="FLEX" address="0x0000E758" value="0x00011010" />
         <register type="FLEX" address="0x0000E45C" value="0x00061060" />
         <register type="FLEX" address="0x0000E55C" value="0x00000008" />
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
     </register_config>
   </set>
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
