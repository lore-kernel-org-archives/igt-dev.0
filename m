Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2B6E4A2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 07:39:38 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Mon, 22 Nov 2021 13:05:33 +0530
Message-Id: <20211122073533.8092-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Add support
 for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Add support for local memory region (Device memory)

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index b80f597f..a0614ad3 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -380,7 +380,7 @@ static void capture(int fd, int dir, const intel_ctx_t *ctx,
 	uint64_t ahnd;
 	int obj_size = 4096;
 
-	handle = gem_create(fd, obj_size);
+	handle = gem_create_in_memory_regions(fd, obj_size, REGION_LMEM(0));
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size);
-- 
2.32.0
