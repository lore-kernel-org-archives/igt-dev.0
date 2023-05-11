Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C3D10E5D8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 May 2023 19:37:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 11 May 2023 21:36:16 +0200
Message-Id: <20230511193617.86458-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
References: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: Add bind/unbind
 debug for single bo for Xe
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

We're still in early phase of integrating intel-bb infra with Xe so
debugging information about bind/unbind might be handy. Binding path
for single/multiple differs so lets add it for single case as it was
missing now.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_batchbuffer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 545d170548..14ed8057e8 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1313,8 +1313,11 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
 				 ibb->num_objects, syncs, 2);
 		free(bind_ops);
 	} else {
+		igt_debug("bind: UNMAP\n");
 		xe_vm_unbind_async(ibb->fd, ibb->vm_id, 0, 0,
 				   ibb->batch_offset, ibb->size, syncs, 2);
+		igt_debug("  offset: %llx, size: %llx\n",
+			  (long long)ibb->batch_offset, (long long)ibb->size);
 	}
 	ret = syncobj_wait_err(ibb->fd, &syncs[1].handle, 1, INT64_MAX, 0);
 	igt_assert_eq(ret, 0);
@@ -2326,8 +2329,12 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 				 ibb->num_objects, syncs, 1);
 		free(bind_ops);
 	} else {
+		igt_debug("bind: MAP\n");
 		xe_vm_bind_async(ibb->fd, ibb->vm_id, 0, ibb->handle, 0,
 				 ibb->batch_offset, ibb->size, syncs, 1);
+		igt_debug("  handle: %u, offset: %llx, size: %llx\n",
+			  ibb->handle, (long long)ibb->batch_offset,
+			  (long long)ibb->size);
 	}
 	ibb->xe_bound = true;
 
-- 
2.34.1
