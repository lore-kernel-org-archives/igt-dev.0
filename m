Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E67EC1EB5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F76A10E8A6;
	Thu,  5 Feb 2026 13:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnoQtHYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBD210E8A6
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298259; x=1801834259;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rQHTvQsudAJ4pUxFTDd/ga95FNLSs7LSQGZ6Jb1B4cA=;
 b=lnoQtHYnqFFz4QUkaFGvrJ6bHpAObaViagPYC/muGci6QfdhQwN0RX5U
 PXExga5q5VhQSrxj/1aN4uKbcn0iqHv6upR6mqBGMwQFNYhFV2FMkRW8X
 ahMR21ZV9FItxy7L+UTvPeApz2eb2gChUpz8CLLVGp2dzo7XtiDd7Yyn1
 K1uNCVsdRMX9LRE+2lutOctv+Z5laI2c/zM9VyGTf4WLYSN7KVWWJ6/Nv
 KiozBuMew7l9pmq2EWLMhHszJjRxghXdTvIfLhWIIzi2vD3zF6Zfsow93
 W2S+NB5+xIanKJeZA4qWjQJx+oq5PAXG/yBVWKdbCmHaUwP9HpEOqBKbe Q==;
X-CSE-ConnectionGUID: +muA94uWSKiP/bWcLEIlqA==
X-CSE-MsgGUID: XM24aM6NRumfsmwss1mMOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693537"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:59 -0800
X-CSE-ConnectionGUID: AJ7GnW/DSrW2jXZErhRvOA==
X-CSE-MsgGUID: TPCpzwrRQviPQ0yf7v+dYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499313"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:57 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/12] tests/kms: Convert to for_each_crtc(), part 5
Date: Thu,  5 Feb 2026 15:30:17 +0200
Message-ID: <20260205133019.9161-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc(). Deal
with the special case where we use the iterator variable
after breaking out from the loop.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
iterator name for_each_pipe;
iterator name for_each_crtc;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY;
@@
- enum pipe PIPE;
+ igt_crtc_t *crtc;
<+...
- for_each_pipe(DISPLAY, PIPE)
+ for_each_crtc(DISPLAY, crtc)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}
...+>
- return PIPE;
+ return crtc->pipe;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_legacy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index da7225c45e65..717a31f4fa64 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -425,7 +425,7 @@ static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
 static enum pipe
 find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	bool first_output = false;
 	bool found = false;
 
@@ -437,13 +437,13 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	/* Clear display, events will be eaten by commit.. */
 	igt_display_reset(display);
 
-	for_each_pipe(display, pipe) {
-		for_each_valid_output_on_pipe(display, pipe, *output) {
+	for_each_crtc(display, crtc) {
+		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
 			if (igt_output_get_driving_crtc(*output) != NULL)
 				continue;
 
 			igt_output_set_crtc(*output,
-					    igt_crtc_for_pipe((*output)->display, pipe));
+					    crtc);
 			if (intel_pipe_output_combo_valid(display)) {
 				found = true;
 
@@ -466,7 +466,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	else
 		igt_require_f(found, "No valid outputs found\n");
 
-	return pipe;
+	return crtc->pipe;
 }
 
 static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool atomic, struct igt_fb *fb, void *data)
-- 
2.52.0

