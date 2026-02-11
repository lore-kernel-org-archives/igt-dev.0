Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8AFECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE6E10E628;
	Wed, 11 Feb 2026 16:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtWg0Kqt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E976B10E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827665; x=1802363665;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=t4wAVcLsUoD5cZzwvgvURbVmjaPuOaNuYzlZMgFvaQQ=;
 b=gtWg0Kqt+7kbpfHwXwmPmMm6hZU+/XDdf11cvTxHCHfy0OArpYNQwdRe
 M6HvbK4H9s9LEfTFkfiwMbuVNW1w68Ms9UTLJc9ZlJf99jZgC7qa/E9mw
 KSjGq8WIMRntkRgkGTYXaCVhO+5uqKCHe2TpzFFAY5b2HnYyYWmCn6pel
 k8w7xFhi4ZhmG2zPOS6qEmQr3EQeXOPwOO6bHXB/b8YtA+cYsT7KCXtzV
 ITFx6kvhdYqh9dxv3yrX74T4xdV/0oT7RQs0FlBNZt7PZrWXmErIDzUyd
 L1yttunaPRgtd6ieyijF/fcRjS+QxRUcrb6spPF6mHfiJiClMHiXN32E8 A==;
X-CSE-ConnectionGUID: wajI+YBQRSq3PhagrH10mg==
X-CSE-MsgGUID: PkrjCYxaR/OuqTdnewHUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082171"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:25 -0800
X-CSE-ConnectionGUID: qflRwDQQSvmx4XSQF9HcNw==
X-CSE-MsgGUID: LFyBefngRYO+5t9AkrnOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405373"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/17] tests/intel/kms_busy: Use 'enum pipe' instead of
 'int'
Date: Wed, 11 Feb 2026 18:33:51 +0200
Message-ID: <20260211163404.2018-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Change the type of the 'pipe' function paramteres from
'int' to the more approproate 'enum pipe'. This will aid
in cocci based 'pipe' to 'crtc' conversion.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_busy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 2c8d365080e1..dd65585d41a2 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
 static bool all_pipes = false;
 
 static void
-set_fb_on_crtc(igt_display_t *dpy, int pipe,
+set_fb_on_crtc(igt_display_t *dpy, enum pipe pipe,
 	       igt_output_t *output, struct igt_fb *fb)
 {
 	drmModeModeInfoPtr mode;
@@ -106,7 +106,7 @@ static void do_cleanup_display(igt_display_t *dpy)
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-static void flip_to_fb(igt_display_t *dpy, int pipe,
+static void flip_to_fb(igt_display_t *dpy, enum pipe pipe,
 		       igt_output_t *output,
 		       struct igt_fb *fb, int timeout,
 		       const char *name, bool modeset)
@@ -172,7 +172,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	put_ahnd(ahnd);
 }
 
-static void test_flip(igt_display_t *dpy, int pipe,
+static void test_flip(igt_display_t *dpy, enum pipe pipe,
 		      igt_output_t *output, bool modeset)
 {
 	struct igt_fb fb[2];
-- 
2.52.0

