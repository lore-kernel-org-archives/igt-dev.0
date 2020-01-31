Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DEC6E248
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 20:39:12 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 31 Jan 2020 12:38:13 -0800
Message-Id: <e3a12a9da3ea0d2d15e9a8bf2483933b29bd0ae6.1580503049.git.ashutosh.dixit@intel.com>
In-Reply-To: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580503049.git.ashutosh.dixit@intel.com>
References: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580503049.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 2/2] benchmarks/gem_mmap: Use mmap_offset
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

Use function versions with mmap_offset. Also check for mappable
aperture before mmap__gtt().

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_mmap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_mmap.c b/benchmarks/gem_mmap.c
index d3d4ad310..ea5ad9062 100644
--- a/benchmarks/gem_mmap.c
+++ b/benchmarks/gem_mmap.c
@@ -118,15 +118,16 @@ int main(int argc, char **argv)
 	handle = gem_create(fd, OBJECT_SIZE);
 	switch (map) {
 	case CPU:
-		ptr = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
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
+		ptr = gem_mmap__wc_ext(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		break;
 	default:
@@ -169,13 +170,13 @@ int main(int argc, char **argv)
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
