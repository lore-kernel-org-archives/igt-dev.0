Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8181AC55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3111710E7C3;
	Fri, 20 Feb 2026 14:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAymUxqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1610E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596127; x=1803132127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ylM7sJ6u472v46OWodCoXmRERhx9S2aH64KcRWcBQB8=;
 b=ZAymUxqd+ri91mWQ1qoop2S5NNFWnDPrNGb7HPYleuKb4VdO1ddv0qYG
 wOQb86Q2ow2cLjfyi+Vo5/gqn4QWl1sVbAhcX+GAMFzhVl0I2wT6iMHDm
 peg/c4GdsDbWcwgtfPy6ZSAMspIBstdfjJJMP4hlY8RxZ9heDEpEMbg0C
 cMALwGwW4O/tmTj1l49snixYllDgV9UQCH20eAdElF7Q0iV4tRWzd0aOW
 bA7ouDbuTuETJBoThoij1y9+o3YMVq316KVobSO60Gs/3/cwfteqUsRd0
 jQ3xnxwbMLYiDY7gXu0LSUZB6ulT958MqWtIzBfbBHwEd7hxu0Bb0fQ7n A==;
X-CSE-ConnectionGUID: qCsnJm/pSJyDi1O46mt87Q==
X-CSE-MsgGUID: FQVEjh/HQGar62K7cTW++A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83007003"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83007003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:07 -0800
X-CSE-ConnectionGUID: PFfqCYHTRGCaOB5+yejUaA==
X-CSE-MsgGUID: RvSB1btUQZ+gaET1kDArlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973640"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:06 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 02/21] tests/kms_concurrent: Actually run the test over
 all connected crtcs
Date: Fri, 20 Feb 2026 16:01:34 +0200
Message-ID: <20260220140154.4138-3-ville.syrjala@linux.intel.com>
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

Currently kms_concurrent uses for_each_valid_output_on_pipe() with an
uninitialized pipe (meaning it probably contains stack garbage). The
actual intention seems to have been to use
for_each_pipe_with_valid_output(). It's even mentioned in the offending
commit message, but the actual code was never changed to match.

We no longer have for_each_pipe_with_valid_output() so we have to switch
over to for_each_crtc_with_valid_output(), which also means we end up
doing the pipe->crtc conversion in one go.

 #include "scripts/iterators.cocci"

@@
iterator name for_each_valid_output_on_pipe;
iterator name for_each_crtc_with_valid_output;
expression DISPLAY, OUTPUT;
identifier PIPE;
type T;
@@
- T PIPE;
+ igt_crtc_t *crtc;
<+... when != PIPE = ...
- for_each_valid_output_on_pipe(DISPLAY, PIPE, OUTPUT)
+ for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
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

@@
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Fixes: 6958319123d9 ("tests/kms_concurrent: remove pipe dependency in subtest name")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_concurrent.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index bbc988aa2000..f31992a514a0 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -344,24 +344,24 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 static void
 run_tests_for_pipe(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
 		     "resolution.");
 	igt_subtest_with_dynamic("multi-plane-atomic-lowres") {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		for_each_crtc_with_valid_output(&data->display, crtc, output) {
 			igt_display_reset(&data->display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(display, pipe));
+					    crtc);
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
-			igt_require(igt_crtc_for_pipe(display, pipe)->n_planes > 0);
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_test(data, pipe, output);
+			igt_require(crtc->n_planes > 0);
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      igt_output_name(output))
+				run_test(data, crtc->pipe, output);
 		}
 	}
 }
-- 
2.52.0

