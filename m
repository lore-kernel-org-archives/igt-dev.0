Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2504C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673510E7DD;
	Fri, 20 Feb 2026 14:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmYYtmtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889710E7DD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596140; x=1803132140;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ijW+hgG3oIKHi/vfI6z24uvZ8GbdUADtoUHp1I9dOWA=;
 b=bmYYtmtG3fvaoTiLS3XiB/SP8cbsyDB9dgQ1/AxtDevUivbumS/Q88C7
 Gar02R+oxI71AxENrk3BHLYtybOJqY3OQH6FDMBwKI775HgqrIgSFBPcn
 yQ0NsM/P3//8HIqO9k+ZIkkwzueY2WXHB4SeOJtvZvNsjLHIJETdXGCkR
 AVf/ZJ+wjTgJQJykW7zQP0noq8W61fATSkbZT4BEEVB4FjfxTpph3d7i9
 CrD12B4A7f22dATnzmIRLQEqh/Q7zKAheLEOWQiJtubWesM16rFq292d0
 5i1Uxgv+HKhzlbW9dEhp3oxfJNQOcGKHZRxfc4QB1YhA8LS5vZH8oPKtR w==;
X-CSE-ConnectionGUID: AAhbBXzlR6um4XoAulC1wg==
X-CSE-MsgGUID: 3ZYsLDFiRj6ggUSi4rjaYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83007017"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83007017"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:20 -0800
X-CSE-ConnectionGUID: ZtCvE8qCQMuI2mOK/MJoBQ==
X-CSE-MsgGUID: o5U6G6qdREiVaYBxh3LNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973681"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/21] lib/kms: Add igt_crtc_for_crtc_id()
Date: Fri, 20 Feb 2026 16:01:37 +0200
Message-ID: <20260220140154.4138-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Introduce igt_crtc_for_crtc_id() as a helper to return the
appropriate igt_crtc_t* for a given KMS CRTC ID. This will
be useful for kms_lease which will need to match the CRTCs
between the lessor and lessee (each has a different view of
the same KMS objects, and thus also different igt_display_t).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 12 ++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5c48796040a2..bec96f2677ad 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7952,3 +7952,15 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
 }
+
+igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_id == crtc_id)
+			return crtc;
+	}
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dedc3f88055b..5a2dd87b509f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -582,6 +582,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 
 	return &display->crtcs[pipe];
 }
+igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 
 typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
-- 
2.52.0

