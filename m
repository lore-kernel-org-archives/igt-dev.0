Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD98EC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AE110E89E;
	Thu,  5 Feb 2026 13:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFflayTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EA110E89E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298241; x=1801834241;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ckqeRA2gdJQWupXti4rE3D3VrMT5eLvwzulJH0iz7fM=;
 b=lFflayTFjk2HlZhGGh55ylXROO5i23gQNJe83LaRu8YWMW2Wx8+DJEKp
 ChPEP5qVCo9+zEsZwfOF4Lt2Sg3JKbq1w8KoMIc9Ghor+9g17MLgMtvWT
 A9PFzvt6u6zZWnDd450JiHrLo3tqnl4HC/+E+BOnJvZv14mui4w11mTRL
 2e4BPqEpPRHcFQ2sVzvhxQkxLo5nKg0jiRy9awKiDhSCnsjumB15A+1Vn
 YcybwstrnAsXquk9fSYtWFkOlvpPnHynBq3mPVCU3cCJ80Y/DDxKxTdnL
 VqRtyoqREARqG9Gwol1muHqzpXXdT1Gtd3AUqE7ph3LxMyYCS0IUcO6I3 w==;
X-CSE-ConnectionGUID: Y1gEpOHVQDyvg6ttRkvmCg==
X-CSE-MsgGUID: FEEmLq2kTPKJmalgLi4UXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693513"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:37 -0800
X-CSE-ConnectionGUID: R1LBHFquT1O72BZ/KcwQHA==
X-CSE-MsgGUID: LHvPmoIARCWv5ClWne+m5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499256"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/12] tests/kms: Use for_each_crtc() for inner loops
Date: Thu,  5 Feb 2026 15:30:11 +0200
Message-ID: <20260205133019.9161-5-ville.syrjala@linux.intel.com>
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

A few test cases use nested for_each_pipe() loops. Convert
the inner of the loops to use for_each_crtc() instead. The
outer loop will be converted later.

Done with cocci:
 #include "scripts/iterators.cocci"

@find@
iterator name for_each_pipe;
identifier PIPE1, PIPE2;
@@
 for_each_pipe(..., PIPE1) {
<+...
	for_each_pipe(..., PIPE2) {
		...
	}
...+>
}

@change depends on find@
iterator name for_each_pipe;
iterator name for_each_crtc;
identifier PIPE1, PIPE2;
expression DISPLAY;
@@
 for_each_pipe(..., PIPE1) {
<+...
-	for_each_pipe(DISPLAY, PIPE2) {
+	for_each_crtc(DISPLAY, crtc2) {
<...
(
- igt_crtc_for_pipe(..., PIPE2)
+ crtc2
|
- kmstest_pipe_name(PIPE2)
+ igt_crtc_name(crtc2)
|
- PIPE2
+ crtc2->pipe
)
...>
	}
...+>
}

@@
typedef igt_crtc_t;
identifier PIPE;
@@
{
...
(
+ igt_crtc_t *crtc2;
- enum pipe PIPE;
|
+ igt_crtc_t *crtc2;
- enum pipe PIPE = ...;
)
... when != PIPE
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c  | 18 +++++++++++-------
 tests/kms_plane_multiple.c | 19 ++++++++++++-------
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 317bc57f21a5..1bb4b483aafd 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -187,7 +187,8 @@ static void run_extendedmode_basic(data_t *data,
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
 static void run_extendedmode_test(data_t *data) {
-	enum pipe pipe1, pipe2;
+	igt_crtc_t *crtc2;
+	enum pipe pipe1;
 	bool sim_flag = igt_run_in_simulation();
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
@@ -197,11 +198,13 @@ static void run_extendedmode_test(data_t *data) {
 	for_each_pipe(display, pipe1) {
 		for_each_valid_output_on_pipe(display, pipe1, output1) {
 
-			for_each_pipe(display, pipe2) {
-				if (pipe1 == pipe2)
+			for_each_crtc(display, crtc2) {
+				if (pipe1 == crtc2->pipe)
 					continue;
 
-				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
+				for_each_valid_output_on_pipe_local(display,
+								    crtc2->pipe,
+								    output2) {
 					if (output1 == output2)
 						continue;
 
@@ -210,7 +213,7 @@ static void run_extendedmode_test(data_t *data) {
 					igt_output_set_crtc(output1,
 							    igt_crtc_for_pipe(output1->display, pipe1));
 					igt_output_set_crtc(output2,
-							    igt_crtc_for_pipe(output2->display, pipe2));
+							    crtc2);
 
 					if (!intel_pipe_output_combo_valid(display))
 						continue;
@@ -218,11 +221,12 @@ static void run_extendedmode_test(data_t *data) {
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
 						      kmstest_pipe_name(pipe1),
 						      igt_output_name(output1),
-						      kmstest_pipe_name(pipe2),
+						      igt_crtc_name(crtc2),
 						      igt_output_name(output2))
 						run_extendedmode_basic(data,
 								pipe1, output1,
-								pipe2, output2);
+								crtc2->pipe,
+								output2);
 				}
 			}
 			/*
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index e399f3ee270d..aeaf6bf514a9 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -511,7 +511,8 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 
 static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
-	enum pipe pipe1, pipe2;
+	igt_crtc_t *crtc2;
+	enum pipe pipe1;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
@@ -522,11 +523,13 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 
 	for_each_pipe(display, pipe1) {
 		for_each_valid_output_on_pipe(display, pipe1, output1) {
-			for_each_pipe(display, pipe2) {
-				if (pipe1 == pipe2)
+			for_each_crtc(display, crtc2) {
+				if (pipe1 == crtc2->pipe)
 					continue;
 
-				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
+				for_each_valid_output_on_pipe_local(display,
+								    crtc2->pipe,
+								    output2) {
 					if (output1 == output2)
 						continue;
 
@@ -535,15 +538,17 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 					igt_output_set_crtc(output1,
 							    igt_crtc_for_pipe(output1->display, pipe1));
 					igt_output_set_crtc(output2,
-							    igt_crtc_for_pipe(output2->display, pipe2));
+							    crtc2);
 
 					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
 						       kmstest_pipe_name(pipe1), output1->name,
-						       kmstest_pipe_name(pipe2), output2->name)
-						test_plane_position_2_display(data, pipe1, pipe2,
+						       igt_crtc_name(crtc2),
+						       output2->name)
+						test_plane_position_2_display(data, pipe1,
+									      crtc2->pipe,
 									      output1, output2,
 									      modifier);
 
-- 
2.52.0

