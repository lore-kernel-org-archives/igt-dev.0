Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189686EA18
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 12:46:42 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue,  8 Jun 2021 15:47:39 +0300
Message-Id: <20210608124739.1113321-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Limit plane
 testing to 3 planes by default
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
List-ID: <igt-dev@lists.freedesktop.org>

To speed up test execution, let's limit planes to be tested to 3
by default. This reduces the test execution time especially in case
of platforms that offer higher number of overlay planes.

For example, the subtest atomic-pipe-A-tiling-x the execution times
on ADL-P

With 6 planes:
Testing connector eDP-1 using pipe A with 6 planes for 1 iteration with seed 1
Subtest atomic-pipe-A-tiling-x: SUCCESS (2,168s)

With 3 planes:
Testing connector eDP-1 using pipe A with 3 planes for 1 iteration with seed 1
Subtest atomic-pipe-A-tiling-x: SUCCESS (1,878s)

The downside of this is of course the reduced test coverage as all
available planes are not tested by default simultaneusly.

For VLK-11391

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_multiple.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 93c6ea7d2..f177aac8a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -35,6 +35,7 @@ IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
 #define SIZE_PLANE      256
 #define SIZE_CURSOR     128
 #define LOOP_FOREVER     -1
+#define DEFAULT_N_PLANES  3
 
 typedef struct {
 	float red;
@@ -56,8 +57,10 @@ struct {
 	int iterations;
 	unsigned int seed;
 	bool user_seed;
+	bool all_planes;
 } opt = {
 	.iterations = 1,
+	.all_planes = false,
 };
 
 /*
@@ -358,7 +361,8 @@ static void
 test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
 {
 	igt_output_t *output;
-	int n_planes = data->display.pipes[pipe].n_planes;
+	int n_planes = opt.all_planes ?
+			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
@@ -398,6 +402,9 @@ static data_t data;
 static int opt_handler(int option, int option_index, void *input)
 {
 	switch (option) {
+	case 'a':
+		opt.all_planes = true;
+		break;
 	case 'i':
 		opt.iterations = strtol(optarg, NULL, 0);
 
@@ -420,11 +427,13 @@ static int opt_handler(int option, int option_index, void *input)
 
 const char *help_str =
 	"  --iterations Number of iterations for test coverage. -1 loop forever, default 64 iterations\n"
-	"  --seed       Seed for random number generator\n";
+	"  --seed       Seed for random number generator\n"
+	"  --all-planes Test with all available planes";
 
 struct option long_options[] = {
 	{ "iterations", required_argument, NULL, 'i'},
 	{ "seed",    required_argument, NULL, 's'},
+	{ "all-planes", no_argument, NULL, 'a'},
 	{ 0, 0, 0, 0 }
 };
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
