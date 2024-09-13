Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76603FC6182
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 22:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1289E10E1B7;
	Fri, 13 Sep 2024 22:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEPU/Xqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5315010E1B7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726265760; x=1757801760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vlJAYVNnEK76HpKXm5Dx1GuCGgrkewv7vKIH0CMtH6M=;
 b=iEPU/XqyLdo12vtpgCdBV8un8vL40Bc8+yZBGw+tHXLuqrlUi1HMjyF2
 k9HSjVh3l6yEhi1ulBJUI/bCr+h6JArIbq9LHtKStXP8GkMy/XiB2uRGa
 U9ToR7GlQ4DpET58WbMTf1WqSXezycZ+rJGCa+vyOXT1n9upfF00FU7/q
 rOaKuJI05nV9HZs2isWXDAclf3dxkvbcP7nBSljj+zX0wibhKJ+mILiAx
 agrrnyVPSbKr5/ocAwK+WoSGMjyTy0rYSezfYKkx8QoZ2XfhUFsNu0pOc
 iTb5mSOw+Bv41A+qhjDHBPAQTY+tGEBRAkT72Dx5IA6DTZ5cbLqHlMk1b g==;
X-CSE-ConnectionGUID: Y/FXzauMS7iGj4laFIZFyA==
X-CSE-MsgGUID: H2otqexBQ2CXZlCfC/BBSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28927079"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="28927079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 15:15:59 -0700
X-CSE-ConnectionGUID: KXpt2xaJSzqDCvMU5/pTpg==
X-CSE-MsgGUID: ImiCwT+CSGmsY1lmBwAyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="67919895"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 15:15:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, krishnaiah.bommu@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
Date: Fri, 13 Sep 2024 15:14:22 -0700
Message-ID: <20240913221555.569699-1-lucas.demarchi@intel.com>
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

Stop trying to unload possibly-dependent modules. Loading a module and
probing a module are 2 different things, although the Linux kernel will
by default probe devices when a module is loaded (for pci, configurable
in /sys/bus/pci/drivers_autoprobe).

For the unloading part we can simplify: instead of trying to unload
the modules directly (which may complain that module is already in use)
we just unplug the HW first.  For each possible device bound.

This will be come part of libkmod in future, but we don't need to wait:
we can implement it in igt too as it's straightforward.

For now this only switches the unload path for xe, but if it works well,
we can switch others in future too.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2362
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This works for me for the test above that was failing, but not thouroughly
tested with the rest of the tests that may trigger module load/unload.
Tested on BMG and DG2. YMMV :)

 lib/igt_kmod.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kmod.h |  5 +----
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 464c0dcf4..1868fdbf7 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -697,6 +697,53 @@ igt_intel_driver_unload(const char *driver)
 	return 0;
 }
 
+static int unbind_xe(void)
+{
+	struct dirent *de;
+	DIR *dir;
+
+	dir = opendir("/sys/module/xe/drivers/pci:xe/");
+
+	/* Module may be loaded, but without any device bound */
+	if (!dir)
+		return 0;
+
+	while ((de = readdir(dir))) {
+		int devfd;
+		bool ret;
+
+		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
+			continue;
+
+		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
+		igt_assert(devfd >= 0);
+
+		ret = igt_sysfs_set(devfd, "power/control", "auto");
+		igt_assert(ret);
+
+		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
+		igt_assert(ret);
+
+		close(devfd);
+		errno = 0;
+	}
+
+	igt_assert_eq(errno, 0);
+
+        return 0;
+}
+
+int igt_xe_driver_unload(void)
+{
+	unbind_xe();
+
+	igt_kmod_unload("xe");
+	if (igt_kmod_is_loaded("xe"))
+		return IGT_EXIT_FAILURE;
+
+	return IGT_EXIT_SUCCESS;
+}
+
 /**
  * igt_amdgpu_driver_load:
  * @opts: options to pass to amdgpu driver
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index efb46da12..ee1719a8f 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -63,10 +63,7 @@ static inline int igt_xe_driver_load(const char *opts)
 }
 
 
-static inline int igt_xe_driver_unload(void)
-{
-	return igt_intel_driver_unload("xe");
-}
+int igt_xe_driver_unload(void);
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
-- 
2.43.0

