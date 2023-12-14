Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B410E9A1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 20:13:28 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 2/2] benchmarks/gem_wsim: Fix mmap for discrete
 graphics cards
Date: Thu, 14 Dec 2023 21:13:02 +0100
Message-Id: <20231214201302.29844-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
References: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
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

It appears that 'gem_mmap__wc' doesn't work for discrete graphics cards
and 'I915_MMAP_OFFSET_FIXED' is needed instead.
Adopt the mapping approach from 'lib/igt_dummyload'.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index a1db37d4e..eafd9cab8 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1502,7 +1502,16 @@ static unsigned int create_bb(struct w_step *w, int self)
 	gem_set_domain(fd, w->bb_handle,
 		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 
-	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
+	if (__gem_set_caching(fd, w->bb_handle,
+			      I915_CACHING_CACHED) == 0) {
+		cs = ptr = gem_mmap__cpu(fd, w->bb_handle,
+					   0, w->bb_size,
+					   PROT_READ | PROT_WRITE);
+	} else
+		cs = ptr = gem_mmap__device_coherent(fd,
+						       w->bb_handle,
+						       0, w->bb_size,
+						       PROT_READ | PROT_WRITE);
 
 	/* Store initial 64b timestamp: start */
 	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
-- 
2.31.1
