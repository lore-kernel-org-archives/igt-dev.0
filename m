Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B110910E5D8
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 08:31:54 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Mar 2022 10:31:39 +0200
Message-Id: <20220328083140.13497-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220328083140.13497-1-kamil.konieczny@linux.intel.com>
References: <20220328083140.13497-1-kamil.konieczny@linux.intel.com>
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

v2: change to HIGH_TO_LOW allocation (Zbigniew)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 7 +++++++
 lib/intel_batchbuffer.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 2cd472d1..be6cce85 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1493,6 +1493,13 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
+struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
+{
+	return __intel_bb_create(i915, 0, size, false, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW);
+}
+
 /**
  * intel_bb_create_with_context:
  * @i915: drm fd
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 75d41ea3..8cc829d9 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -524,6 +524,7 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size);
 struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
+struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
 void intel_bb_destroy(struct intel_bb *ibb);
-- 
2.32.0
