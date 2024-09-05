Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94975CD6E56
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 16:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D50810E903;
	Thu,  5 Sep 2024 16:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhsniEq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737B210E8C8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725554705; x=1757090705;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=I+g3N4f451IsaSG3SKlZztijb9XA5mRmS1oUCGKRMhs=;
 b=bhsniEq/Mb9DTkm5opvGA2MVbTDmiJPV0yVYaSl8tLCUwnXQidZIqJkM
 y+7ecjnEOFXiQ+T9QxWU7aol25c1+K18BZigouseZlP4ieBiUPf8JzSif
 HYvaysW+GlJ9H/JRVgm0WGT9oqVQx6C7ZPmGi6ftbes11gm5mN3qEAfIO
 /MtgkGcVqogXg28x2KnNB1WQheC0GFtLSJ1STtJfv9s65WKQrWgNfUY8I
 snskSCS4KmVhx/ORmPkA3S/5iYWodhMLEp0m7eiavP67+O2m6eT54RGzg
 rb/yky3z+9OcHdyk6Mx0gmmY8L/MiuZ3jiqbaTHiy0fLsq+I1uUrpGaSo A==;
X-CSE-ConnectionGUID: SRqGzWp5QIi7sFzWAHhFXg==
X-CSE-MsgGUID: aawb+2rJSe+lY7jEUqgvMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41764583"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="41764583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:45:05 -0700
X-CSE-ConnectionGUID: ZgPhzMnKS1y7lxBKUpMFMw==
X-CSE-MsgGUID: Wc0LJUV5TlGphfDQyhyk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70485540"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:45:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/4] xe/oa: Update scripts to support BMG
Date: Thu,  5 Sep 2024 09:44:57 -0700
Message-ID: <20240905164458.2406145-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240905164458.2406145-1-ashutosh.dixit@intel.com>
References: <20240905164458.2406145-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: José Roberto de Souza <jose.souza@intel.com>

v2: Retain LNL metrics as the default for Xe2+ (Ashutosh)

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/meson.build                           | 1 +
 lib/xe/oa-configs/guids.xml               | 9 +++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1 +
 lib/xe/oa-configs/oa-metricset-codegen.py | 2 +-
 lib/xe/oa-configs/oa_guid_registry.py     | 1 +
 lib/xe/oa-configs/update-guids.py         | 1 +
 lib/xe/xe_oa.c                            | 5 +++++
 7 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 4af2bc7432..1c83bc5c30 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -417,6 +417,7 @@ xe_oa_hardware = [
   'pvc',
   'mtlgt2', 'mtlgt3',
   'lnl',
+  'bmg',
 ]
 
 xe_xml_files = []
diff --git a/lib/xe/oa-configs/guids.xml b/lib/xe/oa-configs/guids.xml
index 27330edd3d..dd912d00f1 100644
--- a/lib/xe/oa-configs/guids.xml
+++ b/lib/xe/oa-configs/guids.xml
@@ -2760,4 +2760,13 @@
     <guid config_hash="d635631df97322be3d97b9c4e38152e9" mdapi_config_hash="68c19075e48e5128b456a91cd7b95286" id="914ad901-832a-4ccd-a21e-ddc7690ed213" chipset="lnl" name="MetricSet2" />
     <guid config_hash="d63d186f5b83e91f8c0680847bbf4b24" mdapi_config_hash="d31ec4eaa11c8be0d8d72ecece53434f" id="3b3c9f55-e34b-423d-8c05-7b1af03b6685" chipset="lnl" name="MetricSet3" />
     <guid config_hash="76b7587d047c30ecde26e3f6253b4165" mdapi_config_hash="e39d956ed7b8d0cbe7d354cff234af7d" id="e6f21065-a6f5-4ea4-a545-80d6aebaab56" chipset="lnl" name="MetricSet4" />
+    <guid config_hash="cb471dd20a7c853d00899dc7ef33aa0e" mdapi_config_hash="4583b70c638040debcfa88563635b0f5" id="f05e23fc-913d-4ab9-ba9a-43beb059a18c" chipset="bmg" name="RenderBasic" />
+    <guid config_hash="230eab6aa4f36b6de10357fe5f951d46" mdapi_config_hash="8eb3576953c1d98c1637128b495f8fa0" id="c7383a12-5c52-47a8-8e42-11b24d64d1f8" chipset="bmg" name="ComputeBasic" />
+    <guid config_hash="955739b43332e61729e0a7a032188c02" mdapi_config_hash="d9be0378dd2dd6a5f85f71d156d21b43" id="a80e9da5-d2c9-4c20-9f7c-c0adf74bbe89" chipset="bmg" name="DepthProfile" />
+    <guid config_hash="55ecb5067bca7d99769a30a14eaceba5" mdapi_config_hash="e444af605670c2230a5796b4ad65b2c0" id="d8bb1c75-31d8-41a1-99db-99d98be17e78" chipset="bmg" name="DeviceCacheProfile" />
+    <guid config_hash="3dfc710d13968f4398a46cdc3b6549db" mdapi_config_hash="b2c033ea452ef7f46322932fe5e0cfe6" id="d2e403f3-4c94-4b1b-bc09-f472a43251a4" chipset="bmg" name="MemoryProfile" />
+    <guid config_hash="5d38d137356ca80dca2ea337449675be" mdapi_config_hash="07f0aa1a93f77bc7b6771ba2b68c8325" id="dad0d2c6-1290-4d50-a6aa-8b8104204232" chipset="bmg" name="RenderPipeProfile" />
+    <guid config_hash="72e3ab9e7d727f97c5ea29bef23be40e" mdapi_config_hash="e6b78fe68f406ee2a0cc25293c60bc62" id="da09a8a6-802c-48bc-8f3a-35834c9b8ba2" chipset="bmg" name="RTProfile" />
+    <guid config_hash="6dc1bd4e8d8b49cc9776701db836ffe9" mdapi_config_hash="cee63b3642783febd3bcbf45629c5e1c" id="dfe5251f-af3e-434c-b627-38490f2213da" chipset="bmg" name="VectorEngineProfile" />
+    <guid config_hash="b87d3a3dfab7193309deb13aeb595589" mdapi_config_hash="1950d62ef4b729af4494d76ca3ec8101" id="d008dcae-2a82-4929-a94d-2ba1e9c569d6" chipset="bmg" name="VectorEngineStalls" />
 </guids>
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index 602a3965af..df6ab3f9cb 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -207,6 +207,7 @@ chipsets = {
     'ACM': xehpsdv_chipset_oa_formats,
     'MTL': mtl_chipset_oa_formats,
     'LNL': xe2_chipset_oa_formats,
+    'BMG': xe2_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index 5fa12f9caf..8816c0893f 100644
--- a/lib/xe/oa-configs/oa-metricset-codegen.py
+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
@@ -138,7 +138,7 @@ def generate_metric_sets(args, gen):
                     metric_set->c_offset = metric_set->b_offset + 8;
                     metric_set->perfcnt_offset = metric_set->c_offset + 8;
                 """))
-        elif gen.chipset == "lnl":
+        elif gen.chipset == "lnl" or gen.chipset == "bmg":
             c(textwrap.dedent("""\
                 metric_set->perf_oa_format = XE_OA_FORMAT_PEC64u64;
 
diff --git a/lib/xe/oa-configs/oa_guid_registry.py b/lib/xe/oa-configs/oa_guid_registry.py
index 969d40e568..4b07faf59c 100644
--- a/lib/xe/oa-configs/oa_guid_registry.py
+++ b/lib/xe/oa-configs/oa_guid_registry.py
@@ -102,6 +102,7 @@ class Registry:
                            'PVC',
                            'MTL',
                            'LNL',
+                           'BMG',
                           )
         if name in known_chipsets:
             return name
diff --git a/lib/xe/oa-configs/update-guids.py b/lib/xe/oa-configs/update-guids.py
index 18f3458e84..5a099a1587 100755
--- a/lib/xe/oa-configs/update-guids.py
+++ b/lib/xe/oa-configs/update-guids.py
@@ -166,6 +166,7 @@ chipsets = [ 'hsw',
              'acmgt1', 'acmgt2', 'acmgt3',
              'mtlgt2', 'mtlgt3',
              'lnl',
+             'bmg',
 ]
 
 for chipset in chipsets:
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 1bc2eeb0a1..86264230c9 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -38,6 +38,7 @@
 #include "xe_oa_metrics_mtlgt3.h"
 #include "xe_oa_metrics_pvc.h"
 #include "xe_oa_metrics_lnl.h"
+#include "xe_oa_metrics_bmg.h"
 
 static struct intel_xe_perf_logical_counter_group *
 intel_xe_perf_logical_counter_group_new(struct intel_xe_perf *perf,
@@ -295,6 +296,10 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
 	} else if (devinfo->is_pontevecchio) {
 		perf->devinfo.eu_threads_count = 8;
 		intel_xe_perf_load_metrics_pvc(perf);
+	} else if (devinfo->is_lunarlake) {
+		intel_xe_perf_load_metrics_lnl(perf);
+	} else if (devinfo->is_battlemage) {
+		intel_xe_perf_load_metrics_bmg(perf);
 	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else {
-- 
2.41.0

