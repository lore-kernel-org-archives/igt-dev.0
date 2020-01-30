Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794116F8E6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 04:36:43 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 29 Jan 2020 20:36:42 -0800
Message-Id: <bd104efb959aeb6b752ef1be8a0d69a152952e1d.1580358863.git.ashutosh.dixit@intel.com>
In-Reply-To: <7ca4c47dcf1e463fab2d54a7fec7b04bb4cfdea4.1580358863.git.ashutosh.dixit@intel.com>
References: <7ca4c47dcf1e463fab2d54a7fec7b04bb4cfdea4.1580358863.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] benchmarks/gem_busy: use
 gem_mmap__device_coherent()
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
List-ID: <igt-dev@lists.freedesktop.org>

Use gem_mmap__device_coherent() in benchmarks/gem_busy for use with
devices without a mappable aperture.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_busy.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 2fb1edf98..405cc9b09 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -185,10 +185,7 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 	if (flags & WRITE)
 		obj[0].flags = EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create(fd, 4096);
-	if (gem_mmap__has_wc(fd))
-		batch = gem_mmap__wc(fd, obj[1].handle, 0, 4096, PROT_WRITE);
-	else
-		batch = gem_mmap__gtt(fd, obj[1].handle, 4096, PROT_WRITE);
+	batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, obj[1].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	batch[0] = MI_BATCH_BUFFER_END;
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
