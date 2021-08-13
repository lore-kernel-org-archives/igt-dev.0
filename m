Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0456E550
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:46:55 +0200
Message-Id: <20210813074703.18778-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/9] lib/intel_allocator: Fix argument names
 in declarations
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

Unify the argument names to avoid confusion.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index f6511ffbf..e8d807f9a 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -145,13 +145,13 @@ struct intel_allocator {
 			  uint64_t size, uint64_t alignment,
 			  enum allocator_strategy strategy);
 	bool (*is_allocated)(struct intel_allocator *ial, uint32_t handle,
-			     uint64_t size, uint64_t alignment);
+			     uint64_t size, uint64_t offset);
 	bool (*reserve)(struct intel_allocator *ial,
-			uint32_t handle, uint64_t start, uint64_t size);
+			uint32_t handle, uint64_t start, uint64_t end);
 	bool (*unreserve)(struct intel_allocator *ial,
-			  uint32_t handle, uint64_t start, uint64_t size);
+			  uint32_t handle, uint64_t start, uint64_t end);
 	bool (*is_reserved)(struct intel_allocator *ial,
-			    uint64_t start, uint64_t size);
+			    uint64_t start, uint64_t end);
 	bool (*free)(struct intel_allocator *ial, uint32_t handle);
 
 	void (*destroy)(struct intel_allocator *ial);
-- 
2.26.0
