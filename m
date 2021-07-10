Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71D66EB60
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 21:19:26 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id h9so17730012oih.4
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 14:19:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Sat, 10 Jul 2021 16:19:23 -0500
Message-Id: <20210710211923.784638-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_param: Test that you can
 only set the VM once
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

We're about to add this restriction to i915 so we should test for it
explicitly.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_param.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index c795f1b45..3b79a3e5e 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -188,6 +188,15 @@ static void test_vm(int i915)
 	gem_vm_destroy(i915, arg.value);
 	igt_assert_eq(err, -EINVAL);
 
+	/* Test that we can't set the VM twice */
+	arg.ctx_id = gem_context_create(i915);
+	arg.value = gem_vm_create(i915);
+	gem_context_set_param(i915, &arg);
+	err = __gem_context_set_param(i915, &arg);
+	gem_vm_destroy(i915, arg.value);
+	gem_context_destroy(i915, arg.ctx_id);
+	igt_assert_eq(err, -EINVAL);
+
 	/* Test that we can't set the VM after we've done an execbuf */
 	arg.ctx_id = gem_context_create(i915);
 	spin = igt_spin_new(i915, .ctx_id = arg.ctx_id);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
