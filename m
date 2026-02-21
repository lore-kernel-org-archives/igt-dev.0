Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B589DC5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A810E109;
	Sat, 21 Feb 2026 03:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xge/AV5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC310E109
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644038; x=1803180038;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ijW+hgG3oIKHi/vfI6z24uvZ8GbdUADtoUHp1I9dOWA=;
 b=Xge/AV5PL8mqz3mmDsAGP+n5MFN7hZBjc6jRcx+R2kCZZ3sNsFlNT/sM
 S2/eZlvFcAN8BRs++bPp6ogBxxXO2HlcRBSkMaUGTWov4NMFYz7vPCEGx
 ENCZzVmSMQWoVGxDJ8d9h4nq/JdtGI81G5PEWAFBm1ABNkZ2n354PkiSa
 4dJ+UqAko8C4dMNaWAJGVv3/nDjTLobrGVT2g2PDpGd89HDzMyc7ClkWd
 k/oO2bR8820l5xswXFo3QVo19wUiaiMKH4Gh7450eFfiX0Hnud+dC7+T8
 48ebkk0rRYBorYTmqWMCnHM/ke71ULWjeZi1JPWGukfl7frevX2jyC/SA g==;
X-CSE-ConnectionGUID: 9BPjzmEpQiWyk1ZyLncLTA==
X-CSE-MsgGUID: m675e/pIQ32BJ0gi8wCrWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75345762"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="75345762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:38 -0800
X-CSE-ConnectionGUID: rUW95ejGSYC1TuLYDPIYRg==
X-CSE-MsgGUID: i3Uw3gj7SomF7J29xtofXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252720246"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:20:35 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 07/23] lib/kms: Add igt_crtc_for_crtc_id()
Date: Sat, 21 Feb 2026 05:19:46 +0200
Message-ID: <20260221032003.30936-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

