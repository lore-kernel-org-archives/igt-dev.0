Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07C310E321
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:23 +0100
Message-Id: <20230310194125.14781-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 17/19] xe_mmap: skip VRAM tests if no
 VRAM is found
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of producing an error, if there's no VRAM, the test
should be skipped. There's a logic there that would be doing
that, except that it doesn't really work :-)

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/xe/xe_mmap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 9dce6adbe2..6b313a1895 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -42,8 +42,7 @@ test_mmap(int fd, uint32_t flags)
 	uint64_t mmo;
 	void *map;
 
-	if (flags & vram_memory(fd, 0))
-		igt_require(xe_has_vram(fd));
+	igt_require_f(flags, "Device doesn't support such memory region\n");
 
 	bo = xe_bo_create_flags(fd, 0, 4096, flags);
 	mmo = xe_bo_mmap_offset(fd, bo);
-- 
2.34.1
