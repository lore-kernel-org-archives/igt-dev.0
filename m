Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE486EAF0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 22:32:46 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id o2so3599950plg.1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 15:32:46 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 19 Mar 2021 17:32:29 -0500
Message-Id: <20210319223233.2982842-5-jason@jlekstrand.net>
In-Reply-To: <20210319223233.2982842-1-jason@jlekstrand.net>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/i915/gem_ctx_param: Drop the
 zeromap subtests
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

We're going to be deleting this param from i915 since it's never been
used by any actual userspace beyond this test.
---
 tests/i915/gem_ctx_param.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index ab0e3007..47fea06d 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -335,39 +335,6 @@ igt_main
 		gem_context_set_param(fd, &arg);
 	}
 
-	arg.param = I915_CONTEXT_PARAM_NO_ZEROMAP;
-
-	igt_describe("Validates context set param ioctl in non root mode with param "
-	       "set to no zeromap");
-	igt_subtest("non-root-set-no-zeromap") {
-		igt_fork(child, 1) {
-			igt_drop_root();
-
-			arg.ctx_id = ctx;
-			gem_context_get_param(fd, &arg);
-			arg.value--;
-			gem_context_set_param(fd, &arg);
-		}
-
-		igt_waitchildren();
-	}
-
-	igt_describe("Tests the context set param ioctl with no zeromap enabled in root mode");
-	igt_subtest("root-set-no-zeromap-enabled") {
-		arg.ctx_id = ctx;
-		gem_context_get_param(fd, &arg);
-		arg.value = 1;
-		gem_context_set_param(fd, &arg);
-	}
-
-	igt_describe("Tests the context set param ioctl with no zeromap disabled in root mode");
-	igt_subtest("root-set-no-zeromap-disabled") {
-		arg.ctx_id = ctx;
-		gem_context_get_param(fd, &arg);
-		arg.value = 0;
-		gem_context_set_param(fd, &arg);
-	}
-
 	igt_describe("Tests that multiple contexts can share the same VMA");
 	igt_subtest("vm")
 		test_vm(fd);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
