Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B34F6E225
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 05:59:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Tue, 17 Dec 2019 21:59:22 -0800
Message-Id: <20191218055925.705070-8-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 07/10] tests/kms_frontbuffer_tracking: Skip set
 tiling calls if not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Skip the method that is setting tiling with invalid strides if the
hardware does not support HW for tiling/de-tiling.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index ae3b087e..89023bbe 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -2833,7 +2833,8 @@ static void badstride_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	int rc;
 
-	try_invalid_strides();
+	if (gem_has_legacy_hw_tiling(drm.fd))
+		try_invalid_strides();
 
 	prepare_subtest(t, NULL);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
