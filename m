Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE72C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 08:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13E10E207;
	Fri, 26 Jul 2024 08:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6dEp6HC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87710E207
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721980997; x=1753516997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0nA3waQHv7uWeMBk8ZvQAVDMOlTYbgFs05TZ0btlAh0=;
 b=J6dEp6HCsOg/gSF90l6OsKH1EAUAPOcDjlJzSDMsyD/jJHFUQoTdcwdc
 IA6WwDtXS1kAGrvMnR1X1W3ItvRxfc1/+cqfwX+qhKiR0orlUVpCPYvC1
 jctw9KuL9S4m2MujAoOosyXWTZxSz84NN3F4/21tBCn5PEoSoRSK8ip01
 ePpDPSDEq/QHYE4Yrelh8ZR+u74Y4PdCz3V6pebhw8JopmFGJ6om8aQut
 ffV5901KDhMB5k7+qxt4vDyTJgkZiVEpIPKf7VfofyFbdVM8h9z+Da4A6
 aJML3qef0JRJcsIMc5q8AELDnq0FAtVKIDp50AplZoAEW0kvSZSAX7KvH w==;
X-CSE-ConnectionGUID: 3u3URsk3QLeunLGfmFLD4g==
X-CSE-MsgGUID: IB4lyWjKTTqY84k64+cJTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31179324"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="31179324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:03:00 -0700
X-CSE-ConnectionGUID: CKpWE1WsThGb1VOGHr/X8Q==
X-CSE-MsgGUID: P8qi+VqJR1Oj0z+Idkr2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53425728"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:02:57 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com
Subject: [PATCH i-g-t,
 v4] tests/intel/i915_pm_rps: Disable threshold subtests when SLPC is
 enabled
Date: Fri, 26 Jul 2024 13:32:59 +0530
Message-Id: <20240726080259.106611-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Skip these tests when SLPC is enabled as it fails frequently. 
These tests are designed for host turbo and sysfs is not available 
when SLPC is enabled.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455

v2: Add a skip for all the threshold subtests
    Provide explanations for failures (Riana)
    Addressed cosmetic review comments (Riana)
v3: Addressed cosmetic review comments (Riana)

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rps.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 99b83f315..ace22b00c 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1161,7 +1161,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-idle") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, TEST_IDLE);
@@ -1170,7 +1171,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, 0);
@@ -1179,7 +1181,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-park") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, TEST_PARK);
@@ -1188,6 +1191,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-idle-park") {
 		int tmp, gt;
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
-- 
2.34.1

