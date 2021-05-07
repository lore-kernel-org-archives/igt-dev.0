Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8736D6E082
 for <igt-dev@lists.freedesktop.org>; Fri,  7 May 2021 13:08:17 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri,  7 May 2021 18:37:14 +0530
Message-Id: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_mmap_write_crc: Add subtest
 description
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
Cc: S@freedesktop.org, B@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for subtest

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: B S, Karthik <karthik.b.s@intel.com>
---
 tests/kms_mmap_write_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
index 46013808..a38ed231 100644
--- a/tests/kms_mmap_write_crc.c
+++ b/tests/kms_mmap_write_crc.c
@@ -289,6 +289,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 		igt_info("Using %d rounds for the test\n", ROUNDS);
 
 		for (i = 0; i < ROUNDS; i++)
+		igt_describe("Tests that writing non-white to the fb and flip to it to make it fully"
+				" UC/WC and make sure caching mode has become UC/WC");
 			run_test(&data);
 	}
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
