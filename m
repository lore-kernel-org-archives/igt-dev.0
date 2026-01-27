Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8910FD2F004
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F92910E54B;
	Tue, 27 Jan 2026 11:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoZsGt35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3A410E54B
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514988; x=1801050988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Hbkc8qloO4pSF6LZDZa0CuQ1nMsqxvvRXPxWBJ1hW4=;
 b=RoZsGt35Tk4dJSy/cercF9CEQrpTbF+fKG2DVU4t4EQreIsxO2xqEi3w
 QtjvOA07xiC/PuEsNFUNaGcGw+WL1j+FraOAMmi6DczAOi9/DZW3tsMI/
 A/cjSgkHZcIw/HuBWp3N/E1U/aa79GTY8m8aNUT7r2aNNQquOY70Efarj
 9EOSH7C2eqPNBNa6/dz8W+NSDk5/Ltqr092wTHzIgn2xLRHcP7PHlo8XP
 ctbOUGRhTme7l6E8G3G8vATOfZvk/WZuyh/or3HUcYEdb9OzjuSEOP1uU
 ktumz/9RExOBRpArT4Vm52cPwNhNPaEEKpQHkgFalBdtv9R3Q9dI6S/nw g==;
X-CSE-ConnectionGUID: +SqZwgMfTxeZIdj7NwpMFA==
X-CSE-MsgGUID: Rm6QFY2VQci9oxu4/IqgLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81011339"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="81011339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:22 -0800
X-CSE-ConnectionGUID: 5HCXUcc1R0WlplI91o75Tw==
X-CSE-MsgGUID: tw40bkfJS9GP6nO2sBTMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208010883"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:56:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 2/8] lib/igt_kms: Remove kmstest_pipe_to_index()
Date: Tue, 27 Jan 2026 13:55:59 +0200
Message-ID: <26cacac5ee4549ae628983aa7fc07a9ed2bf3928.1769514879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769514879.git.jani.nikula@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
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

There's only a single user for kmstest_pipe_to_index(), and that should
be the extent of it. There's no reason for other code than the i915_pipe
debugfs parsing to convert from pipe name character to the enum
pipe. And for that, the name of the function is misleading anyway.

Inline the functionality in __intel_get_pipe_from_crtc_index(), using
igt_assert_f() for invalid values instead of propagating -EINVAL which
isn't even checked by the caller.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 24 ++++++------------------
 lib/igt_kms.h |  1 -
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a236597ac152..b033e0276801 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1065,22 +1065,6 @@ const char *kmstest_pipe_name(enum pipe pipe)
 	return str + (pipe * 2);
 }
 
-/**
- * kmstest_pipe_to_index:
- * @pipe: display pipe in string format
- *
- * Returns: Index to corresponding pipe
- */
-int kmstest_pipe_to_index(char pipe)
-{
-	int r = pipe - 'A';
-
-	if (r < 0 || r >= IGT_MAX_PIPES)
-		return -EINVAL;
-
-	return r;
-}
-
 /**
  * kmstest_plane_type_name:
  * @plane_type: display plane type
@@ -1322,7 +1306,7 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
 static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 {
 	char buf[2];
-	int debugfs_fd, res = 0;
+	int debugfs_fd, pipe, res = 0;
 	char pipe_char;
 
 	debugfs_fd = igt_debugfs_pipe_dir(fd, crtc_index, O_RDONLY);
@@ -1336,7 +1320,11 @@ static int __intel_get_pipe_from_crtc_index(int fd, int crtc_index)
 
 	igt_assert_eq(sscanf(buf, "%c", &pipe_char), 1);
 
-	return kmstest_pipe_to_index(pipe_char);
+	pipe = pipe_char - 'A';
+
+	igt_assert_f(pipe >= 0 && pipe < IGT_MAX_PIPES, "i915_pipe %c out of range\n", pipe_char);
+
+	return pipe;
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5bfcb53c0aaa..8d6a820856ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -90,7 +90,6 @@ enum pipe {
         IGT_MAX_PIPES
 };
 const char *kmstest_pipe_name(enum pipe pipe);
-int kmstest_pipe_to_index(char pipe);
 const char *kmstest_plane_type_name(int plane_type);
 
 enum port {
-- 
2.47.3

