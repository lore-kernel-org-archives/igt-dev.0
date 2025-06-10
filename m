Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB1C677C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 20:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C94010E31C;
	Tue, 10 Jun 2025 20:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/u41CtA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5403A10E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749586470; x=1781122470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f3hLkcKYB44THJrQgGfzOKYDqL1cr4NTVKmQmu22FWs=;
 b=E/u41CtAoU/N51uJOw5MuFo4XJxujNMuCvTyqDmrjwGe8qU/A/FKwn+N
 M2Xs5RyuU72r4wWhsvNoVjfbtE6pf3wqIo1bBkJ9NfxCxkuWWErFkxhol
 gwn9z/+OfWR3BIXIM6NSBEcZrQHU7t4wrzlpJ4KMpteqcdAbc/0Ux9lgq
 YuDQ8AzU45c2Vc+fQ3bMZMOSYgAF9rJoOBOOGPZlL8pqa3CMpYra/xK7V
 A/V9LJ92VR6LatDLOUuSfRh0rzbrLrkRMFjfU0EpYDndgJ6oqQhSJU3xX
 5F5hgIShtp3Is5rsTQGqVvmPgTAz/eZvN4NZx4VFVT/E+LIkwHRkcb8Uf g==;
X-CSE-ConnectionGUID: BNpbqfPdQoyvzmHztb9Mqw==
X-CSE-MsgGUID: HzAUpp5MRky2qVakh1FFEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51628549"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51628549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 13:14:30 -0700
X-CSE-ConnectionGUID: +iLwlwz2TGejQHdESKn+8w==
X-CSE-MsgGUID: d0iKBrjyQ2C2R6z2s5jnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="177879788"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 13:14:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com
Subject: [PATCH v2 i-g-t 1/2] xe/oa: Update scripts to support PTL
Date: Tue, 10 Jun 2025 13:14:25 -0700
Message-ID: <20250610201426.1948744-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>

v2 (Ashutosh):
- Remove xe3_chipset_params_pec and xe3_chipset_oa_formats, use
  xe2_chipset_oa_formats
- Move generated changes to guids.xml to next patch
- Add PTL to intel_xe_perf_for_devinfo

Signed-off-by: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
---
 lib/meson.build                           | 1 +
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1 +
 lib/xe/oa-configs/oa-metricset-codegen.py | 2 +-
 lib/xe/oa-configs/oa_guid_registry.py     | 1 +
 lib/xe/oa-configs/update-guids.py         | 1 +
 lib/xe/xe_oa.c                            | 3 +++
 6 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index dda30e4bdb..ff81baae13 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -443,6 +443,7 @@ xe_oa_hardware = [
   'mtlgt2', 'mtlgt3',
   'lnl',
   'bmg',
+  'ptl',
 ]
 
 xe_xml_files = []
diff --git a/lib/xe/oa-configs/mdapi-xml-convert.py b/lib/xe/oa-configs/mdapi-xml-convert.py
index df6ab3f9cb..9abc7e5292 100755
--- a/lib/xe/oa-configs/mdapi-xml-convert.py
+++ b/lib/xe/oa-configs/mdapi-xml-convert.py
@@ -208,6 +208,7 @@ chipsets = {
     'MTL': mtl_chipset_oa_formats,
     'LNL': xe2_chipset_oa_formats,
     'BMG': xe2_chipset_oa_formats,
+    'PTL': xe2_chipset_oa_formats,
 }
 
 xehp_plus = ( 'ACM', 'MTL' )
diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
index 8816c0893f..748f587875 100644
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
index 4b07faf59c..55c4968161 100644
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
index 5a099a1587..c3f5a37c6e 100755
--- a/lib/xe/oa-configs/update-guids.py
+++ b/lib/xe/oa-configs/update-guids.py
@@ -167,6 +167,7 @@ chipsets = [ 'hsw',
              'mtlgt2', 'mtlgt3',
              'lnl',
              'bmg',
+             'ptl',
 ]
 
 for chipset in chipsets:
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index db614b7322..428e7d0a29 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -39,6 +39,7 @@
 #include "xe_oa_metrics_pvc.h"
 #include "xe_oa_metrics_lnl.h"
 #include "xe_oa_metrics_bmg.h"
+#include "xe_oa_metrics_ptl.h"
 
 static struct intel_xe_perf_logical_counter_group *
 intel_xe_perf_logical_counter_group_new(struct intel_xe_perf *perf,
@@ -300,6 +301,8 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else if (devinfo->is_battlemage) {
 		intel_xe_perf_load_metrics_bmg(perf);
+	} else if (devinfo->is_pantherlake) {
+		intel_xe_perf_load_metrics_ptl(perf);
 	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else {
-- 
2.48.1

