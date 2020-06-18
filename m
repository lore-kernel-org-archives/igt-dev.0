Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:47 +0100
Message-Id: <20200618104747.24005-11-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/11] gem_wsim: Do not keep batch mapped
 unless needed
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

At this point we only need to keep the mapping for infinite batch buffers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 811a4b1b7161..496e5042d89c 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1449,6 +1449,7 @@ static unsigned int terminate_bb(struct w_step *w)
 	const uint32_t bbe = 0xa << 23;
 	unsigned long mmap_start, mmap_len;
 	unsigned long batch_start = w->bb_sz;
+	bool keep_mmap = false;
 	unsigned int r = 0;
 	uint32_t *ptr, *cs;
 
@@ -1472,6 +1473,7 @@ static unsigned int terminate_bb(struct w_step *w)
 
 		*cs++ = w->preempt_us ? 0x5 << 23 /* MI_ARB_CHK; */ : MI_NOOP;
 		w->recursive_bb_start = cs;
+		keep_mmap = true;
 		*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
 		*cs++ = 0;
 		*cs++ = 0;
@@ -1479,6 +1481,9 @@ static unsigned int terminate_bb(struct w_step *w)
 
 	*cs = bbe;
 
+	if (!keep_mmap)
+		munmap(ptr, mmap_len);
+
 	return r;
 }
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
