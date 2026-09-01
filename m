Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFFC61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869C810EA29;
	Tue,  1 Sep 2026 08:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHtasjv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AEB10E3D4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788252426; x=1819788426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3KEGFnUNsyALd5Fi17B+e4kOxB7FPAvqRj5fi7xK0CY=;
 b=CHtasjv5WDE2v2wrQdPXxvqT0CSpuSk3JtT7tnSA+hrgXau8vfyGuJZ7
 AryvHHyLauLrgSsyAs1MF3FHZ+jI+Sq95C2TPQqp50AZQBFAUbFfFneBK
 gL1fuFqUFzd1vIT8HzWgqM+Nol2uE9dlFDa63JXcnrRP7Jk6lgmiXL/so
 0gTmFuaSGKm2Zzd9iVJaoKO65bKRGDqVJwqoSgdoP9QabNfcTmIz5CN9m
 7LDi9iapQgWuRoDtSc67b6w31OuYOC2G+nhXNZdAWn1wLJp/Xh38/XGiB
 j+M+t+hE5JLeU5aLBQt37Wb3Ktf07qApIIfO8QK90UYB0zTkW4DmiH78d w==;
X-CSE-ConnectionGUID: WoyJ4KZsRaKUhvzF5Sniug==
X-CSE-MsgGUID: 4zbmtJprTVm8m8XkaxUANQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92541640"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92541640"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:47:06 -0700
X-CSE-ConnectionGUID: pQbpLUSrRJ6p8YMnTHLFXA==
X-CSE-MsgGUID: ahdURYHzR5iW2taYJPe/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="264749523"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:47:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 4/4] lib/kms: use enum hardware_pipe for
 __intel_get_pipe_from_crtc_index() return type
Date: Tue,  1 Sep 2026 11:46:40 +0300
Message-ID: <ef16ae698d5d21f31b7d15f3c9cddb476726834a.1788252273.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788252273.git.jani.nikula@intel.com>
References: <cover.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The __intel_get_pipe_from_crtc_index() returns a hardware pipe, so make
it obvious in the function signature.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 12 +++++++-----
 lib/igt_kms.h |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f32f655d5fae..e622d7bcd2c3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1313,10 +1313,11 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
  * The hardware pipe may be different from the CRTC index. Figure out the CRTC
  * index to pipe mapping from the debugfs.
  */
-int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
+enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 {
+	enum hardware_pipe hardware_pipe;
 	char buf[2];
-	int debugfs_fd, pipe, res = 0;
+	int debugfs_fd, res = 0;
 	char pipe_char;
 
 	debugfs_fd = igt_debugfs_crtc_dir(fd, crtc_index);
@@ -1330,11 +1331,12 @@ int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 
 	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
 
-	pipe = pipe_char - 'A';
+	hardware_pipe = pipe_char - 'A';
 
-	igt_assert_f(pipe >= 0 && pipe < IGT_MAX_PIPES, "i915_pipe %c out of range\n", pipe_char);
+	igt_assert_f(hardware_pipe >= 0 && hardware_pipe < IGT_MAX_PIPES,
+		     "i915_pipe %c out of range\n", pipe_char);
 
-	return pipe;
+	return hardware_pipe;
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b7653b8ad49a..86bef14af240 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -155,7 +155,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode);
 #define HDISPLAY_6K_PER_PIPE 6144
 #define HDISPLAY_5K_PER_PIPE 5120
 
-int __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
+enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
 int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
-- 
2.47.3

