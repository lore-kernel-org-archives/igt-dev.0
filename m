Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9934B6E25D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 13:24:26 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Tue, 30 Jun 2020 16:24:19 +0300
Message-Id: <20200630132419.4091-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] igt/tests: Clear pipes properly in
 kms_atomic_transition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

There is an issue happening from time to time in kms_atomic_transition
(bug #1918). We periodically get assertion that some two outputs
attempt to use same pipe like this:

"Failed assertion: output->pending_pipe != b->pending_pipe"

After some investigation came to conclusion that this is happening
because we are calling igt_output_set_pipe(output, PIPE_NONE) only
for connected outputs, which is wrong.
Periodically igt_display_refresh/igt_output_refresh call calls can
update the output state to disconnected. However that doesn't clear
the pipe being assigned(i.e output->pending_pipe).
So this causes assertion to be triggered on next igt_display_refresh
called during commit.

Bugzilla: https://gitlab.freedesktop.org/drm/intel/-/issues/1918

v2: - Do not use for_each_valid_output_on_pipe as it also iterates
      only on connected outputs(Maarten)
    - Also fix run_modeset_tests function

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 tests/kms_atomic_transition.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 754a4969..656bd51e 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -664,9 +664,10 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
 	igt_output_t *output;
 	enum pipe pipe;
 	unsigned event_mask = 0;
+	int i;
 
-	for_each_connected_output(display, output)
-		igt_output_set_pipe(output, PIPE_NONE);
+	for (i = 0; i < display->n_outputs; i++)
+		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
 
 	for_each_pipe(display, pipe) {
 		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[pipe],
@@ -743,11 +744,12 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 	igt_output_t *output;
 	unsigned width = 0, height = 0;
 
+	for (i = 0; i < display->n_outputs; i++)
+		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
+
 	for_each_connected_output(display, output) {
 		drmModeModeInfo *mode = igt_output_get_mode(output);
 
-		igt_output_set_pipe(output, PIPE_NONE);
-
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 	}
-- 
2.24.1.485.gad05a3d8e5

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
