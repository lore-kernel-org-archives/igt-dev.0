Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8F6E5BB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 15:36:10 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 2 Sep 2021 15:35:37 +0000
Message-ID: <BYAPR11MB3784776BE5B2874BBA797CB78ACE9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
 <20210825053109.336142-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210825053109.336142-3-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 02/17] Update IOCTL wrapper with
 DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

I need to remove this patch. Looks like between the start of this series un=
til now, we didnt have a wrapper for CONTEXT_CREATE_EXT, then i was asked t=
o create one, and now a wrapper was merged in lib/i915/gem_context.h. So i =
have to remove this patch and modify the pxp code to call that wrapper.

...alan

-----Original Message-----
From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>=20
Sent: Tuesday, August 24, 2021 10:31 PM
To: igt-dev@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Vivi, R=
odrigo <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v7 02/17] Update IOCTL wrapper with DRM_IOCTL_I915_GE=
M_CONTEXT_CREATE_EXT

Update IOCTL wrapper with DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/ioctl_wrappers.c | 34 ++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c index 09eb3ce7..5c=
59a259 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -706,6 +706,40 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbu=
ffer2 *execbuf)
 	igt_assert_eq(__gem_execbuf_wr(fd, execbuf), 0);  }
=20
+/**
+ * __gem_ctx_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @ctx_ext: context_create_ext data structure
+ *
+ * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem=20
+context based on
+ * additional drm_i915_gem_context_create_ext_setparam input=20
+extensions. This is
+ * allowed to fail, with -errno returned  */ int=20
+__gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext=20
+*ctx_ext) {
+	int err =3D 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, ctx_ext)) {
+		err =3D -errno;
+		igt_assume(err !=3D 0);
+	}
+	errno =3D 0;
+	return err;
+}
+
+/**
+ * gem_ctx_create_ext:
+ * @fd: open i915 drm file descriptor
+ * @ctx_ext: context_create_ext data structure
+ *
+ * This wraps the GEM_CONTEXT_CREATE_EXT ioctl, which allocates gem=20
+context based on
+ * additional drm_i915_gem_context_create_ext_setparam input extensions.
+ */
+void gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext=20
+*ctx_ext) {
+	igt_assert_eq(__gem_ctx_create_ext(fd, ctx_ext), 0); }
+
 /**
  * gem_madvise:
  * @fd: open i915 drm file descriptor
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h index 9a897fec..6f=
7fbf1a 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -84,6 +84,8 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffe=
r2 *execbuf);  int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2=
 *execbuf);  void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *exec=
buf);  int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
+int __gem_ctx_create_ext(int fd, struct drm_i915_gem_context_create_ext=20
+*ctx_ext); void gem_ctx_create_ext(int fd, struct=20
+drm_i915_gem_context_create_ext *ctx_ext);
=20
 #ifndef I915_GEM_DOMAIN_WC
 #define I915_GEM_DOMAIN_WC 0x80
--
2.25.1
