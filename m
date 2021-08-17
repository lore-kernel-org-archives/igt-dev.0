Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5178898CE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 06:31:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 17 Aug 2021 08:31:14 +0200
Message-Id: <20210817063118.9277-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210817063118.9277-1-zbigniew.kempczynski@intel.com>
References: <20210817063118.9277-1-zbigniew.kempczynski@intel.com>
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
List-ID: <igt-dev@lists.freedesktop.org>

I've incidentally missed this during review and line calling
intel_allocator_multiprocess_stop() left before merge.

Remove this as source of confusion - for igt_fork() we can use
standalone allocator within child for some cases (reopen driver
or work within new created context).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
