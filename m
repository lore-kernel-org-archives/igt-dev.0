Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E914011A44F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 09:45:19 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Mon, 20 Dec 2021 15:11:53 +0530
Message-Id: <20211220094153.282527-3-ananya.sharma@intel.com>
In-Reply-To: <20211220094153.282527-1-ananya.sharma@intel.com>
References: <20211220094153.282527-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_lease: replacing
 drmModeAtomicCommit
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
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index c5c88e14..db433958 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -477,7 +477,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(ret >= 0);
 
 	/* sanity check */
-	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
 	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
@@ -492,7 +492,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(ret >= 0);
 
 	/* sanity check */
-	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
 	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
-- 
2.25.1
