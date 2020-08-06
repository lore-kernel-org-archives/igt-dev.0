Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4689B69
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 13:33:42 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  6 Aug 2020 16:33:37 +0300
Message-Id: <20200806133337.8482-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_pipe_crc_basic: Remove redundant
 igt_require_pipe
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The plan was to remove the call while merging a6b258448837
("tests/kms_pipe_crc_basic: Sanity check for CRC mismatches")
according to the review feedback, but that was forgotten. Remove it
now.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index c3c4cdd8..bb66bc6c 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -177,7 +177,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
 	igt_require_f(output, "No connector found for pipe %s\n",
 			kmstest_pipe_name(pipe));
 
-	igt_require_pipe(display, pipe);
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
