Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672C36EA17
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:36:54 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id e20so8172687pgg.0
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:36:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:35:51 -0500
Message-Id: <20210609173632.248880-9-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/93] lib/i915/gem_context: Add
 gem_context_create_ext helpers
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/i915/gem_context.c | 56 ++++++++++++++++++++++++++++++++++++++++++
 lib/i915/gem_context.h |  3 +++
 2 files changed, 59 insertions(+)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 79411e10..1dda0924 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -107,6 +107,40 @@ int __gem_context_create(int fd, uint32_t *ctx_id)
        return err;
 }
 
+/**
+ * __gem_context_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @flags: context create flags
+ * @extensions: first extension struct, or 0 for no extensions
+ * @ctx_id: on success, the context ID is written here
+ *
+ * Creates a new GEM context with flags and extensions.  If no flags or
+ * extensions are required, it's the same as __gem_context_create and works
+ * on older kernels.
+ */
+int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
+			     uint32_t *ctx_id)
+{
+	struct drm_i915_gem_context_create_ext ctx_create;
+	int err = 0;
+
+	if (!flags && !extensions)
+		return __gem_context_create(fd, ctx_id);
+
+	memset(&ctx_create, 0, sizeof(ctx_create));
+	ctx_create.flags = flags;
+	if (extensions) {
+		ctx_create.flags |= I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
+		ctx_create.extensions = extensions;
+	}
+
+	err = create_ext_ioctl(fd, &ctx_create);
+	if (!err)
+		*ctx_id = ctx_create.ctx_id;
+
+	return err;
+}
+
 /**
  * gem_context_create:
  * @fd: open i915 drm file descriptor
@@ -127,6 +161,28 @@ uint32_t gem_context_create(int fd)
 	return ctx_id;
 }
 
+/**
+ * gem_context_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @flags: context create flags
+ * @extensions: first extension struct, or 0 for no extensions
+ *
+ * Creates a new GEM context with flags and extensions.  If no flags or
+ * extensions are required, it's the same as gem_context_create and works
+ * on older kernels.
+ *
+ * Returns: The id of the allocated context.
+ */
+uint32_t gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions)
+{
+	uint32_t ctx_id;
+
+	igt_assert_eq(__gem_context_create_ext(fd, flags, extensions, &ctx_id), 0);
+	igt_assert(ctx_id != 0);
+
+	return ctx_id;
+}
+
 int __gem_context_destroy(int fd, uint32_t ctx_id)
 {
 	struct drm_i915_gem_context_destroy destroy = { ctx_id };
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index c2c2b827..91bb9e7f 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -30,7 +30,10 @@
 struct drm_i915_gem_context_param;
 
 uint32_t gem_context_create(int fd);
+uint32_t gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions);
 int __gem_context_create(int fd, uint32_t *ctx_id);
+int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
+			     uint32_t *ctx_id);
 void gem_context_destroy(int fd, uint32_t ctx_id);
 int __gem_context_destroy(int fd, uint32_t ctx_id);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
