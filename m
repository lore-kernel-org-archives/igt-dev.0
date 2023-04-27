Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0699910EB43
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 12:09:58 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu, 27 Apr 2023 17:41:58 +0530
Message-Id: <20230427121158.3189360-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_query: Add check for expected
 error
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

For negavtive subtests, check for expected error value.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_query.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 3f038225..ceb73c35 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -415,7 +415,7 @@ test_query_invalid_query(int fd)
 		.data = 0,
 	};
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 }
 
 /**
@@ -432,7 +432,7 @@ test_query_invalid_size(int fd)
 		.data = 0,
 	};
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 }
 
 igt_main
-- 
2.25.1
