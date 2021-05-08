Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940EA6E869
 for <igt-dev@lists.freedesktop.org>; Sat,  8 May 2021 08:33:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat,  8 May 2021 21:53:02 +0530
Message-Id: <20210508162303.8235-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v5 i-g-t 13/14] tests/kms_flip_scaled_crc: Reset the
 state before exiting the test
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

Before starting the next subtest, clean up the states to default
values, those are assumed by other tests.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip_scaled_crc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index 4923f1235..671ba7367 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -156,6 +156,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 	int ret;
 
 	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	igt_debug("running on output %s pipe %s\n", output->name,
 		  kmstest_pipe_name(pipe));
@@ -246,6 +247,10 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 	data->pipe_crc = NULL;
 
 	clear_lut(data, pipe);
+
+	igt_output_set_pipe(output, pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 igt_main
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
