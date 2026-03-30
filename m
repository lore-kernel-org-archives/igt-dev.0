Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026BFF495C
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93310E4B5;
	Mon, 30 Mar 2026 07:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAclAU2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AB810E4BE
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774856206; x=1806392206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j/Blf1RyMs8vHUcAoZkb+a6pB4P3CxUw0ruaZWhzAiU=;
 b=RAclAU2nZ+C/crS7zfDRpxzk+BH0gGbG4coLGE0gcaHCAcgDBUV2RiIe
 ifh5leXMrYKaAw9cB4pQMLxch22BNxLF3VCvtMTC4bkvlqD25e8k0jg7v
 cVfrkAevfC8lseklEpdDNtogr/0L9U3pDx7Q6xtYNXzLka0V9FYiOSMdG
 nwfe4XvVhMoOcuSBof/6rCpst9doY/h4GM0XPAQZmY7Zac15mD9BTK4w2
 66PyhYttXCKOYtS+ghSfBPXCaEmL3DhjX/rfkgff7kyBSSnkInn+P+DKQ
 So/e1+ShC33yi1S/EQ1gfP+eABiHEFk+JkyqoPHT9TwAGyIMkctft/ehO Q==;
X-CSE-ConnectionGUID: 5N4pt7OdTCuSU0Y98u/pUg==
X-CSE-MsgGUID: 73B+OpaGRrOkYMd/nspC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79744453"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79744453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:45 -0700
X-CSE-ConnectionGUID: Ed3GuRCrRsuU3UuWKo7jBw==
X-CSE-MsgGUID: MkZ45olhTe+Jq5NOSCV4ag==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 2/3] lib/kms: use a for_each_crtc() loop in
 igt_crtc_for_pipe()
Date: Mon, 30 Mar 2026 10:36:29 +0300
Message-ID: <e4e1c25c35d8e15c141fcf513692eefc47eeb7d9.1774856079.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774856079.git.jani.nikula@intel.com>
References: <cover.1774856079.git.jani.nikula@intel.com>
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

Similar to igt_crtc_for_crtc_id() and igt_crtc_for_crtc_index(), use a
loop for finding the CRTC for the pipe. This is an alternative way to
ensure only valid pipes are returned, and stops indexing
display->crtcs[] with pipe. This not only prepares for only storing
valid CRTCs in the array, but also avoids buffer overflows for too large
pipe values.

Also do away with the explicit pipe == PIPE_NONE check. The remaining
calls are unlikely to ever pass it in, and it's taken care of with the
loop.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e1bb81fce80a..558a366f29b4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8082,12 +8082,12 @@ igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
 {
 	igt_crtc_t *crtc;
 
-	if (pipe == PIPE_NONE)
-		return NULL;
-
-	crtc = &display->crtcs[pipe];
+	for_each_crtc(display, crtc) {
+		if (crtc->pipe == pipe)
+			return crtc;
+	}
 
-	return crtc->valid ? crtc : NULL;
+	return NULL;
 }
 
 /*
-- 
2.47.3

