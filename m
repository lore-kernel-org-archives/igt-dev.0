Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DDCD58CD0
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DA410E3C7;
	Mon, 23 Mar 2026 05:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+Myg4sC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89CD10E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774242008; x=1805778008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xtasMQeWmtU7ERZ9sSyN/6M3K6v2QRgGLFuXSbEd+08=;
 b=f+Myg4sCCo4ibUYtf/IpxhsPY+hjIxkLOo5wKcM3N2cJwGjzedA2m5fe
 HKPKBWT0DPCZ0m02Bs3lmaQp09G1mLTd03EMdrHd32rp03UDRTvyGou9A
 LEyyLUXN08vgLFVYDmKk4uI3JBjfN/O2bpZ3qiky1RQrK9eQ5F3VwmFAe
 d02sU7MIoAsZJ8ZmznlmmTyzdy5wddSZPwlbm9xTnUxRAqpeSQLVe620s
 67GSK7VR/chsRniXvFbCpRNxW3QTVBBfM4In7wEgQvnHvWcZxhYLdgW8l
 QINIggqOSeIw72AFUDGeSzT6a3IJedFf3HuCU7040qiwEH5FRPXh5e1v/ Q==;
X-CSE-ConnectionGUID: kWeabeicQp2Z3dayTdKysQ==
X-CSE-MsgGUID: uTXxJNbhRqSJf9CZ+pqcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100687852"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="100687852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:00:08 -0700
X-CSE-ConnectionGUID: 96dPkYY2Q1KT0fQGt1N1Iw==
X-CSE-MsgGUID: jGYHgWsOQPmjFmEmzkKtWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219124950"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2026 22:00:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Make helper use out-parameter
Date: Mon, 23 Mar 2026 10:40:48 +0530
Message-Id: <20260323051049.2627387-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323051049.2627387-1-pranay.samala@intel.com>
References: <20260323051049.2627387-1-pranay.samala@intel.com>
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

Convert igt_get_non_joiner_mode() helper from returning a mode
pointer to returning bool and filling an output parameter.

Returning connector-owned pointer becomes invalid after connecter
state changes/resets. Hence copying into called-owned argument,
which keeps data stable and safe.
Also update the doc for the new argument and return semantics.

Fixes: e404926ca0d7 ("lib/igt_kms: Add helper to get non-joiner mode")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 10 ++++++----
 lib/igt_kms.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 197ed15d1..118890014 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7057,13 +7057,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
  * igt_get_non_joiner_mode:
  * @drm_fd: drm file descriptor
  * @output: pointer to the output structure
+ * @mode: a pointer to a drm mode structure
  *
  * Finds the display mode from the output that does not require
  * Big Joiner or Ultra Joiner.
  *
- * Returns: Pointer to non-joiner mode, or NULL if not found.
+ * Returns: True if non-joiner mode found.
  */
-drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
+bool igt_get_non_joiner_mode(int drm_fd, igt_output_t *output, drmModeModeInfo *mode)
 {
 	drmModeConnector *connector;
 	int max_dotclock;
@@ -7077,11 +7078,12 @@ drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
 		/* Check if mode requires joiner */
 		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
 		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
-			return current_mode;
+			*mode = *current_mode;
+			return true;
 		}
 	}
 
-	return NULL;
+	return false;
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 71ed4604e..d63836588 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1259,7 +1259,7 @@ bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
-drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
+bool igt_get_non_joiner_mode(int drm_fd, igt_output_t *output, drmModeModeInfo *mode);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
-- 
2.34.1

