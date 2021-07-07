Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B986E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:39 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id f5so2499295pgv.3
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:39 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:40 -0500
Message-Id: <20210707144643.181001-29-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 78/81] tests/i915/gem_ctx_param: Add a
 couple invalid PARAM_VM cases
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_param.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 7fba37cbd..c795f1b45 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -181,6 +181,23 @@ static void test_vm(int i915)
 	gem_context_destroy(i915, arg.ctx_id);
 	igt_require(err == -ENOENT);
 
+	/* Test that we can't set the VM on ctx0 */
+	arg.ctx_id = 0;
+	arg.value = gem_vm_create(i915);
+	err = __gem_context_set_param(i915, &arg);
+	gem_vm_destroy(i915, arg.value);
+	igt_assert_eq(err, -EINVAL);
+
+	/* Test that we can't set the VM after we've done an execbuf */
+	arg.ctx_id = gem_context_create(i915);
+	spin = igt_spin_new(i915, .ctx_id = arg.ctx_id);
+	igt_spin_free(i915, spin);
+	arg.value = gem_vm_create(i915);
+	err = __gem_context_set_param(i915, &arg);
+	gem_context_destroy(i915, arg.ctx_id);
+	gem_vm_destroy(i915, arg.value);
+	igt_assert_eq(err, -EINVAL);
+
 	parent = gem_context_create(i915);
 	child = gem_context_create(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
