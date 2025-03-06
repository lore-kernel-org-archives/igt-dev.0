Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA21C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 03:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B5A10E0FD;
	Thu,  6 Mar 2025 03:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXuMWTP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1110E0FD
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741232661; x=1772768661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bmh4x8FT4wDiczP5whAkJafQcnFDc8SVcyiSYZzMYQA=;
 b=DXuMWTP7v75lvtAmBhcCp2o2Ufk00jORd2bpaODQ4Eyv0XbAI/+0mP7k
 R9D38iEH8RRHUhPjPo/byCm63lWkmBz+L5FWWt/5/Qgao9QIILybMEqPI
 VQ9xvNGJTjeqbAw+T2kpVXz/KVCb2YJWBHbe5TqdV6egzcwmRwXKtoZgH
 vKAQnXgBdIqCupOib1NkhwQ7j0PrQjVYNojF8kbLhgUF1vOq1zCajGcym
 NrIPMAAPCVEUTOTHbTeZaoptB7sc8jVfMVHTx/reAWDnej5AgxV9GNBgw
 SmxnNRtjgqOQVmhrqh2sLZhFodFQFzzLSH1vceyAzxosnomv90yG4I7yw Q==;
X-CSE-ConnectionGUID: Le6sHqmcQoCWK6HnJ0BF+A==
X-CSE-MsgGUID: tm7U/RjsTtaRs5K0r93mGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64673560"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64673560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:21 -0800
X-CSE-ConnectionGUID: pIdm259aTpe8Lz5DeIKSSQ==
X-CSE-MsgGUID: 1PQeIfIEST6Wbqf7+xFN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119403317"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:18 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ramanaidu.naladala@intel.com, jouni.hogander@intel.com,
 kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/intel/kms_psr2_sf: Skip PSR2 sf test on
 joiner
Date: Thu,  6 Mar 2025 09:09:51 +0530
Message-Id: <20250306033953.2519156-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
References: <20250306033953.2519156-1-santhosh.reddy.guddati@intel.com>
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

Joiner cannot be used along with PSR2. skip the selective fetch test
on the joiner outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_psr2_sf.c | 78 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 16acff4cd..b9e1e5219 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1284,6 +1284,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1309,6 +1315,12 @@ igt_main
 						if (!check_psr_mode_supported(&data, psr_status[z]))
 							continue;
 
+						if (is_joiner_mode(data.drm_fd, outputs[i])) {
+							igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(data.output));
+							continue;
+						}
+
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						run_dynamic_test_damage_areas(data, i,
 									      coexist_features);
@@ -1335,6 +1347,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1357,6 +1375,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1379,6 +1403,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1401,6 +1431,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1423,6 +1459,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1446,6 +1488,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					run_plane_move(data, i, coexist_features);
 				}
 			}
@@ -1467,6 +1515,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1489,6 +1543,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1510,6 +1570,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					run_dynamic_test(data, i, coexist_features);
 				}
@@ -1533,6 +1599,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 					run_dynamic_test_damage_areas(data, i, coexist_features);
 				}
@@ -1558,6 +1630,12 @@ igt_main
 					if (!check_psr_mode_supported(&data, psr_status[z]))
 						continue;
 
+					if (is_joiner_mode(data.drm_fd, data.output)) {
+						igt_info("%s supports joiner mode, can't test PSR2 + joiner\n",
+							  igt_output_name(data.output));
+						continue;
+					}
+
 					run_plane_update_continuous(data, i, coexist_features);
 				}
 			}
-- 
2.34.1

