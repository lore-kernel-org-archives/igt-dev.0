Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB632EF9014
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD6810E29D;
	Thu,  5 Mar 2026 13:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2cW2Rpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64C110E29D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718061; x=1804254061;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MA8PyPZhrl361Om80rh7p8atI9hhdY22/uQK+SdEB1E=;
 b=h2cW2RpvMGD2Yo7QhJp/4HAbwgcHw2m2H/aVQSJA8YVvXJ2vfs3JmSYq
 N+doIDhR6njwEslrPw7qizT4Iqmj8yBzqE4fYTXJpY8qShnWFZQgLQ4y0
 xWZ8mOP9XLNvUnEx5UpwGCQWfafm3KFKl6q38dIChCOl8WfJaMA4v7xVE
 FMq/QITL+hLtVaW40InDkb7oR9JmWPbY1plcsHZNCUery/cllWkOnmX/d
 T2IXwwsEyQY7RBteVGPDC5XgafmrC3zV6TrJNLOGoH0vGdH6CFUJQqTXV
 nJuWYjdbFyYe3nrt0QjDq918PFa2BzfrzHW3+yb9fnSZLug2ZNigNRvl+ g==;
X-CSE-ConnectionGUID: 5Qd6U4v4RMSPJdn1MgpvQw==
X-CSE-MsgGUID: icGIBJiZTae2sXKba1kfoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76404992"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76404992"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:41:01 -0800
X-CSE-ConnectionGUID: VKumVifFSOqjEPI+cy3tkg==
X-CSE-MsgGUID: GjECsVO7Tu+SYYFvrDFAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218641256"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] lib/kms: Make igt_first_crtc() skip if no CRTCs are
 around
Date: Thu,  5 Mar 2026 15:40:37 +0200
Message-ID: <20260305134038.6995-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
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

Everyone using igt_first_crtc() really needs a CRTC, and thus
we should just skip if none are around.

Most of the callers neglected to even require the non-NULL
CRTC, but I think all of the do want a CRTC.

Maybe igt_display_require() should even require at least one
CRTC, but let's do this one small step at a time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c       | 2 ++
 tests/nouveau_crc.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ebf77b74d04..a9673a9a6565 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7996,6 +7996,8 @@ igt_crtc_t *igt_first_crtc(igt_display_t *display)
 	for_each_crtc(display, crtc)
 		return crtc;
 
+	igt_skip("No CRTCs on device\n");
+
 	return NULL;
 }
 
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index b71aac45bb79..cad7edc38f20 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -402,7 +402,6 @@ int igt_main()
 		     "is reset to its default value after a single capture.");
 	igt_subtest("ctx-flip-threshold-reset-after-capture") {
 		data.crtc = igt_first_crtc(&data.display);
-		igt_require(data.crtc);
 
 		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
 	}
-- 
2.52.0

