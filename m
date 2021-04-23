Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48056EC6E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:08 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 31so4148534pgn.13
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:28 -0500
Message-Id: <20210423214853.876911-5-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/89] tests/i915/gem_ctx_param: Drop the
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

The idea behind this param is to support OpenCL drivers with relocations
because OpenCL reserves 0x0 for NULL and, if we placed memory there, it
would confuse CL kernels.  It was originally sent out as part of a patch
series including libdrm [1] and Beignet [2] support.  However, the
libdrm and Beignet patches never landed in their respective upstream
projects so this API has never been used.  It's never been used in Mesa
or any other driver, either.

This means that these IGT tests are the only userspace for NO_ZEROMAP
which has ever really existed.  Let's drop them and drop support from
i915 as well.

[1]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067030.html
[2]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067031.html

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
