Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2952398CA4
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:46 +0530
Message-Id: <20220814180908.2553394-30-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 29/51] tests/kms_properties: Add support for
 Bigjoiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_properties.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index dd5a93aa..a9c2b7df 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -241,6 +241,12 @@ static void plane_properties(igt_display_t *display, bool atomic)
 		found = false;
 
 		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(display))
+				continue;
+
 			found_any = found = true;
 
 			run_plane_property_tests(display, pipe, output, atomic);
@@ -264,6 +270,12 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 		found = false;
 
 		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(display))
+				continue;
+
 			found_any_valid_pipe = found = true;
 
 			run_crtc_property_tests(display, pipe, output, atomic);
@@ -290,6 +302,12 @@ static void connector_properties(igt_display_t *display, bool atomic)
 			if (!igt_pipe_connector_valid(pipe, output))
 				continue;
 
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!igt_test_constraint(display))
+				continue;
+
 			found = true;
 			run_connector_property_tests(display, pipe, output, atomic);
 			break;
-- 
2.35.1
