Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7F810E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Dec 2021 12:09:26 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Fri, 24 Dec 2021 17:35:45 +0530
Message-Id: <20211224120545.314546-2-ananya.sharma@intel.com>
In-Reply-To: <20211224120545.314546-1-ananya.sharma@intel.com>
References: <20211224120545.314546-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/1] tests/kms_lease: Replacing
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_lease.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 4577eb50..69497005 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -486,7 +486,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(ret >= 0);
 
 	/* sanity check */
-	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);
+	ret = igt_display_try_commit_atomic(&data->master.display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
 	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
@@ -501,7 +501,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(ret >= 0);
 
 	/* sanity check */
-	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);
+	ret = igt_display_try_commit_atomic(&data->master.display, DRM_MODE_ATOMIC_TEST_ONLY, NULL );
 	igt_assert(ret == 0 || ret == -EINVAL);
 
 	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
-- 
2.25.1
