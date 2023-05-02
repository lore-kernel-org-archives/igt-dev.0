Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A80A10E4CE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 08:53:12 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Date: Tue,  2 May 2023 14:23:07 +0530
Message-Id: <20230502085307.3341569-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_create: Exercise oversized
 object detection
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Create an oversized object and try to check if it throws an error.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_create.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f80..a4dc6a12 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -82,6 +82,13 @@ static void create_invalid_size(int fd)
 			}
 			igt_assert_eq(ret, -EINVAL);
 		}
+		/* Try creating size greater than available */
+		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
+		if (!ret) {
+			gem_close(fd, handle);
+			xe_vm_destroy(fd, vm);
+		}
+		igt_assert_eq(ret, -ENOSPC);
 	}
 
 	xe_vm_destroy(fd, vm);
-- 
2.25.1
