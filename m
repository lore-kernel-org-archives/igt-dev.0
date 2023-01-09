Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED5610E0B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:41 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:41 +0530
Message-Id: <20230109134046.85340-2-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] tests/i915/kms_mmap_write_crc: Restrict
 the number of iteration to reduce the execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reduce the number of iterations of subtest for stress test
from 10 to 2 to reduce the overall execution time.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index 96ddac11..8d995634 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -282,11 +282,14 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 				data.output = output;
 				data.pipe = pipe;
 
-				igt_info("Using %d rounds for each pipe in the test\n", ROUNDS);
 				prepare_crtc(&data);
 
-				for (i = 0; i < ROUNDS; i++)
+				for (i = 0; i < ROUNDS; i++) {
+					if (igt_run_in_simulation() && ROUNDS > 2)
+						break;
+					igt_info("Using %d rounds for each pipe in the test\n", i);
 					test(&data);
+				}
 
 				cleanup_crtc(&data);
 			}
-- 
2.25.1
