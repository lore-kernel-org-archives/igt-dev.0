Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B7FCA5FAF
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC2A10E63E;
	Tue, 20 Jan 2026 17:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCVZ719P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E51410E63E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929455; x=1800465455;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ViPaj5hr487/QAJtqJ2fnb2n34zHAu58oBpIlL19Ik8=;
 b=BCVZ719P66BKRW6TEfQ0EDW/1eEqS6gKZrATJx6Tj4ZCyvt6gBhBcZu/
 soA5M4Ulz8hv7cVwEHtN2biQ7LBUdYYJcqwcqE4ga1bb9Ji0GBpUmvcUE
 EshR7dkEGya6OroTcsVmXTPvokbh+uu/JStbOQfTd0ODxV8FWWOCo+xO4
 snY7cO6Bf6rVWQxTDhfGXIFTRjmeK3lLiAs7X0DHc4kB/ci08sthT/ATS
 E8O5Wonee3INgnRtVLfOHmzxGbO/t3L1tqKtgTVrrXd1ghfraaM6h1VDW
 ofmchKeAxkwz25dnmaRP3a/7+vjfoWtXIHy3uGDXqYL74HVRkhege+huF w==;
X-CSE-ConnectionGUID: memDpRu7TxuFph4OBz1Rhg==
X-CSE-MsgGUID: 2T+QEkmhRpK5TRPGFcSPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81519245"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81519245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:34 -0800
X-CSE-ConnectionGUID: vIBL0B9KR8WYN3HP1zqkJQ==
X-CSE-MsgGUID: PA3NWxPvTDmWMsdnzjM3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205798502"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/12] lib/kms: Add igt_crtc_t based CRC wrappers
Date: Tue, 20 Jan 2026 19:16:51 +0200
Message-ID: <20260120171656.15840-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add wrappers for igt_pipe_crc_new*() that take igt_crtc_t rather
than the bare crtc index. Should help eliminate the pipe usage
from tests.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 14 ++++++++++++++
 lib/igt_kms.h |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 74ad82d77dd3..901bbfab5934 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -59,6 +59,7 @@
 #include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
+#include "igt_pipe_crc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -5299,6 +5300,19 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
 		return 60;
 }
 
+igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source)
+{
+	return igt_pipe_crc_new(crtc->display->drm_fd, crtc->crtc_offset,
+				source);
+}
+
+igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source)
+{
+	return igt_pipe_crc_new_nonblock(crtc->display->drm_fd,
+					 crtc->crtc_offset,
+					 source);
+}
+
 static const char *igt_crtc_name(igt_crtc_t *crtc)
 {
 	if (crtc == NULL)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 71a2f2c4d89c..b291673c2f7f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -584,6 +584,10 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 	return &display->pipes[pipe];
 }
 
+typedef struct _igt_pipe_crc igt_pipe_crc_t;
+igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
+igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
+
 const char *igt_output_name(igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
-- 
2.52.0

