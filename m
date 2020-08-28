Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696736E49A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2020 11:17:11 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 28 Aug 2020 14:16:31 +0300
Message-Id: <20200828111634.147354-6-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200828111634.147354-1-lionel.g.landwerlin@intel.com>
References: <20200828111634.147354-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] lib/i915/perf: break TGL metrics in 2
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

Programming for GT1s & GT2s appear to be different.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/Makefile.am                               |   14 +-
 lib/i915/perf-configs/guids.xml               |   75 +-
 lib/i915/perf-configs/mdapi-xml-convert.py    |    3 +-
 lib/i915/perf-configs/oa-tglgt1.xml           | 8560 +++++++++++++++++
 .../{oa-tgl.xml => oa-tglgt2.xml}             |  252 +-
 lib/i915/perf-configs/update-guids.py         |    2 +-
 lib/i915/perf.c                               |   14 +-
 lib/meson.build                               |    2 +-
 8 files changed, 8786 insertions(+), 136 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-tglgt1.xml
 rename lib/i915/perf-configs/{oa-tgl.xml => oa-tglgt2.xml} (98%)

diff --git a/lib/Makefile.am b/lib/Makefile.am
index e9753d3c..066ae6f5 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -10,7 +10,7 @@ i915_perf_hardware =		\
 	bxt glk			\
 	cnl			\
 	icl ehl			\
-	tgl
+	tglgt1 tglgt2
 
 i915_perf_xml_files = $(i915_perf_hardware:%=i915/perf-configs/oa-%.xml)
 
@@ -91,10 +91,14 @@ i915_perf_generated_files = \
 	$(builddir)/i915/i915_perf_metrics_ehl.h \
 	$(builddir)/i915/i915_perf_registers_ehl.c \
 	$(builddir)/i915/i915_perf_registers_ehl.h \
-	$(builddir)/i915/i915_perf_metrics_tgl.c \
-	$(builddir)/i915/i915_perf_metrics_tgl.h \
-	$(builddir)/i915/i915_perf_registers_tgl.c \
-	$(builddir)/i915/i915_perf_registers_tgl.h \
+	$(builddir)/i915/i915_perf_metrics_tglgt1.c \
+	$(builddir)/i915/i915_perf_metrics_tglgt1.h \
+	$(builddir)/i915/i915_perf_registers_tglgt1.c \
+	$(builddir)/i915/i915_perf_registers_tglgt1.h \
+	$(builddir)/i915/i915_perf_metrics_tglgt2.c \
+	$(builddir)/i915/i915_perf_metrics_tglgt2.h \
+	$(builddir)/i915/i915_perf_registers_tglgt2.c \
+	$(builddir)/i915/i915_perf_registers_tglgt2.h \
 	$(builddir)/i915/i915_perf_equations.c \
 	$(builddir)/i915/i915_perf_equations.h
 
diff --git a/lib/i915/perf-configs/guids.xml b/lib/i915/perf-configs/guids.xml
index 76ad2b0f..b41b72f1 100644
--- a/lib/i915/perf-configs/guids.xml
+++ b/lib/i915/perf-configs/guids.xml
@@ -279,32 +279,6 @@
     <guid config_hash="d2188fa3c865ef430532b127a3fd87a5" mdapi_config_hash="ff33e47c767f6f81d9a779153aae6fdb" id="fd25ec19-3ed1-40c9-8648-1d2387449a92" chipset="icl" name="TDL_3" />
     <guid config_hash="b421b29d8557dbbf0fe3068c82b3d8dd" mdapi_config_hash="cc850ab4463c23e6017f069d67785c31" id="40dc79f2-88c8-47c6-8f86-f509e39fbe5d" chipset="icl" name="GpuBusyness" />
     <guid config_hash="7480125fc0806a347f975dc714568e92" mdapi_config_hash="c6b1c7a22e3c2f456cbfdae1bfe394ac" id="3c0bf614-5d67-4326-887f-a24eb8a58244" chipset="icl" name="TestOa" />
-    <guid config_hash="e11b3ae4d24126848630dfe3ca5d5c9d" mdapi_config_hash="f79fdac73b7b9e7a4b29cc552d53541e" id="daf004fb-fc9f-45e0-b842-1770e6d273c2" chipset="tgl" name="RenderBasic" />
-    <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="e6bdd317-fe1c-406a-afc7-781e88f57bd7" chipset="tgl" name="ComputeBasic" />
-    <guid config_hash="25155ad45887742faf4286e5d637ee76" mdapi_config_hash="907735bc616cd88d18cc07b791f310b1" id="77ae98cf-9a9e-4e35-be85-597b09ffbe53" chipset="tgl" name="RenderPipeProfile" />
-    <guid config_hash="2f5fdc0a222330844b4838c01ff2f0d7" mdapi_config_hash="5e59bd24cd51d97e8bdf10d0105b571a" id="dedd95cd-1bd4-4e65-be7f-1fd7aa43fe12" chipset="tgl" name="HDCAndSF" />
-    <guid config_hash="68ae806b961b5fe10bc4538f3437c1aa" mdapi_config_hash="3c336f4983f38baedb49ee0ba6463a05" id="a889ccb3-5ebd-437f-b5c6-e951fba822f5" chipset="tgl" name="RasterizerAndPixelBackend" />
-    <guid config_hash="9c950c6ca07f1eccfdcfd49dad046c79" mdapi_config_hash="037ce99af3124b147e626c732fed685c" id="feee2629-03a8-4d31-ab4d-7d16572163fb" chipset="tgl" name="L3_1" />
-    <guid config_hash="289db172e2380a6b75aa18135a178fa5" mdapi_config_hash="d96d8a44d3d1cf20e43a8d4a0d455944" id="5266f235-1711-4eef-9493-ebdf0238d512" chipset="tgl" name="L3_2" />
-    <guid config_hash="e8f56ddd87c511ec0550e6607f061cba" mdapi_config_hash="ef430240598e5d1b52be27df97b2cb05" id="9c2cd379-bf93-4ded-b481-f64efd534c4a" chipset="tgl" name="L3_3" />
-    <guid config_hash="f39841acc09f409b1d970cfcdf561fab" mdapi_config_hash="04e1f19526af2ceda229588104702531" id="6a68185d-0056-4891-a5f6-29aa1e1d81ae" chipset="tgl" name="L3_4" />
-    <guid config_hash="63601012e6bccf1956384ab60dce30bb" mdapi_config_hash="de2796143442a5bf31f1da384b2537f7" id="3f17a326-ae8b-4869-9f5a-3bccf793e287" chipset="tgl" name="L3_5" />
-    <guid config_hash="2c297ada6f33ef20eeca56c8d4beeade" mdapi_config_hash="9a5506a742413b90fd2f3f76ed0c8de0" id="d312c40a-9fb7-489a-9a1a-9cd80aac6d61" chipset="tgl" name="L3_6" />
-    <guid config_hash="4a5906954e6d2fb44057c6cd1d7548f2" mdapi_config_hash="d4ce0c915b228a3ba5803cb3ec5bf87f" id="f0f255a4-535c-43ed-9d6b-85958cef6c1c" chipset="tgl" name="Sampler_1" />
-    <guid config_hash="21cca53ef0ba57fdeccd60634bb2647b" mdapi_config_hash="0301fc7eaddaba1e6ed73c66a66cb53f" id="f47c6b97-fc10-4962-bb67-d623e9d6219b" chipset="tgl" name="Sampler_2" />
-    <guid config_hash="48011bc9d54f96fa65d6913fbf1cee7f" mdapi_config_hash="49abf97f3d60ef68f41f88ff3137b09c" id="2e49d25e-93e8-4e2b-b91b-51731f5fb315" chipset="tgl" name="TDL_1" />
-    <guid config_hash="270908dc68b94e7f052cdc9b2b283167" mdapi_config_hash="e8f763b7b1f93e2c4614c9cb6e5efea8" id="2a42ff25-99b1-4048-a121-f0664ed42c90" chipset="tgl" name="TDL_2" />
-    <guid config_hash="c3cfaa9f10fc1109831e511184915858" mdapi_config_hash="1bd054308052f97adffa7c6207f3f653" id="b763fa13-834e-4468-bba6-5f0d40db9813" chipset="tgl" name="TDL_3" />
-    <guid config_hash="152652e6549d438757c692a4fcf35247" mdapi_config_hash="3a1737f21051c9ad2da32d250dd6c4d2" id="cc935a3e-8d96-4b47-bc46-3d84247e9a3a" chipset="tgl" name="GpuBusyness" />
-    <guid config_hash="836d21da6c81399e7f4bf0ca5cc2adc0" mdapi_config_hash="cb12bd77d6d6cace3172867b543e828b" id="0732e7e2-e09a-401c-92bc-8af9bf6000bb" chipset="tgl" name="EuActivity1" />
-    <guid config_hash="ff656dc8ef36a80023ff170f50cba220" mdapi_config_hash="fd6ba067ae79689bad93a1581db5dc72" id="52b1fa12-3068-4b8c-8139-b5031a8d569b" chipset="tgl" name="EuActivity2" />
-    <guid config_hash="a0548951f70bbfc2d608fced4af8703d" mdapi_config_hash="c80f4de1346995f6883330fe36e7ee4c" id="6381bfd9-e89a-4d23-a71c-176f70e39088" chipset="tgl" name="EuActivity3" />
-    <guid config_hash="4fb45fce661994bb712d58bf21dcf617" mdapi_config_hash="b206a58e00605b2100f454e8746c141d" id="efb7e460-edff-4329-9123-bbccc93f5546" chipset="tgl" name="EuActivity4" />
-    <guid config_hash="80a8e01afb1d0480f6560a3d55578240" mdapi_config_hash="bb7bd9a4082249a7503ebf1b6d56dc73" id="76566878-face-4c3e-b18e-9117e1662ed4" chipset="tgl" name="EuActivity5" />
-    <guid config_hash="b466c8edcc118944f73725dd3a1d0997" mdapi_config_hash="3522f98e3d010205276910c21d66f719" id="61ead329-10c0-48ad-8087-99cc9886197f" chipset="tgl" name="EuActivity6" />
-    <guid config_hash="4e334e8ccb537e3a714cb772937895e6" mdapi_config_hash="f0417a67928b18d50e5c4a390ed6b58d" id="b698fbb4-6822-4110-a957-870223a8db94" chipset="tgl" name="EuActivity7" />
-    <guid config_hash="d1d8327895c6292ea720571bf6aec48d" mdapi_config_hash="13b16625e9e7842ec07dfe7f607be03e" id="6e6a63b1-caa6-4b8d-b214-8a0da078c39e" chipset="tgl" name="EuActivity8" />
-    <guid config_hash="185673d9c229adff444a595e6c217439" mdapi_config_hash="51644bc87975e69064d0575227a663f9" id="30801299-fe7b-40ba-8a6c-64c6196f3748" chipset="tgl" name="TestOa" />
     <guid config_hash="25380f09a9ab454374c78f1b5d1c4ddf" mdapi_config_hash="4d28665f4702ddf38239e5c47384dc15" id="a95112cc-804a-4c80-b57b-2870e56cc240" chipset="ehl" name="RenderBasic" />
     <guid config_hash="bf521fa74e9f5285bc3e9a7215cdadd2" mdapi_config_hash="bf085a519814344b241b08064f256921" id="54449e8a-196b-4c43-8ecd-540b0504b5c1" chipset="ehl" name="ComputeBasic" />
     <guid config_hash="9b6d58e5047c130f47999e04b92151e8" mdapi_config_hash="7bf6ffff6913e5536d4ad4dc4fa3b03b" id="05700b63-f044-4c79-b8ae-676972114745" chipset="ehl" name="ComputeExtended" />
@@ -324,4 +298,53 @@
     <guid config_hash="79df0b5785c2464bedddf7c2ea34fae9" mdapi_config_hash="011bb38aa81c2e56de1e7cf9653a4047" id="98154f5e-cf17-423c-a096-e696f87c2906" chipset="ehl" name="TDL_3" />
     <guid config_hash="051a88dbb1037b1e96ab8742322d5195" mdapi_config_hash="8f1f14586a4a4cbd9603488b87f3a571" id="85254749-e937-4205-9b40-5df8847c9ee8" chipset="ehl" name="GpuBusyness" />
     <guid config_hash="2f735b47a388ee4876e999e2fe1fdaff" mdapi_config_hash="8d9471fa5f2e9d9ef3bb3be89fbc0372" id="9dace73d-0364-45bc-9a22-f27c2acda706" chipset="ehl" name="TestOa" />
+    <guid config_hash="cba79c72b2989348f9db79f65aee74c7" mdapi_config_hash="d173cffda0e6aa07c693ed3636b09e3b" id="c17af13d-3953-432b-9bd1-81346b4c2092" chipset="tglgt1" name="RenderBasic" />
+    <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="79a0514e-40d7-437a-90cf-33e02857adc6" chipset="tglgt1" name="ComputeBasic" />
+    <guid config_hash="338f4f73347007310b6860c65e83ce87" mdapi_config_hash="baf3a770bb05723d39743ee683dd84c3" id="619eabea-0191-4d75-aaca-4217837215aa" chipset="tglgt1" name="RenderPipeProfile" />
+    <guid config_hash="b8afaffb07c9b51a3c62fbd5baaafe6c" mdapi_config_hash="57d8f33923d6ca368a72c4b90952ae40" id="b1560378-cb32-4d4b-af30-ffeb163655e6" chipset="tglgt1" name="HDCAndSF" />
+    <guid config_hash="933072588e6f7fa0adf6671f7a77dc28" mdapi_config_hash="e55d617404216cccdd77b6cb30bc7116" id="36e7fc09-3fb7-4b46-a6ff-ba1ce767db7c" chipset="tglgt1" name="RasterizerAndPixelBackend" />
+    <guid config_hash="f4c2bf455adbb7edb4df0b1235f70737" mdapi_config_hash="67a489dfa26ec9ba0d09f5a65ec4b33b" id="4a46a4ee-437d-4726-ac61-31e47072f706" chipset="tglgt1" name="L3_1" />
+    <guid config_hash="dc5293d4e321462b3c8b4349d8d0ed69" mdapi_config_hash="d3c800c0f3d91f8654aeb2d2a6050cba" id="2456d8be-5c99-430c-8172-8294fdc39331" chipset="tglgt1" name="L3_2" />
+    <guid config_hash="b8cdb44eaf81e77955a0ea1021b7f655" mdapi_config_hash="f9c2c916752ce281b9f2613a187a1bb3" id="71e2a606-810c-4252-bf7e-16fed118f4b5" chipset="tglgt1" name="L3_3" />
+    <guid config_hash="8c15daa9e0047d32d8c5a505441c9367" mdapi_config_hash="82bc535c6b08955c4388fa6c4577468b" id="327a91a5-f93c-449d-b5e1-ab92cb1180a1" chipset="tglgt1" name="L3_4" />
+    <guid config_hash="380594159a30354a8c0af095e75ce33d" mdapi_config_hash="0491376295a874188c97e8c2f4a1c673" id="a8de84ca-1624-4e0c-8046-d5265566c15b" chipset="tglgt1" name="L3_5" />
+    <guid config_hash="91ed2710716bbdc5da2b09c1d70ea6ab" mdapi_config_hash="b7b525587e4fbc34b4b750d6c28ccd49" id="6f376729-c56a-4560-a0eb-f4a17ec6df84" chipset="tglgt1" name="L3_6" />
+    <guid config_hash="ed86cc9afa0b2871343d7f5b8bdc799d" mdapi_config_hash="0b918b60a6c41a4af17a3bede6b682bc" id="4876283b-1889-4cef-880f-58de9dc676cb" chipset="tglgt1" name="Sampler_1" />
+    <guid config_hash="62e53aebb5a7cc918adc6742fa29ee56" mdapi_config_hash="29847733f747bcc4e238adb8e21e6a45" id="aeddd71b-2f93-48de-9e69-1cba5865473f" chipset="tglgt1" name="TDL_1" />
+    <guid config_hash="216f8a4dd88b3a519e34d715cab10c99" mdapi_config_hash="e72a704496540537e6317e4a9097ec9f" id="a4089c3f-a697-4213-a58b-70e150969226" chipset="tglgt1" name="GpuBusyness" />
+    <guid config_hash="829796b947ccde345effbdf10333f4ea" mdapi_config_hash="8f54bdebe2bde50b88c02cf4dd420d7a" id="ffde7a80-6d78-42c8-8603-838de28d07da" chipset="tglgt1" name="EuActivity1" />
+    <guid config_hash="0857d40a772c148cb305ef610db5d67c" mdapi_config_hash="68624f860ea8f0e6a446d0b02d5868c7" id="bd3186a3-6e96-4c70-a5d9-65d4bea6f668" chipset="tglgt1" name="EuActivity2" />
+    <guid config_hash="8133879afa7db394475e4f4b803abc37" mdapi_config_hash="2908ee3b1f77b7759366a8922ef8d442" id="b59e975f-044c-4e0c-afcd-46aee1107b81" chipset="tglgt1" name="EuActivity3" />
+    <guid config_hash="fa66e28922ce174de8023c3f445cae5e" mdapi_config_hash="1fb1fdcc4637a0dff0a39a8f74333ce7" id="948f1627-f642-42a6-8304-801d7db112d2" chipset="tglgt1" name="EuActivity4" />
+    <guid config_hash="943086e262c3b7bf208729087e3346d3" mdapi_config_hash="b483f573cd4349dd48e0168c277574ea" id="243ffad2-626e-4d05-94a0-af7068e18a84" chipset="tglgt1" name="EuActivity5" />
+    <guid config_hash="b5e4ba8634a9431f3e477e91d49c922e" mdapi_config_hash="acdc8a6338ee6465ec3726b4dbe11b09" id="1f367b67-1f45-469b-97fd-eac88aeb1f7c" chipset="tglgt1" name="EuActivity6" />
+    <guid config_hash="bce06cc3317021a1bca092e31077c120" mdapi_config_hash="9a2e97a77cef98d3059e2d07d6efd870" id="7c2db23c-1fb4-45df-a5d5-2345d23c10fc" chipset="tglgt1" name="EuActivity7" />
+    <guid config_hash="2cbc81048a9b92ebb143b18a10802c5c" mdapi_config_hash="684747208975b2f0279f5b829ab24b7b" id="b4c81162-2c96-4cf1-86ae-ecff3d57ee4d" chipset="tglgt1" name="EuActivity8" />
+    <guid config_hash="c7195c52cb01e383353dfbffa68baefc" mdapi_config_hash="114b3f158d5e37178af7b031759c3768" id="6f27aaed-4f08-4e0f-95a9-231d9b4fa111" chipset="tglgt1" name="TestOa" />
+    <guid config_hash="b3f89fd4211d1f0e5040fdba467f8923" mdapi_config_hash="6dd33bc3aa87f6ca3811c3e617024e43" id="0fc397c0-4833-492c-9ccd-4929d574d5b8" chipset="tglgt2" name="RenderBasic" />
+    <guid config_hash="6bfccfd98beccb8b008e8ba30a7a553b" mdapi_config_hash="c2e0ad3ca3f17e7e1dc6c9c83c83619e" id="397a46d9-03dd-4696-8196-270362e1c575" chipset="tglgt2" name="ComputeBasic" />
+    <guid config_hash="25155ad45887742faf4286e5d637ee76" mdapi_config_hash="907735bc616cd88d18cc07b791f310b1" id="684ed715-a0ca-499b-89e0-25d1cdf0c737" chipset="tglgt2" name="RenderPipeProfile" />
+    <guid config_hash="2f5fdc0a222330844b4838c01ff2f0d7" mdapi_config_hash="5e59bd24cd51d97e8bdf10d0105b571a" id="3a4c7510-7725-4bf8-9eae-59115a2431c6" chipset="tglgt2" name="HDCAndSF" />
+    <guid config_hash="68ae806b961b5fe10bc4538f3437c1aa" mdapi_config_hash="3c336f4983f38baedb49ee0ba6463a05" id="6f02479c-e9ca-4c2b-b1e6-216a9e1c5ef7" chipset="tglgt2" name="RasterizerAndPixelBackend" />
+    <guid config_hash="9c950c6ca07f1eccfdcfd49dad046c79" mdapi_config_hash="037ce99af3124b147e626c732fed685c" id="7e809cb4-6e90-44cc-9c57-6eff58ad360a" chipset="tglgt2" name="L3_1" />
+    <guid config_hash="289db172e2380a6b75aa18135a178fa5" mdapi_config_hash="d96d8a44d3d1cf20e43a8d4a0d455944" id="0dde1bb6-340f-4350-b398-2b0228573967" chipset="tglgt2" name="L3_2" />
+    <guid config_hash="e8f56ddd87c511ec0550e6607f061cba" mdapi_config_hash="ef430240598e5d1b52be27df97b2cb05" id="8ecaeff2-78f4-4e29-b331-d757e6a74ed0" chipset="tglgt2" name="L3_3" />
+    <guid config_hash="f39841acc09f409b1d970cfcdf561fab" mdapi_config_hash="04e1f19526af2ceda229588104702531" id="30cd8433-f679-401e-b578-19e22975e84f" chipset="tglgt2" name="L3_4" />
+    <guid config_hash="63601012e6bccf1956384ab60dce30bb" mdapi_config_hash="de2796143442a5bf31f1da384b2537f7" id="e0efab61-c904-4354-9fc5-35e8b8bc7d20" chipset="tglgt2" name="L3_5" />
+    <guid config_hash="2c297ada6f33ef20eeca56c8d4beeade" mdapi_config_hash="9a5506a742413b90fd2f3f76ed0c8de0" id="4066ad45-4a68-4acf-86b2-fa5a6a914db7" chipset="tglgt2" name="L3_6" />
+    <guid config_hash="4a5906954e6d2fb44057c6cd1d7548f2" mdapi_config_hash="d4ce0c915b228a3ba5803cb3ec5bf87f" id="17e2be13-39fe-45f0-867c-0f83fcc51654" chipset="tglgt2" name="Sampler_1" />
+    <guid config_hash="21cca53ef0ba57fdeccd60634bb2647b" mdapi_config_hash="0301fc7eaddaba1e6ed73c66a66cb53f" id="0c3c3235-2e91-4ef0-8562-4ea1501e8612" chipset="tglgt2" name="Sampler_2" />
+    <guid config_hash="48011bc9d54f96fa65d6913fbf1cee7f" mdapi_config_hash="49abf97f3d60ef68f41f88ff3137b09c" id="ee6f5fa3-13a8-4842-8b34-f7541a0f76a3" chipset="tglgt2" name="TDL_1" />
+    <guid config_hash="270908dc68b94e7f052cdc9b2b283167" mdapi_config_hash="e8f763b7b1f93e2c4614c9cb6e5efea8" id="f1577929-9215-488b-9899-d12b6e799743" chipset="tglgt2" name="TDL_2" />
+    <guid config_hash="c3cfaa9f10fc1109831e511184915858" mdapi_config_hash="1bd054308052f97adffa7c6207f3f653" id="d5890d02-b2be-4742-a16e-17190a92a301" chipset="tglgt2" name="TDL_3" />
+    <guid config_hash="152652e6549d438757c692a4fcf35247" mdapi_config_hash="3a1737f21051c9ad2da32d250dd6c4d2" id="19fe64eb-ac4f-45c6-b2b9-af728b21753b" chipset="tglgt2" name="GpuBusyness" />
+    <guid config_hash="836d21da6c81399e7f4bf0ca5cc2adc0" mdapi_config_hash="cb12bd77d6d6cace3172867b543e828b" id="414ff049-80d3-48c0-b79a-bd8eed097a06" chipset="tglgt2" name="EuActivity1" />
+    <guid config_hash="ff656dc8ef36a80023ff170f50cba220" mdapi_config_hash="fd6ba067ae79689bad93a1581db5dc72" id="fb65c819-7ac2-4c69-aa9d-b72a18440705" chipset="tglgt2" name="EuActivity2" />
+    <guid config_hash="a0548951f70bbfc2d608fced4af8703d" mdapi_config_hash="c80f4de1346995f6883330fe36e7ee4c" id="7e1c6469-9de7-491a-a7c5-1bd8f9966826" chipset="tglgt2" name="EuActivity3" />
+    <guid config_hash="4fb45fce661994bb712d58bf21dcf617" mdapi_config_hash="b206a58e00605b2100f454e8746c141d" id="a43f80cd-5cc1-4a2c-a750-40594af2b661" chipset="tglgt2" name="EuActivity4" />
+    <guid config_hash="80a8e01afb1d0480f6560a3d55578240" mdapi_config_hash="bb7bd9a4082249a7503ebf1b6d56dc73" id="7e6e555c-aa5b-4c8d-992a-454a5a335c6e" chipset="tglgt2" name="EuActivity5" />
+    <guid config_hash="b466c8edcc118944f73725dd3a1d0997" mdapi_config_hash="3522f98e3d010205276910c21d66f719" id="f3723f39-ecf4-4ff2-a4c4-80e87876b86f" chipset="tglgt2" name="EuActivity6" />
+    <guid config_hash="4e334e8ccb537e3a714cb772937895e6" mdapi_config_hash="f0417a67928b18d50e5c4a390ed6b58d" id="c0d2cd0a-e2be-4b12-916d-2f3aba0ebf9e" chipset="tglgt2" name="EuActivity7" />
+    <guid config_hash="d1d8327895c6292ea720571bf6aec48d" mdapi_config_hash="13b16625e9e7842ec07dfe7f607be03e" id="1fbbd218-693c-4035-b4c0-ce4dd139d828" chipset="tglgt2" name="EuActivity8" />
+    <guid config_hash="185673d9c229adff444a595e6c217439" mdapi_config_hash="51644bc87975e69064d0575227a663f9" id="6607f034-d053-40d1-8215-67c07f3041bb" chipset="tglgt2" name="TestOa" />
 </guids>
diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
index 249cfd59..65d59b12 100755
--- a/lib/i915/perf-configs/mdapi-xml-convert.py
+++ b/lib/i915/perf-configs/mdapi-xml-convert.py
@@ -123,7 +123,8 @@ chipsets = {
     'CNL': gen8_11_chipset_params,
     'ICL': gen8_11_chipset_params,
     'EHL': gen8_11_chipset_params,
-    'TGL': gen8_11_chipset_params,
+    'TGLGT1': gen8_11_chipset_params,
+    'TGLGT2': gen8_11_chipset_params,
 }
 
 register_types = { 'OA', 'NOA', 'FLEX', 'PM' }
diff --git a/lib/i915/perf-configs/oa-tglgt1.xml b/lib/i915/perf-configs/oa-tglgt1.xml
new file mode 100644
index 00000000..84cb2802
--- /dev/null
+++ b/lib/i915/perf-configs/oa-tglgt1.xml
@@ -0,0 +1,8560 @@
+<?xml version="1.0"?>
+<metrics version="1598354173" merge_md5="">
+  <set name="Render Metrics Basic Gen12"
+       chipset="TGLGT1"
+       symbol_name="RenderBasic"
+       underscore_name="render_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="c17af13d-3953-432b-9bd1-81346b4c2092"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler00 Busy"
+             symbol_name="Sampler00Busy"
+             underscore_name="sampler00_busy"
+             description="The percentage of time in which Slice0 Sampler0 has been processing EU requests."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Sampler Slice0 Dualsubslice0 is bottleneck"
+             symbol_name="Sampler00Bottleneck"
+             underscore_name="sampler00_bottleneck"
+             description="The percentage of time when sampler slice0 dualsubslice0 is bottleneck"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Samplers Busy"
+             symbol_name="SamplersBusy"
+             underscore_name="samplers_busy"
+             description="The percentage of time in which samplers have been processing EU requests."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler00Busy"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Samplers Bottleneck"
+             symbol_name="SamplerBottleneck"
+             underscore_name="sampler_bottleneck"
+             description="The percentage of time in which samplers have been slowing down the pipe when processing EU requests."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="$Sampler00Bottleneck"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 5 READ C 4 READ UADD C 3 READ UADD C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 1 READ C 0 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x14150001" />
+        <register type="NOA" address="0x00009888" value="0x16150020" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x0E124000" />
+        <register type="NOA" address="0x00009888" value="0x10124000" />
+        <register type="NOA" address="0x00009888" value="0x12124000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C130E00" />
+        <register type="NOA" address="0x00009888" value="0x00150050" />
+        <register type="NOA" address="0x00009888" value="0x06157000" />
+        <register type="NOA" address="0x00009888" value="0x08157151" />
+        <register type="NOA" address="0x00009888" value="0x10150000" />
+        <register type="NOA" address="0x00009888" value="0x18150000" />
+        <register type="NOA" address="0x00009888" value="0x1C150000" />
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E00C000" />
+        <register type="NOA" address="0x00009888" value="0x1000C000" />
+        <register type="NOA" address="0x00009888" value="0x1200C000" />
+        <register type="NOA" address="0x00009888" value="0x10058000" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x22050030" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x0C0AC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D47" />
+        <register type="NOA" address="0x00009888" value="0x09151536" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110001" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x1F150137" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x0F168000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x1D350137" />
+        <register type="NOA" address="0x00009888" value="0x03350147" />
+        <register type="NOA" address="0x00009888" value="0x07350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x0F364000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55101710" />
+        <register type="NOA" address="0x00009888" value="0x57100007" />
+        <register type="NOA" address="0x00009888" value="0x49101717" />
+        <register type="NOA" address="0x00009888" value="0x4B100717" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+  <set name="Compute Metrics Basic"
+       chipset="TGLGT1"
+       symbol_name="ComputeBasic"
+       underscore_name="compute_basic"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="79a0514e-40d7-437a-90cf-33e02857adc6"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+  <set name="Render Metrics for 3D Pipeline Profile"
+       chipset="TGLGT1"
+       symbol_name="RenderPipeProfile"
+       underscore_name="render_pipe_profile"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="619eabea-0191-4d75-aaca-4217837215aa"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VF Bottleneck"
+             symbol_name="VfBottleneck"
+             underscore_name="vf_bottleneck"
+             description="The percentage of time in which vertex fetch pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Input Assembler"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Bottleneck"
+             symbol_name="VsBottleneck"
+             underscore_name="vs_bottleneck"
+             description="The percentage of time in which vertex shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="10"
+             high_watermark="30"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Vertex Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Bottleneck"
+             symbol_name="HsBottleneck"
+             underscore_name="hs_bottleneck"
+             description="The percentage of time in which hull shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="3"
+             high_watermark="9"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Bottleneck"
+             symbol_name="DsBottleneck"
+             underscore_name="ds_bottleneck"
+             description="The percentage of time in which domain shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Bottleneck"
+             symbol_name="GsBottleneck"
+             underscore_name="gs_bottleneck"
+             description="The percentage of time in which geometry shader pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Geometry Shader"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO Bottleneck"
+             symbol_name="SoBottleneck"
+             underscore_name="so_bottleneck"
+             description="The percentage of time in which stream output pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Clipper Bottleneck"
+             symbol_name="ClBottleneck"
+             underscore_name="cl_bottleneck"
+             description="The percentage of time in which clipper pipeline stage was slowing down the 3D pipeline."
+             low_watermark="10"
+             high_watermark="30"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Strip-Fans Bottleneck"
+             symbol_name="SfBottleneck"
+             underscore_name="sf_bottleneck"
+             description="The percentage of time in which strip-fans pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="10"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Hi-Depth Bottleneck"
+             symbol_name="HiDepthBottleneck"
+             underscore_name="hi_depth_bottleneck"
+             description="The percentage of time in which early hierarchical depth test pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="BC Bottleneck"
+             symbol_name="BcBottleneck"
+             underscore_name="bc_bottleneck"
+             description="The percentage of time in which barycentric coordinates calculation pipeline stage was slowing down the 3D pipeline."
+             low_watermark="5"
+             high_watermark="15"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Barycentric Calc"
+             mdapi_usage_flags="Tier3 Indicate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Stall"
+             symbol_name="HsStall"
+             underscore_name="hs_stall"
+             description="The percentage of time in which hull stall pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Hull Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Stall"
+             symbol_name="DsStall"
+             underscore_name="ds_stall"
+             description="The percentage of time in which domain shader pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Domain Shader"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SO Stall"
+             symbol_name="SoStall"
+             underscore_name="so_stall"
+             description="The percentage of time in which stream-output pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Stream Output"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CL Stall"
+             symbol_name="ClStall"
+             underscore_name="cl_stall"
+             description="The percentage of time in which clipper pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Clipper"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SF Stall"
+             symbol_name="SfStall"
+             underscore_name="sf_stall"
+             description="The percentage of time in which strip-fans pipeline stage was stalled."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="3D Pipe/Rasterizer/Strip-Fans"
+             mdapi_usage_flags="Tier4 Correlate Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x00123E00" />
+        <register type="NOA" address="0x00009888" value="0x060B00B3" />
+        <register type="NOA" address="0x00009888" value="0x140B3C00" />
+        <register type="NOA" address="0x00009888" value="0x1C0B0000" />
+        <register type="NOA" address="0x00009888" value="0x120C8320" />
+        <register type="NOA" address="0x00009888" value="0x040D7E00" />
+        <register type="NOA" address="0x00009888" value="0x280D0000" />
+        <register type="NOA" address="0x00009888" value="0x2C0E001F" />
+        <register type="NOA" address="0x00009888" value="0x10087C00" />
+        <register type="NOA" address="0x00009888" value="0x1E120002" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x1E130002" />
+        <register type="NOA" address="0x00009888" value="0x0E0B0031" />
+        <register type="NOA" address="0x00009888" value="0x180B0092" />
+        <register type="NOA" address="0x00009888" value="0x1A0B00B1" />
+        <register type="NOA" address="0x00009888" value="0x020B0093" />
+        <register type="NOA" address="0x00009888" value="0x040B0033" />
+        <register type="NOA" address="0x00009888" value="0x000B0000" />
+        <register type="NOA" address="0x00009888" value="0x0A0C0022" />
+        <register type="NOA" address="0x00009888" value="0x1E0C00C2" />
+        <register type="NOA" address="0x00009888" value="0x140C8000" />
+        <register type="NOA" address="0x00009888" value="0x160C8000" />
+        <register type="NOA" address="0x00009888" value="0x100D0017" />
+        <register type="NOA" address="0x00009888" value="0x160D0013" />
+        <register type="NOA" address="0x00009888" value="0x1C0D0081" />
+        <register type="NOA" address="0x00009888" value="0x080D0082" />
+        <register type="NOA" address="0x00009888" value="0x0A0D0102" />
+        <register type="NOA" address="0x00009888" value="0x200D0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0D4000" />
+        <register type="NOA" address="0x00009888" value="0x140D4000" />
+        <register type="NOA" address="0x00009888" value="0x180D4000" />
+        <register type="NOA" address="0x00009888" value="0x1A0D4000" />
+        <register type="NOA" address="0x00009888" value="0x020D4000" />
+        <register type="NOA" address="0x00009888" value="0x060D4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0E0225" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x100E8000" />
+        <register type="NOA" address="0x00009888" value="0x140E8000" />
+        <register type="NOA" address="0x00009888" value="0x160E8000" />
+        <register type="NOA" address="0x00009888" value="0x180E8000" />
+        <register type="NOA" address="0x00009888" value="0x1A0E8000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E8000" />
+        <register type="NOA" address="0x00009888" value="0x020E8000" />
+        <register type="NOA" address="0x00009888" value="0x040E8000" />
+        <register type="NOA" address="0x00009888" value="0x060E8000" />
+        <register type="NOA" address="0x00009888" value="0x080E8000" />
+        <register type="NOA" address="0x00009888" value="0x0A0E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x100F4000" />
+        <register type="NOA" address="0x00009888" value="0x140F4000" />
+        <register type="NOA" address="0x00009888" value="0x160F4000" />
+        <register type="NOA" address="0x00009888" value="0x180F4000" />
+        <register type="NOA" address="0x00009888" value="0x1A0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x020F4000" />
+        <register type="NOA" address="0x00009888" value="0x040F4000" />
+        <register type="NOA" address="0x00009888" value="0x060F4000" />
+        <register type="NOA" address="0x00009888" value="0x080F4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0F4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x0E004000" />
+        <register type="NOA" address="0x00009888" value="0x10004000" />
+        <register type="NOA" address="0x00009888" value="0x12008000" />
+        <register type="NOA" address="0x00009888" value="0x34005540" />
+        <register type="NOA" address="0x00009888" value="0x36000003" />
+        <register type="NOA" address="0x00009888" value="0x02004000" />
+        <register type="NOA" address="0x00009888" value="0x04004000" />
+        <register type="NOA" address="0x00009888" value="0x06004000" />
+        <register type="NOA" address="0x00009888" value="0x08004000" />
+        <register type="NOA" address="0x00009888" value="0x0A004000" />
+        <register type="NOA" address="0x00009888" value="0x0C004000" />
+        <register type="NOA" address="0x00009888" value="0x0601C000" />
+        <register type="NOA" address="0x00009888" value="0x08014000" />
+        <register type="NOA" address="0x00009888" value="0x0A01C000" />
+        <register type="NOA" address="0x00009888" value="0x1801E000" />
+        <register type="NOA" address="0x00009888" value="0x00018000" />
+        <register type="NOA" address="0x00009888" value="0x0201C000" />
+        <register type="NOA" address="0x00009888" value="0x0401C000" />
+        <register type="NOA" address="0x00009888" value="0x22050800" />
+        <register type="NOA" address="0x00009888" value="0x120A8000" />
+        <register type="NOA" address="0x00009888" value="0x08081000" />
+        <register type="NOA" address="0x00009888" value="0x16080000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101555" />
+        <register type="NOA" address="0x00009888" value="0x1B14FC00" />
+        <register type="NOA" address="0x00009888" value="0x1D14003F" />
+        <register type="NOA" address="0x00009888" value="0x13148000" />
+        <register type="NOA" address="0x00009888" value="0x15148000" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x5F115555" />
+        <register type="NOA" address="0x00009888" value="0x61111555" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x4D100604" />
+        <register type="NOA" address="0x00009888" value="0x4F100400" />
+        <register type="NOA" address="0x00009888" value="0x5110020A" />
+        <register type="NOA" address="0x00009888" value="0x53100004" />
+        <register type="NOA" address="0x00009888" value="0x55100400" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x57100004" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100400" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set HDCAndSF"
+       chipset="TGLGT1"
+       symbol_name="HDCAndSF"
+       underscore_name="hdc_and_sf"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="b1560378-cb32-4d4b-af30-ffeb163655e6"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 Dualsubslice0 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader00AccessStalledOnL3"
+             underscore_name="non_sampler_shader00_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice0)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 Dualsubslice1 Non-sampler Shader Access Stalled On L3"
+             symbol_name="NonSamplerShader01AccessStalledOnL3"
+             underscore_name="non_sampler_shader01_access_stalled_on_l3"
+             description="Percentage of time when HDC has messages to L3, but it's stalled due to lack of credits (Slice0 Dualsubslice1)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Polygon Data Ready"
+             symbol_name="PolyDataReady"
+             underscore_name="poly_data_ready"
+             description="The percentage of time in which geometry pipeline output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe/Strip-Fans"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x14112400" />
+        <register type="NOA" address="0x00009888" value="0x14312400" />
+        <register type="NOA" address="0x00009888" value="0x240A0019" />
+        <register type="NOA" address="0x00009888" value="0x00110074" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x00128000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x0E310074" />
+        <register type="NOA" address="0x00009888" value="0x10310000" />
+        <register type="NOA" address="0x00009888" value="0x06310000" />
+        <register type="NOA" address="0x00009888" value="0x0E328000" />
+        <register type="NOA" address="0x00009888" value="0x1C330200" />
+        <register type="NOA" address="0x00009888" value="0x0E0D8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x0E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E004000" />
+        <register type="NOA" address="0x00009888" value="0x1000C000" />
+        <register type="NOA" address="0x00009888" value="0x06018000" />
+        <register type="NOA" address="0x00009888" value="0x10058000" />
+        <register type="NOA" address="0x00009888" value="0x100A00F7" />
+        <register type="NOA" address="0x00009888" value="0x140A0000" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A0000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B146000" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x47100400" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100110" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x70800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00070000" />
+        <register type="OA" address="0x0000D940" value="0x00000002" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFE" />
+        <register type="OA" address="0x0000DC00" value="0x00000002" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFE" />
+        <register type="OA" address="0x0000D948" value="0x00000002" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000DC08" value="0x00000002" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFD" />
+        <register type="OA" address="0x0000D950" value="0x00000002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFB" />
+        <register type="OA" address="0x0000DC10" value="0x00000002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFB" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Metric set RasterizerAndPixelBackend"
+       chipset="TGLGT1"
+       symbol_name="RasterizerAndPixelBackend"
+       underscore_name="rasterizer_and_pixel_backend"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="36e7fc09-3fb7-4b46-a6ff-ba1ce767db7c"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Rasterized Pixels"
+             symbol_name="RasterizedPixels"
+             underscore_name="rasterized_pixels"
+             description="The total number of rasterized pixels."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 21 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Hi-Depth Test Fails"
+             symbol_name="HiDepthTestFails"
+             underscore_name="hi_depth_test_fails"
+             description="The total number of pixels dropped on early hierarchical depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 22 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Hi-Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Early Depth Test Fails"
+             symbol_name="EarlyDepthTestFails"
+             underscore_name="early_depth_test_fails"
+             description="The total number of pixels dropped on early depth test."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 23 READ 4 UMUL"
+             mdapi_group="3D Pipe/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Killed in FS"
+             symbol_name="SamplesKilledInPs"
+             underscore_name="samples_killed_in_ps"
+             description="The total number of samples or pixels dropped in fragment shaders."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 24 READ 4 UMUL"
+             mdapi_group="3D Pipe/Fragment Shader"
+             mdapi_usage_flags="Tier4 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Pixels Failing Tests"
+             symbol_name="PixelsFailingPostPsTests"
+             underscore_name="pixels_failing_post_ps_tests"
+             description="The total number of pixels dropped on post-FS alpha, stencil, or depth tests."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 25 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Written"
+             symbol_name="SamplesWritten"
+             underscore_name="samples_written"
+             description="The total number of samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 26 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Samples Blended"
+             symbol_name="SamplesBlended"
+             underscore_name="samples_blended"
+             description="The total number of blended samples or pixels written to all render targets."
+             data_type="uint64"
+             units="pixels"
+             semantic_type="event"
+             equation="A 27 READ 4 UMUL"
+             mdapi_group="3D Pipe/Output Merger"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis="VK OGL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels"
+             symbol_name="SamplerTexels"
+             underscore_name="sampler_texels"
+             description="The total number of texels seen on input (with 2x2 accuracy) in all sampler units."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 28 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Input"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Sampler Texels Misses"
+             symbol_name="SamplerTexelMisses"
+             underscore_name="sampler_texel_misses"
+             description="The total number of texels lookups (with 2x2 accuracy) that missed L1 sampler cache."
+             data_type="uint64"
+             units="texels"
+             semantic_type="event"
+             equation="A 29 READ 4 UMUL"
+             mdapi_group="Sampler/Sampler Cache"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Read"
+             symbol_name="SlmBytesRead"
+             underscore_name="slm_bytes_read"
+             description="The total number of GPU memory bytes read from shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 30 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SLM Bytes Written"
+             symbol_name="SlmBytesWritten"
+             underscore_name="slm_bytes_written"
+             description="The total number of GPU memory bytes written into shared local memory."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="A 31 READ 64 UMUL"
+             mdapi_group="L3/Data Port/SLM"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Memory Accesses"
+             symbol_name="ShaderMemoryAccesses"
+             underscore_name="shader_memory_accesses"
+             description="The total number of shader memory accesses to L3."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 32 READ"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Atomic Memory Accesses"
+             symbol_name="ShaderAtomics"
+             underscore_name="shader_atomics"
+             description="The total number of shader atomic memory accesses."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 34 READ"
+             mdapi_group="L3/Data Port/Atomics"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="L3 Shader Throughput"
+             symbol_name="L3ShaderThroughput"
+             underscore_name="l3_shader_throughput"
+             description="The total number of GPU memory bytes transferred between shaders and L3 caches w/o URB."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="$ShaderMemoryAccesses 64 UMUL"
+             mdapi_group="L3/Data Port"
+             mdapi_usage_flags="Tier2 Frame Batch Draw"
+             mdapi_supported_apis="VK OGL OCL IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Shader Barrier Messages"
+             symbol_name="ShaderBarriers"
+             underscore_name="shader_barriers"
+             description="The total number of shader barrier messages."
+             data_type="uint64"
+             units="messages"
+             semantic_type="event"
+             equation="A 35 READ"
+             mdapi_group="EU Array/Barrier"
+             mdapi_usage_flags="Tier3 Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 Rasterizer Input Available"
+             symbol_name="Rasterizer0InputAvailable"
+             underscore_name="rasterizer0_input_available"
+             description="The percentage of time in which slice0 rasterizer input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Rasterizer Output Ready"
+             symbol_name="Rasterizer0OutputReady"
+             underscore_name="rasterizer0_output_ready"
+             description="The percentage of time in which slice0 rasterizer output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GPU/Rasterizer"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe0 Post-EarlyZ Pixel Data Ready"
+             symbol_name="PixelData00Ready"
+             underscore_name="pixel_data00_ready"
+             description="The percentage of time in which slice0  pipe0 post-EarlyZ pixel data is ready (after early Z tests have been applied)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/Rasterizer/Early Depth Test"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe0 PS Output Available"
+             symbol_name="PSOutput00Available"
+             underscore_name="ps_output00_available"
+             description="The percentage of time in which slice0 pipe0 PS output is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 Pipe0 Pixel Values Ready"
+             symbol_name="PixelValues00Ready"
+             underscore_name="pixel_values00_ready"
+             description="The percentage of time in which slice0 pipe0 pixel values are ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU/3D Pipe"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="SQ00 is full"
+             symbol_name="GTRequestQueue00Full"
+             underscore_name="gt_request_queue00_full"
+             description="The percentage of time when IDI0 SQ0 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ01 is full"
+             symbol_name="GTRequestQueue01Full"
+             underscore_name="gt_request_queue01_full"
+             description="The percentage of time when IDI0 SQ1 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ10 is full"
+             symbol_name="GTRequestQueue10Full"
+             underscore_name="gt_request_queue10_full"
+             description="The percentage of time when IDI1 SQ0 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="SQ11 is full"
+             symbol_name="GTRequestQueue11Full"
+             underscore_name="gt_request_queue11_full"
+             description="The percentage of time when IDI1 SQ1 is filled above a threshold (usually 48 entries)"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x1E055000" />
+        <register type="NOA" address="0x00009888" value="0x1A0500C0" />
+        <register type="NOA" address="0x00009888" value="0x2A0A7300" />
+        <register type="NOA" address="0x00009888" value="0x2C0A0000" />
+        <register type="NOA" address="0x00009888" value="0x120800A0" />
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E00C000" />
+        <register type="NOA" address="0x00009888" value="0x1000C000" />
+        <register type="NOA" address="0x00009888" value="0x12008000" />
+        <register type="NOA" address="0x00009888" value="0x34000080" />
+        <register type="NOA" address="0x00009888" value="0x0800C000" />
+        <register type="NOA" address="0x00009888" value="0x0A00C000" />
+        <register type="NOA" address="0x00009888" value="0x0C00C000" />
+        <register type="NOA" address="0x00009888" value="0x04052700" />
+        <register type="NOA" address="0x00009888" value="0x060500C0" />
+        <register type="NOA" address="0x00009888" value="0x22050000" />
+        <register type="NOA" address="0x00009888" value="0x1C050000" />
+        <register type="NOA" address="0x00009888" value="0x000A0144" />
+        <register type="NOA" address="0x00009888" value="0x0E0A0145" />
+        <register type="NOA" address="0x00009888" value="0x100A0156" />
+        <register type="NOA" address="0x00009888" value="0x080A814F" />
+        <register type="NOA" address="0x00009888" value="0x140A0000" />
+        <register type="NOA" address="0x00009888" value="0x040A0000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A4000" />
+        <register type="NOA" address="0x00009888" value="0x0C0A0000" />
+        <register type="NOA" address="0x00009888" value="0x08081980" />
+        <register type="NOA" address="0x00009888" value="0x0A080032" />
+        <register type="NOA" address="0x00009888" value="0x10080000" />
+        <register type="NOA" address="0x00009888" value="0x16080000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x31152800" />
+        <register type="NOA" address="0x00009888" value="0x331500A0" />
+        <register type="NOA" address="0x00009888" value="0x31352800" />
+        <register type="NOA" address="0x00009888" value="0x333500A0" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B10556B" />
+        <register type="NOA" address="0x00009888" value="0x5D103005" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14FC00" />
+        <register type="NOA" address="0x00009888" value="0x1D140001" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115540" />
+        <register type="NOA" address="0x00009888" value="0x61110005" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x05150096" />
+        <register type="NOA" address="0x00009888" value="0x07150016" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x0316C000" />
+        <register type="NOA" address="0x00009888" value="0x1F350096" />
+        <register type="NOA" address="0x00009888" value="0x03350016" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x0F368000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x47101200" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100202" />
+        <register type="NOA" address="0x00009888" value="0x51100202" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55101000" />
+        <register type="NOA" address="0x00009888" value="0x57100001" />
+        <register type="NOA" address="0x00009888" value="0x49101111" />
+        <register type="NOA" address="0x00009888" value="0x4B100201" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000038" />
+        <register type="OA" address="0x0000D944" value="0x0000FFF8" />
+        <register type="OA" address="0x0000DC00" value="0x00000038" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFF8" />
+        <register type="OA" address="0x0000D948" value="0x000000C0" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC08" value="0x000000C0" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFE7" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_1"
+       chipset="TGLGT1"
+       symbol_name="L3_1"
+       underscore_name="l3_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="4a46a4ee-437d-4726-ac61-31e47072f706"
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
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank0 Input Available"
+             symbol_name="L30Bank0InputAvailable"
+             underscore_name="l30_bank0_input_available"
+             description="The percentage of time in which slice0 L3 bank0 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ C 1 READ FADD C 2 READ FADD C 3 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank1 Input Available"
+             symbol_name="L30Bank1InputAvailable"
+             underscore_name="l30_bank1_input_available"
+             description="The percentage of time in which slice0 L3 bank1 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ C 5 READ FADD C 6 READ FADD C 7 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04002024" />
+        <register type="NOA" address="0x00009888" value="0x0600282F" />
+        <register type="NOA" address="0x00009888" value="0x1C000027" />
+        <register type="NOA" address="0x00009888" value="0x1E000026" />
+        <register type="NOA" address="0x00009888" value="0x02000025" />
+        <register type="NOA" address="0x00009888" value="0x0800002E" />
+        <register type="NOA" address="0x00009888" value="0x0A00002D" />
+        <register type="NOA" address="0x00009888" value="0x0C00002C" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009888" value="0x34000000" />
+        <register type="NOA" address="0x00009888" value="0x36000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100555" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x13148000" />
+        <register type="NOA" address="0x00009888" value="0x15148000" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x1B141C00" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x5F110555" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_2"
+       chipset="TGLGT1"
+       symbol_name="L3_2"
+       underscore_name="l3_2"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="2456d8be-5c99-430c-8172-8294fdc39331"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank2 Input Available"
+             symbol_name="L30Bank2InputAvailable"
+             underscore_name="l30_bank2_input_available"
+             description="The percentage of time in which slice0 L3 bank2 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ B 2 READ FADD B 1 READ FADD B 0 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <counter name="Slice0 L3 Bank3 Input Available"
+             symbol_name="L30Bank3InputAvailable"
+             underscore_name="l30_bank3_input_available"
+             description="The percentage of time in which slice0 L3 bank3 has input available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 7 READ B 6 READ FADD B 5 READ FADD B 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04003000" />
+        <register type="NOA" address="0x00009888" value="0x06003800" />
+        <register type="NOA" address="0x00009888" value="0x00000024" />
+        <register type="NOA" address="0x00009888" value="0x0E000025" />
+        <register type="NOA" address="0x00009888" value="0x10000026" />
+        <register type="NOA" address="0x00009888" value="0x12000027" />
+        <register type="NOA" address="0x00009888" value="0x1400002C" />
+        <register type="NOA" address="0x00009888" value="0x1600002D" />
+        <register type="NOA" address="0x00009888" value="0x1800002E" />
+        <register type="NOA" address="0x00009888" value="0x1A00002F" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009888" value="0x34000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x5D100155" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000F" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110155" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x53100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_3"
+       chipset="TGLGT1"
+       symbol_name="L3_3"
+       underscore_name="l3_3"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="71e2a606-810c-4252-bf7e-16fed118f4b5"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank0 Output Ready"
+             symbol_name="L30Bank0OutputReady"
+             underscore_name="l30_bank0_output_ready"
+             description="The percentage of time in which slice0 L3 bank0 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04000200" />
+        <register type="NOA" address="0x00009888" value="0x06000000" />
+        <register type="NOA" address="0x00009888" value="0x0A000020" />
+        <register type="NOA" address="0x00009888" value="0x0C000028" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100500" />
+        <register type="NOA" address="0x00009888" value="0x1B141800" />
+        <register type="NOA" address="0x00009888" value="0x5F110500" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_4"
+       chipset="TGLGT1"
+       symbol_name="L3_4"
+       underscore_name="l3_4"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="327a91a5-f93c-449d-b5e1-ab92cb1180a1"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank1 Output Ready"
+             symbol_name="L30Bank1OutputReady"
+             underscore_name="l30_bank1_output_ready"
+             description="The percentage of time in which slice0 L3 bank1 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04000A00" />
+        <register type="NOA" address="0x00009888" value="0x06000820" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x1B140400" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_5"
+       chipset="TGLGT1"
+       symbol_name="L3_5"
+       underscore_name="l3_5"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="a8de84ca-1624-4e0c-8046-d5265566c15b"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank2 Output Ready"
+             symbol_name="L30Bank2OutputReady"
+             underscore_name="l30_bank2_output_ready"
+             description="The percentage of time in which slice0 L3 bank2 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04001200" />
+        <register type="NOA" address="0x00009888" value="0x06001020" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x1B140400" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Gen12LP L3_6"
+       chipset="TGLGT1"
+       symbol_name="L3_6"
+       underscore_name="l3_6"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="6f376729-c56a-4560-a0eb-f4a17ec6df84"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 L3 Bank3 Output Ready"
+             symbol_name="L30Bank3OutputReady"
+             underscore_name="l30_bank3_output_ready"
+             description="The percentage of time in which slice0 L3 bank3 output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
+             availability="$SliceMask 1 AND"
+             mdapi_group="GTI/L3"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="slice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x04001A00" />
+        <register type="NOA" address="0x00009888" value="0x06001820" />
+        <register type="NOA" address="0x00009888" value="0x08000028" />
+        <register type="NOA" address="0x00009888" value="0x3A000000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x5B100050" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x1B140400" />
+        <register type="NOA" address="0x00009888" value="0x5F110050" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00000000" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="Sampler_1"
+       chipset="TGLGT1"
+       symbol_name="Sampler_1"
+       underscore_name="sampler_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="4876283b-1889-4cef-880f-58de9dc676cb"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Slice0 DualSubslice0 Input Available"
+             symbol_name="Sampler00InputAvailable"
+             underscore_name="sampler00_input_available"
+             description="The percentage of time in which slice0 dualsubslice0 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice1 Input Available"
+             symbol_name="Sampler01InputAvailable"
+             underscore_name="sampler01_input_available"
+             description="The percentage of time in which slice0 dualsubslice1 sampler input is available"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Slice0 DualSubslice0 Sampler Output Ready"
+             symbol_name="Sampler00OutputReady"
+             underscore_name="sampler00_output_ready"
+             description="The percentage of time in which slice0 dualsubslice0 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Slice0 DualSubslice1 Sampler Output Ready"
+             symbol_name="Sampler01OutputReady"
+             underscore_name="sampler01_output_ready"
+             description="The percentage of time in which slice0 dualsubslice1 sampler output is ready"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0C123E00" />
+        <register type="NOA" address="0x00009888" value="0x1C121600" />
+        <register type="NOA" address="0x00009888" value="0x04143E00" />
+        <register type="NOA" address="0x00009888" value="0x18141613" />
+        <register type="NOA" address="0x00009888" value="0x0C323E00" />
+        <register type="NOA" address="0x00009888" value="0x1C321600" />
+        <register type="NOA" address="0x00009888" value="0x04343E00" />
+        <register type="NOA" address="0x00009888" value="0x18341600" />
+        <register type="NOA" address="0x00009888" value="0x0E120086" />
+        <register type="NOA" address="0x00009888" value="0x1A120033" />
+        <register type="NOA" address="0x00009888" value="0x20120000" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x18124000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C13C200" />
+        <register type="NOA" address="0x00009888" value="0x001400A6" />
+        <register type="NOA" address="0x00009888" value="0x10140000" />
+        <register type="NOA" address="0x00009888" value="0x0C140000" />
+        <register type="NOA" address="0x00009888" value="0x18158000" />
+        <register type="NOA" address="0x00009888" value="0x1C150800" />
+        <register type="NOA" address="0x00009888" value="0x12320086" />
+        <register type="NOA" address="0x00009888" value="0x16320033" />
+        <register type="NOA" address="0x00009888" value="0x20320000" />
+        <register type="NOA" address="0x00009888" value="0x10324000" />
+        <register type="NOA" address="0x00009888" value="0x14324000" />
+        <register type="NOA" address="0x00009888" value="0x1C333C00" />
+        <register type="NOA" address="0x00009888" value="0x103400A6" />
+        <register type="NOA" address="0x00009888" value="0x14340013" />
+        <register type="NOA" address="0x00009888" value="0x08340000" />
+        <register type="NOA" address="0x00009888" value="0x0A340000" />
+        <register type="NOA" address="0x00009888" value="0x1C350088" />
+        <register type="NOA" address="0x00009888" value="0x100D8000" />
+        <register type="NOA" address="0x00009888" value="0x120D8000" />
+        <register type="NOA" address="0x00009888" value="0x140D8000" />
+        <register type="NOA" address="0x00009888" value="0x160D8000" />
+        <register type="NOA" address="0x00009888" value="0x100E8000" />
+        <register type="NOA" address="0x00009888" value="0x120E8000" />
+        <register type="NOA" address="0x00009888" value="0x140E8000" />
+        <register type="NOA" address="0x00009888" value="0x160E8000" />
+        <register type="NOA" address="0x00009888" value="0x100F4000" />
+        <register type="NOA" address="0x00009888" value="0x120F4000" />
+        <register type="NOA" address="0x00009888" value="0x140F4000" />
+        <register type="NOA" address="0x00009888" value="0x160F4000" />
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E00C000" />
+        <register type="NOA" address="0x00009888" value="0x10004000" />
+        <register type="NOA" address="0x00009888" value="0x12004000" />
+        <register type="NOA" address="0x00009888" value="0x34003D40" />
+        <register type="NOA" address="0x00009888" value="0x0801C000" />
+        <register type="NOA" address="0x00009888" value="0x0A01C000" />
+        <register type="NOA" address="0x00009888" value="0x10058000" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x22050300" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0A8000" />
+        <register type="NOA" address="0x00009888" value="0x100AC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105000" />
+        <register type="NOA" address="0x00009888" value="0x5D100155" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
+        <register type="NOA" address="0x00009888" value="0x1D14000F" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110155" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x19128000" />
+        <register type="NOA" address="0x00009888" value="0x1B128000" />
+        <register type="NOA" address="0x00009888" value="0x47100400" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100008" />
+        <register type="NOA" address="0x00009888" value="0x51100004" />
+        <register type="NOA" address="0x00009888" value="0x53100404" />
+        <register type="NOA" address="0x00009888" value="0x55100008" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x000F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000180" />
+        <register type="OA" address="0x0000D954" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC10" value="0x00000180" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D958" value="0x00000600" />
+        <register type="OA" address="0x0000D95C" value="0x0000FF3F" />
+        <register type="OA" address="0x0000DC18" value="0x00000600" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FF3F" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="TDL_1"
+       chipset="TGLGT1"
+       symbol_name="TDL_1"
+       underscore_name="tdl_1"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="aeddd71b-2f93-48de-9e69-1cba5865473f"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
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
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="NonPSThread00ReadyForDispatch"
+             underscore_name="non_ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Non-PS Thread Ready For Dispatch on Slice0 DualSubslice1 Thread Dispatcher"
+             symbol_name="NonPSThread01ReadyForDispatch"
+             underscore_name="non_ps_thread01_ready_for_dispatch"
+             description="The percentage of time in which non-PS thread is ready for dispatch on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice0 Thread Dispatcher"
+             symbol_name="PSThread00ReadyForDispatch"
+             underscore_name="ps_thread00_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="PS Thread Ready For Dispatch on Slice0 Dualsubslice1 Thread Dispatcher"
+             symbol_name="PSThread01ReadyForDispatch"
+             underscore_name="ps_thread01_ready_for_dispatch"
+             description="The percentage of time in which PS thread is ready for dispatch on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader00ReadyPort0"
+             underscore_name="thread_header00_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader00ReadyPort1"
+             underscore_name="thread_header00_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader00ReadyPort2"
+             underscore_name="thread_header00_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader00ReadyPort3"
+             underscore_name="thread_header00_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 0"
+             symbol_name="ThreadHeader01ReadyPort0"
+             underscore_name="thread_header01_ready_port0"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 0"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 1"
+             symbol_name="ThreadHeader01ReadyPort1"
+             underscore_name="thread_header01_ready_port1"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 1"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 2"
+             symbol_name="ThreadHeader01ReadyPort2"
+             underscore_name="thread_header01_ready_port2"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 2"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher Port 3"
+             symbol_name="ThreadHeader01ReadyPort3"
+             underscore_name="thread_header01_ready_port3"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher port 3"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice0 Thread Dispatcher"
+             symbol_name="ThreadHeader00Ready"
+             underscore_name="thread_header00_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice0 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <counter name="Thread Header Ready on Slice0 DualSubslice1 Thread Dispatcher"
+             symbol_name="ThreadHeader01Ready"
+             underscore_name="thread_header01_ready"
+             description="The percentage of time in which thread header is ready on slice0 dualsubslice1 thread dispatcher"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 2 AND"
+             mdapi_group="GPU/Thread Dispatcher"
+             mdapi_usage_flags="Tier3 Overview Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="dualsubslice"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x24110340" />
+        <register type="NOA" address="0x00009888" value="0x2611001C" />
+        <register type="NOA" address="0x00009888" value="0x24310340" />
+        <register type="NOA" address="0x00009888" value="0x2631001C" />
+        <register type="NOA" address="0x00009888" value="0x001100F3" />
+        <register type="NOA" address="0x00009888" value="0x0E1100F2" />
+        <register type="NOA" address="0x00009888" value="0x16110103" />
+        <register type="NOA" address="0x00009888" value="0x06110107" />
+        <register type="NOA" address="0x00009888" value="0x08110106" />
+        <register type="NOA" address="0x00009888" value="0x0A110105" />
+        <register type="NOA" address="0x00009888" value="0x0C110104" />
+        <register type="NOA" address="0x00009888" value="0x10110000" />
+        <register type="NOA" address="0x00009888" value="0x02110000" />
+        <register type="NOA" address="0x00009888" value="0x04110000" />
+        <register type="NOA" address="0x00009888" value="0x00128000" />
+        <register type="NOA" address="0x00009888" value="0x0E128000" />
+        <register type="NOA" address="0x00009888" value="0x16128000" />
+        <register type="NOA" address="0x00009888" value="0x06128000" />
+        <register type="NOA" address="0x00009888" value="0x08128000" />
+        <register type="NOA" address="0x00009888" value="0x0A128000" />
+        <register type="NOA" address="0x00009888" value="0x0C128000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C132300" />
+        <register type="NOA" address="0x00009888" value="0x16138000" />
+        <register type="NOA" address="0x00009888" value="0x18138000" />
+        <register type="NOA" address="0x00009888" value="0x1A138000" />
+        <register type="NOA" address="0x00009888" value="0x103100F3" />
+        <register type="NOA" address="0x00009888" value="0x123100F2" />
+        <register type="NOA" address="0x00009888" value="0x14310103" />
+        <register type="NOA" address="0x00009888" value="0x1C310107" />
+        <register type="NOA" address="0x00009888" value="0x1E310106" />
+        <register type="NOA" address="0x00009888" value="0x02310105" />
+        <register type="NOA" address="0x00009888" value="0x04310104" />
+        <register type="NOA" address="0x00009888" value="0x08310000" />
+        <register type="NOA" address="0x00009888" value="0x0A310000" />
+        <register type="NOA" address="0x00009888" value="0x0E310000" />
+        <register type="NOA" address="0x00009888" value="0x00310000" />
+        <register type="NOA" address="0x00009888" value="0x10328000" />
+        <register type="NOA" address="0x00009888" value="0x12328000" />
+        <register type="NOA" address="0x00009888" value="0x14328000" />
+        <register type="NOA" address="0x00009888" value="0x1C328000" />
+        <register type="NOA" address="0x00009888" value="0x1E328000" />
+        <register type="NOA" address="0x00009888" value="0x02328000" />
+        <register type="NOA" address="0x00009888" value="0x04328000" />
+        <register type="NOA" address="0x00009888" value="0x1C331C00" />
+        <register type="NOA" address="0x00009888" value="0x1E330003" />
+        <register type="NOA" address="0x00009888" value="0x12338000" />
+        <register type="NOA" address="0x00009888" value="0x14338000" />
+        <register type="NOA" address="0x00009888" value="0x100D8000" />
+        <register type="NOA" address="0x00009888" value="0x120D8000" />
+        <register type="NOA" address="0x00009888" value="0x140D8000" />
+        <register type="NOA" address="0x00009888" value="0x1C0D8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0D8000" />
+        <register type="NOA" address="0x00009888" value="0x020D8000" />
+        <register type="NOA" address="0x00009888" value="0x040D8000" />
+        <register type="NOA" address="0x00009888" value="0x100E8000" />
+        <register type="NOA" address="0x00009888" value="0x120E8000" />
+        <register type="NOA" address="0x00009888" value="0x140E8000" />
+        <register type="NOA" address="0x00009888" value="0x1C0E8000" />
+        <register type="NOA" address="0x00009888" value="0x1E0E8000" />
+        <register type="NOA" address="0x00009888" value="0x020E8000" />
+        <register type="NOA" address="0x00009888" value="0x040E8000" />
+        <register type="NOA" address="0x00009888" value="0x100F4000" />
+        <register type="NOA" address="0x00009888" value="0x120F4000" />
+        <register type="NOA" address="0x00009888" value="0x140F4000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x020F4000" />
+        <register type="NOA" address="0x00009888" value="0x040F4000" />
+        <register type="NOA" address="0x00009888" value="0x0000C000" />
+        <register type="NOA" address="0x00009888" value="0x0E00C000" />
+        <register type="NOA" address="0x00009888" value="0x10004000" />
+        <register type="NOA" address="0x00009888" value="0x12004000" />
+        <register type="NOA" address="0x00009888" value="0x34004340" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x02004000" />
+        <register type="NOA" address="0x00009888" value="0x04004000" />
+        <register type="NOA" address="0x00009888" value="0x0600C000" />
+        <register type="NOA" address="0x00009888" value="0x0800C000" />
+        <register type="NOA" address="0x00009888" value="0x0A00C000" />
+        <register type="NOA" address="0x00009888" value="0x0C00C000" />
+        <register type="NOA" address="0x00009888" value="0x0801C000" />
+        <register type="NOA" address="0x00009888" value="0x0A014000" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009888" value="0x00018000" />
+        <register type="NOA" address="0x00009888" value="0x02014000" />
+        <register type="NOA" address="0x00009888" value="0x10058000" />
+        <register type="NOA" address="0x00009888" value="0x1C05C000" />
+        <register type="NOA" address="0x00009888" value="0x22050080" />
+        <register type="NOA" address="0x00009888" value="0x16058000" />
+        <register type="NOA" address="0x00009888" value="0x18058000" />
+        <register type="NOA" address="0x00009888" value="0x1A058000" />
+        <register type="NOA" address="0x00009888" value="0x040A4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0AC000" />
+        <register type="NOA" address="0x00009888" value="0x0E0A8000" />
+        <register type="NOA" address="0x00009888" value="0x060A8000" />
+        <register type="NOA" address="0x00009888" value="0x080AC000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B105555" />
+        <register type="NOA" address="0x00009888" value="0x5D101415" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14FC00" />
+        <register type="NOA" address="0x00009888" value="0x1D140033" />
+        <register type="NOA" address="0x00009888" value="0x13148000" />
+        <register type="NOA" address="0x00009888" value="0x15148000" />
+        <register type="NOA" address="0x00009888" value="0x17148000" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115555" />
+        <register type="NOA" address="0x00009888" value="0x61111415" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
+        <register type="NOA" address="0x00009888" value="0x15128000" />
+        <register type="NOA" address="0x00009888" value="0x17128000" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x03128000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x07128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x47100400" />
+        <register type="NOA" address="0x00009888" value="0x4D100404" />
+        <register type="NOA" address="0x00009888" value="0x4F100004" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
+        <register type="NOA" address="0x00009888" value="0x53100004" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x49100000" />
+        <register type="NOA" address="0x00009888" value="0x4B100404" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x30800000" />
+        <register type="OA" address="0x0000DC40" value="0x003F0000" />
+        <register type="OA" address="0x0000D940" value="0x00000000" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000000" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000000" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000000" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000D950" value="0x00000002" />
+        <register type="OA" address="0x0000D954" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC10" value="0x00000002" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D958" value="0x00000002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000DC18" value="0x00000002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFDF" />
+        <register type="OA" address="0x0000D960" value="0x00078000" />
+        <register type="OA" address="0x0000D964" value="0x00000FFF" />
+        <register type="OA" address="0x0000DC20" value="0x00078000" />
+        <register type="OA" address="0x0000DC24" value="0x00000FFF" />
+        <register type="OA" address="0x0000D968" value="0x00007800" />
+        <register type="OA" address="0x0000D96C" value="0x0000F0FF" />
+        <register type="OA" address="0x0000DC28" value="0x00007800" />
+        <register type="OA" address="0x0000DC2C" value="0x0000F0FF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="GpuBusyness"
+       chipset="TGLGT1"
+       symbol_name="GpuBusyness"
+       underscore_name="gpu_busyness"
+       mdapi_supported_apis="VK OGL OCL MEDIA IO"
+       hw_config_guid="a4089c3f-a697-4213-a58b-70e150969226"
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
+    <counter name="EU Active"
+             symbol_name="EuActive"
+             underscore_name="eu_active"
+             description="The percentage of time in which the Execution Units were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
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
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             equation="8 A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL IO"
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
+             mdapi_supported_apis="VK OGL OCL IO MEDIA"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Posh Ring Busy"
+             symbol_name="PoshEngineBusy"
+             underscore_name="posh_engine_busy"
+             description="The percentage of time when posh command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 5 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Blitter Ring Busy"
+             symbol_name="BlitterBusy"
+             underscore_name="blitter_busy"
+             description="The percentage of time when blitter command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 4 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vebox Ring Busy"
+             symbol_name="VeboxBusy"
+             underscore_name="vebox_busy"
+             description="The percentage of time when vebox command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 7 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox0 Ring Busy"
+             symbol_name="Vdbox0Busy"
+             underscore_name="vdbox0_busy"
+             description="The percentage of time when Vdbox0 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Vdbox1 Ring Busy"
+             symbol_name="Vdbox1Busy"
+             underscore_name="vdbox1_busy"
+             description="The percentage of time when Vdbox1 command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Any Engine Busy"
+             symbol_name="AnyEngineBusy"
+             underscore_name="any_engine_busy"
+             description="The percentage of time when any command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis="IO"
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x220F0009" />
+        <register type="NOA" address="0x00009888" value="0x040E0043" />
+        <register type="NOA" address="0x00009888" value="0x0A0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x080F00A3" />
+        <register type="NOA" address="0x00009888" value="0x200F0000" />
+        <register type="NOA" address="0x00009888" value="0x040F4000" />
+        <register type="NOA" address="0x00009888" value="0x0A0F4000" />
+        <register type="NOA" address="0x00009888" value="0x04004000" />
+        <register type="NOA" address="0x00009888" value="0x08004000" />
+        <register type="NOA" address="0x00009888" value="0x0A004000" />
+        <register type="NOA" address="0x00009888" value="0x02014000" />
+        <register type="NOA" address="0x00009888" value="0x0401C000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x15102400" />
+        <register type="NOA" address="0x00009888" value="0x230B0120" />
+        <register type="NOA" address="0x00009888" value="0x15182400" />
+        <register type="NOA" address="0x00009888" value="0x232B0120" />
+        <register type="NOA" address="0x00009888" value="0x17100023" />
+        <register type="NOA" address="0x00009888" value="0x11100000" />
+        <register type="NOA" address="0x00009888" value="0x5D101000" />
+        <register type="NOA" address="0x00009888" value="0x5B100545" />
+        <register type="NOA" address="0x00009888" value="0x15148000" />
+        <register type="NOA" address="0x00009888" value="0x1B140C00" />
+        <register type="NOA" address="0x00009888" value="0x61112000" />
+        <register type="NOA" address="0x00009888" value="0x5F110945" />
+        <register type="NOA" address="0x00009888" value="0x03124000" />
+        <register type="NOA" address="0x00009888" value="0x05128000" />
+        <register type="NOA" address="0x00009888" value="0x09128000" />
+        <register type="NOA" address="0x00009888" value="0x0B128000" />
+        <register type="NOA" address="0x00009888" value="0x13138000" />
+        <register type="NOA" address="0x00009888" value="0x1B0D0040" />
+        <register type="NOA" address="0x00009888" value="0x1F0B00D3" />
+        <register type="NOA" address="0x00009888" value="0x190B0000" />
+        <register type="NOA" address="0x00009888" value="0x170B0000" />
+        <register type="NOA" address="0x00009888" value="0x1B170002" />
+        <register type="NOA" address="0x00009888" value="0x0D174000" />
+        <register type="NOA" address="0x00009888" value="0x071800A3" />
+        <register type="NOA" address="0x00009888" value="0x11180000" />
+        <register type="NOA" address="0x00009888" value="0x032D4000" />
+        <register type="NOA" address="0x00009888" value="0x032B00D3" />
+        <register type="NOA" address="0x00009888" value="0x192B0000" />
+        <register type="NOA" address="0x00009888" value="0x092B0000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100009" />
+        <register type="NOA" address="0x00009888" value="0x47100000" />
+        <register type="NOA" address="0x00009888" value="0x49101005" />
+        <register type="NOA" address="0x00009888" value="0x4B100207" />
+        <register type="NOA" address="0x00009888" value="0x4D100010" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00024002" />
+        <register type="OA" address="0x0000D944" value="0x0000B7FF" />
+        <register type="OA" address="0x0000DC00" value="0x00024002" />
+        <register type="OA" address="0x0000DC04" value="0x0000B7FF" />
+        <register type="OA" address="0x0000D948" value="0x0007F000" />
+        <register type="OA" address="0x0000D94C" value="0x000001FF" />
+        <register type="OA" address="0x0000DC08" value="0x0007F000" />
+        <register type="OA" address="0x0000DC0C" value="0x000001FF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00804704" />
+        <register type="FLEX" address="0x0000E558" value="0x00A04904" />
+        <register type="FLEX" address="0x0000E658" value="0x00805705" />
+        <register type="FLEX" address="0x0000E758" value="0x00A05905" />
+        <register type="FLEX" address="0x0000E45C" value="0x00808708" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A08908" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity1"
+       chipset="TGLGT1"
+       symbol_name="EuActivity1"
+       underscore_name="eu_activity1"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="ffde7a80-6d78-42c8-8603-838de28d07da"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS FPU Pipe Active"
+             symbol_name="VsFpuActive"
+             underscore_name="vs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS FPU Pipe Active"
+             symbol_name="PsFpuActive"
+             underscore_name="ps_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU Send Pipe Active"
+             symbol_name="EuSendActive"
+             underscore_name="eu_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00810710" />
+        <register type="FLEX" address="0x0000E558" value="0x00A10910" />
+        <register type="FLEX" address="0x0000E658" value="0x00850750" />
+        <register type="FLEX" address="0x0000E758" value="0x00A50950" />
+        <register type="FLEX" address="0x0000E45C" value="0x00802702" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A02902" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity2"
+       chipset="TGLGT1"
+       symbol_name="EuActivity2"
+       underscore_name="eu_activity2"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="bd3186a3-6e96-4c70-a5d9-65d4bea6f668"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS EM Pipe Active"
+             symbol_name="CsEmActive"
+             underscore_name="cs_em_active"
+             description="The percentage of time in which EU FPU1 pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS FPU Pipe Active"
+             symbol_name="CsFpuActive"
+             underscore_name="cs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="CS Send Pipeline Active"
+             symbol_name="CsSendActive"
+             underscore_name="cs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a compute shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00862762" />
+        <register type="FLEX" address="0x0000E558" value="0x00A62962" />
+        <register type="FLEX" address="0x0000E658" value="0x00860760" />
+        <register type="FLEX" address="0x0000E758" value="0x00A60960" />
+        <register type="FLEX" address="0x0000E45C" value="0x00861761" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A61961" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity3"
+       chipset="TGLGT1"
+       symbol_name="EuActivity3"
+       underscore_name="eu_activity3"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="b59e975f-044c-4e0c-afcd-46aee1107b81"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS EM Pipe Active"
+             symbol_name="VsEmActive"
+             underscore_name="vs_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS EM Pipe Active"
+             symbol_name="PsEmActive"
+             underscore_name="ps_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="PS Send Pipeline Active"
+             symbol_name="PsSendActive"
+             underscore_name="ps_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a pixel shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pixel Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00811711" />
+        <register type="FLEX" address="0x0000E558" value="0x00A11911" />
+        <register type="FLEX" address="0x0000E658" value="0x00851751" />
+        <register type="FLEX" address="0x0000E758" value="0x00A51951" />
+        <register type="FLEX" address="0x0000E45C" value="0x00852752" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A52952" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity4"
+       chipset="TGLGT1"
+       symbol_name="EuActivity4"
+       underscore_name="eu_activity4"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="948f1627-f642-42a6-8304-801d7db112d2"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS FPU Pipe Active"
+             symbol_name="HsFpuActive"
+             underscore_name="hs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a hull shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS FPU Pipe Active"
+             symbol_name="DsFpuActive"
+             underscore_name="ds_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a domain shader instructions."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="VS Send Pipe Active"
+             symbol_name="VsSendActive"
+             underscore_name="vs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a vertex shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Vertex Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00820720" />
+        <register type="FLEX" address="0x0000E558" value="0x00A20920" />
+        <register type="FLEX" address="0x0000E658" value="0x00830730" />
+        <register type="FLEX" address="0x0000E758" value="0x00A30930" />
+        <register type="FLEX" address="0x0000E45C" value="0x00812712" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A12912" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity5"
+       chipset="TGLGT1"
+       symbol_name="EuActivity5"
+       underscore_name="eu_activity5"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="243ffad2-626e-4d05-94a0-af7068e18a84"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS EM Pipe Active"
+             symbol_name="HsEmActive"
+             underscore_name="hs_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a hull shader instructions."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS EM Pipe Active"
+             symbol_name="DsEmActive"
+             underscore_name="ds_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a domain shader instructions."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="HS Send Pipe Active"
+             symbol_name="HsSendActive"
+             underscore_name="hs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a hull shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Hull Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00821721" />
+        <register type="FLEX" address="0x0000E558" value="0x00A21921" />
+        <register type="FLEX" address="0x0000E658" value="0x00831731" />
+        <register type="FLEX" address="0x0000E758" value="0x00A31931" />
+        <register type="FLEX" address="0x0000E45C" value="0x00822722" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A22922" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity6"
+       chipset="TGLGT1"
+       symbol_name="EuActivity6"
+       underscore_name="eu_activity6"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="1f367b67-1f45-469b-97fd-eac88aeb1f7c"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS FPU Pipe Active"
+             symbol_name="GsFpuActive"
+             underscore_name="gs_fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing a geometry shader instructions."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS EM Pipe Active"
+             symbol_name="GsEmActive"
+             underscore_name="gs_em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing a geometry shader instructions."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GS Send Pipe Active"
+             symbol_name="GsSendActive"
+             underscore_name="gs_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a geometry shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Geometry Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00840740" />
+        <register type="FLEX" address="0x0000E558" value="0x00A40940" />
+        <register type="FLEX" address="0x0000E658" value="0x00841741" />
+        <register type="FLEX" address="0x0000E758" value="0x00A41941" />
+        <register type="FLEX" address="0x0000E45C" value="0x00842742" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A42942" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity7"
+       chipset="TGLGT1"
+       symbol_name="EuActivity7"
+       underscore_name="eu_activity7"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="7c2db23c-1fb4-45df-a5d5-2345d23c10fc"
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
+    <counter name="EU FPU Pipe Active"
+             symbol_name="FpuActive"
+             underscore_name="fpu_active"
+             description="The percentage of time in which EU FPU pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EM Pipe Active"
+             symbol_name="EmActive"
+             underscore_name="em_active"
+             description="The percentage of time in which EU EM pipeline was actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU FPU And EM Pipes Active"
+             symbol_name="EuFpuEmActive"
+             underscore_name="eu_fpu_em_active"
+             description="The percentage of time in which EU FPU and EM pipelines were actively processing."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Pipes"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="EU AVG IPC Rate"
+             symbol_name="EuAvgIpcRate"
+             underscore_name="eu_avg_ipc_rate"
+             description="The average rate of IPC calculated for 2 FPU pipelines."
+             data_type="float"
+             max_equation="2"
+             units="number"
+             semantic_type="ratio"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD  A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD  A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FADD  A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD FSUB FDIV 1 FADD"
+             mdapi_group="EU Array"
+             mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00803703" />
+        <register type="FLEX" address="0x0000E558" value="0x00A03903" />
+        <register type="FLEX" address="0x0000E658" value="0x00800700" />
+        <register type="FLEX" address="0x0000E758" value="0x00A00900" />
+        <register type="FLEX" address="0x0000E45C" value="0x00801701" />
+        <register type="FLEX" address="0x0000E55C" value="0x00A01901" />
+    </register_config>
+  </set>
+
+  <set name="EuActivity8"
+       chipset="TGLGT1"
+       symbol_name="EuActivity8"
+       underscore_name="eu_activity8"
+       mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
+       hw_config_guid="b4c81162-2c96-4cf1-86ae-ecff3d57ee4d"
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
+    <counter name="Render Ring Busy"
+             symbol_name="RenderBusy"
+             underscore_name="render_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Compute Ring Busy"
+             symbol_name="ComputeBusy"
+             underscore_name="compute_busy"
+             description="The percentage of time when render command streamer was busy."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="System Frame Batch"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="Render and compute engines are simultaneously busy"
+             symbol_name="RenderAndComputeBusy"
+             underscore_name="render_and_compute_busy"
+             description="The percentage of time when render and compute engines are simultaneously busy"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Read Throughput"
+             symbol_name="GtiReadThroughput"
+             underscore_name="gti_read_throughput"
+             description="The total number of GPU memory bytes read from GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 7 READ C 6 READ UADD C 5 READ UADD C 4 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="GTI Write Throughput"
+             symbol_name="GtiWriteThroughput"
+             underscore_name="gti_write_throughput"
+             description="The total number of GPU memory bytes written to GTI."
+             data_type="uint64"
+             max_equation="$GpuCoreClocks 64 UMUL"
+             units="bytes"
+             semantic_type="throughput"
+             equation="64  C 3 READ C 2 READ UADD UMUL"
+             mdapi_group="GTI"
+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="DS Send Pipe Active"
+             symbol_name="DsSendActive"
+             underscore_name="ds_send_active"
+             description="The percentage of time in which EU send pipeline was actively processing a domain shader instruction."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
+             mdapi_group="EU Array/Domain Shader"
+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x0E0E2400" />
+        <register type="NOA" address="0x00009888" value="0x220E0009" />
+        <register type="NOA" address="0x00009888" value="0x1C0E0043" />
+        <register type="NOA" address="0x00009888" value="0x1E0E00B3" />
+        <register type="NOA" address="0x00009888" value="0x200E0000" />
+        <register type="NOA" address="0x00009888" value="0x1C0F4000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F4000" />
+        <register type="NOA" address="0x00009888" value="0x34004000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x18018000" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x05151D37" />
+        <register type="NOA" address="0x00009888" value="0x09151547" />
+        <register type="NOA" address="0x00009888" value="0x05351C00" />
+        <register type="NOA" address="0x00009888" value="0x09351400" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x5B100BBB" />
+        <register type="NOA" address="0x00009888" value="0x1D140030" />
+        <register type="NOA" address="0x00009888" value="0x61111400" />
+        <register type="NOA" address="0x00009888" value="0x1D128000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x0D150136" />
+        <register type="NOA" address="0x00009888" value="0x01150000" />
+        <register type="NOA" address="0x00009888" value="0x03164000" />
+        <register type="NOA" address="0x00009888" value="0x05164000" />
+        <register type="NOA" address="0x00009888" value="0x07164000" />
+        <register type="NOA" address="0x00009888" value="0x03350137" />
+        <register type="NOA" address="0x00009888" value="0x07350147" />
+        <register type="NOA" address="0x00009888" value="0x0B350136" />
+        <register type="NOA" address="0x00009888" value="0x01350000" />
+        <register type="NOA" address="0x00009888" value="0x01368000" />
+        <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x05368000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100000" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x47101000" />
+        <register type="NOA" address="0x00009888" value="0x49101313" />
+        <register type="NOA" address="0x00009888" value="0x4B101313" />
+        <register type="NOA" address="0x00009888" value="0x4D100313" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0x10800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0x00800000" />
+        <register type="OA" address="0x0000DC40" value="0x00010000" />
+        <register type="OA" address="0x0000D940" value="0x00001802" />
+        <register type="OA" address="0x0000D944" value="0x0000FCFF" />
+        <register type="OA" address="0x0000DC00" value="0x00001802" />
+        <register type="OA" address="0x0000DC04" value="0x0000FCFF" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E458" value="0x00832732" />
+        <register type="FLEX" address="0x0000E558" value="0x00A32932" />
+    </register_config>
+  </set>
+
+  <set name="Metric set TestOa"
+       chipset="TGLGT1"
+       symbol_name="TestOa"
+       underscore_name="test_oa"
+       mdapi_supported_apis="VK OGL OCL IO"
+       hw_config_guid="6f27aaed-4f08-4e0f-95a9-231d9b4fa111"
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
+    <counter name="TestCounter0"
+             symbol_name="Counter0"
+             underscore_name="counter0"
+             description="HW test counter 0. Factor: 0.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter1"
+             symbol_name="Counter1"
+             underscore_name="counter1"
+             description="HW test counter 1. Factor: 1.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter2"
+             symbol_name="Counter2"
+             underscore_name="counter2"
+             description="HW test counter 2. Factor: 1.0"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 2 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter3"
+             symbol_name="Counter3"
+             underscore_name="counter3"
+             description="HW test counter 3. Factor: 0.5"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 3 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter4"
+             symbol_name="Counter4"
+             underscore_name="counter4"
+             description="HW test counter 4. Factor: 0.3333"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 4 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter5"
+             symbol_name="Counter5"
+             underscore_name="counter5"
+             description="HW test counter 5. Factor: 0.3333"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 5 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter6"
+             symbol_name="Counter6"
+             underscore_name="counter6"
+             description="HW test counter 6. Factor: 0.16666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 6 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter7"
+             symbol_name="Counter7"
+             underscore_name="counter7"
+             description="HW test counter 7. Factor: 0.6666"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="B 7 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter8"
+             symbol_name="Counter8"
+             underscore_name="counter8"
+             description="HW test counter 8. Should be equal to 1 in IOStream or in OAG query mode"
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 0 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <counter name="TestCounter9 - OAR enable"
+             symbol_name="Counter9"
+             underscore_name="counter9"
+             description="HW test counter 9. Should be equal to 1 in query."
+             data_type="uint64"
+             units="events"
+             semantic_type="event"
+             equation="C 1 READ"
+             mdapi_group="GPU"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="gpu"
+             />
+    <register_config type="NOA">
+        <register type="NOA" address="0x00000D04" value="0x00000200" />
+        <register type="NOA" address="0x00009840" value="0x00000000" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x040F0000" />
+        <register type="NOA" address="0x00009888" value="0x1E0F0017" />
+        <register type="NOA" address="0x00009888" value="0x200F0000" />
+        <register type="NOA" address="0x00009888" value="0x36000001" />
+        <register type="NOA" address="0x00009888" value="0x1A012000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x49110000" />
+        <register type="NOA" address="0x00009888" value="0x5D101400" />
+        <register type="NOA" address="0x00009888" value="0x1D140020" />
+        <register type="NOA" address="0x00009888" value="0x1D1103A3" />
+        <register type="NOA" address="0x00009888" value="0x01110000" />
+        <register type="NOA" address="0x00009888" value="0x61111000" />
+        <register type="NOA" address="0x00009888" value="0x1F128000" />
+        <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x55100210" />
+        <register type="NOA" address="0x00009888" value="0x57100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
+        <register type="NOA" address="0x00009884" value="0x00000003" />
+        <register type="NOA" address="0x00009888" value="0x65100002" />
+        <register type="NOA" address="0x00009884" value="0x00000000" />
+        <register type="NOA" address="0x00009888" value="0x42000001" />
+    </register_config>
+    <register_config type="OA">
+        <register type="OA" address="0x0000D920" value="0x00000000" />
+        <register type="OA" address="0x0000D900" value="0x00000000" />
+        <register type="OA" address="0x0000D904" value="0xF0800000" />
+        <register type="OA" address="0x0000D910" value="0x00000000" />
+        <register type="OA" address="0x0000D914" value="0xF0800000" />
+        <register type="OA" address="0x0000DC40" value="0x00FF0000" />
+        <register type="OA" address="0x0000D940" value="0x00000004" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC00" value="0x00000004" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D948" value="0x00000003" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC08" value="0x00000003" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D950" value="0x00000007" />
+        <register type="OA" address="0x0000D954" value="0x0000FFFF" />
+        <register type="OA" address="0x0000DC10" value="0x00000007" />
+        <register type="OA" address="0x0000DC14" value="0x0000FFFF" />
+        <register type="OA" address="0x0000D958" value="0x00100002" />
+        <register type="OA" address="0x0000D95C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000DC18" value="0x00100002" />
+        <register type="OA" address="0x0000DC1C" value="0x0000FFF7" />
+        <register type="OA" address="0x0000D960" value="0x00100002" />
+        <register type="OA" address="0x0000D964" value="0x0000FFCF" />
+        <register type="OA" address="0x0000DC20" value="0x00100002" />
+        <register type="OA" address="0x0000DC24" value="0x0000FFCF" />
+        <register type="OA" address="0x0000D968" value="0x00100082" />
+        <register type="OA" address="0x0000D96C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000DC28" value="0x00100082" />
+        <register type="OA" address="0x0000DC2C" value="0x0000FFEF" />
+        <register type="OA" address="0x0000D970" value="0x001000C2" />
+        <register type="OA" address="0x0000D974" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC30" value="0x001000C2" />
+        <register type="OA" address="0x0000DC34" value="0x0000FFE7" />
+        <register type="OA" address="0x0000D978" value="0x00100001" />
+        <register type="OA" address="0x0000D97C" value="0x0000FFE7" />
+        <register type="OA" address="0x0000DC38" value="0x00100001" />
+        <register type="OA" address="0x0000DC3C" value="0x0000FFE7" />
+    </register_config>
+    <register_config type="FLEX">
+        <register type="FLEX" address="0x0000E65C" value="0xFFFFFFFF" />
+    </register_config>
+  </set>
+
+</metrics>
diff --git a/lib/i915/perf-configs/oa-tgl.xml b/lib/i915/perf-configs/oa-tglgt2.xml
similarity index 98%
rename from lib/i915/perf-configs/oa-tgl.xml
rename to lib/i915/perf-configs/oa-tglgt2.xml
index 1c6ee712..2108e810 100644
--- a/lib/i915/perf-configs/oa-tgl.xml
+++ b/lib/i915/perf-configs/oa-tglgt2.xml
@@ -1,11 +1,11 @@
 <?xml version="1.0"?>
-<metrics version="1585732834" merge_md5="">
+<metrics version="1598354174" merge_md5="">
   <set name="Render Metrics Basic Gen12"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="RenderBasic"
        underscore_name="render_basic"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="daf004fb-fc9f-45e0-b842-1770e6d273c2"
+       hw_config_guid="0fc397c0-4833-492c-9ccd-4929d574d5b8"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -181,6 +181,36 @@
              mdapi_supported_apis=""
              mdapi_hw_unit_type="gpu"
              />
+    <counter name="Sampler00 Busy"
+             symbol_name="Sampler00Busy"
+             underscore_name="sampler00_busy"
+             description="The percentage of time in which Slice0 Sampler0 has been processing EU requests."
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 0 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="Sampler"
+             mdapi_usage_flags="Tier3 Batch Frame Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
+    <counter name="Sampler Slice0 Dualsubslice0 is bottleneck"
+             symbol_name="Sampler00Bottleneck"
+             underscore_name="sampler00_bottleneck"
+             description="The percentage of time when sampler slice0 dualsubslice0 is bottleneck"
+             data_type="float"
+             max_equation="100"
+             units="percent"
+             semantic_type="duration"
+             equation="B 1 READ 100 UMUL $GpuCoreClocks FDIV"
+             availability="$DualSubsliceMask 1 AND"
+             mdapi_group="GPU/Sampler"
+             mdapi_usage_flags="Frame Batch Draw"
+             mdapi_supported_apis=""
+             mdapi_hw_unit_type="subslice"
+             />
     <counter name="Samplers Busy"
              symbol_name="SamplersBusy"
              underscore_name="samplers_busy"
@@ -189,7 +219,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 7 READ GPU_CLOCK 0 READ FDIV"
+             equation="$Sampler00Busy"
              availability="$DualSubsliceMask 1 AND"
              mdapi_group="Sampler"
              mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
@@ -206,7 +236,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 6 READ GPU_CLOCK 0 READ FDIV"
+             equation="$Sampler00Bottleneck"
              availability="$DualSubsliceMask 1 AND"
              mdapi_group="Sampler"
              mdapi_usage_flags="Tier3 Overview Indicate System Frame Batch Draw"
@@ -335,7 +365,7 @@
              underscore_name="slm_bytes_read"
              description="The total number of GPU memory bytes read from shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 30 READ 64 UMUL"
@@ -349,7 +379,7 @@
              underscore_name="slm_bytes_written"
              description="The total number of GPU memory bytes written into shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 31 READ 64 UMUL"
@@ -392,7 +422,7 @@
              max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="A 30 READ A 31 READ UADD A 32 READ UADD 64 UMUL"
+             equation="$ShaderMemoryAccesses 64 UMUL"
              mdapi_group="L3/Data Port"
              mdapi_usage_flags="Tier2 Frame Batch Draw"
              mdapi_supported_apis="VK OGL OCL IO"
@@ -444,28 +474,40 @@
         <register type="NOA" address="0x00009840" value="0x00000000" />
         <register type="NOA" address="0x00009884" value="0x00000000" />
         <register type="NOA" address="0x00009888" value="0x14150001" />
-        <register type="NOA" address="0x00009888" value="0x0A124000" />
-        <register type="NOA" address="0x00009888" value="0x0C124000" />
-        <register type="NOA" address="0x00009888" value="0x1A138000" />
-        <register type="NOA" address="0x00009888" value="0x1C130100" />
-        <register type="NOA" address="0x00009888" value="0x04155100" />
-        <register type="NOA" address="0x00009888" value="0x06150050" />
+        <register type="NOA" address="0x00009888" value="0x16150020" />
+        <register type="NOA" address="0x00009888" value="0x00124000" />
+        <register type="NOA" address="0x00009888" value="0x0E124000" />
+        <register type="NOA" address="0x00009888" value="0x10124000" />
+        <register type="NOA" address="0x00009888" value="0x12124000" />
+        <register type="NOA" address="0x00009888" value="0x10138000" />
+        <register type="NOA" address="0x00009888" value="0x1C130E00" />
+        <register type="NOA" address="0x00009888" value="0x00150050" />
+        <register type="NOA" address="0x00009888" value="0x06157000" />
+        <register type="NOA" address="0x00009888" value="0x08157151" />
         <register type="NOA" address="0x00009888" value="0x10150000" />
-        <register type="NOA" address="0x00009888" value="0x1A150000" />
-        <register type="NOA" address="0x00009888" value="0x34001000" />
-        <register type="NOA" address="0x00009888" value="0x36000002" />
-        <register type="NOA" address="0x00009888" value="0x2205A000" />
+        <register type="NOA" address="0x00009888" value="0x18150000" />
+        <register type="NOA" address="0x00009888" value="0x1C150000" />
+        <register type="NOA" address="0x00009888" value="0x18004000" />
+        <register type="NOA" address="0x00009888" value="0x36000490" />
+        <register type="NOA" address="0x00009888" value="0x1C058000" />
+        <register type="NOA" address="0x00009888" value="0x2405002A" />
         <register type="NOA" address="0x00009884" value="0x00000003" />
         <register type="NOA" address="0x00009888" value="0x05151D47" />
         <register type="NOA" address="0x00009888" value="0x09151536" />
         <register type="NOA" address="0x00009888" value="0x05351C00" />
         <register type="NOA" address="0x00009888" value="0x09351400" />
-        <register type="NOA" address="0x00009888" value="0x5D102C00" />
-        <register type="NOA" address="0x00009888" value="0x5B1005BB" />
-        <register type="NOA" address="0x00009888" value="0x1B141800" />
-        <register type="NOA" address="0x00009888" value="0x5F110500" />
-        <register type="NOA" address="0x00009888" value="0x0B128000" />
-        <register type="NOA" address="0x00009888" value="0x0D128000" />
+        <register type="NOA" address="0x00009888" value="0x41104000" />
+        <register type="NOA" address="0x00009888" value="0x5B1050BB" />
+        <register type="NOA" address="0x00009888" value="0x5D102C01" />
+        <register type="NOA" address="0x00009888" value="0x11148000" />
+        <register type="NOA" address="0x00009888" value="0x1B14E000" />
+        <register type="NOA" address="0x00009888" value="0x4B112000" />
+        <register type="NOA" address="0x00009888" value="0x5F115000" />
+        <register type="NOA" address="0x00009888" value="0x61110001" />
+        <register type="NOA" address="0x00009888" value="0x01128000" />
+        <register type="NOA" address="0x00009888" value="0x0F128000" />
+        <register type="NOA" address="0x00009888" value="0x11128000" />
+        <register type="NOA" address="0x00009888" value="0x13128000" />
         <register type="NOA" address="0x00009888" value="0x1F150137" />
         <register type="NOA" address="0x00009888" value="0x01150000" />
         <register type="NOA" address="0x00009888" value="0x0F168000" />
@@ -478,14 +520,16 @@
         <register type="NOA" address="0x00009888" value="0x0F364000" />
         <register type="NOA" address="0x00009888" value="0x01368000" />
         <register type="NOA" address="0x00009888" value="0x03368000" />
+        <register type="NOA" address="0x00009888" value="0x47103000" />
+        <register type="NOA" address="0x00009888" value="0x4D100000" />
+        <register type="NOA" address="0x00009888" value="0x4F100000" />
+        <register type="NOA" address="0x00009888" value="0x51100000" />
         <register type="NOA" address="0x00009888" value="0x17100000" />
+        <register type="NOA" address="0x00009888" value="0x31100000" />
         <register type="NOA" address="0x00009888" value="0x55103130" />
         <register type="NOA" address="0x00009888" value="0x57100001" />
-        <register type="NOA" address="0x00009888" value="0x47103000" />
         <register type="NOA" address="0x00009888" value="0x49103131" />
         <register type="NOA" address="0x00009888" value="0x4B100131" />
-        <register type="NOA" address="0x00009888" value="0x4D100000" />
-        <register type="NOA" address="0x00009888" value="0x31100000" />
         <register type="NOA" address="0x00009884" value="0x00000003" />
         <register type="NOA" address="0x00009888" value="0x65100002" />
         <register type="NOA" address="0x00009884" value="0x00000000" />
@@ -494,10 +538,18 @@
     <register_config type="OA">
         <register type="OA" address="0x0000D920" value="0x00000000" />
         <register type="OA" address="0x0000D900" value="0x00000000" />
-        <register type="OA" address="0x0000D904" value="0x00800000" />
+        <register type="OA" address="0x0000D904" value="0x30800000" />
         <register type="OA" address="0x0000D910" value="0x00000000" />
         <register type="OA" address="0x0000D914" value="0x00800000" />
-        <register type="OA" address="0x0000DC40" value="0x00000000" />
+        <register type="OA" address="0x0000DC40" value="0x00030000" />
+        <register type="OA" address="0x0000D940" value="0x00000018" />
+        <register type="OA" address="0x0000D944" value="0x0000FFFC" />
+        <register type="OA" address="0x0000DC00" value="0x00000018" />
+        <register type="OA" address="0x0000DC04" value="0x0000FFFC" />
+        <register type="OA" address="0x0000D948" value="0x00000060" />
+        <register type="OA" address="0x0000D94C" value="0x0000FFF3" />
+        <register type="OA" address="0x0000DC08" value="0x00000060" />
+        <register type="OA" address="0x0000DC0C" value="0x0000FFF3" />
     </register_config>
     <register_config type="FLEX">
         <register type="FLEX" address="0x0000E458" value="0x00804704" />
@@ -511,11 +563,11 @@
   </set>
 
   <set name="Compute Metrics Basic"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="ComputeBasic"
        underscore_name="compute_basic"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="e6bdd317-fe1c-406a-afc7-781e88f57bd7"
+       hw_config_guid="397a46d9-03dd-4696-8196-270362e1c575"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -813,7 +865,7 @@
              underscore_name="slm_bytes_read"
              description="The total number of GPU memory bytes read from shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 30 READ 64 UMUL"
@@ -827,7 +879,7 @@
              underscore_name="slm_bytes_written"
              description="The total number of GPU memory bytes written into shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 31 READ 64 UMUL"
@@ -870,7 +922,7 @@
              max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="A 30 READ A 31 READ UADD A 32 READ UADD 64 UMUL"
+             equation="$ShaderMemoryAccesses 64 UMUL"
              mdapi_group="L3/Data Port"
              mdapi_usage_flags="Tier2 Frame Batch Draw"
              mdapi_supported_apis="VK OGL OCL IO"
@@ -969,11 +1021,11 @@
   </set>
 
   <set name="Render Metrics for 3D Pipeline Profile"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="RenderPipeProfile"
        underscore_name="render_pipe_profile"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="77ae98cf-9a9e-4e35-be85-597b09ffbe53"
+       hw_config_guid="684ed715-a0ca-499b-89e0-25d1cdf0c737"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -1271,7 +1323,7 @@
              underscore_name="slm_bytes_read"
              description="The total number of GPU memory bytes read from shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 30 READ 64 UMUL"
@@ -1285,7 +1337,7 @@
              underscore_name="slm_bytes_written"
              description="The total number of GPU memory bytes written into shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 31 READ 64 UMUL"
@@ -1328,7 +1380,7 @@
              max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="A 30 READ A 31 READ UADD A 32 READ UADD 64 UMUL"
+             equation="$ShaderMemoryAccesses 64 UMUL"
              mdapi_group="L3/Data Port"
              mdapi_usage_flags="Tier2 Frame Batch Draw"
              mdapi_supported_apis="VK OGL OCL IO"
@@ -1741,11 +1793,11 @@
   </set>
 
   <set name="Metric set HDCAndSF"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="HDCAndSF"
        underscore_name="hdc_and_sf"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="dedd95cd-1bd4-4e65-be7f-1fd7aa43fe12"
+       hw_config_guid="3a4c7510-7725-4bf8-9eae-59115a2431c6"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -2043,7 +2095,7 @@
              underscore_name="slm_bytes_read"
              description="The total number of GPU memory bytes read from shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 30 READ 64 UMUL"
@@ -2057,7 +2109,7 @@
              underscore_name="slm_bytes_written"
              description="The total number of GPU memory bytes written into shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 31 READ 64 UMUL"
@@ -2100,7 +2152,7 @@
              max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="A 30 READ A 31 READ UADD A 32 READ UADD 64 UMUL"
+             equation="$ShaderMemoryAccesses 64 UMUL"
              mdapi_group="L3/Data Port"
              mdapi_usage_flags="Tier2 Frame Batch Draw"
              mdapi_supported_apis="VK OGL OCL IO"
@@ -2354,11 +2406,11 @@
   </set>
 
   <set name="Metric set RasterizerAndPixelBackend"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="RasterizerAndPixelBackend"
        underscore_name="rasterizer_and_pixel_backend"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="a889ccb3-5ebd-437f-b5c6-e951fba822f5"
+       hw_config_guid="6f02479c-e9ca-4c2b-b1e6-216a9e1c5ef7"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -2656,7 +2708,7 @@
              underscore_name="slm_bytes_read"
              description="The total number of GPU memory bytes read from shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 30 READ 64 UMUL"
@@ -2670,7 +2722,7 @@
              underscore_name="slm_bytes_written"
              description="The total number of GPU memory bytes written into shared local memory."
              data_type="uint64"
-             max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
+             max_equation="$GpuCoreClocks 128 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
              equation="A 31 READ 64 UMUL"
@@ -2713,7 +2765,7 @@
              max_equation="$GpuCoreClocks 64 UMUL $EuSubslicesTotalCount UMUL"
              units="bytes"
              semantic_type="throughput"
-             equation="A 30 READ A 31 READ UADD A 32 READ UADD 64 UMUL"
+             equation="$ShaderMemoryAccesses 64 UMUL"
              mdapi_group="L3/Data Port"
              mdapi_usage_flags="Tier2 Frame Batch Draw"
              mdapi_supported_apis="VK OGL OCL IO"
@@ -3045,11 +3097,11 @@
   </set>
 
   <set name="Gen12LP L3_1"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_1"
        underscore_name="l3_1"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="feee2629-03a8-4d31-ab4d-7d16572163fb"
+       hw_config_guid="7e809cb4-6e90-44cc-9c57-6eff58ad360a"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -3391,11 +3443,11 @@
   </set>
 
   <set name="Gen12LP L3_2"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_2"
        underscore_name="l3_2"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="5266f235-1711-4eef-9493-ebdf0238d512"
+       hw_config_guid="0dde1bb6-340f-4350-b398-2b0228573967"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -3738,11 +3790,11 @@
   </set>
 
   <set name="Gen12LP L3_3"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_3"
        underscore_name="l3_3"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="9c2cd379-bf93-4ded-b481-f64efd534c4a"
+       hw_config_guid="8ecaeff2-78f4-4e29-b331-d757e6a74ed0"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -3926,7 +3978,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 7 READ C 6 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -3941,7 +3993,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 5 READ C 4 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4005,11 +4057,11 @@
   </set>
 
   <set name="Gen12LP L3_4"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_4"
        underscore_name="l3_4"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="6a68185d-0056-4891-a5f6-29aa1e1d81ae"
+       hw_config_guid="30cd8433-f679-401e-b578-19e22975e84f"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -4193,7 +4245,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 5 READ C 4 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4208,7 +4260,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 7 READ C 6 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4272,11 +4324,11 @@
   </set>
 
   <set name="Gen12LP L3_5"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_5"
        underscore_name="l3_5"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="3f17a326-ae8b-4869-9f5a-3bccf793e287"
+       hw_config_guid="e0efab61-c904-4354-9fc5-35e8b8bc7d20"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -4460,7 +4512,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 5 READ C 4 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4475,7 +4527,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 7 READ C 6 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4539,11 +4591,11 @@
   </set>
 
   <set name="Gen12LP L3_6"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="L3_6"
        underscore_name="l3_6"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="d312c40a-9fb7-489a-9a1a-9cd80aac6d61"
+       hw_config_guid="4066ad45-4a68-4acf-86b2-fa5a6a914db7"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -4727,7 +4779,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 5 READ C 4 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 5 READ C 4 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4742,7 +4794,7 @@
              max_equation="100"
              units="percent"
              semantic_type="duration"
-             equation="C 7 READ C 6 READ FADD 100 UMUL $GpuCoreClocks FDIV"
+             equation="C 7 READ C 6 READ FADD 4 FDIV 100 UMUL $GpuCoreClocks FDIV"
              availability="$SliceMask 1 AND"
              mdapi_group="GTI/L3"
              mdapi_usage_flags="Frame Batch Draw"
@@ -4806,11 +4858,11 @@
   </set>
 
   <set name="Sampler_1"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="Sampler_1"
        underscore_name="sampler_1"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="f0f255a4-535c-43ed-9d6b-85958cef6c1c"
+       hw_config_guid="17e2be13-39fe-45f0-867c-0f83fcc51654"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -5245,11 +5297,11 @@
   </set>
 
   <set name="Sampler_2"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="Sampler_2"
        underscore_name="sampler_2"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="f47c6b97-fc10-4962-bb67-d623e9d6219b"
+       hw_config_guid="0c3c3235-2e91-4ef0-8562-4ea1501e8612"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -5686,11 +5738,11 @@
   </set>
 
   <set name="TDL_1"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="TDL_1"
        underscore_name="tdl_1"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="2e49d25e-93e8-4e2b-b91b-51731f5fb315"
+       hw_config_guid="ee6f5fa3-13a8-4842-8b34-f7541a0f76a3"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -6285,11 +6337,11 @@
   </set>
 
   <set name="TDL_2"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="TDL_2"
        underscore_name="tdl_2"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="2a42ff25-99b1-4048-a121-f0664ed42c90"
+       hw_config_guid="f1577929-9215-488b-9899-d12b6e799743"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -6820,11 +6872,11 @@
   </set>
 
   <set name="TDL_3"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="TDL_3"
        underscore_name="tdl_3"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="b763fa13-834e-4468-bba6-5f0d40db9813"
+       hw_config_guid="d5890d02-b2be-4742-a16e-17190a92a301"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -7374,11 +7426,11 @@
   </set>
 
   <set name="GpuBusyness"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="GpuBusyness"
        underscore_name="gpu_busyness"
        mdapi_supported_apis="VK OGL OCL MEDIA IO"
-       hw_config_guid="cc935a3e-8d96-4b47-bc46-3d84247e9a3a"
+       hw_config_guid="19fe64eb-ac4f-45c6-b2b9-af728b21753b"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -7776,11 +7828,11 @@
   </set>
 
   <set name="EuActivity1"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity1"
        underscore_name="eu_activity1"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="0732e7e2-e09a-401c-92bc-8af9bf6000bb"
+       hw_config_guid="414ff049-80d3-48c0-b79a-bd8eed097a06"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -8103,11 +8155,11 @@
   </set>
 
   <set name="EuActivity2"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity2"
        underscore_name="eu_activity2"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="52b1fa12-3068-4b8c-8139-b5031a8d569b"
+       hw_config_guid="fb65c819-7ac2-4c69-aa9d-b72a18440705"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -8430,11 +8482,11 @@
   </set>
 
   <set name="EuActivity3"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity3"
        underscore_name="eu_activity3"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="6381bfd9-e89a-4d23-a71c-176f70e39088"
+       hw_config_guid="7e1c6469-9de7-491a-a7c5-1bd8f9966826"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -8757,11 +8809,11 @@
   </set>
 
   <set name="EuActivity4"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity4"
        underscore_name="eu_activity4"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="efb7e460-edff-4329-9123-bbccc93f5546"
+       hw_config_guid="a43f80cd-5cc1-4a2c-a750-40594af2b661"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -9084,11 +9136,11 @@
   </set>
 
   <set name="EuActivity5"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity5"
        underscore_name="eu_activity5"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="76566878-face-4c3e-b18e-9117e1662ed4"
+       hw_config_guid="7e6e555c-aa5b-4c8d-992a-454a5a335c6e"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -9411,11 +9463,11 @@
   </set>
 
   <set name="EuActivity6"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity6"
        underscore_name="eu_activity6"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="61ead329-10c0-48ad-8087-99cc9886197f"
+       hw_config_guid="f3723f39-ecf4-4ff2-a4c4-80e87876b86f"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -9738,11 +9790,11 @@
   </set>
 
   <set name="EuActivity7"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity7"
        underscore_name="eu_activity7"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="b698fbb4-6822-4110-a957-870223a8db94"
+       hw_config_guid="c0d2cd0a-e2be-4b12-916d-2f3aba0ebf9e"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -9926,7 +9978,7 @@
              max_equation="2"
              units="number"
              semantic_type="ratio"
-             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FADD A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD FSUB FDIV 1 FADD"
+             equation="A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD  A 11 READ A 12 READ FADD A 13 READ FADD A 14 READ FADD  A 15 READ A 16 READ FADD A 17 READ FADD A 18 READ FADD FADD  A 7 READ A 8 READ FADD A 9 READ FADD A 10 READ FADD FSUB FDIV 1 FADD"
              mdapi_group="EU Array"
              mdapi_usage_flags="Tier4 Overview System Frame Batch Draw"
              mdapi_supported_apis=""
@@ -10079,11 +10131,11 @@
   </set>
 
   <set name="EuActivity8"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="EuActivity8"
        underscore_name="eu_activity8"
        mdapi_supported_apis="OGL OGL4 OCL MEDIA IO"
-       hw_config_guid="6e6a63b1-caa6-4b8d-b214-8a0da078c39e"
+       hw_config_guid="1fbbd218-693c-4035-b4c0-ce4dd139d828"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
@@ -10374,11 +10426,11 @@
   </set>
 
   <set name="Metric set TestOa"
-       chipset="TGL"
+       chipset="TGLGT2"
        symbol_name="TestOa"
        underscore_name="test_oa"
        mdapi_supported_apis="VK OGL OCL IO"
-       hw_config_guid="30801299-fe7b-40ba-8a6c-64c6196f3748"
+       hw_config_guid="6607f034-d053-40d1-8215-67c07f3041bb"
        >
     <counter name="GPU Time Elapsed"
              symbol_name="GpuTime"
diff --git a/lib/i915/perf-configs/update-guids.py b/lib/i915/perf-configs/update-guids.py
index 775d067f..31f6e3e7 100755
--- a/lib/i915/perf-configs/update-guids.py
+++ b/lib/i915/perf-configs/update-guids.py
@@ -174,7 +174,7 @@ chipsets = [ 'hsw',
              'bxt', 'glk',
              'cnl',
              'icl', 'ehl',
-             'tgl' ]
+             'tglgt1', 'tglgt2' ]
 
 for chipset in chipsets:
     filename = 'oa-' + chipset + '.xml'
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 8d3e188a..ea4a527b 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -53,7 +53,8 @@
 #include "i915_perf_metrics_cnl.h"
 #include "i915_perf_metrics_icl.h"
 #include "i915_perf_metrics_ehl.h"
-#include "i915_perf_metrics_tgl.h"
+#include "i915_perf_metrics_tglgt1.h"
+#include "i915_perf_metrics_tglgt2.h"
 
 static int
 perf_ioctl(int fd, unsigned long request, void *arg)
@@ -253,7 +254,16 @@ intel_perf_for_devinfo(uint32_t device_id,
 	} else if (devinfo->is_elkhartlake) {
 		intel_perf_load_metrics_ehl(perf);
 	} else if (devinfo->is_tigerlake) {
-		intel_perf_load_metrics_tgl(perf);
+		switch (devinfo->gt) {
+		case 1:
+			intel_perf_load_metrics_tglgt1(perf);
+			break;
+		case 2:
+			intel_perf_load_metrics_tglgt2(perf);
+			break;
+		default:
+			unsupported_i915_perf_platform(perf);
+		}
 	} else {
 		return unsupported_i915_perf_platform(perf);
 	}
diff --git a/lib/meson.build b/lib/meson.build
index bccebba2..34184d53 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -205,7 +205,7 @@ i915_perf_hardware = [
   'bxt', 'glk',
   'cnl',
   'icl', 'ehl',
-  'tgl',
+  'tglgt1', 'tglgt2',
 ]
 
 i915_xml_files = []
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
