Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D249410E1B0
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 13:05:00 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 14:04:43 +0100
Message-Id: <20220224130444.18793-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220224130444.18793-1-kamil.konieczny@linux.intel.com>
References: <20220224130444.18793-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: add create
 without relocs
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

There is create function with relocations, so add its
counterpart without it.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 9 ++++++++-
 lib/intel_batchbuffer.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e5666cd4..159813dd 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1484,7 +1484,14 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
 	return __intel_bb_create(i915, 0, size,
 				 relocs && !aux_needs_softpin(i915), 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_LOW_TO_HIGH);
+}
+
+struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
+{
+	return __intel_bb_create(i915, 0, size, false, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_LOW_TO_HIGH);
 }
 
 /**
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index a488f9cf..793c16aa 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -523,6 +523,7 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size);
 struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
+struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
 void intel_bb_destroy(struct intel_bb *ibb);
-- 
2.32.0
