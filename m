Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130B6C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186B10EA7B;
	Thu, 10 Apr 2025 22:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IieUVrRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEEE10E1A1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325335; x=1775861335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VunVQwdQaV4z8ZH4sWG4PWuV9YwdVuHLMzKNpwDsIf8=;
 b=IieUVrRW8Aeu9LlYx5Rt3GvLHeletva6sRzRnLI4xoJXIQ4zR9hZXDLF
 HLFCs4yRtfpUtdIqytJZx5J0cgRHUSg8vzp8xWPvyDl0sWOPacF+gZbAV
 xyHIBHxVfEc6l4Dxkg4DUcPKVgrBZKn8zmPXVs4F5t06Tg1AYJfs5Lxmb
 DOm1oHcSU5IGalnAD94G43M2FngQRHNx7r47wUuZDEALLaT5ilknV8aIx
 3n3aQt0gSbC/1c4poItQFdk4xE6W3Tdb0YhWPGG+5tVPwNi4lSOl0DLkk
 4151UqIQIPzij9ueOP2Qb8ZeNtT1zBtLbdUpbH9BqGgcwq4+sxK2KLjQs g==;
X-CSE-ConnectionGUID: AytS+Bt+R+eokbK6Tfwp9A==
X-CSE-MsgGUID: J0M1vy2pSZCrlKL03A9+Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757007"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
X-CSE-ConnectionGUID: He/KbjyPTC2L1mTXlOFgUw==
X-CSE-MsgGUID: V9YCjINtREiiypdYt8J5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998315"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 04/10] lib/igt_kmod: Use igt_kmod_unbind() to kick
 snd_hda_intel
Date: Thu, 10 Apr 2025 15:48:33 -0700
Message-ID: <20250410-lib-kmod-v1-4-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

No need for the extra function now that the generic igt_kmod_unbind()
can be used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 56 +++-----------------------------------------------------
 1 file changed, 3 insertions(+), 53 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index a1e39a429..3f5f93f37 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -495,58 +495,6 @@ igt_intel_driver_load(const char *opts, const char *driver)
 	return 0;
 }
 
-/**
- * kick_snd_hda_intel:
- *
- * This function unbinds the snd_hda_intel driver so the module can be
- * unloaded.
- *
- */
-static void kick_snd_hda_intel(void)
-{
-	DIR *dir;
-	struct dirent *snd_hda;
-	int fd; size_t len;
-
-	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
-	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
-	const char *devid = "0000:";
-
-	fd = open(path, O_WRONLY);
-	if (fd < 0) {
-		return;
-	}
-
-	dir = opendir(dpath);
-	if (!dir)
-		goto out;
-
-	len = strlen(devid);
-	while ((snd_hda = readdir(dir))) {
-		struct stat st;
-		char fpath[PATH_MAX];
-
-		if (*snd_hda->d_name == '.')
-			continue;
-
-		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
-		if (lstat(fpath, &st))
-			continue;
-
-		if (!S_ISLNK(st.st_mode))
-			continue;
-
-		if (!strncmp(devid, snd_hda->d_name, len)) {
-			igt_ignore_warn(write(fd, snd_hda->d_name,
-					strlen(snd_hda->d_name)));
-		}
-	}
-
-	closedir(dir);
-out:
-	close(fd);
-}
-
 static int igt_always_unload_audio_driver(char **who)
 {
 	int ret;
@@ -579,7 +527,9 @@ static int igt_always_unload_audio_driver(char **who)
 			ret = pipewire_pulse_start_reserve();
 			if (ret)
 				igt_warn("Failed to notify pipewire_pulse\n");
-			kick_snd_hda_intel();
+
+			igt_kmod_unbind("snd_hda_intel", NULL);
+
 			ret = igt_kmod_unload(*m);
 			pipewire_pulse_stop_reserve();
 			if (ret) {

-- 
2.49.0

