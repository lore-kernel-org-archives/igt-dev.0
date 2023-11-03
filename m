Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EA510EA27
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 16:03:18 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:02:33 +0000
Message-ID: <20231103160237.405122-12-matthew.auld@intel.com>
In-Reply-To: <20231103160237.405122-1-matthew.auld@intel.com>
References: <20231103160237.405122-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 11/15] lib/intel_allocator: treat
 default_alignment as the minimum
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

If something overrides the default alignment, we should only apply the
alignment if it is larger than the default_alignment.

v2 (Niranjana):
  - Simplify slightly

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index e5b9457b8..96ffe40d5 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -584,8 +584,8 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 			break;
 
 		case REQ_ALLOC:
-			if (!req->alloc.alignment)
-				req->alloc.alignment = ial->default_alignment;
+			req->alloc.alignment = max(ial->default_alignment,
+						   req->alloc.alignment);
 
 			resp->response_type = RESP_ALLOC;
 			resp->alloc.offset = ial->alloc(ial,
-- 
2.41.0
