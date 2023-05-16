Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480D10E283
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:56:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 16 May 2023 22:20:42 +0530
Message-Id: <20230516165058.4047595-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 04/20] lib/igt_msm: Use drm_close_driver() to
 close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

cc: Rob Clark <robdclark@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index 8c0380f42..a236898b6 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -87,7 +87,7 @@ igt_msm_dev_close(struct msm_device *dev)
 {
 	if (!dev)
 		return;
-	close(dev->fd);
+	drm_close_driver(dev->fd);
 	free(dev);
 }
 
-- 
2.40.0
