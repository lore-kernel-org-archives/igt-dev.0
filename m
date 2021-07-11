Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A816EB80
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 03:52:13 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so14441612otl.3
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 20:52:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Sat, 10 Jul 2021 22:52:03 -0500
Message-Id: <20210711035204.802908-6-jason@jlekstrand.net>
In-Reply-To: <20210711035204.802908-1-jason@jlekstrand.net>
References: <20210711035204.802908-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/i915/gem_exec_schedule: Avoid
 cmdparser dependencies in deep()
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

When we have a command parser which runs synchronously, it blocks until
the batch is idle.  For most userspace, this doesn't matter as they
never re-use a batch.  With IGT, this can be a problem because it means
we can't queue up multiple instances of the same batch.  The easy
solution is to create a new batch BO for each execbuf.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_schedule.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index a75faeb68..ee7b10f7f 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1891,7 +1891,6 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 		reloc.delta = sizeof(uint32_t) * n;
 		reloc.read_domains = I915_GEM_DOMAIN_RENDER;
 		reloc.write_domain = I915_GEM_DOMAIN_RENDER;
-		obj[2].handle = gem_create(fd, 4096);
 		obj[2].relocs_ptr = to_user_pointer(&reloc);
 		obj[2].relocation_count = 1;
 
@@ -1910,15 +1909,20 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 		}
 		batch[++i] = eb.rsvd1;
 		batch[++i] = MI_BATCH_BUFFER_END;
-		gem_write(fd, obj[2].handle, 0, batch, sizeof(batch));
 
 		gem_context_set_priority(fd, eb.rsvd1, MAX_PRIO - nreq + n);
 		for (int m = 0; m < XS; m++) {
 			obj[1].handle = dep[m];
 			reloc.target_handle = obj[1].handle;
+
+			/* Create a new batch BO every time so we don't end
+			 * up with extra dependencies
+			 */
+			obj[2].handle = gem_create(fd, 4096);
+			gem_write(fd, obj[2].handle, 0, batch, sizeof(batch));
 			gem_execbuf(fd, &eb);
+			gem_close(fd, obj[2].handle);
 		}
-		gem_close(fd, obj[2].handle);
 	}
 	igt_info("First deptree: %d requests [%.3fs]\n",
 		 n * XS, 1e-9*igt_nsec_elapsed(&tv));
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
