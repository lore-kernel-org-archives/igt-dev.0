Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF0C61DBD
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 18:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91810E16D;
	Tue, 25 Aug 2026 18:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+q4ma3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2910E12B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787682835; x=1819218835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dAH1TTrmDtkRTxtmGn09Dalf5Q/kbEWCnww/YXNfLXE=;
 b=h+q4ma3ZGqYPYaVy44YIPH2XZ20ZcPxcuP/fY1h58rTCFum5fNKyGJsN
 +h4c5BKhfWZYK4mTpUxV5XKlf/EZH8S5rd53Gw0Fdn+o5i3fSmnoFv6Lo
 BgbzsAVk5qAslpjj7YnSerrx2U+sIrmTpH/YT3iQFwRgMBYU3vrEM3Ew7
 qQrOoHu69qWzqsvKsD3Uk0CMa4q/PFDLERUmfB93SrXA/xX6oWhD1a4V1
 DfvUjNhwPiuh5BYpnRvgEw3nuVcbiEVsXa/Sxb3evmEc9/Csw91cHdXH2
 KEuUc+jUBY+X65t+DaW3fjwUv/tG57NkqiGksKbEhE5ZxD8Ba8rz20smK w==;
X-CSE-ConnectionGUID: GryEtEE3T9O6r/4HLFkLFg==
X-CSE-MsgGUID: mlN/FqI8T8GvbYHu2t8uGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="113695208"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="113695208"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:33:55 -0700
X-CSE-ConnectionGUID: yTnyLKRgSQ2lmCwuvPOWag==
X-CSE-MsgGUID: RuqZmUWvQdKZqH1CG+Uemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270848944"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 11:33:54 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to return vblank
 timestamp and sequence
Date: Wed, 26 Aug 2026 00:03:56 +0530
Message-ID: <20260825183359.2791891-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
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

Add a utility that waits for the next vertical blanking interval on a
specified CRTC and returns the timestamp and sequence number reported
by the kernel for that event.

Several tests need access not only to vblank synchronization but also
to the exact timing information associated with the completed vblank.
Having a common helper avoids repeating the same wait and timestamp
extraction.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 25 +++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 42cc7c3bd..cd4783db9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5876,6 +5876,31 @@ void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
 	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_index, count) == 0);
 }
 
+/**
+ * igt_wait_for_vblank_ts_seq:
+ * @crtc: the CRTC.
+ * @ts_ns: returns the vblank timestamp in nanoseconds.
+ * @seq: returns the vblank sequence number.
+ *
+ * Waits for the next vertical blank interval on @crtc and hands back the
+ * timestamp and the sequence number.
+ */
+void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq)
+{
+	drmVBlank wait_vbl = {
+		.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc),
+		.request.sequence = 1,
+	};
+
+	do_or_die(drmWaitVBlank(crtc->display->drm_fd, &wait_vbl));
+
+	if (ts_ns)
+		*ts_ns = wait_vbl.reply.tval_sec * NSEC_PER_SEC +
+			 wait_vbl.reply.tval_usec * NSEC_PER_USEC;
+	if (seq)
+		*seq = wait_vbl.reply.sequence;
+}
+
 /**
  * igt_wait_for_vblank:
  * @drm_fd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8d4d14847..8d1928af6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -652,6 +652,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
 const char *igt_plane_rotation_name(igt_rotation_t rotation);
 
 void igt_wait_for_vblank(igt_crtc_t *crtc);
+void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int *seq);
 void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);
 
 /**
-- 
2.43.0

