Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B1110E41E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 09:01:31 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Jun 2023 14:30:31 +0530
Message-Id: <20230621090032.611560-3-swati2.sharma@intel.com>
In-Reply-To: <20230621090032.611560-1-swati2.sharma@intel.com>
References: <20230621090032.611560-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] i915/kms_mmap_write_crc: Free the mmap
 and dma-buf fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Release the dma-buf fd (held also by the mmap) after testing so
that we can check for kernel resource leaks at exit.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index bc51975f..87f51153 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -165,6 +165,9 @@ static void test(data_t *data)
 	/* check that the crc is as expected, which requires that caches got flushed */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(&crc, &data->ref_crc);
+
+	munmap(ptr, fb->size);
+	close(dma_buf_fd);
 }
 
 static void prepare_crtc(data_t *data)
-- 
2.25.1
