Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8795C10EB21
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 11:48:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 12:48:06 +0100
Message-Id: <20211229114806.24218-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
References: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_allocator: Fix invalid
 strategy on allocator helper code
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

During write likely it was copy-pasted and was never changed to
valid HIGH_TO_LOW strategy. Fix this overlook.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_allocator.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index e8d807f9a..068985637 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -251,7 +251,7 @@ static inline uint64_t get_simple_h2l_ahnd(int fd, uint32_t ctx)
 
 	return do_relocs ? 0 : intel_allocator_open_full(fd, ctx, 0, 0,
 							 INTEL_ALLOCATOR_SIMPLE,
-							 ALLOC_STRATEGY_LOW_TO_HIGH);
+							 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
 static inline uint64_t get_reloc_ahnd(int fd, uint32_t ctx)
-- 
2.32.0
