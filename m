Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A056E822
 for <igt-dev@lists.freedesktop.org>; Thu, 13 May 2021 05:45:20 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu, 13 May 2021 11:14:08 +0530
Message-Id: <20210513054408.3711197-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
References: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_mmap_write_crc: Add subtest
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
List-ID: <igt-dev@lists.freedesktop.org>

Added description for subtest

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

v2: modified description (Sai)
---
 tests/kms_mmap_write_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
index 46013808..b57fbe15 100644
--- a/tests/kms_mmap_write_crc.c
+++ b/tests/kms_mmap_write_crc.c
@@ -285,9 +285,9 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 		fork_cpuhog_helper();
 	}
 
+	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
 	igt_subtest("main") {
 		igt_info("Using %d rounds for the test\n", ROUNDS);
-
 		for (i = 0; i < ROUNDS; i++)
 			run_test(&data);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
