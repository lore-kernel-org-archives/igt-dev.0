Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB591D49205
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 10:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857F010E483;
	Mon, 18 Nov 2024 10:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY9mvlHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5C410E0B0
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 10:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731924643; x=1763460643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vKEAmoL91LJ7iDPbbxzZgmHxcVWWaBoYXCyNLrIhVUw=;
 b=BY9mvlHgfMXLlUIB4mJwyagzzVGjyxuACuogRYKDJfi5tkBtuI+FPjo+
 Snm1XsDdv6+s3dg8nTLrLxUqqWXMyvCmMsrPmif7n9pvMJFTAbAYsn1kj
 7mwyOP8K7PenqDt1vyzHotnlCJc1ujYdzPP1HxbsUB/6noUErRVeeof0i
 ql8gT/73iy8S6jZ5fLst6C8M3s7SNFPJi5CDCVUGJzuZ9ZajByjQu+tlX
 0zVak2w4u2wcyeuPNmTt67JTXmJur5XegrSh2DQdadqg8tAiBsrEB8CpC
 AtNocC82skpXyOzz174w+3VEaVB1JMMX+Gb7Jo3quDLv7FSC81sh+O+GD g==;
X-CSE-ConnectionGUID: nO8ztVNiTmiN7Bzc9QGTbw==
X-CSE-MsgGUID: DZNUfPySRhGoEI0REN2X6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31809911"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31809911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:43 -0800
X-CSE-ConnectionGUID: kXYN49NHQOG7hDZfj4dH+w==
X-CSE-MsgGUID: d2D+ZBcCTSy41CRe3qc5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94272135"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 02:10:41 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V3 2/4] lib/drrs: Add support to force drrs to default on exit
Date: Mon, 18 Nov 2024 15:29:46 +0530
Message-ID: <20241118095948.2017893-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
References: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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

Use existing exit handler helpers to reset the drrs status
to default on exit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/i915/intel_drrs.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
index ac8dd5e61..0d1f9cbad 100644
--- a/lib/i915/intel_drrs.c
+++ b/lib/i915/intel_drrs.c
@@ -56,26 +56,18 @@ bool intel_output_has_drrs(int device, igt_output_t *output)
 	return strstr(buf, "seamless");
 }
 
-static void drrs_set(int device, enum pipe pipe, unsigned int val)
+static void reset_crtc_drrs_at_exit(int sig)
 {
-	char buf[2];
-	int dir, ret;
-
-	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
-	snprintf(buf, sizeof(buf), "%d", val);
+	igt_reset_crtcs();
+}
 
-	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
-	igt_require_fd(dir);
-	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
-	close(dir);
+static bool drrs_set(int device, enum pipe pipe, const char *val)
+{
+	igt_debug("Manually %sabling DRRS.\n", !strcmp(val, "1") ? "en" : "dis");
 
-	/*
-	 * drrs_enable() is called on DRRS capable platform only,
-	 * whereas drrs_disable() is called on all platforms.
-	 * So handle the failure of debugfs_write only for drrs_enable().
-	 */
-	if (val)
-		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
+	return igt_set_crtc_attrs(device, pipe,
+				  "i915_drrs_ctl",
+				  val, "0");
 }
 
 /**
@@ -90,7 +82,17 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
  */
 void intel_drrs_enable(int device, enum pipe pipe)
 {
-	drrs_set(device, pipe, 1);
+	bool ret = drrs_set(device, pipe, "1");
+
+	/*
+	 * drrs_enable() is called on DRRS capable platform only,
+	 * whereas drrs_disable() is called on all platforms.
+	 * So handle the failure of debugfs_write only for drrs_enable().
+	 */
+	igt_assert_f(ret == 1, "debugfs_write failed");
+
+	dump_crtc_attrs();
+	igt_install_exit_handler(reset_crtc_drrs_at_exit);
 }
 
 /**
@@ -105,7 +107,8 @@ void intel_drrs_enable(int device, enum pipe pipe)
  */
 void intel_drrs_disable(int device, enum pipe pipe)
 {
-	drrs_set(device, pipe, 0);
+	drrs_set(device, pipe, "0");
+	dump_crtc_attrs();
 }
 
 /**
-- 
2.43.0

