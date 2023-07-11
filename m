Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F098010E37F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 11:20:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:19:54 +0200
Message-Id: <20230711112009.122482-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 02/17] lib/intel_allocator: Drop aliasing
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
--
v3: Remove also ipc message passing for open-as (Karolina)
---
 lib/intel_allocator.c            | 73 --------------------------------
 lib/intel_allocator.h            |  1 -
 lib/intel_allocator_msgchannel.h |  8 +---
 3 files changed, 1 insertion(+), 81 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 8161221dbf..09f665fbb9 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -25,7 +25,6 @@
 static const char *reqtype_str[] = {
 	[REQ_STOP]		= "stop",
 	[REQ_OPEN]		= "open",
-	[REQ_OPEN_AS]		= "open as",
 	[REQ_CLOSE]		= "close",
 	[REQ_ADDRESS_RANGE]	= "address range",
 	[REQ_ALLOC]		= "alloc",
@@ -376,19 +375,6 @@ static struct allocator *allocator_open(int fd, uint32_t ctx, uint32_t vm,
 	return al;
 }
 
-static struct allocator *allocator_open_as(struct allocator *base,
-					   uint32_t new_vm, uint64_t *ahndp)
-{
-	struct allocator *al;
-
-	igt_assert(ahndp);
-	al = __allocator_create(base->fd, base->ctx, new_vm, base->ial);
-	__allocator_get(al);
-	*ahndp = __handle_create(al);
-
-	return al;
-}
-
 static bool allocator_close(uint64_t ahnd)
 {
 	struct allocator *al;
@@ -512,47 +498,6 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 				   refcnt - 1, refcnt, ret - 1, ret);
 			break;
 
-		case REQ_OPEN_AS:
-			/* lock first to avoid concurrent close */
-			pthread_mutex_lock(&map_mutex);
-
-			al = __allocator_find_by_handle(req->allocator_handle);
-			resp->response_type = RESP_OPEN_AS;
-
-			if (!al) {
-				alloc_info("<open as> [tid: %ld] ahnd: %" PRIx64
-					   " -> no handle\n",
-					   (long) req->tid, req->allocator_handle);
-				pthread_mutex_unlock(&map_mutex);
-				break;
-			}
-
-			if (!al->vm) {
-				alloc_info("<open as> [tid: %ld] ahnd: %" PRIx64
-					   " -> only open as for <fd, vm> is possible\n",
-					   (long) req->tid, req->allocator_handle);
-				pthread_mutex_unlock(&map_mutex);
-				break;
-			}
-
-
-			al = allocator_open_as(al, req->open_as.new_vm, &ahnd);
-			refcnt = atomic_load(&al->refcount);
-			ret = atomic_load(&al->ial->refcount);
-			pthread_mutex_unlock(&map_mutex);
-
-			resp->response_type = RESP_OPEN_AS;
-			resp->open.allocator_handle = ahnd;
-
-			alloc_info("<open as> [tid: %ld] fd: %d, ahnd: %" PRIx64
-				   ", ctx: %u, vm: %u"
-				   ", alloc_type: %u, al->refcnt: %ld->%ld"
-				   ", refcnt: %d->%d\n",
-				   (long) req->tid, al->fd, ahnd,
-				   al->ctx, al->vm, al->ial->type,
-				   refcnt - 1, refcnt, ret - 1, ret);
-			break;
-
 		case REQ_CLOSE:
 			pthread_mutex_lock(&map_mutex);
 			al = __allocator_find_by_handle(req->allocator_handle);
@@ -1037,24 +982,6 @@ uint64_t intel_allocator_open_vm(int fd, uint32_t vm, uint8_t allocator_type)
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
diff --git a/lib/intel_allocator_msgchannel.h b/lib/intel_allocator_msgchannel.h
index cefbf4ce33..ba38530fd1 100644
--- a/lib/intel_allocator_msgchannel.h
+++ b/lib/intel_allocator_msgchannel.h
@@ -13,7 +13,6 @@
 enum reqtype {
 	REQ_STOP,
 	REQ_OPEN,
-	REQ_OPEN_AS,
 	REQ_CLOSE,
 	REQ_ADDRESS_RANGE,
 	REQ_ALLOC,
@@ -27,7 +26,6 @@ enum reqtype {
 
 enum resptype {
 	RESP_OPEN,
-	RESP_OPEN_AS,
 	RESP_CLOSE,
 	RESP_ADDRESS_RANGE,
 	RESP_ALLOC,
@@ -58,10 +56,6 @@ struct alloc_req {
 			uint64_t default_alignment;
 		} open;
 
-		struct {
-			uint32_t new_vm;
-		} open_as;
-
 		struct {
 			uint32_t handle;
 			uint64_t size;
@@ -100,7 +94,7 @@ struct alloc_resp {
 	union {
 		struct {
 			uint64_t allocator_handle;
-		} open, open_as;
+		} open;
 
 		struct {
 			bool is_empty;
-- 
2.34.1
