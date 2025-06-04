Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEBDC5B552
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 21:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3B610E88D;
	Wed,  4 Jun 2025 21:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vdwv6oqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23BA10E88D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749073851; x=1780609851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pYtYWecN3OHhVQQhpxIrYkop2lMdRz99IRFcEunu3sI=;
 b=Vdwv6oqrugOGQI/CPYcRbMF8DxTBoK7UL46GPNZvN7YEyM0WCOt72kVI
 /ZyytiCQjFkpd0KfIOXeNyqPww8ZmcX/SVuseDocmXZL8+cpNtjpm+lcf
 2g13hmy9hDpRPqYjjeSe4W7GIKWAApO/14EE/9WGV6Ix/YkaSOMgEVEGu
 eyY7K9GH0mLpbtlFKF5FxchOSnk4KA13A5b1uiOU9HSZ/Hw7NL4N0Rvnh
 l42KW+u/PMkr4SdW0B6J+iquW0L3mRq5wHsYJbXbRjo212aPCHDYgxElN
 gya/n0LVRHLmOEfHokmi4vR/SuwkhBOI8urkO7PKxesDsicyGOejtLI3m w==;
X-CSE-ConnectionGUID: YaEkt21DRl+VrvfXziDb9Q==
X-CSE-MsgGUID: hw2KSTbOQ2KJt7XOG+lkNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51047192"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51047192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:50:50 -0700
X-CSE-ConnectionGUID: CYMXOZfsTZeIKlftbaLhgw==
X-CSE-MsgGUID: bm1hyGcLQMehHPRyjXtCMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="149145096"
Received: from unknown (HELO DUT4399MTLH.fm.intel.com) ([10.105.8.87])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:50:50 -0700
From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com
Subject: [PATCH 1/2] xe/oa: Update scripts to support PTL
Date: Wed,  4 Jun 2025 21:50:42 +0000
Message-ID: <20250604215043.6568-1-sushma.venkatesh.reddy@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Signed-off-by: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
---
 lib/meson.build                           |  1 +
 lib/xe/oa-configs/guids.xml               | 14 ++++++++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 19 +++++++++++++++++++
 lib/xe/oa-configs/oa-metricset-codegen.py |  2 +-
 lib/xe/oa-configs/oa_guid_registry.py     |  1 +
 lib/xe/oa-configs/update-guids.py         |  1 +
 6 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index f54198051..161edf04f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -437,6 +437,7 @@ xe_oa_hardware = [
   'mtlgt2', 'mtlgt3',
   'lnl',
   'bmg',
+  'ptl',
 ]
 
 xe_xml_files = []
diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index c8831a912..b9487c81b 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2770,4 +2770,18 @@
     <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="dfe5251f-af3e-434c-b627-38490f2213da" chipset="bmg" name="VectorEngineProfile" />
     <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="d008dcae-2a82-4929-a94d-2ba1e9c569d6" chipset="bmg" name="VectorEngineStalls" />
     <guid config_hash="6723e2305bfd92e1d94c4242e476ee36" mdapi_config_hash="8c21cff2375af4159f5abd0ef05ee97a" id="9ec392a7-4c77-4253-a28a-85240821e82c" chipset="bmg" name="TestOa" />
+    <guid mdapi_config_hash="3c2ee9a97141f36bc13828aeda30e477" id="b13bebeb-15c6-440c-9168-51ba2ad0e14a" chipset="ptl" name="PipelineStats" />
+    <guid config_hash="208c3c79f1b4db2f86277292566d3f10" mdapi_config_hash="1fbaf5ad061ccf96ff7d4e108cbcf3ae" id="a78beb3a-98d1-48cc-86ee-29bb3cc3b5a7" chipset="ptl" name="RenderBasic" />
+    <guid config_hash="39eb89a5a9a33ab05bce6069f77e0cbb" mdapi_config_hash="24837cfd6478062c78968430d5f8a902" id="751a8e91-f8cd-49ba-95ef-28f45fd4ded6" chipset="ptl" name="ComputeBasic" />
+    <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="b7f6cc1f-8092-44c2-8889-82ca13aa736a" chipset="ptl" name="DepthProfile" />
+    <guid config_hash="55ecb5067bca7d99769a30a14eaceba5" mdapi_config_hash="e444af605670c2230a5796b4ad65b2c0" id="89acd6f6-6559-4aae-8178-e3d475c2af4e" chipset="ptl" name="DeviceCacheProfile" />
+    <guid config_hash="073c22bb18e4ea3a39b43ab9cf9915a1" mdapi_config_hash="b29927048361ca3c24e3228e5f77cc25" id="9a4e83b3-2f9b-4d09-a9b7-256b7e7ad536" chipset="ptl" name="MemoryProfile" />
+    <guid config_hash="5d38d137356ca80dca2ea337449675be" mdapi_config_hash="07f0aa1a93f77bc7b6771ba2b68c8325" id="37a30f4d-40b1-4ad5-aeab-592c72e22536" chipset="ptl" name="RenderPipeProfile" />
+    <guid config_hash="85bd9123cd9231c85b4cde11e6a17a68" mdapi_config_hash="72bda7af5deee4193c5ef93165851069" id="7d46ea13-6f8c-4b7f-8ecd-a14839b2c2e3" chipset="ptl" name="RTProfile" />
+    <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="765ea760-ca86-475a-a807-7c75f44b39c9" chipset="ptl" name="VectorEngineProfile" />
+    <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="64c274c2-3df8-44c7-a779-085e27d474d3" chipset="ptl" name="VectorEngineStalls" />
+    <guid config_hash="2c8d8862e0eab0c587f2a2c18d96ad3b" mdapi_config_hash="89ebddf1d2af3b8acb33e7e3488086be" id="cf90eca9-c696-4e2c-8f48-0574b1745a58" chipset="ptl" name="TestOa" />
+    <guid config_hash="8558ae483770cbd2b2647fac43742d3d" mdapi_config_hash="7d87d4e394083695910c216ae9dce526" id="e8d82001-29be-4dc3-96f4-aa569d27635c" chipset="ptl" name="MediaSet1" />
+    <guid mdapi_config_hash="883c847bdfecb4051eb3fde4009cf4ec" id="d5b211bb-8651-4c92-9bc9-3b5a6881a13b" chipset="ptl" name="MediaSet2" />
+    <guid mdapi_config_hash="3c2ee9a97141f36bc13828aeda30e477" id="5f744d66-6840-479d-8626-65919115f241" chipset="ptl" name="EuStallSampling" />
 </guids>
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index df6ab3f9c..f1a7c4f37 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -162,6 +162,19 @@ xe2_chipset_params_pec = {
     }
 }
 
+xe3_chipset_params_pec = {
+    'pec_offset': 32,
+    'oa_report_size': 576,
+    # TODO: Not sure about the configs below
+    'config_reg_blacklist': {
+        0x2364, # OACTXID
+    },
+    'register_offsets': {
+        0x1b0: 'PERFCNT 0',
+        0x1b8: 'PERFCNT 1',
+    }
+}
+
 hsw_chipset_oa_formats = {
     '256B_GENERIC_NOA16': hsw_chipset_params,
 }
@@ -188,6 +201,11 @@ xe2_chipset_oa_formats = {
     '128B_MPEC8_NOA16': mtl_chipset_oam_samedia_params,
 }
 
+xe3_chipset_oa_formats = {
+    '576B_PEC64LL': xe3_chipset_params_pec,
+    '256B_GENERIC_NOA16': xehpsdv_chipset_params,
+}
+
 chipsets = {
     'HSW': hsw_chipset_oa_formats,
     'BDW': gen8_11_chipset_oa_formats,
@@ -208,6 +226,7 @@ chipsets = {
     'MTL': mtl_chipset_oa_formats,
     'LNL': xe2_chipset_oa_formats,
     'BMG': xe2_chipset_oa_formats,
+    'PTL': xe3_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index 8816c0893..748f58787 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -138,7 +138,7 @@ def generate_metric_sets(args, gen):
                     metric_set->c_offset = metric_set->b_offset + 8;
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
-        elif gen.chipset == "lnl" or gen.chipset == "bmg":
+        elif gen.chipset == "lnl" or gen.chipset == "bmg" or gen.chipset == "ptl":
             c(textwrap.dedent("""\
                 metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
 
diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
index 4b07faf59..55c496816 100644
--- a/lib/xe/oa-configs/oa_guid_registry.py
+++ b/lib/xe/oa-configs/oa_guid_registry.py
@@ -103,6 +103,7 @@ class Registry:
                            'MTL',
                            'LNL',
                            'BMG',
+                           'PTL',
                           )
         if name in known_chipsets:
             return name
diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
index 5a099a158..c3f5a37c6 100755
--- a/lib/xe/oa-configs/update-guids.py
+++ b/lib/xe/oa-configs/update-guids.py
@@ -167,6 +167,7 @@ chipsets = [ 'hsw',
              'mtlgt2', 'mtlgt3',
              'lnl',
              'bmg',
+             'ptl',
 ]
 
 for chipset in chipsets:
-- 
2.43.0

