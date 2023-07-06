Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562F10E413
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 06:06:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 08:05:41 +0200
Message-Id: <20230706060555.282757-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/16] lib/intel_allocator: Drop aliasing
 allocator handle api
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

There's no real user of this api, lets drop it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 18 ------------------
 lib/intel_allocator.h |  1 -
 2 files changed, 19 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 8161221dbf..c31576ecef 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1037,24 +1037,6 @@ uint64_t intel_allocator_open_vm(int fd, uint32_t vm, uint8_t allocator_type)
 					    ALLOC_STRATEGY_HIGH_TO_LOW, 0);
 }
 
-uint64_t intel_allocator_open_vm_as(uint64_t allocator_handle, uint32_t new_vm)
-{
-	struct alloc_req req = { .request_type = REQ_OPEN_AS,
-				 .allocator_handle = allocator_handle,
-				 .open_as.new_vm = new_vm };
-	struct alloc_resp resp;
-
-	/* Get child_tid only once at open() */
-	if (child_tid == -1)
-		child_tid = gettid();
-
-	igt_assert(handle_request(&req, &resp) == 0);
-	igt_assert(resp.open_as.allocator_handle);
-	igt_assert(resp.response_type == RESP_OPEN_AS);
-
-	return resp.open.allocator_handle;
-}
-
 /**
  * intel_allocator_close:
  * @allocator_handle: handle to the allocator that will be closed
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index a6bf573e9d..3ec74f6191 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -182,7 +182,6 @@ uint64_t intel_allocator_open_vm_full(int fd, uint32_t vm,
 				      enum allocator_strategy strategy,
 				      uint64_t default_alignment);
 
-uint64_t intel_allocator_open_vm_as(uint64_t allocator_handle, uint32_t new_vm);
 bool intel_allocator_close(uint64_t allocator_handle);
 void intel_allocator_get_address_range(uint64_t allocator_handle,
 				       uint64_t *startp, uint64_t *endp);
-- 
2.34.1
