Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0401DD49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36AC10E9BF;
	Fri, 30 Jan 2026 10:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egfep+FX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5819210E9BF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770417; x=1801306417;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lCsND7RNy0uvKQP7Z8+H0BRHy05d2fqO5Rxux3ujzXY=;
 b=egfep+FXm3Q893J0/VIKz9XZf3RH7RAZh6/KgAhjai+UeX7dmLbjIz6B
 3kEZlnL1tup1DuseoVP+BwS8l4NHySQK9+DQpjfduwbZrYnEosHFdz8cd
 I6f/qZn0JGudp0I6fOq6VOsyQiusICdSLWtJW0LtGTFo31X9VY7w8dSjW
 Ep25RgVQ3nONa1acv5CBKs5mP9WWn7bw1QitqvQ4M4ERB369xi93SLpJO
 0/jw38U0Z28PXgbWkVJCFJHcxw5zGCcFLxhpNt1dv3aHgTDJY0An6JkwX
 kFrpNPi6Zygy1LUrsd9nlDK1KIfsWcUc1uqfTvMJqnzf1f6pE/qyTKkS1 Q==;
X-CSE-ConnectionGUID: QVqPGZLaQCCmsdiesAvAag==
X-CSE-MsgGUID: s1KPuIJxTPe2SqwO5xqPXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653047"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:37 -0800
X-CSE-ConnectionGUID: Y4zt68EnRMasbdseMHJ+DA==
X-CSE-MsgGUID: +/vhxwrfSEe2XA9HU2bawg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826874"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/15] lib/kms: Use for_each_crtc_with_valid_output(),
 part 3
Date: Fri, 30 Jan 2026 12:52:35 +0200
Message-ID: <20260130105237.14481-14-ville.syrjala@linux.intel.com>
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

Convert some uses of for_each_pipe_with_valid_output()
to for_each_crtc_with_valid_output(). Take care of the
cases where we (presumably) still have to keep some
kind of 'pipe' pointer thingy still up to date.

Eventually we should probably replace the pipe pointer
with a crtc pointer but I didn't want to go that far here.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe_with_valid_output;
iterator name for_each_crtc_with_valid_output;
typedef igt_crtc_t;
enum pipe *PIPE;
expression DISPLAY, OUTPUT;
@@
- for_each_pipe_with_valid_output(DISPLAY, *PIPE, OUTPUT)
+ for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
{
+ *PIPE = crtc->pipe;
<...
(
- igt_crtc_for_pipe(..., *PIPE)
+ crtc
|
- kmstest_pipe_name(*PIPE)
+ igt_crtc_name(crtc)
|
- *PIPE
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
for_each_crtc_with_valid_output(...) { ... }
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_prime.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index f51c463211f4..7b13e9f538e1 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -118,14 +118,16 @@ static bool has_prime_export(int fd)
 static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 				   enum pipe *pipe)
 {
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	bool found = false;
 
-	for_each_pipe_with_valid_output(display, *pipe, output) {
+	for_each_crtc_with_valid_output(display, crtc, output) {
+		*pipe = crtc->pipe;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, *pipe));
+				    crtc);
 		if (intel_pipe_output_combo_valid(display)) {
 			found = true;
 			break;
-- 
2.52.0

