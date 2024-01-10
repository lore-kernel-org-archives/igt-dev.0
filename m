Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8405610E56C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 06:48:53 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t] lib/intel_compute: Fix incorrect check for opencl
 kernel support
Date: Wed, 10 Jan 2024 12:23:53 +0530
Message-Id: <20240110065353.2271236-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Skip compute tests on platforms which doesn't have a opencl
kernel defined in the library.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 1f1c79fd3..b092e5d85 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1430,7 +1430,7 @@ static bool __run_intel_compute_kernel(int fd,
 		kernels++;
 	}
 	if (!kernels->kernel)
-		return 1;
+		return 0;
 
 	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
 						  kernels->size, eci);
-- 
2.25.1
