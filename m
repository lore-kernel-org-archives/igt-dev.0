Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB34C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 05:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3487610EEAC;
	Wed, 27 Mar 2024 05:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iM02E0Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C410710ED34
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711518490; x=1743054490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6iGikvWSIMYrgldNGZFdvidY0Yr/5XWGsV7XOXF5M5s=;
 b=iM02E0Gp56TjL7tl7jwj/l8eRQqaHCWma4EH8L+CnGzTCX20ylwvJ+gl
 zMPfTzuwDePa9f9ttcDgiKnVP0SDRDNF2AQvYfP//+xqYzkRfqUo1pA4+
 6QaNMV0CsY0xMhGoneibF/rM7gnme7GZ1GIBTiYRW3m0ROk/YUdCX8JXs
 QBwr+UPIjRZvjuRquH1iToeGdNaMSwJXVY/wk8YpaCoWn6XK4EmjPyWnC
 t/nMnZT+Rk0/NJZBIUwztEfKFZurt2TdsVarGh+imrHkbbGNi2+wE9yDt
 0tMtC/uKhRShG6+v4eeWVkvnfKe/m5jEb0WvVSxWDK/kOr3FYjGOejo0H A==;
X-CSE-ConnectionGUID: GUt+ay5WTt6T7K2yZWMV8w==
X-CSE-MsgGUID: +QD3WEWgSDuxGcr7wAJSQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6710546"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6710546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 22:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="16569664"
Received: from andrea7x-mobl2.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.39.156])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 22:48:08 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_fbt: Skip fbcpsr tests on
 Wa_14016291713
Date: Wed, 27 Mar 2024 07:47:49 +0200
Message-Id: <20240327054750.159017-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Wa_1401629171 is disabling FBC if PSR is enabled. Check this from FBC
debugfs interface and skip current test if FBC is disabled due to
Wa_14016291713.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9525
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index db2db0ff1..6d5395a0c 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2025,6 +2025,14 @@ static bool fbc_mode_too_large(void)
 	return strstr(buf, "FBC disabled: mode too large for compression\n");
 }
 
+static bool fbc_psr_not_possible(void)
+{
+	char buf[128];
+
+	debugfs_read_crtc("i915_fbc_status", buf);
+	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
+}
+
 static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
 {
 	char buf[PATH_MAX];
@@ -2699,6 +2707,7 @@ static void do_status_assertions(int flags)
 		igt_require(!fbc_not_enough_stolen());
 		igt_require(!fbc_stride_not_supported());
 		igt_require(!fbc_mode_too_large());
+		igt_require(!fbc_psr_not_possible());
 		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
 			igt_assert_f(intel_fbc_is_enabled(drm.fd,
 						    prim_mode_params.pipe,
-- 
2.34.1

