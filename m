Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA1610E14B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 18:48:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 20:48:47 +0200
Message-Id: <20230606184847.97018-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_allocator: Fix missing alignment
 bug
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

For helpers which don't pass alignment we must establish any positive
value to move forward in RELOC allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_allocator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 45c1168ab5..8161221dbf 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -935,6 +935,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 
 		igt_assert(xe_dev);
 
+		if (!default_alignment)
+			req.open.default_alignment = xe_get_default_alignment(fd);
+
 		if (!end)
 			req.open.end = 1ull << xe_dev->va_bits;
 	}
-- 
2.34.1
