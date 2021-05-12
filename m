Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36B96EB4E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 07:23:06 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Wed, 12 May 2021 12:51:57 +0530
Message-Id: <20210512072157.3163214-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
References: <20210507130714.2261738-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_mmap_write_crc: Add subtest
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
Cc: B S Karthik <karthik.b.s@intel.com>
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_mmap_write_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
index 46013808..8bb30e23 100644
--- a/tests/kms_mmap_write_crc.c
+++ b/tests/kms_mmap_write_crc.c
@@ -288,6 +288,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	igt_subtest("main") {
 		igt_info("Using %d rounds for the test\n", ROUNDS);
 
+		igt_describe("Tests that caching mode has become UC/WT and flushed and also validat"
+				"es mmap write to an uncached buffer ");
 		for (i = 0; i < ROUNDS; i++)
 			run_test(&data);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
