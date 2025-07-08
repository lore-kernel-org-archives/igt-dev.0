Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8912EC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 10:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4886310E1AA;
	Tue,  8 Jul 2025 10:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpvG1rmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5810E1AA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751969281; x=1783505281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qf7HXJFjuj+ybBuuyAdt1zp7KsnZCAxzOjN5FZMEZ08=;
 b=MpvG1rmtyAr0GK1xnq8/+IbMh92oiVPMHyLZWCL3MBBBX0UYpjlLIsAJ
 NaGRHRJ1gRnnqbWB6sHKx0qblEWCxFCAG+r9HkTtCSzTyDG3zyd43k1ja
 lKCLw2ao8BqR9x43LGIKSR4V5UMZRkavMxsHf3wLTTCMG51jopvYodN3J
 TOc8/cL6IRR7IFTn8bMWJtABXLdx0nwOC3xNj5LA9hVtgjWvkwFVy8yFZ
 h8TZ3QugeXBwjTMtrKHLngI3oFZpbIMG0TKSaOlGgUu5uq9aNbBJv5pxJ
 4FUvc6LzcDcdgdjJ68LGXLyLGtQduhHR6aFBEOjNnwHkG+pMfpTyF9hSH w==;
X-CSE-ConnectionGUID: Ya7FVUgTQpqEncJfMF5Sng==
X-CSE-MsgGUID: hQ6pwNouS3OO44a993XRDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54088699"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54088699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:08:00 -0700
X-CSE-ConnectionGUID: ih/dyECcQkiBLoYDCJ/3pg==
X-CSE-MsgGUID: kIUX5O+FS3qLLhUaqNn72g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161012024"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:07:58 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
Date: Tue,  8 Jul 2025 15:38:13 +0530
Message-ID: <20250708100813.787544-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
References: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
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

Bypass timestamp and sequence validations when INTEL_SIMULATION is
active to accommodate non-deterministic timing in simulated test
environments.

v2: Use existing function for reading environment variables. (kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 382b92d9a..0cebbecac 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -321,7 +321,19 @@ static bool should_skip_ts_checks(void) {
 	 * timestamp to drift with a relatively larger standard deviation over a large sample.
 	 * As it's a known issue, skip any Timestamp or Sequence checks for MTK drivers.
 	 */
-	return is_mtk_device(drm_fd);
+	if (is_mtk_device(drm_fd))
+		return true;
+
+	/*
+	 * In simulation environments, hardware behavior may not accurately reflect real-world
+	 * timing characteristics. To avoid false negatives in tests due to simulated timing
+	 * artifacts, skip timestamp and sequence checks when the INTEL_SIMULATION environment
+	 * variable is set to a truthy value.
+	 */
+	if (igt_run_in_simulation())
+		return true;
+
+	return false;
 }
 
 static bool vblank_dependence(int flags)
-- 
2.43.0

