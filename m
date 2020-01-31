Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C56E237
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 19:54:05 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 31 Jan 2020 11:47:01 -0800
Message-Id: <fe554b5b42e3e4aad658c4eda46045d8b12fbfa8.1580499870.git.ashutosh.dixit@intel.com>
In-Reply-To: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580499870.git.ashutosh.dixit@intel.com>
References: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580499870.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] benchmarks/gem_mmap: Add feature checks
 and use mmap_offset
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

Add checks for particular features to be available before invoking
those tests. Also use function versions with mmap_offset.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_mmap.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/benchmarks/gem_mmap.c b/benchmarks/gem_mmap.c
index d3d4ad310..33e22cc08 100644
--- a/benchmarks/gem_mmap.c
+++ b/benchmarks/gem_mmap.c
@@ -118,22 +118,28 @@ int main(int argc, char **argv)
 	handle = gem_create(fd, OBJECT_SIZE);
 	switch (map) {
 	case CPU:
-		ptr = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
+		igt_require(gem_has_llc(fd));
+		ptr = gem_mmap__cpu_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 		break;
 	case GTT:
+		gem_require_mappable_ggtt(fd);
 		ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		break;
 	case WC:
-		ptr = gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
+		igt_require(gem_mmap__has_wc(fd) || gem_mmap_offset__has_wc(fd));
+		ptr = gem_mmap__wc_ext(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		break;
 	default:
 		abort();
 	}
 
-	gem_set_tiling(fd, handle, tiling, 512);
+	if (tiling != I915_TILING_NONE) {
+		igt_require(gem_available_fences(fd) > 0);
+		gem_set_tiling(fd, handle, tiling, 512);
+	}
 
 	if (dir == READ) {
 		src = ptr;
@@ -169,13 +175,13 @@ int main(int argc, char **argv)
 				munmap(ptr, OBJECT_SIZE);
 				switch (map) {
 				case CPU:
-					ptr = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
+					ptr = gem_mmap__cpu_coherent(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 					break;
 				case GTT:
 					ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
 					break;
 				case WC:
-					ptr = gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
+					ptr = gem_mmap__wc_ext(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 					break;
 				default:
 					abort();
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
