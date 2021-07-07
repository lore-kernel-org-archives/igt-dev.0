Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D206E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:37 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x16so2322076pfa.13
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:39 -0500
Message-Id: <20210707144643.181001-28-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 77/81] tests/i915/gem_ctx_param: Add tests
 for recently removed params
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
 tests/i915/gem_ctx_param.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 54bf0cc96..7fba37cbd 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -244,6 +244,35 @@ static void test_vm(int i915)
 	gem_close(i915, batch.handle);
 }
 
+static void test_set_invalid_param(int fd, uint64_t param, uint64_t value)
+{
+	/* Create a fresh context */
+	struct drm_i915_gem_context_param arg = {
+		.ctx_id = gem_context_create(fd),
+		.param = param,
+		.value = value,
+	};
+	int err;
+
+	err = __gem_context_set_param(fd, &arg);
+	gem_context_destroy(fd, arg.ctx_id);
+	igt_assert_eq(err, -EINVAL);
+}
+
+static void test_get_invalid_param(int fd, uint64_t param)
+{
+	/* Create a fresh context */
+	struct drm_i915_gem_context_param arg = {
+		.ctx_id = gem_context_create(fd),
+		.param = param,
+	};
+	int err;
+
+	err = __gem_context_get_param(fd, &arg);
+	gem_context_destroy(fd, arg.ctx_id);
+	igt_assert_eq(err, -EINVAL);
+}
+
 igt_main
 {
 	struct drm_i915_gem_context_param arg;
@@ -406,6 +435,21 @@ igt_main
 		igt_assert_eq(__gem_context_set_param(fd, &arg), -EINVAL);
 	}
 
+	igt_subtest("invalid-set-ringsize")
+		test_set_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE, 8192);
+
+	igt_subtest("invalid-get-ringsize")
+		test_get_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE);
+
+	igt_subtest("invalid-set-no-zeromap")
+		test_set_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP, 1);
+
+	igt_subtest("invalid-get-no-zeromap")
+		test_get_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP);
+
+	igt_subtest("invalid-get-engines")
+		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
+
 	igt_fixture
 		close(fd);
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
