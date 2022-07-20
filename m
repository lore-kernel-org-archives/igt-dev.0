Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73C11BBC2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 18:33:44 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Jul 2022 15:33:28 -0300
Message-Id: <20220720183328.267703-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/amdgpu: Skip multihead MPO tests
 on single display
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 Alexander Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Bhawanpreet.Lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
If only one output is connected, all the igt@amdgpu/amd_plane "-multihead"
subtests will result in CRASH, such as can be seen in:

Starting subtest: mpo-scale-nv12-multihead
Received signal SIGSEGV.
Stack trace:
 #0 [fatal_sig_handler+0x163]
 #1 [__sigaction+0x50]
 #2 [force_output_mode+0xa]
 #3 [test_display_mpo+0x20b]
 #4 [__igt_unique____real_main725+0x106d]
 #5 [main+0x23]
 #6 [__libc_start_call_main+0x80]
 #7 [__libc_start_main+0x89]
 #8 [_start+0x25]
Subtest mpo-scale-nv12-multihead: CRASH (0.009s)

In single-display systems, the "-multihead" subtests should SKIP.

[How]
Count the number of connected outputs on the system and compare it to the
ideal number depending on the subtest, using igt_skip_on to assure that
multiheaded subtests will SKIP on single display systems.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
v1 -> v2:
- Rebase it on top of master (Rodrigo Siqueira).
- Add Alex's Reviewed-by tag.
---
 tests/amdgpu/amd_plane.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index faaa1b87..4b2bee49 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -449,9 +449,11 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 {
 
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
 	uint32_t regamma_lut_size;
 	lut_t lut;
 	struct fbc fb[4];
+	int valid_outputs = 0;
 	int videos[][2]= {
 		{426, 240},
 		{640, 360},
@@ -464,6 +466,13 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 
 	test_init(data);
 
+	/* Skip if there is less valid outputs than the required. */
+	for_each_connected_output(display, output)
+		valid_outputs++;
+
+	igt_skip_on_f(valid_outputs < display_count,
+			"Valid outputs (%d) should be equal or greater than %d\n", valid_outputs, display_count);
+
 	regamma_lut_size = igt_pipe_obj_get_prop(data->pipe[0], IGT_CRTC_GAMMA_LUT_SIZE);
 	igt_assert_lt(0, regamma_lut_size);
 	lut_init(&lut, regamma_lut_size);
@@ -586,9 +595,17 @@ static void test_mpo_swizzle_toggle_multihead(data_t *data)
 {
 	struct amdgpu_bo_metadata meta = {};
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
 	igt_fb_t fb_1280_xr24_tiled, fb_1280_ar24_tiled, fb_1920_xb24_tiled,
 		fb_1920_xb24_linear, fb_1920_xr24_tiled;
 	int w, h;
+	int valid_outputs = 0;
+
+	/* Skip if only one display is connected. */
+	for_each_connected_output(display, output)
+		valid_outputs++;
+
+	igt_skip_on_f(valid_outputs == 1, "Must have more than one output connected\n");
 
 	w = 2400;
 	h = 1350;
-- 
2.36.1
