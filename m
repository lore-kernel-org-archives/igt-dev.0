Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA39C8969E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 11:56:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 16 Aug 2021 13:56:22 +0200
Message-Id: <20210816115626.22759-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/gem_exec_capture: Remove
 unnecessary multiprocess stop() call
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

I've incidentally missed this during review and line calling
intel_allocator_multiprocess_stop() left before merge.

Remove this as source of confusion - for igt_fork() we can use
standalone allocator within child for some cases (reopen driver
or work within new created context).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_capture.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index cd6b2f88f..f2ea6cb06 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -612,7 +612,6 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	gem_quiescent_gpu(fd);
 	put_offset(ahnd, obj.handle);
 	put_ahnd(ahnd);
-	intel_allocator_multiprocess_stop();
 }
 
 static void userptr(int fd, int dir)
-- 
2.26.0
