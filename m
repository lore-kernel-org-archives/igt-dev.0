Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7D410FE75
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 08:49:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Fri, 10 Jun 2022 14:15:40 +0530
Message-Id: <20220610084540.4087062-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
References: <20220610084540.4087062-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/kms_dither: Rename dynamic tests
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

Instead of using dynamic subtests as <output name>-<pipe name>,
update as <pipe name>-<output name>.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_dither.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 21c1618a..c72f83be 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -210,7 +210,8 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
 					test_dithering(data, pipe, output, fb_bpc,
 							fb_format, output_bpc);
 
-- 
2.35.1
