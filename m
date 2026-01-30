Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0888D61037
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8481510E9BB;
	Fri, 30 Jan 2026 10:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz2HHrZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E10610E9BB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770397; x=1801306397;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o1NExbrw/IIuMwk/V0ozfpplZrpFVx2rZB32RE0Al7Y=;
 b=Vz2HHrZwdHNDkGwD1oIVaKrowh2B2U2oP3gWEIo58b34RYksJp6HFDW7
 zP9Jhz5lzUTjSwO8qocSWKMxCPPleTCF9wiOeQJ/PcnSYMiTy+/9PeAZG
 BjUlDvx9sv/JknBAfVwXoe4hIih3qNn5mBoNOU/lZXS2vICVNlFmrhE4B
 tY1SOA2DB0uo2wOjKTdt8ilozRb5RchQ311GA3y35VVqEAnkkxPmQB5kv
 VeY1C/lsuRKgfiIL92OFT0+QWKzVNKxzNwt7QktROSpIqiTqPAOUSEVZa
 arzTg7op5O2UXnNvpztw0yO1xu2kat/KgAGlQ9sdBeJv6JBYbPY9BPUY2 Q==;
X-CSE-ConnectionGUID: jct7ChNCTXSiNRu/9hCtyA==
X-CSE-MsgGUID: wbKMCiT4SWCeQlwmPle2PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653023"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:17 -0800
X-CSE-ConnectionGUID: hIRtv29rQMiO0Jv8pqW/yA==
X-CSE-MsgGUID: BwSwp4mrSYm+FJ/C/Pw6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826813"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:16 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/15] lib/kms: Use for_each_crtc_with_single_output(),
 part 1
Date: Fri, 30 Jan 2026 12:52:30 +0200
Message-ID: <20260130105237.14481-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

Convert some uses of for_each_pipe_with_single_output()
to for_each_crtc_with_single_output(). Take care of the
cases where we (presumably) still have to keep some
kind of 'data.pipe' thingy still up to date.

Eventually we should probably replace 'data.pipe' with
'data.crtc' but I didn't want to go that far here.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe_with_single_output;
iterator name for_each_crtc_with_single_output;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY, OUTPUT, X;
@@
- for_each_pipe_with_single_output(DISPLAY, X.PIPE, OUTPUT)
+ for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
{
+ X.PIPE = crtc->pipe;
<...
(
- igt_crtc_for_pipe(..., X.PIPE)
+ crtc
|
- kmstest_pipe_name(X.PIPE)
+ igt_crtc_name(crtc)
|
- X.PIPE
+ crtc->pipe
)
...>
}

@depends on change@
identifier FUNC;
@@
FUNC(...)
{
+ igt_crtc_t *crtc;
<+...
for_each_crtc_with_single_output(...) { ... }
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_edge_walk.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index eaf4c59b8a19..86577fbc53d8 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -344,6 +344,7 @@ static const char *help_str =
 
 int igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
+	igt_crtc_t *crtc;
 	struct {
 		const char *name;
 		unsigned flags;
@@ -394,21 +395,24 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 					data.curw, data.curh, tests[i].name);
 			igt_subtest_with_dynamic_f("%dx%d-%s", data.curw,
 						   data.curh, tests[i].name) {
-				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
-					if (!extended && data.pipe != active_pipes[0] &&
-					    data.pipe != active_pipes[last_pipe])
+				for_each_crtc_with_single_output(&data.display,
+								 crtc,
+								 data.output) {
+					data.pipe = crtc->pipe;
+					if (!extended && crtc->pipe != active_pipes[0] &&
+					    crtc->pipe != active_pipes[last_pipe])
 						continue;
 
 					igt_display_reset(&data.display);
 					igt_output_set_crtc(data.output,
-							    igt_crtc_for_pipe(data.output->display, data.pipe));
+							    crtc);
 					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					igt_output_set_crtc(data.output, NULL);
 
 					igt_dynamic_f("pipe-%s-%s",
-						      kmstest_pipe_name(data.pipe),
+						      igt_crtc_name(crtc),
 						      data.output->name)
 						test_crtc(&data, tests[i].flags);
 				}
-- 
2.52.0

