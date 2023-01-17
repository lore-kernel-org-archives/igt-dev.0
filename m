Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6CA10E471
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 09:35:37 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 10:35:32 +0100
Message-Id: <20230117093532.34937-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Remove unwanted
 logging
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

During libdrm removal I've incidentally left logging offsets which
shouldn't be part of this series. Get rid of it to avoid unnecessary
noise.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_batchbuffer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b8f11730e6..59c788e683 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1568,7 +1568,6 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
-	igt_info("Adding offset handle: %u, %lx\n", buf->handle, buf->addr.offset);
 	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 				  buf->addr.offset, alignment, write);
 	buf->addr.offset = obj->offset;
-- 
2.34.1
