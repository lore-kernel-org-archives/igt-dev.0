Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE310E1E1
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 16:50:40 +0000 (UTC)
Date: Fri, 30 Sep 2022 09:49:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20220930164949.GK22224@nvishwa1-DESK>
References: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
 <20220928062115.6412-3-niranjana.vishwanathapura@intel.com>
 <35f9106d-4d6e-10c9-05c5-e17eba5bb80d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <35f9106d-4d6e-10c9-05c5-e17eba5bb80d@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib/vm_bind: Add vm_bind/unbind and
 execbuf3 ioctls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 10:05:37AM +0100, Matthew Auld wrote:
>On 28/09/2022 07:21, Niranjana Vishwanathapura wrote:
>>From: Adam Miszczak <adam.miszczak@linux.intel.com>
>>
>>Add required library interfaces for new vm_bind/unbind
>>and execbuf3 ioctls.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Missing sob from Adam.

The author name was wrong here, will fix it.

>
>>---
>>  lib/intel_chipset.h  |  2 ++
>>  lib/ioctl_wrappers.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>>  lib/ioctl_wrappers.h |  6 ++++
>>  3 files changed, 86 insertions(+)
>>
>>diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>>index d7a6ff190f..7cf8259157 100644
>>--- a/lib/intel_chipset.h
>>+++ b/lib/intel_chipset.h
>>@@ -225,4 +225,6 @@ void intel_check_pch(void);
>>  #define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
>>+#define HAS_64K_PAGES(devid)	(IS_DG2(devid))
>
>Unrelated change?

I was asked to move it from test patch to a library patch.
Hence move it here. Ok, will move it to patch #1 as it is
now will defines uapi in a library header file and this is
an implicit uapi.

Regards,
Niranjana

>
>Otherwise,
>Acked-by: Matthew Auld <matthew.auld@intel.com>
>
>>+
>>  #endif /* _INTEL_CHIPSET_H */
>>diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
>>index 09eb3ce7b5..ac37b6bb43 100644
>>--- a/lib/ioctl_wrappers.c
>>+++ b/lib/ioctl_wrappers.c
>>@@ -706,6 +706,38 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
>>  	igt_assert_eq(__gem_execbuf_wr(fd, execbuf), 0);
>>  }
>>+/**
>>+ * __gem_execbuf3:
>>+ * @fd: open i915 drm file descriptor
>>+ * @execbuf: execbuffer data structure
>>+ *
>>+ * This wraps the EXECBUFFER3 ioctl, which submits a batchbuffer for the gpu to
>>+ * run. This is allowed to fail, with -errno returned.
>>+ */
>>+int __gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf)
>>+{
>>+	int err = 0;
>>+	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_EXECBUFFER3, execbuf)) {
>>+		err = -errno;
>>+		igt_assume(err != 0);
>>+	}
>>+	errno = 0;
>>+	return err;
>>+}
>>+
>>+/**
>>+ * gem_execbuf3:
>>+ * @fd: open i915 drm file descriptor
>>+ * @execbuf: execbuffer data structure
>>+ *
>>+ * This wraps the EXECBUFFER3 ioctl, which submits a batchbuffer for the gpu to
>>+ * run.
>>+ */
>>+void gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf)
>>+{
>>+	igt_assert_eq(__gem_execbuf3(fd, execbuf), 0);
>>+}
>>+
>>  /**
>>   * gem_madvise:
>>   * @fd: open i915 drm file descriptor
>>@@ -1328,3 +1360,49 @@ bool igt_has_drm_cap(int fd, uint64_t capability)
>>  	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
>>  	return cap.value;
>>  }
>>+
>>+/* VM_BIND */
>>+
>>+int __gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind)
>>+{
>>+	int err = 0;
>>+
>>+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_BIND, bind))
>>+		err = -errno;
>>+	return err;
>>+}
>>+
>>+/**
>>+ * gem_vm_bind:
>>+ * @fd: open i915 drm file descriptor
>>+ * @bind: vm_bind data structure
>>+ *
>>+ * This wraps the VM_BIND ioctl to bind an address range to
>>+ * the specified address space.
>>+ */
>>+void gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind)
>>+{
>>+	igt_assert_eq(__gem_vm_bind(fd, bind), 0);
>>+}
>>+
>>+int __gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind)
>>+{
>>+	int err = 0;
>>+
>>+	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_VM_UNBIND, unbind))
>>+		err = -errno;
>>+	return err;
>>+}
>>+
>>+/**
>>+ * gem_vm_unbind:
>>+ * @fd: open i915 drm file descriptor
>>+ * @unbind: vm_unbind data structure
>>+ *
>>+ * This wraps the VM_UNBIND ioctl to unbind an address range from
>>+ * the specified address space.
>>+ */
>>+void gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind)
>>+{
>>+	igt_assert_eq(__gem_vm_unbind(fd, unbind), 0);
>>+}
>>diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
>>index 9a897fec23..223cd9160c 100644
>>--- a/lib/ioctl_wrappers.h
>>+++ b/lib/ioctl_wrappers.h
>>@@ -84,6 +84,12 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>>  int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>>  void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>>  int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
>>+void gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf);
>>+int __gem_execbuf3(int fd, struct drm_i915_gem_execbuffer3 *execbuf);
>>+int __gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind);
>>+void gem_vm_bind(int fd, struct drm_i915_gem_vm_bind *bind);
>>+int __gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind);
>>+void gem_vm_unbind(int fd, struct drm_i915_gem_vm_unbind *unbind);
>>  #ifndef I915_GEM_DOMAIN_WC
>>  #define I915_GEM_DOMAIN_WC 0x80
