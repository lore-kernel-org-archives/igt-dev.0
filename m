Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64F8C28B23
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 03:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D919F10E0EC;
	Thu,  6 Mar 2025 03:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZSUYGS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700A10E0D8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 03:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741232659; x=1772768659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUzjJw7HlQeDA9/JdFYMCTLXWDWEVOs154AmwFl97p0=;
 b=nZSUYGS4jjigFlL1Pwc4jtc5nT5moetQOCxUvsQhLUzp8NLjRQQFPVbU
 VnkD43wVHN8v8mzVEQWPa5FsG3u9/vSFDQ2MWN36KVYb1SaI6zfILI8DM
 4Xec6kajbC+HLnO/VN1WE6nsJGf+0+3MOGXhauRrDu6CLxz7H3yJzTjBd
 jyD3Go1NfKiS6ZoS2Yr4TqiZU4zeY1POfqwXmaz1HA3cevREiHU66/IgK
 P1LCmykF2jMj5sRy2SDabPs5HMBYGY6RQpu6G9uwBqPVFlR+jso7oYBgU
 10LJoQOU3JL4JvhYt5UtNN6Sjk24/dkXpymP+bbnlATLos7jN73BkDK7T g==;
X-CSE-ConnectionGUID: 3aXMAA1AQZO1MRS/6DyDYw==
X-CSE-MsgGUID: W/NUjjCyTDe2EF4Id7vi1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64673558"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="64673558"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:19 -0800
X-CSE-ConnectionGUID: XJBlPGRiQJuFkZCGcg1v1g==
X-CSE-MsgGUID: gQaQ4k6wRbqFHEmBoGPrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119403306"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 19:44:16 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ramanaidu.naladala@intel.com, jouni.hogander@intel.com,
 kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/3] tests/intel/kms_psr: Skip PSR test on joiner
 outputs
Date: Thu,  6 Mar 2025 09:09:50 +0530
Message-Id: <20250306033953.2519156-2-santhosh.reddy.guddati@intel.com>
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

Skip the PSR test on joiner outputs as joiner cannot be used with PSR.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_psr.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 124d7be18..c930e3872 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -838,6 +838,11 @@ igt_main
 			igt_subtest_with_dynamic_f("%s%sbasic", append_fbc_subtest[y],
 						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
+					if (is_joiner_mode(data.drm_fd, output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								igt_output_name(output));
+						continue;
+					}
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
@@ -855,6 +860,11 @@ igt_main
 			igt_subtest_with_dynamic_f("%s%sno-drrs", append_fbc_subtest[y],
 						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
+					if (is_joiner_mode(data.drm_fd, output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+						continue;
+					}
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
@@ -878,6 +888,11 @@ igt_main
 					igt_skip_on(is_xe_device(data.drm_fd) &&
 						    (op == MMAP_CPU || op == MMAP_GTT));
 					for_each_connected_output(&data.display, output) {
+						if (is_joiner_mode(data.drm_fd, output)) {
+							igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+							continue;
+						}
 						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 								      data.op_psr_mode, output))
 							continue;
@@ -902,6 +917,11 @@ igt_main
 					igt_skip_on(is_xe_device(data.drm_fd) &&
 						    (op == MMAP_CPU || op == MMAP_GTT));
 					for_each_connected_output(&data.display, output) {
+						if (is_joiner_mode(data.drm_fd, output)) {
+							igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+							continue;
+						}
 						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 								      data.op_psr_mode, output))
 							continue;
@@ -924,6 +944,11 @@ igt_main
 					igt_skip_on(is_xe_device(data.drm_fd) &&
 						    (op == MMAP_CPU || op == MMAP_GTT));
 					for_each_connected_output(&data.display, output) {
+						if (is_joiner_mode(data.drm_fd, output)) {
+							igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+							continue;
+						}
 						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 								      data.op_psr_mode, output))
 							continue;
@@ -944,6 +969,11 @@ igt_main
 			igt_subtest_with_dynamic_f("%s%sdpms", append_fbc_subtest[y],
 						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
+					if (is_joiner_mode(data.drm_fd, output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+						continue;
+					}
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
@@ -966,6 +996,11 @@ igt_main
 			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
 						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
+					if (is_joiner_mode(data.drm_fd, output)) {
+						igt_info("%s supports joiner mode, can't test PSR + joiner\n",
+								  igt_output_name(output));
+						continue;
+					}
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
-- 
2.34.1

