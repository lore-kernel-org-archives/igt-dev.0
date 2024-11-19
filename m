Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1E5D4920E
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC30B10E0E4;
	Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6eb650t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321910E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994824; x=1763530824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N0PALVAWGKFIb4VOBCbS3Qz9VckX9nGI58/nXTbEmlc=;
 b=h6eb650tD3w00CHZuHSpRY7/lxqN47ydaaDLPoTyoeN6hNJ9KAhcLEJq
 6qOfOxtF61yS/NI9bXH7nxZV+gW42HMQ0pJ2h91nXS7dnTsBLIX8HSm67
 B4vj+HogzbclITIIrFvCKVTrPSqUiS4preSkS0hTxLTfIuaH4b9LGk+Mc
 xzM0GDVeB5N8Zy4U5H31h3FYw5Ps7cIdANp4rzQrrM0dXxYgKCzz89SZI
 RNKgUdndF29yOPTZcpgqBx90kMieQbqhwcZ+S2zUgWbpjs3iz3qOFjZ/s
 7nXjzTwu2VwtH8CUv6JQnksrjj91JsErGrH+CIkOYljoVh7m+NZgvuLIe w==;
X-CSE-ConnectionGUID: Ov8NhgFzRCmkc/jGBLTfQw==
X-CSE-MsgGUID: 8B1Ihr4iQKaS1SEjapBdNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588153"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: kK5WuXF/QM6AeUUtqVYaDg==
X-CSE-MsgGUID: wxLq9wS8SLKAp3NChEjr4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222411"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 3/9] lib/igt_kmod: Share xe's unload logic with i915
Date: Mon, 18 Nov 2024 21:40:02 -0800
Message-ID: <20241119054008.2001984-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119054008.2001984-1-lucas.demarchi@intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
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

Now that xe unbind+unload logic is working, extend it to i915.
Note that there was a buggy call igt_kmod_is_loaded("driver") that would
never trigger: no point fixing that if we are dropping it though.

Another note that we can't still completely drop the old logic since a
few tests rely on it. Example: tests/intel/perf_pmu.c checks for trying
to remove the module with a perf event open and that being blocked by
the module refcount. Doing unbind() first would succeed the module
unload, but also crash the machine since perf doesn't work (yet) with
unplugging the device. That will need to be fixed in the kernel first.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 36 +++---------------------------------
 lib/igt_kmod.h |  6 ++++--
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index dc6b11c87..0ce0b9462 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -703,40 +703,10 @@ int igt_kmod_unbind(const char *mod_name)
 int
 igt_intel_driver_unload(const char *driver)
 {
-	char *who = NULL;
-	int ret;
-
-	ret = __igt_intel_driver_unload(&who, driver);
-	if (ret) {
-		igt_warn("Could not unload %s\n", who);
-		igt_kmod_list_loaded();
-		igt_lsof("/dev/dri");
-		igt_lsof("/dev/snd");
-		free(who);
-		return ret;
-	}
-	free(who);
-
-	if (igt_kmod_is_loaded("intel-gtt"))
-		igt_kmod_unload("intel-gtt");
-
-	igt_kmod_unload("drm_kms_helper");
-	igt_kmod_unload("drm");
-
-	if (igt_kmod_is_loaded("driver")) {
-		igt_warn("%s.ko still loaded!\n", driver);
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
-int igt_xe_driver_unload(void)
-{
-	igt_kmod_unbind("xe");
+	igt_kmod_unbind(driver);
 
-	igt_kmod_unload("xe");
-	if (igt_kmod_is_loaded("xe"))
+	igt_kmod_unload(driver);
+	if (igt_kmod_is_loaded(driver))
 		return IGT_EXIT_FAILURE;
 
 	return IGT_EXIT_SUCCESS;
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 193b95627..88d4a51e6 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -64,8 +64,10 @@ static inline int igt_xe_driver_load(const char *opts)
 	return igt_intel_driver_load(opts, "xe");
 }
 
-
-int igt_xe_driver_unload(void);
+static inline int igt_xe_driver_unload(void)
+{
+	return igt_intel_driver_unload("xe");
+}
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
-- 
2.47.0

