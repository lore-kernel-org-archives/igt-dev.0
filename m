Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263EE6F48C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:40:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  8 Dec 2021 18:24:16 +0100
Message-Id: <20211208172416.136412-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
References: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/gem_exec_basic: Add gem create
 fallback
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

If we're on stable kernels which still don't have local memory turned on
provide a fallback to generic gem_create() call when requested region is
the system memory.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_basic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 008a35d0a..6307e929c 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -28,12 +28,15 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
 
-static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
+static uint32_t batch_create(int fd, uint64_t batch_size, uint32_t region)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
+	int ret;
 
-	handle = gem_create_in_memory_regions(fd, batch_size, region);
+	ret = __gem_create_in_memory_regions(fd, &handle, &batch_size, region);
+	if (ret == -ENODEV && IS_SYSTEM_MEMORY_REGION(region))
+		handle = gem_create(fd, batch_size);
 	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
 
 	return handle;
-- 
2.26.0
