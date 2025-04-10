Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3570AC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 19:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBBF10EA63;
	Thu, 10 Apr 2025 19:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FulKU9TX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957510EA63
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744314411; x=1775850411;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PhzLDUZnDs7qQaqpEq8MbJINIV/Dn/M2wDF5IFeZBJ8=;
 b=FulKU9TXOhlRaDKob4R3sK+YGVrnOr/21odzWDa7Put1uXRGFHLmGk6P
 dlYprvZwi8RjqgSUulXulcYjrXsyHFZB9gUbO+FuvH66zHpvJmb7STs13
 Lnivn91h6a/wTN3yeFkRIdQ3QUwsAX1poLad+ZMXhpEC2cvA3IPnMSFSb
 NCsROE7QCNv3e3nBrQlOfP9LnSAZE6egQ4wCEj5coK3fmiGKizW++OAXX
 L1gN3ak2IZAd15iPYxJUT9wic6ErPadBg4gumqHcSE0xNwZC9ijWnFXxb
 rgKdy0IZHXd9qGxR5ecabA33O4sg3wJDgbk4taL5GA6+ix/HsYgFWDM4R g==;
X-CSE-ConnectionGUID: ee7l2AxNT4idgZNmRO1J/Q==
X-CSE-MsgGUID: 6wBgzwTpQGKHP4Km2HmhhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45993925"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45993925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 12:46:50 -0700
X-CSE-ConnectionGUID: HCvGwOMITCSOrcWL7WRyQQ==
X-CSE-MsgGUID: NTGyUmx8TuKhVVmDl9tmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="134167672"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 12:46:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 22:46:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/gem_exec_capture: Deal with DG1 recoverable
 vs. capture uapi changes
Date: Thu, 10 Apr 2025 22:46:43 +0300
Message-ID: <20250410194643.20558-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The kernel will start to allow recoverable+capture on DG1 again
because rejecting that combo broke the intel-media-driver.
Adapt the test to match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 37c1f7255046..c0549c0e3d66 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -658,7 +658,7 @@ static bool needs_recoverable_ctx(int fd)
 		return false;
 
 	devid = intel_get_drm_devid(fd);
-	return gem_has_lmem(fd) ||  intel_graphics_ver(devid) > IP_VER(12, 0);
+	return intel_graphics_ver(devid) > IP_VER(12, 10);
 }
 
 #define find_first_available_engine(fd, ctx, e, saved) \
-- 
2.49.0

