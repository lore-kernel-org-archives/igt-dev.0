Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB7AC7115B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 05:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A53010E160;
	Mon, 23 Jun 2025 05:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+N772BH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DD910E15B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 05:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750656004; x=1782192004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PGhkW8Z/y1miOuV81v4pH/UUO2rje9dFzpfrEfwi5Fg=;
 b=c+N772BHL4UWCthM+D4j/DIM6eW2cC3FHK1Mbr8F0X501IafgjgK8/Fj
 sXyqqu5o8IfGKVi767uqoyc6J7JU/XuuNDAwCcpt0isI5izuJ8suOb4ZV
 aFJKrg/l1GP47EjqMZ3mvH3Wihn7QZfWPHgtN2VfeHzOYgrCKTwNACfL9
 JlBWqdmAVQUNVCvU7IDUbNUUWHkXuHvOS6DBy0jJSuF4b7d7uivfCxBrD
 ET4/G99tZ6yJNHUvag1BszDwGr9HIP/5ch7A4XDb0UVF6dYaqkBWYz5QI
 qT8PcfJPOZmhplRTR+djPRRk3NfMl1DkeBluKxnj4KBT9d+IlFCBk+E7f A==;
X-CSE-ConnectionGUID: maQwJ8MwTa6Oe/CBYzEXhw==
X-CSE-MsgGUID: xne9i5PfRgSa3G+h6EWyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="70416993"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70416993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:20:04 -0700
X-CSE-ConnectionGUID: wA6HoEGnSB+VR3xmum6J3Q==
X-CSE-MsgGUID: v8bqg9PKRSaCpbsmoCW74A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182527562"
Received: from jeevan24.iind.intel.com ([10.223.74.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:20:03 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] kms_vrr: Add comment explaining PR and LOBF dependency
Date: Mon, 23 Jun 2025 10:50:56 +0530
Message-ID: <20250623052056.135083-1-jeevan.b@intel.com>
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

Add a comment to explain that LOBF requires PR support,
which is only available on eDP 1.5 panels.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 4919b7cb7..b7600ae2c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1049,6 +1049,10 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				continue;
 			}
 
+			/* Panel Replay is supported only with eDP 1.5 panels.
+			 * LOBF and PR are mutually exclusive features.
+			 * Skip the test if PR is not supported, as LOBF cannot be enabled.
+			 */
 			if (flags == TEST_LINK_OFF)
 				igt_require_f(psr_sink_support(data->drm_fd,
 					      data->debugfs_fd, PR_MODE, output),
-- 
2.43.0

