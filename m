Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12956E0D8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:18:01 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jan 2021 13:17:44 +0200
Message-Id: <20210105111749.463432-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/i915/perf: update gen9/10/11 TestOa
 configs
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

Programming an additional FLEX register.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf-configs/guids.xml     | 20 ++++++++++----------
 lib/i915/perf-configs/oa-cflgt2.xml |  7 +++++--
 lib/i915/perf-configs/oa-cflgt3.xml |  7 +++++--
 lib/i915/perf-configs/oa-cnl.xml    |  7 +++++--
 lib/i915/perf-configs/oa-ehl.xml    |  7 +++++--
 lib/i915/perf-configs/oa-icl.xml    |  7 +++++--
 lib/i915/perf-configs/oa-kblgt2.xml |  7 +++++--
 lib/i915/perf-configs/oa-kblgt3.xml |  7 +++++--
 lib/i915/perf-configs/oa-sklgt2.xml |  7 +++++--
 lib/i915/perf-configs/oa-sklgt3.xml |  7 +++++--
 lib/i915/perf-configs/oa-sklgt4.xml |  7 +++++--
 11 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index fb21e092b..e30f19bbf 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -106,7 +106,7 @@
     <guid config_hash="c41684d2ccbe553874fb9cdbd8fd0229" mdapi_config_hash="6b1a9dc8dd375bf367313ad9b0531580" id="0a7accbf-8c55-455f-9984-23e9fb0b826d" chipset="sklgt2" name="TDL_2" />
     <guid config_hash="483a06910590c1753a0266ef8b9f9b70" mdapi_config_hash="4be337ed83e3c95aebf66553ed685602" id="41a24047-7484-4ead-ae37-de907e5ff2b2" chipset="sklgt2" name="ComputeExtra" />
     <guid config_hash="784698b7fb41dad7bc4bf13fac46657b" mdapi_config_hash="2fe32bdaf82fc66774ee95c33a23ea88" id="95910492-943f-44bd-9461-390240f243fd" chipset="sklgt2" name="VMEPipe" />
-    <guid config_hash="d2e36c07c43f128370fe1112d4de1181" mdapi_config_hash="d569893983ce055b9021b64420894431" id="1651949f-0ac0-4cb1-a06f-dafd74a407d1" chipset="sklgt2" name="TestOa" />
+    <guid config_hash="d811fdce9eae9713bde1a8f91fd6feb7" mdapi_config_hash="f8f56d024b8445d193952ead4d7e3004" id="c5384091-ce4c-406c-ab4d-4c530f71c7ae" chipset="sklgt2" name="TestOa" />
     <guid config_hash="ee7996e47cdaf7722422397285763cdc" mdapi_config_hash="ada812fc71ebbabd1e746dbab67881b1" id="c44a5cf7-886d-477b-bebd-2d738923e4c3" chipset="sklgt2" name="GpuBusyness" />
     <guid config_hash="cec6202194db96d6a09fed71808bb7de" mdapi_config_hash="df4b9b85ed61f457a0b71b03299b282d" id="e0b2aae4-9b8f-4211-8df0-f8e8cb203209" chipset="sklgt2" name="FfBottlenecks" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="e7f3f72cad542f3a17c09686e65487fc" id="27871149-2fa9-40ba-aa73-350d60c03a09" chipset="sklgt2" name="PMA_Stall" />
@@ -128,7 +128,7 @@
     <guid config_hash="93ab6cf80fefdfca540a3ac101925411" mdapi_config_hash="66d2a4df7b3190be8bd9643e1cb14f99" id="29194a55-7e75-4152-a71f-ef34b1ae4cca" chipset="sklgt3" name="TDL_2" />
     <guid config_hash="3ca2784da64d161a998b7d8f6d4e0235" mdapi_config_hash="5796dcc1e154e567d7758854bb621bcb" id="2d80a648-7b5a-4e92-bbe7-3b5c76f2e221" chipset="sklgt3" name="ComputeExtra" />
     <guid config_hash="54b2a9ae72018dd99e63c2ecd9c92901" mdapi_config_hash="6ae821fe8ac78f4b387f9eec605ac900" id="cfae9232-6ffc-42cc-a703-9790016925f0" chipset="sklgt3" name="VMEPipe" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="d05fe58178a1882edcb81d86070551e3" id="2b985803-d3c9-4629-8a4f-634bfecba0e8" chipset="sklgt3" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="01fe5ee1b6d1e8e5eee460cb71eeb0d6" id="14cadcfd-fb3a-46a3-8c13-0a4f850a4b18" chipset="sklgt3" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="0c5058ff-fdf4-4e0d-81fb-c0310fb76525" chipset="sklgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c889fd93-8dc7-4ba5-9451-de34a8b5ea3f" chipset="sklgt3" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2acbf308-143d-4846-a976-6ad7cc83148a" chipset="sklgt3" name="AsyncCompute" />
@@ -149,7 +149,7 @@
     <guid config_hash="93ab6cf80fefdfca540a3ac101925411" mdapi_config_hash="60b1253d54ce38bb6678d9a3eaa10305" id="a4b3106c-cfec-49f5-8e26-470470379e66" chipset="sklgt4" name="TDL_2" />
     <guid config_hash="19cb1c38ee83566f630015215532efa5" mdapi_config_hash="f9ae90355e5abe786bf5e81f1c4222c0" id="a5aa857d-e8f0-4dfa-8981-ce340fa748fd" chipset="sklgt4" name="ComputeExtra" />
     <guid config_hash="b28f9fef3bf5699c217d634bffa57fbc" mdapi_config_hash="cafc4d5abc6807434093d4f47fe83292" id="0e8d8b86-4ee7-4cdd-aaaa-58adc92cb29e" chipset="sklgt4" name="VMEPipe" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="051007cbfaffa4151d7c9365edde7bff" id="882fa433-1f4a-4a67-a962-c741888fe5f5" chipset="sklgt4" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="def0e0e3844a4909fa0dec2f8a9f2ca0" id="c1c2d40e-652a-482c-98fc-28bdb7c6ee44" chipset="sklgt4" name="TestOa" />
     <guid config_hash="6124b939906bc3cda3621544aabfd890" mdapi_config_hash="24ef7b4026d1ac159bb663946df0e9b0" id="4e5b1599-5b01-4b3d-89fa-6b26a25fe02b" chipset="sklgt4" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="befe9fd6-474e-4a3d-b98e-cd793715cf91" chipset="sklgt4" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="93685e9d-f4ba-4f30-a087-a4f56246fc70" chipset="sklgt4" name="AsyncCompute" />
@@ -170,7 +170,7 @@
     <guid config_hash="93ab6cf80fefdfca540a3ac101925411" mdapi_config_hash="b685ab8fe6fc020e85f189f55fdf6e05" id="a00cbdf2-eabd-4240-9a89-86e2ac1ca1e4" chipset="kblgt2" name="TDL_2" />
     <guid config_hash="483a06910590c1753a0266ef8b9f9b70" mdapi_config_hash="4be337ed83e3c95aebf66553ed685602" id="aa7a3fb9-22fb-43ff-a32d-0ab6c13bbd16" chipset="kblgt2" name="ComputeExtra" />
     <guid config_hash="784698b7fb41dad7bc4bf13fac46657b" mdapi_config_hash="2fe32bdaf82fc66774ee95c33a23ea88" id="398a4268-ef6f-4ffc-b55f-3c7b5363ce61" chipset="kblgt2" name="VMEPipe" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="5f4afc2f159098e96b8fd90a85979ae3" id="baa3c7e4-52b6-4b85-801e-465a94b746dd" chipset="kblgt2" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="451756d65e43fb07a5f589ccaed0819d" id="cd4b577b-073a-423f-a948-e198dd818c71" chipset="kblgt2" name="TestOa" />
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="6c66fe6e-2988-454a-bfae-7fca3bbcbec2" chipset="kblgt2" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="b49aa434-4958-4d98-9e6f-443ff27ca74d" chipset="kblgt2" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="2f0740b8-da7c-47ff-b7ec-cc7bbf2057a0" chipset="kblgt2" name="AsyncCompute" />
@@ -191,7 +191,7 @@
     <guid config_hash="93ab6cf80fefdfca540a3ac101925411" mdapi_config_hash="25e39a0a38a1fdbf4e2ff677aad30fc6" id="9df2815d-4e9e-417f-bde1-3788dc6e1ea1" chipset="kblgt3" name="TDL_2" />
     <guid config_hash="f543908db2541ef48f35603e35c379bd" mdapi_config_hash="41ebe4b58e504d63d60141faa9d45c18" id="efc497ac-884e-4ee4-a4a8-15fba22aaf21" chipset="kblgt3" name="ComputeExtra" />
     <guid config_hash="16c6718fd82aaa5e1187df8d88ace152" mdapi_config_hash="d0ce6de1ad831394a048015990e82864" id="bfd9764d-2c5b-4c16-bfc1-89de3ca10917" chipset="kblgt3" name="VMEPipe" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="817cb7526b5399e772ed721e062325b3" id="f1792f32-6db2-4b50-b4b2-557128f1688d" chipset="kblgt3" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="befeffb33cb10b61a2f4f0d3d563ab74" id="bb3344bf-2551-40f7-b75f-cbf29e4195f7" chipset="kblgt3" name="TestOa" />
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="b55ecba1-2aa9-422e-89ff-b9e30f03d447" chipset="kblgt3" name="GpuBusyness" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="85bc2e4f-2563-4388-921b-dc0dad879cf3" chipset="kblgt3" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="cad0e478-5fec-44cc-ad01-76d4c61f52ad" chipset="kblgt3" name="AsyncCompute" />
@@ -229,7 +229,7 @@
     <guid config_hash="483a06910590c1753a0266ef8b9f9b70" mdapi_config_hash="4be337ed83e3c95aebf66553ed685602" id="5f679fb0-909e-4c0e-b4b2-8e801f83e71b" chipset="cflgt2" name="ComputeExtra" />
     <guid config_hash="784698b7fb41dad7bc4bf13fac46657b" mdapi_config_hash="2fe32bdaf82fc66774ee95c33a23ea88" id="0d09ba9a-1d1c-457d-83e2-74ac448014d6" chipset="cflgt2" name="VMEPipe" />
     <guid config_hash="d36b63d76294172be0ad5e6530109d06" mdapi_config_hash="aa4c1ab961a066b0bc98bf914735b6af" id="e2f162ae-5732-4af0-8b11-69510f57094a" chipset="cflgt2" name="GpuBusyness" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="5f4afc2f159098e96b8fd90a85979ae3" id="74fb4902-d3d3-4237-9e90-cbdc68d0a446" chipset="cflgt2" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="451756d65e43fb07a5f589ccaed0819d" id="d3c99326-e161-4e44-9745-7772bdc579c5" chipset="cflgt2" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="5ccbf9fb-6bf2-456b-a749-bdff7b1aff13" chipset="cflgt2" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="d642768d-65a2-458d-9233-d15ff6f717e9" chipset="cflgt2" name="AsyncCompute" />
     <guid config_hash="73805d7acd1298aa6d81d3e2278ee411" mdapi_config_hash="5d3d4bcf1e36569409cfd84a7e137ade" id="b316bcab-212f-4228-97de-af6b5a1a2ea1" chipset="cflgt3" name="RenderBasic" />
@@ -250,7 +250,7 @@
     <guid config_hash="f543908db2541ef48f35603e35c379bd" mdapi_config_hash="e3197d98aa86acaf090f1bffde854586" id="e61ae394-9d9e-4204-a735-1dad7e44d953" chipset="cflgt3" name="ComputeExtra" />
     <guid config_hash="16c6718fd82aaa5e1187df8d88ace152" mdapi_config_hash="d0ce6de1ad831394a048015990e82864" id="94272ad9-45ee-4e34-b7a7-51546cd6405c" chipset="cflgt3" name="VMEPipe" />
     <guid config_hash="de8530fdc36d260415e78771e8cc6929" mdapi_config_hash="3f82064fe17d6d7005b6e5c4bb828c5a" id="22b7e0c2-cade-425f-b099-34479768c72a" chipset="cflgt3" name="GpuBusyness" />
-    <guid config_hash="cca1580576ffa8e25aa271ebdac68cc7" mdapi_config_hash="228710e94277d74bd4be0c2536a3edd4" id="577e8e2c-3fa0-4875-8743-3538d585e3b0" chipset="cflgt3" name="TestOa" />
+    <guid config_hash="eb1f36a78ee4dc71bb9501070f3b6800" mdapi_config_hash="b70188988f7ceb0160bd5eb7ca93559b" id="f240ef8d-4a2e-4961-a63c-cc43b01ed923" chipset="cflgt3" name="TestOa" />
     <guid config_hash="8ae5bda74271c473f88f13e57d6f6828" mdapi_config_hash="4d9fb617c64406cc8b372808461dd3e3" id="c11af8d1-858b-4f8b-98fb-8d683ba8bda0" chipset="cflgt3" name="PMA_Stall" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="4a97c6cf-8e84-4854-a031-6c6e7b42e07c" chipset="cflgt3" name="AsyncCompute" />
     <guid config_hash="428ad0859c9dac4ba85dd73106f5b2de" mdapi_config_hash="7baf473e87d0838b628bd2ed289f4783" id="2d975e19-7130-41d2-b06f-79d74f91e7c8" chipset="cnl" name="RenderBasic" />
@@ -267,7 +267,7 @@
     <guid config_hash="c6bda99f4d7656d8b1b613c17c2d53da" mdapi_config_hash="2c48df889c497b3f97d5a350827d8f05" id="9bcf4ff2-c15f-4bea-8ec8-8db87791942e" chipset="cnl" name="Sampler" />
     <guid config_hash="4bfffb81b9376af931bad919fc66ef3f" mdapi_config_hash="33d7ba5d98519f3038ed07f273fe5f91" id="c46c7bb5-f26d-4634-b491-902394af85b1" chipset="cnl" name="TDL_1" />
     <guid config_hash="e5419b6c232500a6a824c2c58f3b7d32" mdapi_config_hash="b9a01044b9befe9fcf952f26ba4fcc4e" id="aa2d6ab4-99b3-42f8-94d6-4a9aa2baedaf" chipset="cnl" name="TDL_2" />
-    <guid config_hash="ccb9fdae1fe1f44c4c32bdc69befc160" mdapi_config_hash="9cf34989f5e721e734d4edf26036c2c5" id="db41edd4-d8e7-4730-ad11-b9a2d6833503" chipset="cnl" name="TestOa" />
+    <guid config_hash="ebd014335c55b7be47615354eecae7a5" mdapi_config_hash="21595af7d9d76b7f414c744aeaddbe1d" id="99517a69-b9a7-4124-8f59-06645ea13187" chipset="cnl" name="TestOa" />
     <guid config_hash="eaaf4df3ac5e9b4fd52d980f0be72dbf" mdapi_config_hash="8ef6088f425f2a97b01bed560ad6e2b3" id="193093b2-da24-49bf-b407-442c213b71b4" chipset="icl" name="RenderBasic" />
     <guid config_hash="8b7f8030265ee506c24ec10d17ab8f1a" mdapi_config_hash="f22218a44add1267d4fad705b511323c" id="12ca7e9c-55cb-45cd-9f87-4fc821488e6d" chipset="icl" name="ComputeBasic" />
     <guid config_hash="3b6635eb3709f346076901ea88ec1f2b" mdapi_config_hash="402f156b276dfaaaf84eb09ec5347515" id="43eb7fc1-dc5e-45e2-a90a-0053f5397271" chipset="icl" name="ComputeExtended" />
@@ -286,7 +286,7 @@
     <guid config_hash="b141825840f912e9d7c98a13ae34d600" mdapi_config_hash="af8ee9d86606564460ce2928023e47a5" id="c6d3af7b-037b-4656-95e1-4f838f0a2c14" chipset="icl" name="TDL_2" />
     <guid config_hash="d2188fa3c865ef430532b127a3fd87a5" mdapi_config_hash="ff33e47c767f6f81d9a779153aae6fdb" id="fd25ec19-3ed1-40c9-8648-1d2387449a92" chipset="icl" name="TDL_3" />
     <guid config_hash="b421b29d8557dbbf0fe3068c82b3d8dd" mdapi_config_hash="cc850ab4463c23e6017f069d67785c31" id="40dc79f2-88c8-47c6-8f86-f509e39fbe5d" chipset="icl" name="GpuBusyness" />
-    <guid config_hash="7480125fc0806a347f975dc714568e92" mdapi_config_hash="c6b1c7a22e3c2f456cbfdae1bfe394ac" id="3c0bf614-5d67-4326-887f-a24eb8a58244" chipset="icl" name="TestOa" />
+    <guid config_hash="3abb2f3338c8d2b6aff2a869ee9030d9" mdapi_config_hash="0b64f16be99304796735d1bd7b6e580a" id="e617cfd5-6cc5-4143-8994-cd36cebb921f" chipset="icl" name="TestOa" />
     <guid config_hash="9627e657d1b89b3bf665208e08e2f0c8" mdapi_config_hash="187efc3290d4e6ff25cdce2f7f43e1dd" id="7d863af6-be13-4f00-822d-33f58c8df9e7" chipset="icl" name="AsyncCompute" />
     <guid config_hash="25380f09a9ab454374c78f1b5d1c4ddf" mdapi_config_hash="4d28665f4702ddf38239e5c47384dc15" id="a95112cc-804a-4c80-b57b-2870e56cc240" chipset="ehl" name="RenderBasic" />
     <guid config_hash="bf521fa74e9f5285bc3e9a7215cdadd2" mdapi_config_hash="bf085a519814344b241b08064f256921" id="54449e8a-196b-4c43-8ecd-540b0504b5c1" chipset="ehl" name="ComputeBasic" />
@@ -306,7 +306,7 @@
     <guid config_hash="39c75fae3e4bc24fce0759413caac64d" mdapi_config_hash="7d8add695c157a7908abfef46b767e28" id="47e27fcf-9904-4fc0-a661-636dffeafe7d" chipset="ehl" name="TDL_2" />
     <guid config_hash="79df0b5785c2464bedddf7c2ea34fae9" mdapi_config_hash="011bb38aa81c2e56de1e7cf9653a4047" id="98154f5e-cf17-423c-a096-e696f87c2906" chipset="ehl" name="TDL_3" />
     <guid config_hash="051a88dbb1037b1e96ab8742322d5195" mdapi_config_hash="8f1f14586a4a4cbd9603488b87f3a571" id="85254749-e937-4205-9b40-5df8847c9ee8" chipset="ehl" name="GpuBusyness" />
-    <guid config_hash="2f735b47a388ee4876e999e2fe1fdaff" mdapi_config_hash="8d9471fa5f2e9d9ef3bb3be89fbc0372" id="9dace73d-0364-45bc-9a22-f27c2acda706" chipset="ehl" name="TestOa" />
+    <guid config_hash="75555135047c7824daeac619e0118fef" mdapi_config_hash="d754b8eaa7773e50d8a14775482dd59f" id="4cbcfaf7-3c0c-42b8-a324-b1e58329c732" chipset="ehl" name="TestOa" />
     <guid config_hash="cba79c72b2989348f9db79f65aee74c7" mdapi_config_hash="d173cffda0e6aa07c693ed3636b09e3b" id="c17af13d-3953-432b-9bd1-81346b4c2092" chipset="tglgt1" name="RenderBasic" />
     <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="79a0514e-40d7-437a-90cf-33e02857adc6" chipset="tglgt1" name="ComputeBasic" />
     <guid config_hash="338f4f73347007310b6860c65e83ce87" mdapi_config_hash="baf3a770bb05723d39743ee683dd84c3" id="619eabea-0191-4d75-aaca-4217837215aa" chipset="tglgt1" name="RenderPipeProfile" />
diff --git a/lib/i915/perf-configs/oa-cflgt2.xml b/lib/i915/perf-configs/oa-cflgt2.xml
index d568b91d0..020eeb5f3 100644
--- a/lib/i915/perf-configs/oa-cflgt2.xml
+++ b/lib/i915/perf-configs/oa-cflgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609841995" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT2"
        symbol_name="RenderBasic"
@@ -10562,7 +10562,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="74fb4902-d3d3-4237-9e90-cbdc68d0a446"
+       hw_config_guid="d3c99326-e161-4e44-9745-7772bdc579c5"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10760,6 +10760,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-cflgt3.xml b/lib/i915/perf-configs/oa-cflgt3.xml
index 9ac9156a3..bcf5ad719 100644
--- a/lib/i915/perf-configs/oa-cflgt3.xml
+++ b/lib/i915/perf-configs/oa-cflgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842035" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="CFLGT3"
        symbol_name="RenderBasic"
@@ -10629,7 +10629,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="577e8e2c-3fa0-4875-8743-3538d585e3b0"
+       hw_config_guid="f240ef8d-4a2e-4961-a63c-cc43b01ed923"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10827,6 +10827,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-cnl.xml b/lib/i915/perf-configs/oa-cnl.xml
index 2235911a3..43dd32ff8 100644
--- a/lib/i915/perf-configs/oa-cnl.xml
+++ b/lib/i915/perf-configs/oa-cnl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124705" merge_md5="">
+<metrics version="1609843132" merge_md5="">
   <set name="Render Metrics Basic Gen10"
        chipset="CNL"
        symbol_name="RenderBasic"
@@ -10196,7 +10196,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="db41edd4-d8e7-4730-ad11-b9a2d6833503"
+       hw_config_guid="99517a69-b9a7-4124-8f59-06645ea13187"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10406,6 +10406,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
 </metrics>
diff --git a/lib/i915/perf-configs/oa-ehl.xml b/lib/i915/perf-configs/oa-ehl.xml
index 96e5ca9fb..a4ddcd0dd 100644
--- a/lib/i915/perf-configs/oa-ehl.xml
+++ b/lib/i915/perf-configs/oa-ehl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1582124706" merge_md5="">
+<metrics version="1609842445" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="EHL"
        symbol_name="RenderBasic"
@@ -11585,7 +11585,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="9dace73d-0364-45bc-9a22-f27c2acda706"
+       hw_config_guid="4cbcfaf7-3c0c-42b8-a324-b1e58329c732"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11783,6 +11783,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
   </set>
 
 </metrics>
diff --git a/lib/i915/perf-configs/oa-icl.xml b/lib/i915/perf-configs/oa-icl.xml
index cbcd647db..bc299de49 100644
--- a/lib/i915/perf-configs/oa-icl.xml
+++ b/lib/i915/perf-configs/oa-icl.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1598356969" merge_md5="">
+<metrics version="1609842547" merge_md5="">
   <set name="Render Metrics Basic Gen11"
        chipset="ICL"
        symbol_name="RenderBasic"
@@ -11668,7 +11668,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="3c0bf614-5d67-4326-887f-a24eb8a58244"
+       hw_config_guid="e617cfd5-6cc5-4143-8994-cd36cebb921f"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11864,6 +11864,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
   </set>
 
   <set name="AsyncCompute"
diff --git a/lib/i915/perf-configs/oa-kblgt2.xml b/lib/i915/perf-configs/oa-kblgt2.xml
index 6137be6cd..619cda923 100644
--- a/lib/i915/perf-configs/oa-kblgt2.xml
+++ b/lib/i915/perf-configs/oa-kblgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842130" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT2"
        symbol_name="RenderBasic"
@@ -10562,7 +10562,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="baa3c7e4-52b6-4b85-801e-465a94b746dd"
+       hw_config_guid="cd4b577b-073a-423f-a948-e198dd818c71"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10760,6 +10760,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-kblgt3.xml b/lib/i915/perf-configs/oa-kblgt3.xml
index 117a2889f..64a54e968 100644
--- a/lib/i915/perf-configs/oa-kblgt3.xml
+++ b/lib/i915/perf-configs/oa-kblgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842140" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="KBLGT3"
        symbol_name="RenderBasic"
@@ -10629,7 +10629,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="f1792f32-6db2-4b50-b4b2-557128f1688d"
+       hw_config_guid="bb3344bf-2551-40f7-b75f-cbf29e4195f7"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10827,6 +10827,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-sklgt2.xml b/lib/i915/perf-configs/oa-sklgt2.xml
index f1125bd2a..12e01180d 100644
--- a/lib/i915/perf-configs/oa-sklgt2.xml
+++ b/lib/i915/perf-configs/oa-sklgt2.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842167" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT2"
        symbol_name="RenderBasic"
@@ -11592,7 +11592,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="1651949f-0ac0-4cb1-a06f-dafd74a407d1"
+       hw_config_guid="c5384091-ce4c-406c-ab4d-4c530f71c7ae"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -11789,6 +11789,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-sklgt3.xml b/lib/i915/perf-configs/oa-sklgt3.xml
index 0870791f7..2e32bc7d8 100644
--- a/lib/i915/perf-configs/oa-sklgt3.xml
+++ b/lib/i915/perf-configs/oa-sklgt3.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842186" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT3"
        symbol_name="RenderBasic"
@@ -10629,7 +10629,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="2b985803-d3c9-4629-8a4f-634bfecba0e8"
+       hw_config_guid="14cadcfd-fb3a-46a3-8c13-0a4f850a4b18"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10827,6 +10827,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
diff --git a/lib/i915/perf-configs/oa-sklgt4.xml b/lib/i915/perf-configs/oa-sklgt4.xml
index 4e223a861..570919df7 100644
--- a/lib/i915/perf-configs/oa-sklgt4.xml
+++ b/lib/i915/perf-configs/oa-sklgt4.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<metrics version="1599482527" merge_md5="">
+<metrics version="1609842208" merge_md5="">
   <set name="Render Metrics Basic Gen9"
        chipset="SKLGT4"
        symbol_name="RenderBasic"
@@ -10652,7 +10652,7 @@
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO BB"
-       hw_config_guid="882fa433-1f4a-4a67-a962-c741888fe5f5"
+       hw_config_guid="c1c2d40e-652a-482c-98fc-28bdb7c6ee44"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10850,6 +10850,9 @@
         <register type="OA" address="0x000027A8" value="0x00100001" />
         <register type="OA" address="0x000027AC" value="0x0000FFE7" />
     </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0x00222222" />
+    </register_config>
   </set>
 
   <set name="Metric set PMA Stall"
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
