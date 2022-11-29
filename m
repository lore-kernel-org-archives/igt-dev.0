Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8F10E0F5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 17:27:26 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 12:27:16 -0500
Message-Id: <20221129172718.151773-2-zack@kde.org>
In-Reply-To: <20221129172718.151773-1-zack@kde.org>
References: <20221129172718.151773-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] igt/vmwgfx: Add support for testing
 vmwgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com,
 Roye Eshed <reshed@vmware.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Maaz Mombasawala <mombasawalam@vmware.com>

Introduce vmwgfx specific tests and the general framework for testing
vmwgfx with the rest of IGT. The changes do not affect any other
drivers and are self-contained to vmwgfx.

Signed-off-by: Roye Eshed <reshed@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 lib/drmtest.c                   |    3 +
 lib/drmtest.h                   |    1 +
 lib/igt_vmwgfx.c                | 1354 ++++++++++++++++++++++++
 lib/igt_vmwgfx.h                |  275 +++++
 lib/meson.build                 |    1 +
 lib/svga/svga3d_cmd.h           | 1511 +++++++++++++++++++++++++++
 lib/svga/svga3d_devcaps.h       |  369 +++++++
 lib/svga/svga3d_dx.h            | 1722 +++++++++++++++++++++++++++++++
 lib/svga/svga3d_limits.h        |   83 ++
 lib/svga/svga3d_reg.h           |   44 +
 lib/svga/svga3d_surfacedefs.h   | 1559 ++++++++++++++++++++++++++++
 lib/svga/svga3d_types.h         | 1554 ++++++++++++++++++++++++++++
 lib/svga/svga_escape.h          |   54 +
 lib/svga/svga_overlay.h         |  115 +++
 lib/svga/svga_reg.h             |  897 ++++++++++++++++
 lib/svga/vm_basic_types.h       |  161 +++
 meson.build                     |    8 +
 tests/meson.build               |    2 +
 tests/vmwgfx/execution_buffer.c |  306 ++++++
 tests/vmwgfx/meson.build        |   18 +
 tests/vmwgfx/mob_stress.c       |   99 ++
 tests/vmwgfx/ref_count.c        |  311 ++++++
 tests/vmwgfx/surface_copy.c     |  337 ++++++
 tests/vmwgfx/tri.c              |  208 ++++
 24 files changed, 10992 insertions(+)
 create mode 100644 lib/igt_vmwgfx.c
 create mode 100644 lib/igt_vmwgfx.h
 create mode 100644 lib/svga/svga3d_cmd.h
 create mode 100644 lib/svga/svga3d_devcaps.h
 create mode 100644 lib/svga/svga3d_dx.h
 create mode 100644 lib/svga/svga3d_limits.h
 create mode 100644 lib/svga/svga3d_reg.h
 create mode 100644 lib/svga/svga3d_surfacedefs.h
 create mode 100644 lib/svga/svga3d_types.h
 create mode 100644 lib/svga/svga_escape.h
 create mode 100644 lib/svga/svga_overlay.h
 create mode 100644 lib/svga/svga_reg.h
 create mode 100644 lib/svga/vm_basic_types.h
 create mode 100644 tests/vmwgfx/execution_buffer.c
 create mode 100644 tests/vmwgfx/meson.build
 create mode 100644 tests/vmwgfx/mob_stress.c
 create mode 100644 tests/vmwgfx/ref_count.c
 create mode 100644 tests/vmwgfx/surface_copy.c
 create mode 100644 tests/vmwgfx/tri.c

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdf..39fb3cb2 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -189,6 +189,7 @@ static const struct module {
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
+	{ DRIVER_VMWGFX, "vmwgfx" },
 	{}
 };
 
@@ -547,6 +548,8 @@ static const char *chipset_to_str(int chipset)
 		return "panfrost";
 	case DRIVER_MSM:
 		return "msm";
+	case DRIVER_VMWGFX:
+		return "vmwgfx";
 	case DRIVER_ANY:
 		return "any";
 	default:
diff --git a/lib/drmtest.h b/lib/drmtest.h
index b5debd44..e2a5c7a0 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -51,6 +51,7 @@
 #define DRIVER_V3D	(1 << 4)
 #define DRIVER_PANFROST	(1 << 5)
 #define DRIVER_MSM	(1 << 6)
+#define DRIVER_VMWGFX   (1 << 7)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
new file mode 100644
index 00000000..e2ef75d8
--- /dev/null
+++ b/lib/igt_vmwgfx.c
@@ -0,0 +1,1354 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+/**
+ * SECTION:igt_vmwgfx
+ * @short_description: VMWGFX support library
+ * @title: VMWGFX
+ * @include: igt.h
+ *
+ * This library provides various auxiliary helper functions for writing VMWGFX
+ * tests.
+ */
+
+#define VMW_INTEGRAL_BITSIZE (sizeof(*((struct vmw_bitvector *)0)->bv) * 8)
+
+/*
+ * Default Shaders
+ */
+static const uint32 SVGADXPixelShader[] = {
+	0x40, 0xe,	 0x3001062, 0x1010f2, 0x1,	0x3000065, 0x1020f2,
+	0x0,  0x5000036, 0x1020f2,  0x0,      0x101e46, 0x1,	   0x100003e,
+};
+static const uint32 SVGADXVertexShader[] = {
+	0x10040,    0x1f,      0x300005f, 0x101072,  0x0,      0x300005f,
+	0x1010f2,   0x1,       0x4000067, 0x1020f2,  0x0,      0x1,
+	0x3000065,  0x1020f2,  0x1,	  0x5000036, 0x102072, 0x0,
+	0x101246,   0x0,       0x5000036, 0x102082,  0x0,      0x4001,
+	0x3f800000, 0x5000036, 0x1020f2,  0x1,	     0x101e46, 0x1,
+	0x100003e,
+};
+
+struct vmw_bitvector vmw_bitvector_alloc(uint32 size)
+{
+	struct vmw_bitvector bitvector;
+	uint32 nwords;
+	uint32 *bv;
+
+	nwords = (size - 1) / VMW_INTEGRAL_BITSIZE + 1;
+	bv = calloc(nwords, sizeof(uint32));
+
+	bitvector.size = size;
+	bitvector.nwords = nwords;
+	bitvector.bv = bv;
+	return bitvector;
+}
+
+void vmw_bitvector_free(struct vmw_bitvector bitvector)
+{
+	free(bitvector.bv);
+}
+
+bool vmw_bitvector_find_next_bit(struct vmw_bitvector bitvector,
+				 uint32 *position)
+{
+	uint32 index = 0;
+	uint32 curr_word = 0;
+	uint32 bit_index = 0;
+	for (curr_word = 0; curr_word < bitvector.nwords; curr_word++) {
+		if (bitvector.bv[curr_word] != UINT32_MAX) {
+			for (bit_index = 0; index < bitvector.size;
+			     index++, bit_index++) {
+				uint32 bitmask = 1 << bit_index;
+				if ((bitmask & bitvector.bv[curr_word]) == 0) {
+					bitvector.bv[curr_word] |= bitmask;
+					*position = index;
+					return true;
+				}
+			}
+			return false;
+		} else {
+			index += VMW_INTEGRAL_BITSIZE;
+		}
+	}
+	return false;
+}
+
+void vmw_bitvector_free_bit(struct vmw_bitvector bitvector, uint32 position)
+{
+	uint32 curr_word = position / VMW_INTEGRAL_BITSIZE;
+	uint32 bit_index = position % VMW_INTEGRAL_BITSIZE;
+	uint32 bitmask = ~(1 << bit_index);
+	bitvector.bv[curr_word] &= bitmask;
+}
+
+void vmw_svga_device_init(struct vmw_svga_device *device,
+			  vmw_svga_device_node device_node)
+{
+	if (device_node == vmw_svga_device_node_master) {
+		device->drm_fd = drm_open_driver_master(DRIVER_VMWGFX);
+	} else {
+		device->drm_fd = drm_open_driver_render(DRIVER_VMWGFX);
+	}
+	device->element_layout_bv = vmw_bitvector_alloc(50);
+	device->blend_state_bv = vmw_bitvector_alloc(50);
+	device->depthstencil_state_bv = vmw_bitvector_alloc(20);
+	device->rasterizer_state_bv = vmw_bitvector_alloc(50);
+	device->rt_view_bv = vmw_bitvector_alloc(500);
+	device->ds_view_bv = vmw_bitvector_alloc(10);
+	device->shader_bv = vmw_bitvector_alloc(500);
+}
+
+void vmw_svga_device_fini(struct vmw_svga_device *device)
+{
+	vmw_bitvector_free(device->element_layout_bv);
+	vmw_bitvector_free(device->blend_state_bv);
+	vmw_bitvector_free(device->depthstencil_state_bv);
+	vmw_bitvector_free(device->rasterizer_state_bv);
+	vmw_bitvector_free(device->rt_view_bv);
+	vmw_bitvector_free(device->ds_view_bv);
+	vmw_bitvector_free(device->shader_bv);
+	close(device->drm_fd);
+}
+
+bool vmw_save_data_as_png(struct vmw_surface *surface, void *data,
+			  const char *filename)
+{
+	cairo_surface_t *cairo_surface;
+	cairo_status_t ret;
+	uint32 width = surface->params.base.base_size.width;
+	uint32 height = surface->params.base.base_size.height;
+	uint32 pixel_size =
+		g_SVGA3dSurfaceDescs[surface->params.base.format].bytesPerBlock;
+	uint32 stride;
+	cairo_format_t format;
+
+	stride = pixel_size * width;
+	/* Can separate this into another function as it grows */
+	switch (surface->params.base.format) {
+	case SVGA3D_R8G8B8A8_UNORM:
+		format = CAIRO_FORMAT_ARGB32;
+		break;
+	default:
+		format = CAIRO_FORMAT_INVALID;
+		break;
+	}
+
+	cairo_surface = cairo_image_surface_create_for_data(
+		(uint8 *)data, format, width, height, stride);
+	ret = cairo_surface_write_to_png(cairo_surface, filename);
+	cairo_surface_destroy(cairo_surface);
+	return (ret == CAIRO_STATUS_SUCCESS);
+}
+
+void *vmw_surface_data_pixel(struct vmw_surface *surface, uint8 *img_data,
+			     uint32 x, uint32 y)
+{
+	uint32 width = surface->params.base.base_size.width;
+	uint32 pixel_size =
+		g_SVGA3dSurfaceDescs[surface->params.base.format].bytesPerBlock;
+	return &img_data[y * width * pixel_size + x * pixel_size];
+}
+
+uint64 vmw_ioctl_get_param(int fd, uint32 param)
+{
+	struct drm_vmw_getparam_arg arg = { 0 };
+	int ret;
+
+	arg.param = param;
+
+	do {
+		ret = drmCommandWriteRead(fd, DRM_VMW_GET_PARAM, &arg,
+					  sizeof(arg));
+	} while (ret == -ERESTART);
+	if (ret) {
+		fprintf(stderr, "IOCTL failed %d: %s\n", ret, strerror(-ret));
+	}
+	return arg.value;
+}
+
+void vmw_ioctl_get_3d_cap(int fd, uint64 buffer, uint32 max_size)
+{
+	struct drm_vmw_get_3d_cap_arg arg = { 0 };
+	int ret;
+
+	arg.buffer = buffer;
+	arg.max_size = max_size;
+
+	do {
+		ret = drmCommandWrite(fd, DRM_VMW_GET_3D_CAP, &arg,
+				      sizeof(arg));
+	} while (ret == -ERESTART);
+	if (ret) {
+		fprintf(stderr, "IOCTL failed %d: %s\n", ret, strerror(-ret));
+	}
+}
+
+/**
+ * vmw_ioctl_fence_finish
+ *
+ * @fence: the fence report for the fence ioctl
+ * @fd: the driver file descriptor
+ *
+ * fills out the arguments for the fence wait ioctl and then waits until
+ * the fence finishes, then checks if the fence has failed or succeeds and
+ * returns that value.
+ */
+int vmw_ioctl_fence_finish(int fd, struct drm_vmw_fence_rep *fence)
+{
+	struct drm_vmw_fence_wait_arg arg = { 0 };
+	int ret;
+
+	arg.handle = fence->handle;
+	arg.timeout_us = VMW_FENCE_TIMEOUT_SECONDS * 1000000;
+	arg.flags = fence->mask;
+
+	ret = drmCommandWriteRead(fd, DRM_VMW_FENCE_WAIT, &arg, sizeof(arg));
+
+	if (ret != 0)
+		fprintf(stderr, "%s Failed\n", __FUNCTION__);
+
+	return ret;
+}
+
+/**
+ * vmw_ioctl_command
+ *
+ * @fence: the fence report for the fence ioctl
+ * @fd: the driver file descriptor
+ *
+ * fills out the arguments for the fence wait ioctl and then waits until
+ * the fence finishes, returns 0 if fence has succeeded, 1 otherwise.
+ */
+int32 vmw_ioctl_command(int drm_fd, int32_t cid, void *commands, uint32_t size,
+			struct drm_vmw_fence_rep *fence)
+{
+	struct drm_vmw_execbuf_arg arg = { 0 };
+	int ret;
+	const int argsize = sizeof(arg);
+
+	memset(&arg, 0, sizeof(arg));
+
+	arg.fence_rep = (unsigned long)fence;
+	arg.commands = (unsigned long)commands;
+	arg.command_size = size;
+	arg.throttle_us = 0; /* deprecated */
+	arg.version = DRM_VMW_EXECBUF_VERSION;
+	arg.context_handle = cid;
+
+	do {
+		ret = drmCommandWrite(drm_fd, DRM_VMW_EXECBUF, &arg, argsize);
+		if (ret == -EBUSY)
+			usleep(1000);
+	} while (ret == -ERESTART || ret == -EBUSY);
+	if (ret) {
+		igt_info("%s error %s.\n", __FUNCTION__, strerror(-ret));
+		return 1;
+	}
+	return 0;
+}
+
+/**
+ * vmw_ioctl_mob_create
+ *
+ * @fd: the driver file descriptor
+ * @size: the size of the mob
+ *
+ * Creates a new mob using the fd of the size inputed as
+ * an argument, calling the mob create ioctl to form a new
+ * mob
+ */
+struct vmw_mob *vmw_ioctl_mob_create(int fd, uint32_t size)
+{
+	struct vmw_mob *mob;
+	union drm_vmw_alloc_dmabuf_arg arg;
+	struct drm_vmw_alloc_dmabuf_req *req = &arg.req;
+	struct drm_vmw_dmabuf_rep *rep = &arg.rep;
+	int ret;
+
+	mob = calloc(1, sizeof(struct vmw_mob));
+	if (!mob)
+		goto out_err1;
+
+	memset(&arg, 0, sizeof(arg));
+	req->size = size;
+	do {
+		ret = drmCommandWriteRead(fd, DRM_VMW_ALLOC_DMABUF, &arg,
+					  sizeof(arg));
+	} while (ret == -ERESTART);
+
+	if (ret) {
+		fprintf(stderr, "IOCTL failed %d: %s\n", ret, strerror(-ret));
+		goto out_err1;
+	}
+
+	mob->data = NULL;
+	mob->handle = rep->handle;
+	mob->map_handle = rep->map_handle;
+	mob->map_count = 0;
+	mob->size = size;
+
+	return mob;
+
+out_err1:
+	free(mob);
+	return NULL;
+}
+
+/**
+ * vmw_ioctl_mob_close_handle
+ *
+ * @mob: the mob to be unreferenced
+ * @fd: the driver file descriptor
+ *
+ * Closes the user-space handle of the mob.
+ */
+void vmw_ioctl_mob_close_handle(int fd, struct vmw_mob *mob)
+{
+	struct drm_vmw_handle_close_arg arg;
+
+	if (mob->data) {
+		munmap(mob->data, mob->size);
+		mob->data = NULL;
+	}
+
+	memset(&arg, 0, sizeof(arg));
+	arg.handle = mob->handle;
+	drmCommandWrite(fd, DRM_VMW_HANDLE_CLOSE, &arg, sizeof(arg));
+
+	free(mob);
+}
+
+struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
+{
+	int ret;
+	union drm_vmw_gb_surface_reference_ext_arg arg;
+	struct vmw_surface surface;
+	arg.req.handle_type = handle_type;
+	arg.req.sid = sid;
+
+	ret = drmCommandWriteRead(fd, DRM_VMW_GB_SURFACE_REF_EXT, &arg,
+				  sizeof(arg));
+	if (ret != 0)
+		fprintf(stderr, "%s Failed\n", __FUNCTION__);
+
+	surface.base = arg.rep.crep;
+	surface.params = arg.rep.creq;
+	return surface;
+}
+
+/**
+ * vmw_ioctl_mob_map
+ *
+ * @mob: the mob to be mapped
+ * @fd: the driver file descriptor
+ *
+ * Maps an existing mob and increments the mob mapping counter
+ */
+void *vmw_ioctl_mob_map(int fd, struct vmw_mob *mob)
+{
+	void *map;
+
+	if (mob->data == NULL) {
+		map = mmap(NULL, mob->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+			   fd, mob->map_handle);
+		if (map == MAP_FAILED) {
+			fprintf(stderr, "%s: Map failed.\n", __FUNCTION__);
+			return NULL;
+		}
+
+		// MADV_HUGEPAGE only exists on Linux
+#ifdef MADV_HUGEPAGE
+		(void)madvise(map, mob->size, MADV_HUGEPAGE);
+#endif
+		mob->data = map;
+	}
+
+	++mob->map_count;
+
+	return mob->data;
+}
+
+/**
+ * vmw_ioctl_mob_unmap
+ *
+ * @mob: the mob to be mapped
+ *
+ * Unmaps the existing mob and decrements the mob mapping counter
+ */
+void vmw_ioctl_mob_unmap(struct vmw_mob *mob)
+{
+	--mob->map_count;
+	munmap(mob->data, mob->size);
+	mob->data = NULL;
+}
+
+/**
+ * vmw_ioctl_buffer_create
+ *
+ * @flags: SVGA3D flags which define what the buffer will be used for
+ * @size: the size of the buffer
+ * @mob: the mob to be mapped
+ * @fd: the driver file descriptor
+ *
+ * Uses the flags and takes in a mob to create a buffer of a predetermined size.
+ * A surface buffer is created by calling the surface create ioctl.
+ */
+struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
+					    uint32_t size, struct vmw_mob *mob)
+{
+	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
+	return vmw_create_surface_simple(fd, flags, SVGA3D_BUFFER, surface_size,
+					 mob);
+}
+
+/**
+ * vmw_ioctl_surface_unref
+ *
+ * @surface: the surface to be ureferenced
+ * @fd: the driver file descriptor
+ *
+ * Unreferences the surface.
+ */
+void vmw_ioctl_surface_unref(int fd, struct vmw_surface *surface)
+{
+	struct drm_vmw_surface_arg s_arg;
+
+	memset(&s_arg, 0, sizeof(s_arg));
+	s_arg.sid = surface->base.handle;
+
+	(void)drmCommandWrite(fd, DRM_VMW_UNREF_SURFACE, &s_arg, sizeof(s_arg));
+	free(surface);
+}
+
+struct vmw_surface *vmw_ioctl_create_surface_full(
+	int fd, SVGA3dSurfaceAllFlags flags, SVGA3dSurfaceFormat format,
+	uint32 multisample_count, SVGA3dMSPattern multisample_pattern,
+	SVGA3dMSQualityLevel quality_level, SVGA3dTextureFilter autogen_filter,
+	uint32 num_mip_levels, uint32 array_size, SVGA3dSize size,
+	struct vmw_mob *mob, enum drm_vmw_surface_flags surface_flags)
+{
+	struct vmw_surface *surface;
+	int32 ret;
+	union drm_vmw_gb_surface_create_ext_arg arg = { 0 };
+
+	surface = calloc(1, sizeof(struct vmw_surface));
+	if (!surface)
+		goto out_err1;
+
+	arg.req.base.base_size.width = size.width;
+	arg.req.base.base_size.height = size.height;
+	arg.req.base.base_size.depth = size.depth;
+	arg.req.base.array_size = array_size;
+	arg.req.base.autogen_filter = autogen_filter;
+	arg.req.base.drm_surface_flags |= surface_flags;
+	if (mob) {
+		arg.req.base.buffer_handle = mob->handle;
+	} else {
+		arg.req.base.buffer_handle = SVGA3D_INVALID_ID;
+		arg.req.base.drm_surface_flags |=
+			drm_vmw_surface_flag_create_buffer;
+	}
+	arg.req.base.format = format;
+	arg.req.base.mip_levels = num_mip_levels;
+	arg.req.base.multisample_count = multisample_count;
+	arg.req.base.svga3d_flags = SVGA3D_FLAGS_LOWER_32(flags);
+	arg.req.svga3d_flags_upper_32_bits = SVGA3D_FLAGS_UPPER_32(flags);
+	arg.req.multisample_pattern = multisample_pattern;
+	arg.req.quality_level = quality_level;
+	arg.req.version = drm_vmw_gb_surface_v1;
+
+	surface->params = arg.req;
+
+	do {
+		ret = drmCommandWriteRead(fd, DRM_VMW_GB_SURFACE_CREATE_EXT,
+					  &arg, sizeof(arg));
+	} while (ret == -ERESTART);
+
+	if (ret) {
+		fprintf(stderr, "IOCTL failed %d: %s\n", ret, strerror(-ret));
+		goto out_err1;
+	}
+
+	surface->base = arg.rep;
+	surface->mob = mob;
+	return surface;
+
+out_err1:
+	free(surface);
+	return NULL;
+}
+
+struct vmw_surface *vmw_create_surface_simple(int fd,
+					      SVGA3dSurfaceAllFlags flags,
+					      SVGA3dSurfaceFormat format,
+					      SVGA3dSize size,
+					      struct vmw_mob *mob)
+{
+	/*
+		TODO
+		Should check flag for SVGA3D_SURFACE_MULTISAMPLE and generate
+		Assuming no multisampling for now.
+	 */
+	uint32 multisample_count = 0;
+	SVGA3dMSPattern multisample_pattern = SVGA3D_MS_PATTERN_NONE;
+	SVGA3dMSQualityLevel quality_level = SVGA3D_MS_QUALITY_NONE;
+
+	uint32 array_size;
+
+	array_size = (flags & SVGA3D_SURFACE_CUBEMAP) != 0 ?
+			     SVGA3D_MAX_SURFACE_FACES :
+			     1;
+
+	return vmw_ioctl_create_surface_full(fd, flags, format,
+					     multisample_count,
+					     multisample_pattern, quality_level,
+					     SVGA3D_TEX_FILTER_NONE, 1,
+					     array_size, size, mob, 0);
+}
+
+/**
+ * vmw_ioctl_syncforcpu
+ *
+ * @handle: the handle for the sync
+ * @dont_block: defines whether or not to block
+ * @readonly: defines whether or not it is read only
+ * @allow_cs: defines whether or not to allow cs
+ * @fd: the driver file descriptor
+ *
+ * Sets the arguments, including the handle and the flags and
+ * then calls an ioctl to sync with the cpu
+ */
+int vmw_ioctl_syncforcpu(int fd, uint32_t handle, bool dont_block,
+			 bool readonly, bool allow_cs)
+{
+	struct drm_vmw_synccpu_arg arg;
+	int ret;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.op = drm_vmw_synccpu_grab;
+	arg.handle = handle;
+	arg.flags = drm_vmw_synccpu_read;
+	if (!readonly)
+		arg.flags |= drm_vmw_synccpu_write;
+	if (dont_block)
+		arg.flags |= drm_vmw_synccpu_dontblock;
+	if (allow_cs)
+		arg.flags |= drm_vmw_synccpu_allow_cs;
+
+	ret = drmCommandWrite(fd, DRM_VMW_SYNCCPU, &arg, sizeof(arg));
+	if (ret) {
+		fprintf(stderr, "%s failed %d: %s\n", __FUNCTION__, ret,
+			strerror(-ret));
+	}
+	return ret;
+}
+
+/**
+ * vmw_ioctl_releasefromcpu
+ *
+ * @handle: the handle for the sync
+ * @readonly: defines whether or not it is read only
+ * @allow_cs: defines whether or not to allow cs
+ * @fd: the driver file descriptor
+ *
+ * Sets the arguments, including the handle and the flags and
+ * then calls an ioctl to release from cpu
+ */
+int vmw_ioctl_releasefromcpu(int fd, uint32_t handle, bool readonly,
+			     bool allow_cs)
+{
+	struct drm_vmw_synccpu_arg arg;
+	int ret;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.op = drm_vmw_synccpu_release;
+	arg.handle = handle;
+	arg.flags = drm_vmw_synccpu_read;
+	if (!readonly)
+		arg.flags |= drm_vmw_synccpu_write;
+	if (allow_cs)
+		arg.flags |= drm_vmw_synccpu_allow_cs;
+
+	ret = drmCommandWrite(fd, DRM_VMW_SYNCCPU, &arg, sizeof(arg));
+	if (ret) {
+		fprintf(stderr, "%s failed %d: %s\n", __FUNCTION__, ret,
+			strerror(-ret));
+	}
+	return ret;
+}
+
+/**
+ * vmw_execbuf_create
+ *
+ * @drm_fd: the direct rendering manager file descriptor
+ * @cid: the context id
+ *
+ * Creates a new execution buffer for exeuction commands
+ */
+struct vmw_execbuf *vmw_execbuf_create(int drm_fd, int32_t cid)
+{
+	struct vmw_execbuf *command_buffer = malloc(sizeof(struct vmw_execbuf));
+
+	command_buffer->drm_fd = drm_fd;
+	command_buffer->cid = cid;
+	command_buffer->buffer = malloc(VMW_EXECBUF_BASE_SIZE);
+	command_buffer->buffer_size = VMW_EXECBUF_BASE_SIZE;
+	command_buffer->offset = 0;
+
+	return command_buffer;
+}
+
+/**
+ * vmw_execbuf_set_cid
+ *
+ * @cid: the command buffer id
+ *
+ * Sets the execution buffers cid
+ */
+void vmw_execbuf_set_cid(struct vmw_execbuf *execbuf, int32_t cid)
+{
+	execbuf->cid = cid;
+}
+
+/**
+ * vmw_execbuf_destroy
+ *
+ * @execbuf: the execution buffer to be destroyed
+ *
+ * Destroys the execution buffer
+ */
+void vmw_execbuf_destroy(struct vmw_execbuf *execbuf)
+{
+	memset(execbuf->buffer, 0, execbuf->buffer_size);
+
+	free(execbuf->buffer);
+
+	execbuf->drm_fd = 0;
+	execbuf->cid = 0;
+	execbuf->buffer_size = 0;
+	execbuf->offset = 0;
+
+	free(execbuf);
+}
+
+/**
+ * vmw_execbuf_append
+ *
+ * @execbuf: the execution buffer
+ * @cid: the command buffer id
+ * @cmdId: the command ID
+ * @cmdData: the command data
+ * @cmdSize: the size of the commands
+ * @trailerData: the trailer data
+ * @trailerSize: the size of the trailer
+ * @fd: the driver file descriptor
+ *
+ * Appends the header, command data, and trailer data.
+ * Reallocates the buffer if the command data exceeds the buffer size.
+ * Changes the offset based on the data appended.
+ */
+int vmw_execbuf_append(struct vmw_execbuf *execbuf, uint32_t cmd_id,
+		       const void *cmd_data, uint32_t cmd_size,
+		       const void *trailer_data, uint32_t trailer_size)
+{
+	SVGA3dCmdHeader header;
+	uint32_t length;
+	uint32_t offset;
+
+	header.id = cmd_id;
+	header.size = cmd_size + trailer_size;
+
+	length = sizeof header + cmd_size + trailer_size;
+
+	if (length > (execbuf->buffer_size - execbuf->offset)) {
+		int increase_size =
+			length - (execbuf->buffer_size - execbuf->offset);
+		execbuf->buffer_size +=
+			ALIGN(increase_size, VMW_EXECBUF_BASE_SIZE);
+		execbuf->buffer =
+			realloc(execbuf->buffer, execbuf->buffer_size);
+	}
+
+	offset = execbuf->offset;
+	memcpy(execbuf->buffer + offset, &header, sizeof header);
+	offset += sizeof header;
+	memcpy(execbuf->buffer + offset, cmd_data, cmd_size);
+	offset += cmd_size;
+	if (trailer_size) {
+		memcpy(execbuf->buffer + offset, trailer_data, trailer_size);
+		offset += trailer_size;
+	}
+	execbuf->offset = offset;
+
+	return offset;
+}
+
+/**
+ * vmw_execbuf_submit
+ *
+ * @execbuf: the execution buffer
+ * @fence: the vmw fence response
+ *
+ * Submits the commands from the buffer and updates the fence response
+ */
+int32 vmw_execbuf_submit(struct vmw_execbuf *execbuf,
+			 struct drm_vmw_fence_rep *fence)
+{
+	uint32_t size = execbuf->offset;
+	int32 ret;
+	assert(execbuf->offset > 0);
+	assert(execbuf->offset <= execbuf->buffer_size);
+
+	ret = vmw_ioctl_command(execbuf->drm_fd, execbuf->cid, execbuf->buffer,
+				size, fence);
+	execbuf->offset = 0;
+	return ret;
+}
+
+int32 vmw_ioctl_context_create(int drm_fd)
+{
+	int ret;
+	union drm_vmw_extended_context_arg arg = { 0 };
+	arg.req = drm_vmw_context_dx;
+
+	do {
+		ret = drmCommandWriteRead(drm_fd,
+					  DRM_VMW_CREATE_EXTENDED_CONTEXT, &arg,
+					  sizeof(arg));
+	} while (ret == -ERESTART);
+
+	if (ret) {
+		fprintf(stderr, "%s failed %d: %s\n", __FUNCTION__, ret,
+			strerror(-ret));
+		return SVGA3D_INVALID_ID;
+	}
+	return arg.rep.cid;
+}
+
+void vmw_ioctl_context_destroy(int drm_fd, int32 cid)
+{
+	struct drm_vmw_context_arg c_arg;
+
+	memset(&c_arg, 0, sizeof(c_arg));
+	c_arg.cid = cid;
+
+	(void)drmCommandWrite(drm_fd, DRM_VMW_UNREF_CONTEXT, &c_arg,
+			      sizeof(c_arg));
+}
+
+struct vmw_shader vmw_shader_define_and_bind(struct vmw_svga_device *device,
+					     struct vmw_execbuf *cmd_buf,
+					     SVGA3dShaderType shader_type,
+					     uint32 size,
+					     const void *shader_text)
+{
+	struct vmw_shader shader;
+	struct vmw_mob *shader_mob;
+	SVGA3dShaderId shader_id;
+	void *data;
+
+	SVGA3dCmdDXDefineShader define_cmd = { 0 };
+	SVGA3dCmdDXBindShader bind_cmd = { 0 };
+
+	shader_mob = vmw_ioctl_mob_create(cmd_buf->drm_fd, size);
+	data = vmw_ioctl_mob_map(cmd_buf->drm_fd, shader_mob);
+	memcpy(data, shader_text, size);
+	vmw_ioctl_mob_unmap(shader_mob);
+
+	vmw_bitvector_find_next_bit(device->shader_bv, &shader_id);
+
+	define_cmd.shaderId = shader_id;
+	define_cmd.sizeInBytes = size;
+	define_cmd.type = shader_type;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_SHADER, &define_cmd,
+			   sizeof define_cmd, NULL, 0);
+
+	bind_cmd.cid = cmd_buf->cid;
+	bind_cmd.shid = shader_id;
+	bind_cmd.mobid = shader_mob->handle;
+	bind_cmd.offsetInBytes = 0;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_BIND_SHADER, &bind_cmd,
+			   sizeof bind_cmd, NULL, 0);
+
+	shader.shid = shader_id;
+	shader.context_id = cmd_buf->cid;
+	shader.mob = shader_mob;
+	return shader;
+}
+
+void vmw_shader_destroy(struct vmw_svga_device *device,
+			struct vmw_execbuf *cmd_buf, struct vmw_shader shader)
+{
+	SVGA3dCmdDXDestroyShader destroy_cmd = { .shaderId = shader.shid };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_SHADER, &destroy_cmd,
+			   sizeof destroy_cmd, NULL, 0);
+	vmw_ioctl_mob_close_handle(cmd_buf->drm_fd, shader.mob);
+	vmw_bitvector_free_bit(device->shader_bv, shader.shid);
+}
+
+void vmw_create_default_objects(struct vmw_svga_device *device,
+				int32 context_id,
+				struct vmw_default_objects *objects,
+				const SVGA3dSize *rt_size)
+{
+	uint32 i = 0;
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence = { 0 };
+
+	SVGA3dInputElementDesc input_elements[] = {
+		{ 0, 0, SVGA3D_R32G32B32A32_FLOAT, SVGA3D_INPUT_PER_VERTEX_DATA,
+		  0, 0 },
+		{ 0, offsetof(struct vmw_vertex, r), SVGA3D_R32G32B32A32_FLOAT,
+		  SVGA3D_INPUT_PER_VERTEX_DATA, 0, 1 },
+	};
+	uint32 input_element_count = ARRAY_SIZE(input_elements);
+
+	SVGA3dCmdDXDefineElementLayout element_layout_cmd = { 0 };
+	SVGA3dDXBlendStatePerRT rt_blend_state = { 0 };
+	SVGA3dCmdDXDefineBlendState blend_cmd = { 0 };
+	SVGA3dCmdDXDefineDepthStencilState depthstencil_cmd = { 0 };
+	SVGA3dCmdDXDefineRasterizerState rasterizer_cmd = { 0 };
+	SVGA3dRenderTargetViewDesc rtv_desc = { 0 };
+	SVGA3dCmdDXDefineRenderTargetView rt_view_cmd = { 0 };
+	SVGA3dCmdDXDefineDepthStencilView ds_view_cmd = { 0 };
+
+	objects->context_id = context_id;
+
+	cmd_buf = vmw_execbuf_create(device->drm_fd, context_id);
+
+	vmw_bitvector_find_next_bit(device->element_layout_bv,
+				    &element_layout_cmd.elementLayoutId);
+	vmw_execbuf_append(
+		cmd_buf, SVGA_3D_CMD_DX_DEFINE_ELEMENTLAYOUT,
+		&element_layout_cmd, sizeof element_layout_cmd, &input_elements,
+		input_element_count * sizeof(SVGA3dInputElementDesc));
+	objects->element_layout_id = element_layout_cmd.elementLayoutId;
+
+	rt_blend_state.renderTargetWriteMask = 0x0F;
+	rt_blend_state.blendEnable = false;
+	rt_blend_state.srcBlend = SVGA3D_BLENDOP_ONE;
+	rt_blend_state.destBlend = SVGA3D_BLENDOP_ZERO;
+	rt_blend_state.blendOp = SVGA3D_BLENDEQ_ADD;
+	rt_blend_state.srcBlendAlpha = SVGA3D_BLENDOP_ONE;
+	rt_blend_state.destBlendAlpha = SVGA3D_BLENDOP_ZERO;
+	rt_blend_state.blendOpAlpha = SVGA3D_BLENDEQ_ADD;
+	rt_blend_state.logicOpEnable = false;
+	rt_blend_state.logicOp = 0;
+	vmw_bitvector_find_next_bit(device->blend_state_bv, &blend_cmd.blendId);
+	blend_cmd.alphaToCoverageEnable = 0;
+	blend_cmd.independentBlendEnable = 1;
+	for (i = 0; i < ARRAY_SIZE(blend_cmd.perRT); i++) {
+		blend_cmd.perRT[i] = rt_blend_state;
+	}
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_BLEND_STATE,
+			   &blend_cmd, sizeof blend_cmd, NULL, 0);
+	objects->blend_id = blend_cmd.blendId;
+
+	vmw_bitvector_find_next_bit(device->depthstencil_state_bv,
+				    &depthstencil_cmd.depthStencilId);
+	depthstencil_cmd.depthEnable = true;
+	depthstencil_cmd.depthWriteMask = SVGA3D_DEPTH_WRITE_MASK_ALL;
+	depthstencil_cmd.depthFunc = SVGA3D_CMP_LESSEQUAL;
+	depthstencil_cmd.stencilEnable = false;
+	depthstencil_cmd.frontEnable = false;
+	depthstencil_cmd.backEnable = false;
+	depthstencil_cmd.stencilReadMask = 0;
+	depthstencil_cmd.stencilWriteMask = 0;
+	depthstencil_cmd.frontStencilFailOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.frontStencilDepthFailOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.frontStencilPassOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.frontStencilFunc = SVGA3D_CMP_ALWAYS;
+	depthstencil_cmd.backStencilFailOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.backStencilDepthFailOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.backStencilPassOp = SVGA3D_STENCILOP_KEEP;
+	depthstencil_cmd.backStencilFunc = SVGA3D_CMP_ALWAYS;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_STATE,
+			   &depthstencil_cmd, sizeof depthstencil_cmd, NULL, 0);
+	objects->depthstencil_id = depthstencil_cmd.depthStencilId;
+
+	vmw_bitvector_find_next_bit(device->rasterizer_state_bv,
+				    &rasterizer_cmd.rasterizerId);
+	rasterizer_cmd.fillMode = SVGA3D_FILLMODE_FILL;
+	rasterizer_cmd.cullMode = SVGA3D_CULL_NONE;
+	rasterizer_cmd.frontCounterClockwise = false;
+	rasterizer_cmd.depthBias = 0;
+	rasterizer_cmd.depthBiasClamp = 0.0;
+	rasterizer_cmd.slopeScaledDepthBias = 0.0;
+	rasterizer_cmd.depthClipEnable = true;
+	rasterizer_cmd.scissorEnable = false;
+	rasterizer_cmd.multisampleEnable = false;
+	rasterizer_cmd.antialiasedLineEnable = false;
+	rasterizer_cmd.lineWidth = 0.0;
+	rasterizer_cmd.lineStippleEnable = 0;
+	rasterizer_cmd.lineStippleFactor = 0;
+	rasterizer_cmd.lineStipplePattern = 0;
+	rasterizer_cmd.provokingVertexLast = 0;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE,
+			   &rasterizer_cmd, sizeof rasterizer_cmd, NULL, 0);
+	objects->rasterizer_id = rasterizer_cmd.rasterizerId;
+
+	objects->color_rt = vmw_create_surface_simple(
+		device->drm_fd,
+		SVGA3D_SURFACE_HINT_TEXTURE | SVGA3D_SURFACE_HINT_RENDERTARGET |
+			SVGA3D_SURFACE_BIND_RENDER_TARGET,
+		SVGA3D_R8G8B8A8_UNORM, *rt_size, NULL);
+
+	objects->depth_rt = vmw_create_surface_simple(
+		device->drm_fd,
+		SVGA3D_SURFACE_HINT_DEPTHSTENCIL |
+			SVGA3D_SURFACE_HINT_RENDERTARGET |
+			SVGA3D_SURFACE_BIND_DEPTH_STENCIL,
+		SVGA3D_R24G8_TYPELESS, *rt_size, NULL);
+
+	rtv_desc.tex.arraySize = 1;
+	rtv_desc.tex.firstArraySlice = 0;
+	rtv_desc.tex.mipSlice = 0;
+	vmw_bitvector_find_next_bit(device->rt_view_bv,
+				    &rt_view_cmd.renderTargetViewId);
+	rt_view_cmd.sid = objects->color_rt->base.handle;
+	rt_view_cmd.format = SVGA3D_R8G8B8A8_UNORM;
+	rt_view_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
+	rt_view_cmd.desc = rtv_desc;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_RENDERTARGET_VIEW,
+			   &rt_view_cmd, sizeof rt_view_cmd, NULL, 0);
+	objects->color_rt_id = rt_view_cmd.renderTargetViewId;
+
+	vmw_bitvector_find_next_bit(device->ds_view_bv,
+				    &ds_view_cmd.depthStencilViewId);
+	ds_view_cmd.sid = objects->depth_rt->base.handle;
+	ds_view_cmd.format = SVGA3D_D24_UNORM_S8_UINT;
+	ds_view_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
+	ds_view_cmd.mipSlice = 0;
+	ds_view_cmd.firstArraySlice = 0, ds_view_cmd.arraySize = 1;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW,
+			   &ds_view_cmd, sizeof ds_view_cmd, NULL, 0);
+	objects->ds_view_id = ds_view_cmd.depthStencilViewId;
+
+	objects->vertex_shader = vmw_shader_define_and_bind(
+		device, cmd_buf, SVGA3D_SHADERTYPE_VS,
+		sizeof SVGADXVertexShader, SVGADXVertexShader);
+
+	objects->pixel_shader = vmw_shader_define_and_bind(
+		device, cmd_buf, SVGA3D_SHADERTYPE_PS, sizeof SVGADXPixelShader,
+		SVGADXPixelShader);
+
+	vmw_execbuf_submit(cmd_buf, &cmd_fence);
+	vmw_ioctl_fence_finish(device->drm_fd, &cmd_fence);
+	vmw_execbuf_destroy(cmd_buf);
+
+	objects->rt_size = *rt_size;
+}
+
+void vmw_set_default_objects(int drm_fd, struct vmw_default_objects *objects)
+{
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence = { 0 };
+
+	SVGA3dCmdDXSetInputLayout element_layout_cmd = {
+		.elementLayoutId = objects->element_layout_id
+	};
+
+	SVGA3dCmdDXSetBlendState blend_cmd = { .blendId = objects->blend_id,
+					       .blendFactor = { 1.0f, 1.0f,
+								1.0f, 1.0f },
+					       .sampleMask = 0xFFFFFFFF };
+
+	SVGA3dCmdDXSetDepthStencilState depthstencil_cmd = {
+		.depthStencilId = objects->depthstencil_id, .stencilRef = 0
+	};
+
+	SVGA3dCmdDXSetRasterizerState rasterizer_cmd = {
+		.rasterizerId = objects->rasterizer_id
+	};
+
+	SVGA3dViewport viewport = { .x = 0.0,
+				    .y = 0.0,
+				    .width = objects->rt_size.width,
+				    .height = objects->rt_size.height,
+				    .minDepth = 0.0,
+				    .maxDepth = 1.0 };
+	SVGA3dCmdDXSetViewports viewports_cmd = { 0 };
+
+	SVGASignedRect scissor_rect = { .left = 0,
+					.right = objects->rt_size.width,
+					.top = 0,
+					.bottom = objects->rt_size.height };
+	SVGA3dCmdDXSetScissorRects rects_cmd = { 0 };
+
+	SVGA3dCmdDXSetRenderTargets rt_cmd = { .depthStencilViewId =
+						       objects->ds_view_id };
+
+	SVGA3dCmdDXSetShader vs_cmd = { .shaderId = objects->vertex_shader.shid,
+					.type = SVGA3D_SHADERTYPE_VS };
+
+	SVGA3dCmdDXSetShader ps_cmd = { .shaderId = objects->pixel_shader.shid,
+					.type = SVGA3D_SHADERTYPE_PS };
+
+	cmd_buf = vmw_execbuf_create(drm_fd, objects->context_id);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_INPUT_LAYOUT,
+			   &element_layout_cmd, sizeof element_layout_cmd, NULL,
+			   0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_BLEND_STATE, &blend_cmd,
+			   sizeof blend_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_DEPTHSTENCIL_STATE,
+			   &depthstencil_cmd, sizeof depthstencil_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_RASTERIZER_STATE,
+			   &rasterizer_cmd, sizeof rasterizer_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_VIEWPORTS,
+			   &viewports_cmd, sizeof viewports_cmd, &viewport,
+			   sizeof(SVGA3dViewport));
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_SCISSORRECTS, &rects_cmd,
+			   sizeof rects_cmd, &scissor_rect,
+			   sizeof(SVGASignedRect));
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_RENDERTARGETS, &rt_cmd,
+			   sizeof rt_cmd, &objects->color_rt_id,
+			   sizeof(SVGA3dRenderTargetViewId));
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_SHADER, &vs_cmd,
+			   sizeof vs_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_SHADER, &ps_cmd,
+			   sizeof ps_cmd, NULL, 0);
+
+	vmw_execbuf_submit(cmd_buf, &cmd_fence);
+	vmw_ioctl_fence_finish(drm_fd, &cmd_fence);
+	vmw_execbuf_destroy(cmd_buf);
+}
+
+void vmw_destroy_default_objects(struct vmw_svga_device *device,
+				 struct vmw_default_objects *objects)
+{
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence = { 0 };
+
+	SVGA3dCmdDXDestroyElementLayout element_layout_cmd = {
+		.elementLayoutId = objects->element_layout_id
+	};
+
+	SVGA3dCmdDXDestroyBlendState blend_cmd = { .blendId =
+							   objects->blend_id };
+
+	SVGA3dCmdDXDestroyDepthStencilState depthstencil_cmd = {
+		.depthStencilId = objects->depthstencil_id
+	};
+
+	SVGA3dCmdDXDestroyRasterizerState rasterizer_cmd = {
+		.rasterizerId = objects->rasterizer_id
+	};
+
+	SVGA3dCmdDXDestroyRenderTargetView rt_view_cmd = {
+		.renderTargetViewId = objects->color_rt_id
+	};
+
+	SVGA3dCmdDXDestroyDepthStencilView ds_view_cmd = {
+		.depthStencilViewId = objects->ds_view_id
+	};
+
+	cmd_buf = vmw_execbuf_create(device->drm_fd, objects->context_id);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_ELEMENTLAYOUT,
+			   &element_layout_cmd, sizeof element_layout_cmd, NULL,
+			   0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_BLEND_STATE,
+			   &blend_cmd, sizeof blend_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_STATE,
+			   &depthstencil_cmd, sizeof depthstencil_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_RASTERIZER_STATE,
+			   &rasterizer_cmd, sizeof rasterizer_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_RENDERTARGET_VIEW,
+			   &rt_view_cmd, sizeof rt_view_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_VIEW,
+			   &ds_view_cmd, sizeof ds_view_cmd, NULL, 0);
+
+	vmw_ioctl_surface_unref(device->drm_fd, objects->color_rt);
+	vmw_ioctl_surface_unref(device->drm_fd, objects->depth_rt);
+
+	vmw_bitvector_free_bit(device->element_layout_bv,
+			       objects->element_layout_id);
+	vmw_bitvector_free_bit(device->blend_state_bv, objects->blend_id);
+	vmw_bitvector_free_bit(device->depthstencil_state_bv,
+			       objects->depthstencil_id);
+	vmw_bitvector_free_bit(device->rasterizer_state_bv,
+			       objects->rasterizer_id);
+	vmw_bitvector_free_bit(device->rt_view_bv, objects->color_rt_id);
+	vmw_bitvector_free_bit(device->ds_view_bv, objects->ds_view_id);
+
+	vmw_shader_destroy(device, cmd_buf, objects->vertex_shader);
+	vmw_shader_destroy(device, cmd_buf, objects->pixel_shader);
+
+	vmw_execbuf_submit(cmd_buf, &cmd_fence);
+	vmw_ioctl_fence_finish(device->drm_fd, &cmd_fence);
+	vmw_execbuf_destroy(cmd_buf);
+}
+
+void vmw_cmd_set_topology(struct vmw_execbuf *cmd_buf,
+			  SVGA3dPrimitiveType topology)
+{
+	SVGA3dCmdDXSetTopology cmd = { .topology = topology };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_TOPOLOGY, &cmd,
+			   sizeof cmd, NULL, 0);
+}
+
+void vmw_cmd_set_vertex_buffers(struct vmw_execbuf *cmd_buf,
+				uint32 start_buffer,
+				SVGA3dVertexBuffer *buffers, uint32 num_buffers)
+{
+	SVGA3dCmdDXSetVertexBuffers cmd = { .startBuffer = start_buffer };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_SET_VERTEX_BUFFERS, &cmd,
+			   sizeof cmd, buffers,
+			   num_buffers * sizeof(SVGA3dVertexBuffer));
+}
+
+void vmw_cmd_update_gb_surface(struct vmw_execbuf *cmd_buf, SVGA3dSurfaceId sid)
+{
+	SVGA3dCmdUpdateGBSurface cmd = { .sid = sid };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_UPDATE_GB_SURFACE, &cmd,
+			   sizeof cmd, NULL, 0);
+}
+
+void vmw_cmd_clear_depthstencil_view(struct vmw_execbuf *cmd_buf, uint16 flags,
+				     uint16 stencil,
+				     SVGA3dDepthStencilViewId dsvid,
+				     float depth)
+{
+	SVGA3dCmdDXClearDepthStencilView cmd = { .flags = flags,
+						 .stencil = stencil,
+						 .depthStencilViewId = dsvid,
+						 .depth = depth };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_CLEAR_DEPTHSTENCIL_VIEW,
+			   &cmd, sizeof cmd, NULL, 0);
+}
+
+void vmw_cmd_clear_rendertarget_view(struct vmw_execbuf *cmd_buf,
+				     SVGA3dRenderTargetViewId rtvid,
+				     SVGA3dRGBAFloat rgba)
+{
+	SVGA3dCmdDXClearRenderTargetView cmd = { .renderTargetViewId = rtvid,
+						 .rgba = rgba };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_CLEAR_RENDERTARGET_VIEW,
+			   &cmd, sizeof cmd, NULL, 0);
+}
+
+void vmw_cmd_draw(struct vmw_execbuf *cmd_buf, uint32 vertex_count,
+		  uint32 start_vertex_location)
+{
+	SVGA3dCmdDXDraw cmd = { .vertexCount = vertex_count,
+				.startVertexLocation = start_vertex_location };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DRAW, &cmd, sizeof cmd, NULL,
+			   0);
+}
+
+void vmw_cmd_readback_gb_surface(struct vmw_execbuf *cmd_buf, uint32 sid)
+{
+	SVGA3dCmdReadbackGBSurface cmd = { .sid = sid };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_READBACK_GB_SURFACE, &cmd,
+			   sizeof cmd, NULL, 0);
+}
+
+void *vmw_readback_surface(int drm_fd, struct vmw_surface *surface)
+{
+	void *values;
+	void *readback;
+	struct vmw_mob readback_mob = {
+		.size = surface->base.buffer_size,
+		.handle = surface->base.buffer_handle,
+		.map_handle = surface->base.buffer_map_handle
+	};
+
+	values = malloc(surface->base.buffer_size);
+
+	readback = vmw_ioctl_mob_map(drm_fd, &readback_mob);
+	memcpy(values, readback, readback_mob.size);
+	vmw_ioctl_mob_unmap(&readback_mob);
+
+	return values;
+}
+
+void vmw_cmd_surface_copy(struct vmw_execbuf *cmd_buf, SVGA3dSurfaceImageId src,
+			  SVGA3dSurfaceImageId dest, const SVGA3dCopyBox *boxes,
+			  uint32 num_boxes)
+{
+	SVGA3dCmdSurfaceCopy cmd = { .src = src, .dest = dest };
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_SURFACE_COPY, &cmd, sizeof cmd,
+			   boxes, num_boxes * sizeof(SVGA3dCopyBox));
+}
+
+uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
+			 struct vmw_default_objects *objects, bool do_sync)
+{
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence;
+	struct vmw_mob *vertex_mob;
+	struct vmw_surface *vertex_buffer;
+	SVGA3dVertexBuffer vb_binding;
+	SVGA3dRGBAFloat clear_color;
+	void *vertex_data;
+	uint8 *rendered_img;
+	struct vmw_vertex vertices[3] = {
+		{ 0.0, 0.75, 0.5, 1.0, 0.0, 1.0, 0.0, 1.0 },
+		{ 0.75, -0.75, 0.5, 1.0, 1.0, 0.0, 0.0, 1.0 },
+		{ -0.75, -0.75, 0.5, 1.0, 0.0, 0.0, 1.0, 1.0 },
+	};
+
+	/* Vertex setup */
+	vertex_mob = vmw_ioctl_mob_create(device->drm_fd, sizeof(vertices));
+	vertex_buffer = vmw_ioctl_buffer_create(
+		device->drm_fd,
+		SVGA3D_SURFACE_HINT_VERTEXBUFFER |
+			SVGA3D_SURFACE_BIND_VERTEX_BUFFER,
+		sizeof(vertices), vertex_mob);
+
+	vmw_set_default_objects(device->drm_fd, objects);
+
+	cmd_buf = vmw_execbuf_create(device->drm_fd, cid);
+
+	vmw_cmd_set_topology(cmd_buf, SVGA3D_PRIMITIVE_TRIANGLELIST);
+
+	vb_binding.sid = vertex_buffer->base.handle;
+	vb_binding.offset = 0;
+	vb_binding.stride = sizeof(vertices[0]);
+	vmw_cmd_set_vertex_buffers(cmd_buf, 0, &vb_binding, 1);
+
+	/* Copy data into vertex buffer */
+	vertex_data = vmw_ioctl_mob_map(device->drm_fd, vertex_mob);
+	memcpy(vertex_data, vertices, sizeof(vertices));
+	vmw_ioctl_mob_unmap(vertex_mob);
+
+	vmw_cmd_update_gb_surface(cmd_buf, vertex_buffer->base.handle);
+
+	/* Clear color = 50% gray */
+	clear_color.r = 0.5;
+	clear_color.g = 0.5;
+	clear_color.b = 0.5;
+	clear_color.a = 1.0;
+
+	/* Clear */
+	vmw_cmd_clear_depthstencil_view(cmd_buf, 0xFFFF, 0, objects->ds_view_id,
+					1.0);
+	vmw_cmd_clear_rendertarget_view(cmd_buf, objects->color_rt_id,
+					clear_color);
+
+	/* Draw */
+	vmw_cmd_draw(cmd_buf, 3, 0);
+	vmw_cmd_draw(cmd_buf, 3, 0);
+
+	/* Readback */
+	vmw_cmd_readback_gb_surface(cmd_buf, objects->color_rt->base.handle);
+
+	/* Submit commands */
+	vmw_execbuf_submit(cmd_buf, &cmd_fence);
+	if (do_sync) {
+		vmw_ioctl_fence_finish(device->drm_fd, &cmd_fence);
+	}
+	vmw_execbuf_destroy(cmd_buf);
+
+	/* Read frambuffer into system mem and save */
+	rendered_img = vmw_readback_surface(device->drm_fd, objects->color_rt);
+
+	vmw_ioctl_surface_unref(device->drm_fd, vertex_buffer);
+	vmw_ioctl_mob_close_handle(device->drm_fd, vertex_mob);
+	return rendered_img;
+}
+
+void vmw_triangle_assert_values(uint8 *rendered_img,
+				struct vmw_surface *color_rt)
+{
+	uint8 *out_pixel;
+	uint8 *center_pixel;
+	uint8 *rv_pixel;
+	uint8 *gv_pixel;
+	uint8 *bv_pixel;
+
+	/* Assert some pixel values */
+	out_pixel = vmw_surface_data_pixel(color_rt, rendered_img, 10, 10);
+	igt_assert_eq(out_pixel[0], 127); // r
+	igt_assert_eq(out_pixel[1], 127); // g
+	igt_assert_eq(out_pixel[2], 127); // b
+
+	center_pixel = vmw_surface_data_pixel(color_rt, rendered_img, 200, 200);
+	igt_assert_eq(center_pixel[0], 64); // r
+	igt_assert_eq(center_pixel[1], 127); // g
+	igt_assert_eq(center_pixel[2], 64); // b
+
+	rv_pixel = vmw_surface_data_pixel(color_rt, rendered_img, 349, 349);
+	igt_assert_eq(rv_pixel[0], 254); // r
+	igt_assert_eq(rv_pixel[1], 0); // g
+	igt_assert_eq(rv_pixel[2], 0); // b
+
+	gv_pixel = vmw_surface_data_pixel(color_rt, rendered_img, 200, 52);
+	igt_assert_eq(gv_pixel[0], 1); // r
+	igt_assert_eq(gv_pixel[1], 253); // g
+	igt_assert_eq(gv_pixel[2], 1); // b
+
+	bv_pixel = vmw_surface_data_pixel(color_rt, rendered_img, 50, 349);
+	igt_assert_eq(bv_pixel[0], 0); // r
+	igt_assert_eq(bv_pixel[1], 0); // g
+	igt_assert_eq(bv_pixel[2], 254); // b
+}
+
+SVGA3dDevCapResult vmw_format_get_caps(int drm_fd,
+				       SVGA3dDevCapIndex dev_cap_index)
+{
+	uint64 size;
+	uint32 *cap_buffer;
+	SVGA3dDevCapResult result = { 0 };
+
+	if (dev_cap_index >= SVGA3D_DEVCAP_MAX) {
+		return result;
+	}
+
+	size = vmw_ioctl_get_param(drm_fd, DRM_VMW_PARAM_3D_CAPS_SIZE);
+	cap_buffer = (uint32 *)malloc(size);
+	memset(cap_buffer, 0, size);
+
+	vmw_ioctl_get_3d_cap(drm_fd, (uint64)cap_buffer, size);
+	result = (SVGA3dDevCapResult)cap_buffer[dev_cap_index];
+
+	free(cap_buffer);
+	return result;
+}
+
+bool vmw_is_format_supported(int drm_fd, SVGA3dDevCapIndex dev_cap_index)
+{
+	SVGA3dDevCapResult result;
+	result = vmw_format_get_caps(drm_fd, dev_cap_index);
+	return result.u & SVGA3D_FORMAT_POSITIVE;
+}
diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
new file mode 100644
index 00000000..769b4862
--- /dev/null
+++ b/lib/igt_vmwgfx.h
@@ -0,0 +1,275 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#ifndef IGT_VMWGFX_H
+#define IGT_VMWGFX_H
+
+#include "igt.h"
+#include "vmwgfx_drm.h"
+#include "lib/svga/svga3d_cmd.h"
+#include "lib/svga/svga3d_dx.h"
+#include "lib/svga/svga3d_types.h"
+#include "lib/svga/vm_basic_types.h"
+#include "lib/svga/svga3d_surfacedefs.h"
+#include "lib/svga/svga3d_devcaps.h"
+
+#define VMW_EXECBUF_BASE_SIZE 4096
+#define VMW_FENCE_TIMEOUT_SECONDS 3600UL
+#define SVGA3D_FLAGS_UPPER_32(svga3d_flags) (svga3d_flags >> 32)
+#define SVGA3D_FLAGS_LOWER_32(svga3d_flags) \
+	(svga3d_flags & ((uint64_t)UINT32_MAX))
+
+struct vmw_bitvector {
+	/* Total number of bits */
+	uint32 size;
+	/* Number of 32-bit elements in array */
+	uint32 nwords;
+	uint32 *bv;
+};
+
+struct vmw_svga_device {
+	int32 drm_fd;
+	struct vmw_bitvector element_layout_bv;
+	struct vmw_bitvector blend_state_bv;
+	struct vmw_bitvector depthstencil_state_bv;
+	struct vmw_bitvector rasterizer_state_bv;
+	struct vmw_bitvector rt_view_bv;
+	struct vmw_bitvector ds_view_bv;
+	struct vmw_bitvector shader_bv;
+};
+
+typedef enum {
+	vmw_svga_device_node_master,
+	vmw_svga_device_node_render,
+} vmw_svga_device_node;
+
+/**
+ * struct vmw_execbuf
+ *
+ * @drm_fd: the direct rendering manger file descriptor.
+ * @cid: the command id
+ * @buffer: the buffer which contains the commands
+ * @offset: the offset for the current command
+ *
+ * A command buffer which contains a series of commands appended
+ * one after the other to be submitted.
+ */
+struct vmw_execbuf {
+	int drm_fd;
+	int cid;
+	char *buffer;
+	uint32_t buffer_size;
+	uint32_t offset;
+};
+
+/**
+ * struct vmw_mob
+ *
+ * @handle: the handle for the mob
+ * @map_handle: the handle for mapping
+ * @data: the data inside the mob
+ * @map_count: how many mappings it has
+ * @size: the size of the mob
+ *
+ * A mob object for holding data
+ */
+struct vmw_mob {
+	uint32_t handle;
+	uint64_t map_handle;
+	void *data;
+	uint32_t map_count;
+	uint32_t size;
+};
+
+/**
+ * struct vmw_surface
+ *
+ * @base: the surface rep for the buffer ioctl
+ * @mob: the mob which hold the data for the buffer
+ *
+ * A buffer object which takes the buffer and purposes it for a surface
+ */
+struct vmw_surface {
+	struct drm_vmw_gb_surface_create_rep base;
+	struct drm_vmw_gb_surface_create_ext_req params;
+	struct vmw_mob *mob;
+};
+
+struct vmw_vertex {
+	float x, y, z, w;
+	float r, g, b, a;
+};
+
+struct vmw_shader {
+	SVGA3dShaderId shid;
+	int32 context_id;
+	struct vmw_mob *mob;
+};
+
+struct vmw_default_objects {
+	uint32 context_id;
+	SVGA3dElementLayoutId element_layout_id;
+	SVGA3dBlendStateId blend_id;
+	SVGA3dDepthStencilStateId depthstencil_id;
+	SVGA3dRasterizerStateId rasterizer_id;
+	SVGA3dRenderTargetViewId color_rt_id;
+	struct vmw_surface *color_rt;
+	SVGA3dDepthStencilViewId ds_view_id;
+	struct vmw_surface *depth_rt;
+	struct vmw_shader vertex_shader;
+	struct vmw_shader pixel_shader;
+	SVGA3dSize rt_size;
+};
+
+const SVGA3dSize vmw_default_rect_size = { 400, 400, 1 };
+
+struct vmw_bitvector vmw_bitvector_alloc(uint32 size);
+
+void vmw_bitvector_free(struct vmw_bitvector bitvector);
+
+bool vmw_bitvector_find_next_bit(struct vmw_bitvector bitvector,
+				 uint32 *position);
+
+void vmw_bitvector_free_bit(struct vmw_bitvector bitvector, uint32 position);
+
+void vmw_svga_device_init(struct vmw_svga_device *device,
+			  vmw_svga_device_node device_node);
+
+void vmw_svga_device_fini(struct vmw_svga_device *device);
+
+bool vmw_save_data_as_png(struct vmw_surface *surface, void *data,
+			  const char *filename);
+
+void *vmw_surface_data_pixel(struct vmw_surface *surface, uint8 *img_data,
+			     uint32 x, uint32 y);
+
+/* IOCTL wrappers */
+uint64 vmw_ioctl_get_param(int fd, uint32 param);
+void vmw_ioctl_get_3d_cap(int fd, uint64 buffer, uint32 max_size);
+struct vmw_mob *vmw_ioctl_mob_create(int fd, uint32_t size);
+void vmw_ioctl_mob_close_handle(int fd, struct vmw_mob *mob);
+void *vmw_ioctl_mob_map(int fd, struct vmw_mob *mob);
+void vmw_ioctl_mob_unmap(struct vmw_mob *mob);
+
+int32 vmw_ioctl_command(int32_t drm_fd, int32_t cid, void *commands,
+			uint32_t size, struct drm_vmw_fence_rep *fence);
+int vmw_ioctl_fence_finish(int fd, struct drm_vmw_fence_rep *fence);
+
+int vmw_ioctl_syncforcpu(int fd, uint32_t handle, bool dont_block,
+			 bool readonly, bool allow_cs);
+int vmw_ioctl_releasefromcpu(int fd, uint32_t handle, bool readonly,
+			     bool allow_cs);
+
+struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
+					    uint32_t size, struct vmw_mob *mob);
+void vmw_ioctl_surface_unref(int fd, struct vmw_surface *buffer);
+
+struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type);
+
+struct vmw_surface *vmw_ioctl_create_surface_full(
+	int fd, SVGA3dSurfaceAllFlags flags, SVGA3dSurfaceFormat format,
+	uint32 multisample_count, SVGA3dMSPattern multisample_pattern,
+	SVGA3dMSQualityLevel quality_level, SVGA3dTextureFilter autogen_filter,
+	uint32 num_mip_levels, uint32 array_size, SVGA3dSize size,
+	struct vmw_mob *mob, enum drm_vmw_surface_flags surface_flags);
+
+struct vmw_surface *vmw_create_surface_simple(int fd,
+					      SVGA3dSurfaceAllFlags flags,
+					      SVGA3dSurfaceFormat format,
+					      SVGA3dSize size,
+					      struct vmw_mob *mob);
+
+struct vmw_execbuf *vmw_execbuf_create(int drm_fd, int32_t cid);
+void vmw_execbuf_set_cid(struct vmw_execbuf *execbuf, int32_t cid);
+void vmw_execbuf_destroy(struct vmw_execbuf *execbuf);
+int vmw_execbuf_append(struct vmw_execbuf *execbuf, uint32_t cmd_id,
+		       const void *cmd_data, uint32_t cmd_size,
+		       const void *trailer_data, uint32_t trailer_size);
+int32 vmw_execbuf_submit(struct vmw_execbuf *execbuf,
+			 struct drm_vmw_fence_rep *fence);
+
+int32 vmw_ioctl_context_create(int drm_fd);
+void vmw_ioctl_context_destroy(int drm_fd, int32 cid);
+
+struct vmw_shader vmw_shader_define_and_bind(struct vmw_svga_device *device,
+					     struct vmw_execbuf *cmd_buf,
+					     SVGA3dShaderType shader_type,
+					     uint32 size,
+					     const void *shader_text);
+
+void vmw_shader_destroy(struct vmw_svga_device *device,
+			struct vmw_execbuf *cmd_buf, struct vmw_shader shader);
+void vmw_create_default_objects(struct vmw_svga_device *device,
+				int32 context_id,
+				struct vmw_default_objects *objects,
+				const SVGA3dSize *rt_size);
+void vmw_set_default_objects(int drm_fd, struct vmw_default_objects *objects);
+void vmw_destroy_default_objects(struct vmw_svga_device *device,
+				 struct vmw_default_objects *objects);
+
+void vmw_cmd_set_topology(struct vmw_execbuf *cmd_buf,
+			  SVGA3dPrimitiveType topology);
+
+void vmw_cmd_set_vertex_buffers(struct vmw_execbuf *cmd_buf,
+				uint32 start_buffer,
+				SVGA3dVertexBuffer *buffers,
+				uint32 num_buffers);
+
+void vmw_cmd_update_gb_surface(struct vmw_execbuf *cmd_buf,
+			       SVGA3dSurfaceId sid);
+
+void vmw_cmd_clear_depthstencil_view(struct vmw_execbuf *cmd_buf, uint16 flags,
+				     uint16 stencil,
+				     SVGA3dDepthStencilViewId dsvid,
+				     float depth);
+
+void vmw_cmd_clear_rendertarget_view(struct vmw_execbuf *cmd_buf,
+				     SVGA3dRenderTargetViewId rtvid,
+				     SVGA3dRGBAFloat rgba);
+
+void vmw_cmd_draw(struct vmw_execbuf *cmd_buf, uint32 vertex_count,
+		  uint32 start_vertex_location);
+
+void vmw_cmd_readback_gb_surface(struct vmw_execbuf *cmd_buf, uint32 sid);
+
+void *vmw_readback_surface(int drm_fd, struct vmw_surface *surface);
+
+void vmw_cmd_surface_copy(struct vmw_execbuf *cmd_buf, SVGA3dSurfaceImageId src,
+			  SVGA3dSurfaceImageId dest, const SVGA3dCopyBox *boxes,
+			  uint32 num_boxes);
+
+uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
+			 struct vmw_default_objects *objects, bool do_sync);
+
+void vmw_triangle_assert_values(uint8 *rendered_img,
+				struct vmw_surface *color_rt);
+
+SVGA3dDevCapResult vmw_format_get_caps(int drm_fd,
+				       SVGA3dDevCapIndex dev_cap_index);
+
+bool vmw_is_format_supported(int drm_fd, SVGA3dDevCapIndex dev_cap_index);
+
+#endif /* IGT_VMWGFX_H */
diff --git a/lib/meson.build b/lib/meson.build
index cef2d0ff..36ec2f67 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -87,6 +87,7 @@ lib_sources = [
 	'igt_panfrost.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
+	'igt_vmwgfx.c',
 	'igt_psr.c',
 	'igt_amd.c',
 	'igt_edid.c',
diff --git a/lib/svga/svga3d_cmd.h b/lib/svga/svga3d_cmd.h
new file mode 100644
index 00000000..5a64d40b
--- /dev/null
+++ b/lib/svga/svga3d_cmd.h
@@ -0,0 +1,1511 @@
+/**********************************************************
+ * Copyright 2012-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_cmd.h --
+ *
+ *    SVGA 3d hardware cmd definitions
+ */
+
+#ifndef _SVGA3D_CMD_H_
+#define _SVGA3D_CMD_H_
+
+#include "svga3d_types.h"
+#include "svga3d_limits.h"
+#include "svga_reg.h"
+
+typedef enum SVGAFifo3dCmdId {
+	SVGA_3D_CMD_LEGACY_BASE = 1000,
+	SVGA_3D_CMD_BASE = 1040,
+
+	SVGA_3D_CMD_SURFACE_DEFINE = 1040,
+	SVGA_3D_CMD_SURFACE_DESTROY = 1041,
+	SVGA_3D_CMD_SURFACE_COPY = 1042,
+	SVGA_3D_CMD_SURFACE_STRETCHBLT = 1043,
+	SVGA_3D_CMD_SURFACE_DMA = 1044,
+	SVGA_3D_CMD_CONTEXT_DEFINE = 1045,
+	SVGA_3D_CMD_CONTEXT_DESTROY = 1046,
+	SVGA_3D_CMD_SETTRANSFORM = 1047,
+	SVGA_3D_CMD_SETZRANGE = 1048,
+	SVGA_3D_CMD_SETRENDERSTATE = 1049,
+	SVGA_3D_CMD_SETRENDERTARGET = 1050,
+	SVGA_3D_CMD_SETTEXTURESTATE = 1051,
+	SVGA_3D_CMD_SETMATERIAL = 1052,
+	SVGA_3D_CMD_SETLIGHTDATA = 1053,
+	SVGA_3D_CMD_SETLIGHTENABLED = 1054,
+	SVGA_3D_CMD_SETVIEWPORT = 1055,
+	SVGA_3D_CMD_SETCLIPPLANE = 1056,
+	SVGA_3D_CMD_CLEAR = 1057,
+	SVGA_3D_CMD_PRESENT = 1058,
+	SVGA_3D_CMD_SHADER_DEFINE = 1059,
+	SVGA_3D_CMD_SHADER_DESTROY = 1060,
+	SVGA_3D_CMD_SET_SHADER = 1061,
+	SVGA_3D_CMD_SET_SHADER_CONST = 1062,
+	SVGA_3D_CMD_DRAW_PRIMITIVES = 1063,
+	SVGA_3D_CMD_SETSCISSORRECT = 1064,
+	SVGA_3D_CMD_BEGIN_QUERY = 1065,
+	SVGA_3D_CMD_END_QUERY = 1066,
+	SVGA_3D_CMD_WAIT_FOR_QUERY = 1067,
+	SVGA_3D_CMD_PRESENT_READBACK = 1068,
+	SVGA_3D_CMD_BLIT_SURFACE_TO_SCREEN = 1069,
+	SVGA_3D_CMD_SURFACE_DEFINE_V2 = 1070,
+	SVGA_3D_CMD_GENERATE_MIPMAPS = 1071,
+	SVGA_3D_CMD_DEAD4 = 1072,
+	SVGA_3D_CMD_DEAD5 = 1073,
+	SVGA_3D_CMD_DEAD6 = 1074,
+	SVGA_3D_CMD_DEAD7 = 1075,
+	SVGA_3D_CMD_DEAD8 = 1076,
+	SVGA_3D_CMD_DEAD9 = 1077,
+	SVGA_3D_CMD_DEAD10 = 1078,
+	SVGA_3D_CMD_DEAD11 = 1079,
+	SVGA_3D_CMD_ACTIVATE_SURFACE = 1080,
+	SVGA_3D_CMD_DEACTIVATE_SURFACE = 1081,
+	SVGA_3D_CMD_SCREEN_DMA = 1082,
+	SVGA_3D_CMD_DEAD1 = 1083,
+	SVGA_3D_CMD_DEAD2 = 1084,
+
+	SVGA_3D_CMD_DEAD12 = 1085,
+	SVGA_3D_CMD_DEAD13 = 1086,
+	SVGA_3D_CMD_DEAD14 = 1087,
+	SVGA_3D_CMD_DEAD15 = 1088,
+	SVGA_3D_CMD_DEAD16 = 1089,
+	SVGA_3D_CMD_DEAD17 = 1090,
+
+	SVGA_3D_CMD_SET_OTABLE_BASE = 1091,
+	SVGA_3D_CMD_READBACK_OTABLE = 1092,
+
+	SVGA_3D_CMD_DEFINE_GB_MOB = 1093,
+	SVGA_3D_CMD_DESTROY_GB_MOB = 1094,
+	SVGA_3D_CMD_DEAD3 = 1095,
+	SVGA_3D_CMD_UPDATE_GB_MOB_MAPPING = 1096,
+
+	SVGA_3D_CMD_DEFINE_GB_SURFACE = 1097,
+	SVGA_3D_CMD_DESTROY_GB_SURFACE = 1098,
+	SVGA_3D_CMD_BIND_GB_SURFACE = 1099,
+	SVGA_3D_CMD_COND_BIND_GB_SURFACE = 1100,
+	SVGA_3D_CMD_UPDATE_GB_IMAGE = 1101,
+	SVGA_3D_CMD_UPDATE_GB_SURFACE = 1102,
+	SVGA_3D_CMD_READBACK_GB_IMAGE = 1103,
+	SVGA_3D_CMD_READBACK_GB_SURFACE = 1104,
+	SVGA_3D_CMD_INVALIDATE_GB_IMAGE = 1105,
+	SVGA_3D_CMD_INVALIDATE_GB_SURFACE = 1106,
+
+	SVGA_3D_CMD_DEFINE_GB_CONTEXT = 1107,
+	SVGA_3D_CMD_DESTROY_GB_CONTEXT = 1108,
+	SVGA_3D_CMD_BIND_GB_CONTEXT = 1109,
+	SVGA_3D_CMD_READBACK_GB_CONTEXT = 1110,
+	SVGA_3D_CMD_INVALIDATE_GB_CONTEXT = 1111,
+
+	SVGA_3D_CMD_DEFINE_GB_SHADER = 1112,
+	SVGA_3D_CMD_DESTROY_GB_SHADER = 1113,
+	SVGA_3D_CMD_BIND_GB_SHADER = 1114,
+
+	SVGA_3D_CMD_SET_OTABLE_BASE64 = 1115,
+
+	SVGA_3D_CMD_BEGIN_GB_QUERY = 1116,
+	SVGA_3D_CMD_END_GB_QUERY = 1117,
+	SVGA_3D_CMD_WAIT_FOR_GB_QUERY = 1118,
+
+	SVGA_3D_CMD_NOP = 1119,
+
+	SVGA_3D_CMD_ENABLE_GART = 1120,
+	SVGA_3D_CMD_DISABLE_GART = 1121,
+	SVGA_3D_CMD_MAP_MOB_INTO_GART = 1122,
+	SVGA_3D_CMD_UNMAP_GART_RANGE = 1123,
+
+	SVGA_3D_CMD_DEFINE_GB_SCREENTARGET = 1124,
+	SVGA_3D_CMD_DESTROY_GB_SCREENTARGET = 1125,
+	SVGA_3D_CMD_BIND_GB_SCREENTARGET = 1126,
+	SVGA_3D_CMD_UPDATE_GB_SCREENTARGET = 1127,
+
+	SVGA_3D_CMD_READBACK_GB_IMAGE_PARTIAL = 1128,
+	SVGA_3D_CMD_INVALIDATE_GB_IMAGE_PARTIAL = 1129,
+
+	SVGA_3D_CMD_SET_GB_SHADERCONSTS_INLINE = 1130,
+
+	SVGA_3D_CMD_GB_SCREEN_DMA = 1131,
+	SVGA_3D_CMD_BIND_GB_SURFACE_WITH_PITCH = 1132,
+	SVGA_3D_CMD_GB_MOB_FENCE = 1133,
+	SVGA_3D_CMD_DEFINE_GB_SURFACE_V2 = 1134,
+	SVGA_3D_CMD_DEFINE_GB_MOB64 = 1135,
+	SVGA_3D_CMD_REDEFINE_GB_MOB64 = 1136,
+	SVGA_3D_CMD_NOP_ERROR = 1137,
+
+	SVGA_3D_CMD_SET_VERTEX_STREAMS = 1138,
+	SVGA_3D_CMD_SET_VERTEX_DECLS = 1139,
+	SVGA_3D_CMD_SET_VERTEX_DIVISORS = 1140,
+	SVGA_3D_CMD_DRAW = 1141,
+	SVGA_3D_CMD_DRAW_INDEXED = 1142,
+
+	SVGA_3D_CMD_DX_MIN = 1143,
+	SVGA_3D_CMD_DX_DEFINE_CONTEXT = 1143,
+	SVGA_3D_CMD_DX_DESTROY_CONTEXT = 1144,
+	SVGA_3D_CMD_DX_BIND_CONTEXT = 1145,
+	SVGA_3D_CMD_DX_READBACK_CONTEXT = 1146,
+	SVGA_3D_CMD_DX_INVALIDATE_CONTEXT = 1147,
+	SVGA_3D_CMD_DX_SET_SINGLE_CONSTANT_BUFFER = 1148,
+	SVGA_3D_CMD_DX_SET_SHADER_RESOURCES = 1149,
+	SVGA_3D_CMD_DX_SET_SHADER = 1150,
+	SVGA_3D_CMD_DX_SET_SAMPLERS = 1151,
+	SVGA_3D_CMD_DX_DRAW = 1152,
+	SVGA_3D_CMD_DX_DRAW_INDEXED = 1153,
+	SVGA_3D_CMD_DX_DRAW_INSTANCED = 1154,
+	SVGA_3D_CMD_DX_DRAW_INDEXED_INSTANCED = 1155,
+	SVGA_3D_CMD_DX_DRAW_AUTO = 1156,
+	SVGA_3D_CMD_DX_SET_INPUT_LAYOUT = 1157,
+	SVGA_3D_CMD_DX_SET_VERTEX_BUFFERS = 1158,
+	SVGA_3D_CMD_DX_SET_INDEX_BUFFER = 1159,
+	SVGA_3D_CMD_DX_SET_TOPOLOGY = 1160,
+	SVGA_3D_CMD_DX_SET_RENDERTARGETS = 1161,
+	SVGA_3D_CMD_DX_SET_BLEND_STATE = 1162,
+	SVGA_3D_CMD_DX_SET_DEPTHSTENCIL_STATE = 1163,
+	SVGA_3D_CMD_DX_SET_RASTERIZER_STATE = 1164,
+	SVGA_3D_CMD_DX_DEFINE_QUERY = 1165,
+	SVGA_3D_CMD_DX_DESTROY_QUERY = 1166,
+	SVGA_3D_CMD_DX_BIND_QUERY = 1167,
+	SVGA_3D_CMD_DX_SET_QUERY_OFFSET = 1168,
+	SVGA_3D_CMD_DX_BEGIN_QUERY = 1169,
+	SVGA_3D_CMD_DX_END_QUERY = 1170,
+	SVGA_3D_CMD_DX_READBACK_QUERY = 1171,
+	SVGA_3D_CMD_DX_SET_PREDICATION = 1172,
+	SVGA_3D_CMD_DX_SET_SOTARGETS = 1173,
+	SVGA_3D_CMD_DX_SET_VIEWPORTS = 1174,
+	SVGA_3D_CMD_DX_SET_SCISSORRECTS = 1175,
+	SVGA_3D_CMD_DX_CLEAR_RENDERTARGET_VIEW = 1176,
+	SVGA_3D_CMD_DX_CLEAR_DEPTHSTENCIL_VIEW = 1177,
+	SVGA_3D_CMD_DX_PRED_COPY_REGION = 1178,
+	SVGA_3D_CMD_DX_PRED_COPY = 1179,
+	SVGA_3D_CMD_DX_PRESENTBLT = 1180,
+	SVGA_3D_CMD_DX_GENMIPS = 1181,
+	SVGA_3D_CMD_DX_UPDATE_SUBRESOURCE = 1182,
+	SVGA_3D_CMD_DX_READBACK_SUBRESOURCE = 1183,
+	SVGA_3D_CMD_DX_INVALIDATE_SUBRESOURCE = 1184,
+	SVGA_3D_CMD_DX_DEFINE_SHADERRESOURCE_VIEW = 1185,
+	SVGA_3D_CMD_DX_DESTROY_SHADERRESOURCE_VIEW = 1186,
+	SVGA_3D_CMD_DX_DEFINE_RENDERTARGET_VIEW = 1187,
+	SVGA_3D_CMD_DX_DESTROY_RENDERTARGET_VIEW = 1188,
+	SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW = 1189,
+	SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_VIEW = 1190,
+	SVGA_3D_CMD_DX_DEFINE_ELEMENTLAYOUT = 1191,
+	SVGA_3D_CMD_DX_DESTROY_ELEMENTLAYOUT = 1192,
+	SVGA_3D_CMD_DX_DEFINE_BLEND_STATE = 1193,
+	SVGA_3D_CMD_DX_DESTROY_BLEND_STATE = 1194,
+	SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_STATE = 1195,
+	SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_STATE = 1196,
+	SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE = 1197,
+	SVGA_3D_CMD_DX_DESTROY_RASTERIZER_STATE = 1198,
+	SVGA_3D_CMD_DX_DEFINE_SAMPLER_STATE = 1199,
+	SVGA_3D_CMD_DX_DESTROY_SAMPLER_STATE = 1200,
+	SVGA_3D_CMD_DX_DEFINE_SHADER = 1201,
+	SVGA_3D_CMD_DX_DESTROY_SHADER = 1202,
+	SVGA_3D_CMD_DX_BIND_SHADER = 1203,
+	SVGA_3D_CMD_DX_DEFINE_STREAMOUTPUT = 1204,
+	SVGA_3D_CMD_DX_DESTROY_STREAMOUTPUT = 1205,
+	SVGA_3D_CMD_DX_SET_STREAMOUTPUT = 1206,
+	SVGA_3D_CMD_DX_SET_COTABLE = 1207,
+	SVGA_3D_CMD_DX_READBACK_COTABLE = 1208,
+	SVGA_3D_CMD_DX_BUFFER_COPY = 1209,
+	SVGA_3D_CMD_DX_TRANSFER_FROM_BUFFER = 1210,
+	SVGA_3D_CMD_DX_SURFACE_COPY_AND_READBACK = 1211,
+	SVGA_3D_CMD_DX_MOVE_QUERY = 1212,
+	SVGA_3D_CMD_DX_BIND_ALL_QUERY = 1213,
+	SVGA_3D_CMD_DX_READBACK_ALL_QUERY = 1214,
+	SVGA_3D_CMD_DX_PRED_TRANSFER_FROM_BUFFER = 1215,
+	SVGA_3D_CMD_DX_MOB_FENCE_64 = 1216,
+	SVGA_3D_CMD_DX_BIND_ALL_SHADER = 1217,
+	SVGA_3D_CMD_DX_HINT = 1218,
+	SVGA_3D_CMD_DX_BUFFER_UPDATE = 1219,
+	SVGA_3D_CMD_DX_SET_VS_CONSTANT_BUFFER_OFFSET = 1220,
+	SVGA_3D_CMD_DX_SET_PS_CONSTANT_BUFFER_OFFSET = 1221,
+	SVGA_3D_CMD_DX_SET_GS_CONSTANT_BUFFER_OFFSET = 1222,
+	SVGA_3D_CMD_DX_SET_HS_CONSTANT_BUFFER_OFFSET = 1223,
+	SVGA_3D_CMD_DX_SET_DS_CONSTANT_BUFFER_OFFSET = 1224,
+	SVGA_3D_CMD_DX_SET_CS_CONSTANT_BUFFER_OFFSET = 1225,
+
+	SVGA_3D_CMD_DX_COND_BIND_ALL_SHADER = 1226,
+	SVGA_3D_CMD_DX_MAX = 1227,
+
+	SVGA_3D_CMD_SCREEN_COPY = 1227,
+
+	SVGA_3D_CMD_RESERVED1 = 1228,
+	SVGA_3D_CMD_RESERVED2 = 1229,
+	SVGA_3D_CMD_RESERVED3 = 1230,
+	SVGA_3D_CMD_RESERVED4 = 1231,
+	SVGA_3D_CMD_RESERVED5 = 1232,
+	SVGA_3D_CMD_RESERVED6 = 1233,
+	SVGA_3D_CMD_RESERVED7 = 1234,
+	SVGA_3D_CMD_RESERVED8 = 1235,
+
+	SVGA_3D_CMD_GROW_OTABLE = 1236,
+	SVGA_3D_CMD_DX_GROW_COTABLE = 1237,
+	SVGA_3D_CMD_INTRA_SURFACE_COPY = 1238,
+
+	SVGA_3D_CMD_DEFINE_GB_SURFACE_V3 = 1239,
+
+	SVGA_3D_CMD_DX_RESOLVE_COPY = 1240,
+	SVGA_3D_CMD_DX_PRED_RESOLVE_COPY = 1241,
+	SVGA_3D_CMD_DX_PRED_CONVERT_REGION = 1242,
+	SVGA_3D_CMD_DX_PRED_CONVERT = 1243,
+	SVGA_3D_CMD_WHOLE_SURFACE_COPY = 1244,
+
+	SVGA_3D_CMD_DX_DEFINE_UA_VIEW = 1245,
+	SVGA_3D_CMD_DX_DESTROY_UA_VIEW = 1246,
+	SVGA_3D_CMD_DX_CLEAR_UA_VIEW_UINT = 1247,
+	SVGA_3D_CMD_DX_CLEAR_UA_VIEW_FLOAT = 1248,
+	SVGA_3D_CMD_DX_COPY_STRUCTURE_COUNT = 1249,
+	SVGA_3D_CMD_DX_SET_UA_VIEWS = 1250,
+
+	SVGA_3D_CMD_DX_DRAW_INDEXED_INSTANCED_INDIRECT = 1251,
+	SVGA_3D_CMD_DX_DRAW_INSTANCED_INDIRECT = 1252,
+	SVGA_3D_CMD_DX_DISPATCH = 1253,
+	SVGA_3D_CMD_DX_DISPATCH_INDIRECT = 1254,
+
+	SVGA_3D_CMD_WRITE_ZERO_SURFACE = 1255,
+	SVGA_3D_CMD_UPDATE_ZERO_SURFACE = 1256,
+	SVGA_3D_CMD_DX_TRANSFER_TO_BUFFER = 1257,
+	SVGA_3D_CMD_DX_SET_STRUCTURE_COUNT = 1258,
+
+	SVGA_3D_CMD_LOGICOPS_BITBLT = 1259,
+	SVGA_3D_CMD_LOGICOPS_TRANSBLT = 1260,
+	SVGA_3D_CMD_LOGICOPS_STRETCHBLT = 1261,
+	SVGA_3D_CMD_LOGICOPS_COLORFILL = 1262,
+	SVGA_3D_CMD_LOGICOPS_ALPHABLEND = 1263,
+	SVGA_3D_CMD_LOGICOPS_CLEARTYPEBLEND = 1264,
+
+	SVGA_3D_CMD_DX_COPY_COTABLE_INTO_MOB = 1265,
+
+	SVGA_3D_CMD_UPDATE_GB_SCREENTARGET_V2 = 1266,
+
+	SVGA_3D_CMD_DEFINE_GB_SURFACE_V4 = 1267,
+	SVGA_3D_CMD_DX_SET_CS_UA_VIEWS = 1268,
+	SVGA_3D_CMD_DX_SET_MIN_LOD = 1269,
+
+	SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW_V2 = 1272,
+	SVGA_3D_CMD_DX_DEFINE_STREAMOUTPUT_WITH_MOB = 1273,
+	SVGA_3D_CMD_DX_SET_SHADER_IFACE = 1274,
+	SVGA_3D_CMD_DX_BIND_STREAMOUTPUT = 1275,
+	SVGA_3D_CMD_SURFACE_STRETCHBLT_NON_MS_TO_MS = 1276,
+	SVGA_3D_CMD_DX_BIND_SHADER_IFACE = 1277,
+
+	SVGA_3D_CMD_UPDATE_GB_SCREENTARGET_MOVE = 1278,
+
+	SVGA_3D_CMD_DX_PRED_STAGING_COPY = 1281,
+	SVGA_3D_CMD_DX_STAGING_COPY = 1282,
+	SVGA_3D_CMD_DX_PRED_STAGING_COPY_REGION = 1283,
+	SVGA_3D_CMD_DX_SET_VERTEX_BUFFERS_V2 = 1284,
+	SVGA_3D_CMD_DX_SET_INDEX_BUFFER_V2 = 1285,
+	SVGA_3D_CMD_DX_SET_VERTEX_BUFFERS_OFFSET_AND_SIZE = 1286,
+	SVGA_3D_CMD_DX_SET_INDEX_BUFFER_OFFSET_AND_SIZE = 1287,
+	SVGA_3D_CMD_DX_DEFINE_RASTERIZER_STATE_V2 = 1288,
+	SVGA_3D_CMD_DX_PRED_STAGING_CONVERT_REGION = 1289,
+	SVGA_3D_CMD_DX_PRED_STAGING_CONVERT = 1290,
+	SVGA_3D_CMD_DX_STAGING_BUFFER_COPY = 1291,
+
+	SVGA_3D_CMD_MAX = 1303,
+	SVGA_3D_CMD_FUTURE_MAX = 3000
+} SVGAFifo3dCmdId;
+
+#define SVGA_NUM_3D_CMD (SVGA_3D_CMD_MAX - SVGA_3D_CMD_BASE)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 id;
+	uint32 size;
+} SVGA3dCmdHeader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 numMipLevels;
+} SVGA3dSurfaceFace;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+	SVGA3dSurface1Flags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+
+	SVGA3dSurfaceFace face[SVGA3D_MAX_SURFACE_FACES];
+
+} SVGA3dCmdDefineSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+	SVGA3dSurface1Flags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+
+	SVGA3dSurfaceFace face[SVGA3D_MAX_SURFACE_FACES];
+	uint32 multisampleCount;
+	SVGA3dTextureFilter autogenFilter;
+
+} SVGA3dCmdDefineSurface_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+} SVGA3dCmdDestroySurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+} SVGA3dCmdDefineContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+} SVGA3dCmdDestroyContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dClearFlag clearFlag;
+	uint32 color;
+	float depth;
+	uint32 stencil;
+
+} SVGA3dCmdClear;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dLightType type;
+	SVGA3dBool inWorldSpace;
+	float diffuse[4];
+	float specular[4];
+	float ambient[4];
+	float position[4];
+	float direction[4];
+	float range;
+	float falloff;
+	float attenuation0;
+	float attenuation1;
+	float attenuation2;
+	float theta;
+	float phi;
+} SVGA3dLightData;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+
+} SVGA3dCmdPresent;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dRenderStateName state;
+	union {
+		uint32 uintValue;
+		float floatValue;
+	};
+} SVGA3dRenderState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+} SVGA3dCmdSetRenderState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dRenderTargetType type;
+	SVGA3dSurfaceImageId target;
+} SVGA3dCmdSetRenderTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dest;
+
+} SVGA3dCmdSurfaceCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId surface;
+	SVGA3dCopyBox box;
+} SVGA3dCmdIntraSurfaceCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 srcSid;
+	uint32 destSid;
+} SVGA3dCmdWholeSurfaceCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dest;
+	SVGA3dBox boxSrc;
+	SVGA3dBox boxDest;
+} SVGA3dCmdSurfaceStretchBltNonMSToMS;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dest;
+	SVGA3dBox boxSrc;
+	SVGA3dBox boxDest;
+	SVGA3dStretchBltMode mode;
+} SVGA3dCmdSurfaceStretchBlt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 discard : 1;
+
+	uint32 unsynchronized : 1;
+
+	uint32 reserved : 30;
+} SVGA3dSurfaceDMAFlags;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAGuestImage guest;
+	SVGA3dSurfaceImageId host;
+	SVGA3dTransferType transfer;
+
+} SVGA3dCmdSurfaceDMA;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 suffixSize;
+
+	uint32 maximumOffset;
+
+	SVGA3dSurfaceDMAFlags flags;
+} SVGA3dCmdSurfaceDMASuffix;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 first;
+	uint32 last;
+} SVGA3dArrayRangeHint;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 surfaceId;
+	uint32 offset;
+	uint32 stride;
+} SVGA3dArray;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dDeclType type;
+	SVGA3dDeclMethod method;
+	SVGA3dDeclUsage usage;
+	uint32 usageIndex;
+} SVGA3dVertexArrayIdentity;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dVertexDecl {
+	SVGA3dVertexArrayIdentity identity;
+	SVGA3dArray array;
+	SVGA3dArrayRangeHint rangeHint;
+} SVGA3dVertexDecl;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dPrimitiveRange {
+	SVGA3dPrimitiveType primType;
+	uint32 primitiveCount;
+
+	SVGA3dArray indexArray;
+	uint32 indexWidth;
+
+	int32 indexBias;
+} SVGA3dPrimitiveRange;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 numVertexDecls;
+	uint32 numRanges;
+
+} SVGA3dCmdDrawPrimitives;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+	uint32 primitiveCount;
+	uint32 startVertexLocation;
+
+	uint8 primitiveType;
+	uint8 padding[3];
+} SVGA3dCmdDraw;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+	uint8 primitiveType;
+
+	uint32 indexBufferSid;
+	uint32 indexBufferOffset;
+
+	uint8 indexBufferStride;
+
+	int32 baseVertexLocation;
+
+	uint32 primitiveCount;
+	uint32 pad0;
+	uint16 pad1;
+} SVGA3dCmdDrawIndexed;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint16 streamOffset;
+	uint8 stream;
+	uint8 type;
+	uint8 method;
+	uint8 usage;
+	uint8 usageIndex;
+	uint8 padding;
+
+} SVGA3dVertexElement;
+#pragma pack(pop)
+
+#define SVGA3D_VERTEX_ELEMENT_RESPECT_STREAM (1 << 7)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+	uint32 numElements;
+
+} SVGA3dCmdSetVertexDecls;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+	uint32 stride;
+	uint32 offset;
+} SVGA3dVertexStream;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+	uint32 numStreams;
+
+} SVGA3dCmdSetVertexStreams;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 numDivisors;
+} SVGA3dCmdSetVertexDivisors;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stage;
+	SVGA3dTextureStateName name;
+	union {
+		uint32 value;
+		float floatValue;
+	};
+} SVGA3dTextureState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+
+} SVGA3dCmdSetTextureState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dTransformType type;
+	float matrix[16];
+} SVGA3dCmdSetTransform;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	float min;
+	float max;
+} SVGA3dZRange;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dZRange zRange;
+} SVGA3dCmdSetZRange;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	float diffuse[4];
+	float ambient[4];
+	float specular[4];
+	float emissive[4];
+	float shininess;
+} SVGA3dMaterial;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dFace face;
+	SVGA3dMaterial material;
+} SVGA3dCmdSetMaterial;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 index;
+	SVGA3dLightData data;
+} SVGA3dCmdSetLightData;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 index;
+	uint32 enabled;
+} SVGA3dCmdSetLightEnabled;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dRect rect;
+} SVGA3dCmdSetViewport;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dRect rect;
+} SVGA3dCmdSetScissorRect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 index;
+	float plane[4];
+} SVGA3dCmdSetClipPlane;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 shid;
+	SVGA3dShaderType type;
+
+} SVGA3dCmdDefineShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 shid;
+	SVGA3dShaderType type;
+} SVGA3dCmdDestroyShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 reg;
+	SVGA3dShaderType type;
+	SVGA3dShaderConstType ctype;
+	uint32 values[4];
+
+} SVGA3dCmdSetShaderConst;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dShaderType type;
+	uint32 shid;
+} SVGA3dCmdSetShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+} SVGA3dCmdBeginQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+	SVGAGuestPtr guestResult;
+} SVGA3dCmdEndQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+	SVGAGuestPtr guestResult;
+} SVGA3dCmdWaitForQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 totalSize;
+	SVGA3dQueryState state;
+	union {
+		uint32 result32;
+		uint32 queryCookie;
+	};
+} SVGA3dQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId srcImage;
+	SVGASignedRect srcRect;
+	uint32 destScreenId;
+	SVGASignedRect destRect;
+
+} SVGA3dCmdBlitSurfaceToScreen;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+	SVGA3dTextureFilter filter;
+} SVGA3dCmdGenerateMipmaps;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+} SVGA3dCmdActivateSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+} SVGA3dCmdDeactivateSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdScreenDMA {
+	uint32 screenId;
+	SVGAGuestImage refBuffer;
+	SVGAGuestImage destBuffer;
+	SVGAGuestImage changeMap;
+} SVGA3dCmdScreenDMA;
+#pragma pack(pop)
+
+#define SVGA3D_LOTRANSBLT_HONORALPHA (0x01)
+#define SVGA3D_LOSTRETCHBLT_MIRRORX (0x01)
+#define SVGA3D_LOSTRETCHBLT_MIRRORY (0x02)
+#define SVGA3D_LOALPHABLEND_SRCHASALPHA (0x01)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsBitBlt {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dst;
+	SVGA3dLogicOp logicOp;
+	SVGA3dLogicOpRop3 logicOpRop3;
+
+} SVGA3dCmdLogicOpsBitBlt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsTransBlt {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dst;
+	uint32 color;
+	uint32 flags;
+	SVGA3dBox srcBox;
+	SVGA3dSignedBox dstBox;
+	SVGA3dBox clipBox;
+} SVGA3dCmdLogicOpsTransBlt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsStretchBlt {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dst;
+	uint16 mode;
+	uint16 flags;
+	SVGA3dBox srcBox;
+	SVGA3dSignedBox dstBox;
+	SVGA3dBox clipBox;
+} SVGA3dCmdLogicOpsStretchBlt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsColorFill {
+	SVGA3dSurfaceImageId dst;
+	uint32 color;
+	SVGA3dLogicOp logicOp;
+	SVGA3dLogicOpRop3 logicOpRop3;
+
+} SVGA3dCmdLogicOpsColorFill;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsAlphaBlend {
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dst;
+	uint32 alphaVal;
+	uint32 flags;
+	SVGA3dBox srcBox;
+	SVGA3dSignedBox dstBox;
+	SVGA3dBox clipBox;
+} SVGA3dCmdLogicOpsAlphaBlend;
+#pragma pack(pop)
+
+#define SVGA3D_CLEARTYPE_INVALID_GAMMA_INDEX 0xFFFFFFFF
+
+#define SVGA3D_CLEARTYPE_GAMMA_WIDTH 512
+#define SVGA3D_CLEARTYPE_GAMMA_HEIGHT 16
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdLogicOpsClearTypeBlend {
+	SVGA3dSurfaceImageId tmp;
+	SVGA3dSurfaceImageId dst;
+	SVGA3dSurfaceImageId gammaSurf;
+	SVGA3dSurfaceImageId alphaSurf;
+	uint32 gamma;
+	uint32 color;
+	uint32 color2;
+	int32 alphaOffsetX;
+	int32 alphaOffsetY;
+
+} SVGA3dCmdLogicOpsClearTypeBlend;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAMobFormat ptDepth;
+	uint32 sizeInBytes;
+	PPN64 base;
+} SVGAOTableMobEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceFormat format;
+	SVGA3dSurface1Flags surface1Flags;
+	uint32 numMipLevels;
+	uint32 multisampleCount;
+	SVGA3dTextureFilter autogenFilter;
+	SVGA3dSize size;
+	SVGAMobId mobid;
+	uint32 arraySize;
+	uint32 mobPitch;
+	SVGA3dSurface2Flags surface2Flags;
+	uint8 multisamplePattern;
+	uint8 qualityLevel;
+	uint16 bufferByteStride;
+	float minLOD;
+	uint32 pad0[2];
+} SVGAOTableSurfaceEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGAMobId mobid;
+} SVGAOTableContextEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dShaderType type;
+	uint32 sizeInBytes;
+	uint32 offsetInBytes;
+	SVGAMobId mobid;
+} SVGAOTableShaderEntry;
+#pragma pack(pop)
+
+#define SVGA_STFLAG_PRIMARY (1 << 0)
+#define SVGA_STFLAG_RESERVED (1 << 1)
+typedef uint32 SVGAScreenTargetFlags;
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceImageId image;
+	uint32 width;
+	uint32 height;
+	int32 xRoot;
+	int32 yRoot;
+	SVGAScreenTargetFlags flags;
+	uint32 dpi;
+	uint32 pad[7];
+} SVGAOTableScreenTargetEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	float value[4];
+} SVGA3dShaderConstFloat;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	int32 value[4];
+} SVGA3dShaderConstInt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 value;
+} SVGA3dShaderConstBool;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint16 streamOffset;
+	uint8 stream;
+	uint8 type;
+	uint8 methodUsage;
+	uint8 usageIndex;
+} SVGAGBVertexElement;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+	uint16 stride;
+	uint32 offset;
+} SVGAGBVertexStream;
+#pragma pack(pop)
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dRect viewport;
+	SVGA3dRect scissorRect;
+	SVGA3dZRange zRange;
+
+	SVGA3dSurfaceImageId renderTargets[SVGA3D_RT_MAX];
+	SVGAGBVertexElement decl1[4];
+
+	uint32 renderStates[SVGA3D_RS_MAX];
+	SVGAGBVertexElement decl2[18];
+	uint32 pad0[2];
+
+	struct {
+		SVGA3dFace face;
+		SVGA3dMaterial material;
+	} material;
+
+	float clipPlanes[SVGA3D_MAX_CLIP_PLANES][4];
+	float matrices[SVGA3D_TRANSFORM_MAX][16];
+
+	SVGA3dBool lightEnabled[SVGA3D_NUM_LIGHTS];
+	SVGA3dLightData lightData[SVGA3D_NUM_LIGHTS];
+
+	uint32 shaders[SVGA3D_NUM_SHADERTYPE_PREDX];
+	SVGAGBVertexElement decl3[10];
+	uint32 pad1[3];
+
+	uint32 occQueryActive;
+	uint32 occQueryValue;
+
+	SVGA3dShaderConstInt pShaderIValues[SVGA3D_CONSTINTREG_MAX];
+	SVGA3dShaderConstInt vShaderIValues[SVGA3D_CONSTINTREG_MAX];
+	uint16 pShaderBValues;
+	uint16 vShaderBValues;
+
+	SVGAGBVertexStream streams[SVGA3D_MAX_VERTEX_ARRAYS];
+	SVGA3dVertexDivisor divisors[SVGA3D_MAX_VERTEX_ARRAYS];
+	uint32 numVertexDecls;
+	uint32 numVertexStreams;
+	uint32 numVertexDivisors;
+	uint32 pad2[30];
+
+	uint32 tsColorKey[SVGA3D_NUM_TEXTURE_UNITS];
+	uint32 textureStages[SVGA3D_NUM_TEXTURE_UNITS][SVGA3D_TS_CONSTANT + 1];
+	uint32 tsColorKeyEnable[SVGA3D_NUM_TEXTURE_UNITS];
+
+	SVGA3dShaderConstFloat pShaderFValues[SVGA3D_CONSTREG_MAX];
+	SVGA3dShaderConstFloat vShaderFValues[SVGA3D_CONSTREG_MAX];
+} SVGAGBContextData;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAOTableType type;
+	PPN32 baseAddress;
+	uint32 sizeInBytes;
+	uint32 validSizeInBytes;
+	SVGAMobFormat ptDepth;
+} SVGA3dCmdSetOTableBase;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAOTableType type;
+	PPN64 baseAddress;
+	uint32 sizeInBytes;
+	uint32 validSizeInBytes;
+	SVGAMobFormat ptDepth;
+} SVGA3dCmdSetOTableBase64;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAOTableType type;
+	PPN64 baseAddress;
+	uint32 sizeInBytes;
+	uint32 validSizeInBytes;
+	SVGAMobFormat ptDepth;
+} SVGA3dCmdGrowOTable;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAOTableType type;
+} SVGA3dCmdReadbackOTable;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBMob {
+	SVGAMobId mobid;
+	SVGAMobFormat ptDepth;
+	PPN32 base;
+	uint32 sizeInBytes;
+} SVGA3dCmdDefineGBMob;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDestroyGBMob {
+	SVGAMobId mobid;
+} SVGA3dCmdDestroyGBMob;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBMob64 {
+	SVGAMobId mobid;
+	SVGAMobFormat ptDepth;
+	PPN64 base;
+	uint32 sizeInBytes;
+} SVGA3dCmdDefineGBMob64;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdRedefineGBMob64 {
+	SVGAMobId mobid;
+	SVGAMobFormat ptDepth;
+	PPN64 base;
+	uint32 sizeInBytes;
+} SVGA3dCmdRedefineGBMob64;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdUpdateGBMobMapping {
+	SVGAMobId mobid;
+} SVGA3dCmdUpdateGBMobMapping;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBSurface {
+	uint32 sid;
+	SVGA3dSurface1Flags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+	uint32 numMipLevels;
+	uint32 multisampleCount;
+	SVGA3dTextureFilter autogenFilter;
+	SVGA3dSize size;
+} SVGA3dCmdDefineGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBSurface_v2 {
+	uint32 sid;
+	SVGA3dSurface1Flags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+	uint32 numMipLevels;
+	uint32 multisampleCount;
+	SVGA3dTextureFilter autogenFilter;
+	SVGA3dSize size;
+	uint32 arraySize;
+	uint32 pad;
+} SVGA3dCmdDefineGBSurface_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBSurface_v3 {
+	uint32 sid;
+	SVGA3dSurfaceAllFlags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+	uint32 numMipLevels;
+	uint32 multisampleCount;
+	SVGA3dMSPattern multisamplePattern;
+	SVGA3dMSQualityLevel qualityLevel;
+	SVGA3dTextureFilter autogenFilter;
+	SVGA3dSize size;
+	uint32 arraySize;
+} SVGA3dCmdDefineGBSurface_v3;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBSurface_v4 {
+	uint32 sid;
+	SVGA3dSurfaceAllFlags surfaceFlags;
+	SVGA3dSurfaceFormat format;
+	uint32 numMipLevels;
+	uint32 multisampleCount;
+	SVGA3dMSPattern multisamplePattern;
+	SVGA3dMSQualityLevel qualityLevel;
+	SVGA3dTextureFilter autogenFilter;
+	SVGA3dSize size;
+	uint32 arraySize;
+	uint32 bufferByteStride;
+} SVGA3dCmdDefineGBSurface_v4;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDestroyGBSurface {
+	uint32 sid;
+} SVGA3dCmdDestroyGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdBindGBSurface {
+	uint32 sid;
+	SVGAMobId mobid;
+} SVGA3dCmdBindGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdBindGBSurfaceWithPitch {
+	uint32 sid;
+	SVGAMobId mobid;
+	uint32 baseLevelPitch;
+} SVGA3dCmdBindGBSurfaceWithPitch;
+#pragma pack(pop)
+
+#define SVGA3D_COND_BIND_GB_SURFACE_FLAG_READBACK (1 << 0)
+#define SVGA3D_COND_BIND_GB_SURFACE_FLAG_UPDATE (1 << 1)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdCondBindGBSurface {
+	uint32 sid;
+	SVGAMobId testMobid;
+	SVGAMobId mobid;
+	uint32 flags;
+} SVGA3dCmdCondBindGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdUpdateGBImage {
+	SVGA3dSurfaceImageId image;
+	SVGA3dBox box;
+} SVGA3dCmdUpdateGBImage;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdUpdateGBSurface {
+	uint32 sid;
+} SVGA3dCmdUpdateGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdReadbackGBImage {
+	SVGA3dSurfaceImageId image;
+} SVGA3dCmdReadbackGBImage;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdReadbackGBSurface {
+	uint32 sid;
+} SVGA3dCmdReadbackGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdReadbackGBImagePartial {
+	SVGA3dSurfaceImageId image;
+	SVGA3dBox box;
+	uint32 invertBox;
+} SVGA3dCmdReadbackGBImagePartial;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdInvalidateGBImage {
+	SVGA3dSurfaceImageId image;
+} SVGA3dCmdInvalidateGBImage;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdInvalidateGBSurface {
+	uint32 sid;
+} SVGA3dCmdInvalidateGBSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdInvalidateGBImagePartial {
+	SVGA3dSurfaceImageId image;
+	SVGA3dBox box;
+	uint32 invertBox;
+} SVGA3dCmdInvalidateGBImagePartial;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBContext {
+	uint32 cid;
+} SVGA3dCmdDefineGBContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDestroyGBContext {
+	uint32 cid;
+} SVGA3dCmdDestroyGBContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdBindGBContext {
+	uint32 cid;
+	SVGAMobId mobid;
+	uint32 validContents;
+} SVGA3dCmdBindGBContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdReadbackGBContext {
+	uint32 cid;
+} SVGA3dCmdReadbackGBContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdInvalidateGBContext {
+	uint32 cid;
+} SVGA3dCmdInvalidateGBContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDefineGBShader {
+	uint32 shid;
+	SVGA3dShaderType type;
+	uint32 sizeInBytes;
+} SVGA3dCmdDefineGBShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdBindGBShader {
+	uint32 shid;
+	SVGAMobId mobid;
+	uint32 offsetInBytes;
+} SVGA3dCmdBindGBShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDestroyGBShader {
+	uint32 shid;
+} SVGA3dCmdDestroyGBShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	uint32 regStart;
+	SVGA3dShaderType shaderType;
+	SVGA3dShaderConstType constType;
+
+} SVGA3dCmdSetGBShaderConstInline;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+} SVGA3dCmdBeginGBQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+	SVGAMobId mobid;
+	uint32 offset;
+} SVGA3dCmdEndGBQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGA3dQueryType type;
+	SVGAMobId mobid;
+	uint32 offset;
+} SVGA3dCmdWaitForGBQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAMobId mobid;
+	uint32 mustBeZero;
+	uint32 initialized;
+} SVGA3dCmdEnableGart;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAMobId mobid;
+	uint32 gartOffset;
+} SVGA3dCmdMapMobIntoGart;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 gartOffset;
+	uint32 numPages;
+} SVGA3dCmdUnmapGartRange;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	uint32 width;
+	uint32 height;
+	int32 xRoot;
+	int32 yRoot;
+	SVGAScreenTargetFlags flags;
+
+	uint32 dpi;
+} SVGA3dCmdDefineGBScreenTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+} SVGA3dCmdDestroyGBScreenTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	SVGA3dSurfaceImageId image;
+} SVGA3dCmdBindGBScreenTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	SVGA3dRect rect;
+} SVGA3dCmdUpdateGBScreenTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	SVGA3dRect rect;
+	SVGA3dFrameUpdateType type;
+} SVGA3dCmdUpdateGBScreenTarget_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	SVGA3dRect rect;
+	SVGA3dFrameUpdateType type;
+	SVGAUnsignedPoint srcPoint;
+} SVGA3dCmdUpdateGBScreenTargetMove;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdGBScreenDMA {
+	uint32 screenId;
+	uint32 dead;
+	SVGAMobId destMobID;
+	uint32 destPitch;
+	SVGAMobId changeMapMobID;
+} SVGA3dCmdGBScreenDMA;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 value;
+	uint32 mobId;
+	uint32 mobOffset;
+} SVGA3dCmdGBMobFence;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 stid;
+	SVGA3dSurfaceImageId dest;
+
+	uint32 statusMobId;
+	uint32 statusMobOffset;
+
+	uint32 mustBeInvalidId;
+	uint32 mustBeZero;
+} SVGA3dCmdScreenCopy;
+#pragma pack(pop)
+
+#define SVGA_SCREEN_COPY_STATUS_FAILURE 0x00
+#define SVGA_SCREEN_COPY_STATUS_SUCCESS 0x01
+#define SVGA_SCREEN_COPY_STATUS_INVALID 0xFFFFFFFF
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+} SVGA3dCmdWriteZeroSurface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 sid;
+} SVGA3dCmdUpdateZeroSurface;
+#pragma pack(pop)
+
+#endif
diff --git a/lib/svga/svga3d_devcaps.h b/lib/svga/svga3d_devcaps.h
new file mode 100644
index 00000000..286fe552
--- /dev/null
+++ b/lib/svga/svga3d_devcaps.h
@@ -0,0 +1,369 @@
+/**********************************************************
+ * Copyright 1998-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_devcaps.h --
+ *
+ *    SVGA 3d caps definitions
+ */
+
+#ifndef _SVGA3D_DEVCAPS_H_
+#define _SVGA3D_DEVCAPS_H_
+
+#include "svga3d_types.h"
+
+#define SVGA3D_MAKE_HWVERSION(major, minor) (((major) << 16) | ((minor)&0xFF))
+#define SVGA3D_MAJOR_HWVERSION(version) ((version) >> 16)
+#define SVGA3D_MINOR_HWVERSION(version) ((version)&0xFF)
+
+typedef enum {
+	SVGA3D_HWVERSION_WS5_RC1 = SVGA3D_MAKE_HWVERSION(0, 1),
+	SVGA3D_HWVERSION_WS5_RC2 = SVGA3D_MAKE_HWVERSION(0, 2),
+	SVGA3D_HWVERSION_WS51_RC1 = SVGA3D_MAKE_HWVERSION(0, 3),
+	SVGA3D_HWVERSION_WS6_B1 = SVGA3D_MAKE_HWVERSION(1, 1),
+	SVGA3D_HWVERSION_FUSION_11 = SVGA3D_MAKE_HWVERSION(1, 4),
+	SVGA3D_HWVERSION_WS65_B1 = SVGA3D_MAKE_HWVERSION(2, 0),
+	SVGA3D_HWVERSION_WS8_B1 = SVGA3D_MAKE_HWVERSION(2, 1),
+	SVGA3D_HWVERSION_CURRENT = SVGA3D_HWVERSION_WS8_B1,
+} SVGA3dHardwareVersion;
+
+typedef uint32 SVGA3dDevCapIndex;
+
+#define SVGA3D_DEVCAP_INVALID ((uint32)-1)
+#define SVGA3D_DEVCAP_3D 0
+#define SVGA3D_DEVCAP_MAX_LIGHTS 1
+
+#define SVGA3D_DEVCAP_MAX_TEXTURES 2
+#define SVGA3D_DEVCAP_MAX_CLIP_PLANES 3
+#define SVGA3D_DEVCAP_VERTEX_SHADER_VERSION 4
+#define SVGA3D_DEVCAP_VERTEX_SHADER 5
+#define SVGA3D_DEVCAP_FRAGMENT_SHADER_VERSION 6
+#define SVGA3D_DEVCAP_FRAGMENT_SHADER 7
+#define SVGA3D_DEVCAP_MAX_RENDER_TARGETS 8
+#define SVGA3D_DEVCAP_S23E8_TEXTURES 9
+#define SVGA3D_DEVCAP_S10E5_TEXTURES 10
+#define SVGA3D_DEVCAP_MAX_FIXED_VERTEXBLEND 11
+#define SVGA3D_DEVCAP_D16_BUFFER_FORMAT 12
+#define SVGA3D_DEVCAP_D24S8_BUFFER_FORMAT 13
+#define SVGA3D_DEVCAP_D24X8_BUFFER_FORMAT 14
+#define SVGA3D_DEVCAP_QUERY_TYPES 15
+#define SVGA3D_DEVCAP_TEXTURE_GRADIENT_SAMPLING 16
+#define SVGA3D_DEVCAP_MAX_POINT_SIZE 17
+#define SVGA3D_DEVCAP_MAX_SHADER_TEXTURES 18
+#define SVGA3D_DEVCAP_MAX_TEXTURE_WIDTH 19
+#define SVGA3D_DEVCAP_MAX_TEXTURE_HEIGHT 20
+#define SVGA3D_DEVCAP_MAX_VOLUME_EXTENT 21
+#define SVGA3D_DEVCAP_MAX_TEXTURE_REPEAT 22
+#define SVGA3D_DEVCAP_MAX_TEXTURE_ASPECT_RATIO 23
+#define SVGA3D_DEVCAP_MAX_TEXTURE_ANISOTROPY 24
+#define SVGA3D_DEVCAP_MAX_PRIMITIVE_COUNT 25
+#define SVGA3D_DEVCAP_MAX_VERTEX_INDEX 26
+#define SVGA3D_DEVCAP_MAX_VERTEX_SHADER_INSTRUCTIONS 27
+#define SVGA3D_DEVCAP_MAX_FRAGMENT_SHADER_INSTRUCTIONS 28
+#define SVGA3D_DEVCAP_MAX_VERTEX_SHADER_TEMPS 29
+#define SVGA3D_DEVCAP_MAX_FRAGMENT_SHADER_TEMPS 30
+#define SVGA3D_DEVCAP_TEXTURE_OPS 31
+#define SVGA3D_DEVCAP_SURFACEFMT_X8R8G8B8 32
+#define SVGA3D_DEVCAP_SURFACEFMT_A8R8G8B8 33
+#define SVGA3D_DEVCAP_SURFACEFMT_A2R10G10B10 34
+#define SVGA3D_DEVCAP_SURFACEFMT_X1R5G5B5 35
+#define SVGA3D_DEVCAP_SURFACEFMT_A1R5G5B5 36
+#define SVGA3D_DEVCAP_SURFACEFMT_A4R4G4B4 37
+#define SVGA3D_DEVCAP_SURFACEFMT_R5G6B5 38
+#define SVGA3D_DEVCAP_SURFACEFMT_LUMINANCE16 39
+#define SVGA3D_DEVCAP_SURFACEFMT_LUMINANCE8_ALPHA8 40
+#define SVGA3D_DEVCAP_SURFACEFMT_ALPHA8 41
+#define SVGA3D_DEVCAP_SURFACEFMT_LUMINANCE8 42
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_D16 43
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_D24S8 44
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_D24X8 45
+#define SVGA3D_DEVCAP_SURFACEFMT_DXT1 46
+#define SVGA3D_DEVCAP_SURFACEFMT_DXT2 47
+#define SVGA3D_DEVCAP_SURFACEFMT_DXT3 48
+#define SVGA3D_DEVCAP_SURFACEFMT_DXT4 49
+#define SVGA3D_DEVCAP_SURFACEFMT_DXT5 50
+#define SVGA3D_DEVCAP_SURFACEFMT_BUMPX8L8V8U8 51
+#define SVGA3D_DEVCAP_SURFACEFMT_A2W10V10U10 52
+#define SVGA3D_DEVCAP_SURFACEFMT_BUMPU8V8 53
+#define SVGA3D_DEVCAP_SURFACEFMT_Q8W8V8U8 54
+#define SVGA3D_DEVCAP_SURFACEFMT_CxV8U8 55
+#define SVGA3D_DEVCAP_SURFACEFMT_R_S10E5 56
+#define SVGA3D_DEVCAP_SURFACEFMT_R_S23E8 57
+#define SVGA3D_DEVCAP_SURFACEFMT_RG_S10E5 58
+#define SVGA3D_DEVCAP_SURFACEFMT_RG_S23E8 59
+#define SVGA3D_DEVCAP_SURFACEFMT_ARGB_S10E5 60
+#define SVGA3D_DEVCAP_SURFACEFMT_ARGB_S23E8 61
+
+#define SVGA3D_DEVCAP_MISSING62 62
+
+#define SVGA3D_DEVCAP_MAX_VERTEX_SHADER_TEXTURES 63
+
+#define SVGA3D_DEVCAP_MAX_SIMULTANEOUS_RENDER_TARGETS 64
+
+#define SVGA3D_DEVCAP_SURFACEFMT_V16U16 65
+#define SVGA3D_DEVCAP_SURFACEFMT_G16R16 66
+#define SVGA3D_DEVCAP_SURFACEFMT_A16B16G16R16 67
+#define SVGA3D_DEVCAP_SURFACEFMT_UYVY 68
+#define SVGA3D_DEVCAP_SURFACEFMT_YUY2 69
+
+#define SVGA3D_DEVCAP_DEAD4 70
+#define SVGA3D_DEVCAP_DEAD5 71
+#define SVGA3D_DEVCAP_DEAD7 72
+#define SVGA3D_DEVCAP_DEAD6 73
+
+#define SVGA3D_DEVCAP_AUTOGENMIPMAPS 74
+#define SVGA3D_DEVCAP_SURFACEFMT_NV12 75
+#define SVGA3D_DEVCAP_DEAD10 76
+
+#define SVGA3D_DEVCAP_MAX_CONTEXT_IDS 77
+
+#define SVGA3D_DEVCAP_MAX_SURFACE_IDS 78
+
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_DF16 79
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_DF24 80
+#define SVGA3D_DEVCAP_SURFACEFMT_Z_D24S8_INT 81
+
+#define SVGA3D_DEVCAP_SURFACEFMT_ATI1 82
+#define SVGA3D_DEVCAP_SURFACEFMT_ATI2 83
+
+#define SVGA3D_DEVCAP_DEAD1 84
+#define SVGA3D_DEVCAP_DEAD8 85
+#define SVGA3D_DEVCAP_DEAD9 86
+
+#define SVGA3D_DEVCAP_LINE_AA 87
+#define SVGA3D_DEVCAP_LINE_STIPPLE 88
+#define SVGA3D_DEVCAP_MAX_LINE_WIDTH 89
+#define SVGA3D_DEVCAP_MAX_AA_LINE_WIDTH 90
+
+#define SVGA3D_DEVCAP_SURFACEFMT_YV12 91
+
+#define SVGA3D_DEVCAP_DEAD3 92
+
+#define SVGA3D_DEVCAP_TS_COLOR_KEY 93
+
+#define SVGA3D_DEVCAP_DEAD2 94
+
+#define SVGA3D_DEVCAP_DXCONTEXT 95
+
+#define SVGA3D_DEVCAP_DEAD11 96
+
+#define SVGA3D_DEVCAP_DX_MAX_VERTEXBUFFERS 97
+
+#define SVGA3D_DEVCAP_DX_MAX_CONSTANT_BUFFERS 98
+
+#define SVGA3D_DEVCAP_DX_PROVOKING_VERTEX 99
+
+#define SVGA3D_DEVCAP_DXFMT_X8R8G8B8 100
+#define SVGA3D_DEVCAP_DXFMT_A8R8G8B8 101
+#define SVGA3D_DEVCAP_DXFMT_R5G6B5 102
+#define SVGA3D_DEVCAP_DXFMT_X1R5G5B5 103
+#define SVGA3D_DEVCAP_DXFMT_A1R5G5B5 104
+#define SVGA3D_DEVCAP_DXFMT_A4R4G4B4 105
+#define SVGA3D_DEVCAP_DXFMT_Z_D32 106
+#define SVGA3D_DEVCAP_DXFMT_Z_D16 107
+#define SVGA3D_DEVCAP_DXFMT_Z_D24S8 108
+#define SVGA3D_DEVCAP_DXFMT_Z_D15S1 109
+#define SVGA3D_DEVCAP_DXFMT_LUMINANCE8 110
+#define SVGA3D_DEVCAP_DXFMT_LUMINANCE4_ALPHA4 111
+#define SVGA3D_DEVCAP_DXFMT_LUMINANCE16 112
+#define SVGA3D_DEVCAP_DXFMT_LUMINANCE8_ALPHA8 113
+#define SVGA3D_DEVCAP_DXFMT_DXT1 114
+#define SVGA3D_DEVCAP_DXFMT_DXT2 115
+#define SVGA3D_DEVCAP_DXFMT_DXT3 116
+#define SVGA3D_DEVCAP_DXFMT_DXT4 117
+#define SVGA3D_DEVCAP_DXFMT_DXT5 118
+#define SVGA3D_DEVCAP_DXFMT_BUMPU8V8 119
+#define SVGA3D_DEVCAP_DXFMT_BUMPL6V5U5 120
+#define SVGA3D_DEVCAP_DXFMT_BUMPX8L8V8U8 121
+#define SVGA3D_DEVCAP_DXFMT_FORMAT_DEAD1 122
+#define SVGA3D_DEVCAP_DXFMT_ARGB_S10E5 123
+#define SVGA3D_DEVCAP_DXFMT_ARGB_S23E8 124
+#define SVGA3D_DEVCAP_DXFMT_A2R10G10B10 125
+#define SVGA3D_DEVCAP_DXFMT_V8U8 126
+#define SVGA3D_DEVCAP_DXFMT_Q8W8V8U8 127
+#define SVGA3D_DEVCAP_DXFMT_CxV8U8 128
+#define SVGA3D_DEVCAP_DXFMT_X8L8V8U8 129
+#define SVGA3D_DEVCAP_DXFMT_A2W10V10U10 130
+#define SVGA3D_DEVCAP_DXFMT_ALPHA8 131
+#define SVGA3D_DEVCAP_DXFMT_R_S10E5 132
+#define SVGA3D_DEVCAP_DXFMT_R_S23E8 133
+#define SVGA3D_DEVCAP_DXFMT_RG_S10E5 134
+#define SVGA3D_DEVCAP_DXFMT_RG_S23E8 135
+#define SVGA3D_DEVCAP_DXFMT_BUFFER 136
+#define SVGA3D_DEVCAP_DXFMT_Z_D24X8 137
+#define SVGA3D_DEVCAP_DXFMT_V16U16 138
+#define SVGA3D_DEVCAP_DXFMT_G16R16 139
+#define SVGA3D_DEVCAP_DXFMT_A16B16G16R16 140
+#define SVGA3D_DEVCAP_DXFMT_UYVY 141
+#define SVGA3D_DEVCAP_DXFMT_YUY2 142
+#define SVGA3D_DEVCAP_DXFMT_NV12 143
+#define SVGA3D_DEVCAP_DXFMT_FORMAT_DEAD2 144
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32A32_TYPELESS 145
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32A32_UINT 146
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32A32_SINT 147
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32_TYPELESS 148
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32_FLOAT 149
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32_UINT 150
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32_SINT 151
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_TYPELESS 152
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_UINT 153
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_SNORM 154
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_SINT 155
+#define SVGA3D_DEVCAP_DXFMT_R32G32_TYPELESS 156
+#define SVGA3D_DEVCAP_DXFMT_R32G32_UINT 157
+#define SVGA3D_DEVCAP_DXFMT_R32G32_SINT 158
+#define SVGA3D_DEVCAP_DXFMT_R32G8X24_TYPELESS 159
+#define SVGA3D_DEVCAP_DXFMT_D32_FLOAT_S8X24_UINT 160
+#define SVGA3D_DEVCAP_DXFMT_R32_FLOAT_X8X24 161
+#define SVGA3D_DEVCAP_DXFMT_X32_G8X24_UINT 162
+#define SVGA3D_DEVCAP_DXFMT_R10G10B10A2_TYPELESS 163
+#define SVGA3D_DEVCAP_DXFMT_R10G10B10A2_UINT 164
+#define SVGA3D_DEVCAP_DXFMT_R11G11B10_FLOAT 165
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_TYPELESS 166
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_UNORM 167
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_UNORM_SRGB 168
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_UINT 169
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_SINT 170
+#define SVGA3D_DEVCAP_DXFMT_R16G16_TYPELESS 171
+#define SVGA3D_DEVCAP_DXFMT_R16G16_UINT 172
+#define SVGA3D_DEVCAP_DXFMT_R16G16_SINT 173
+#define SVGA3D_DEVCAP_DXFMT_R32_TYPELESS 174
+#define SVGA3D_DEVCAP_DXFMT_D32_FLOAT 175
+#define SVGA3D_DEVCAP_DXFMT_R32_UINT 176
+#define SVGA3D_DEVCAP_DXFMT_R32_SINT 177
+#define SVGA3D_DEVCAP_DXFMT_R24G8_TYPELESS 178
+#define SVGA3D_DEVCAP_DXFMT_D24_UNORM_S8_UINT 179
+#define SVGA3D_DEVCAP_DXFMT_R24_UNORM_X8 180
+#define SVGA3D_DEVCAP_DXFMT_X24_G8_UINT 181
+#define SVGA3D_DEVCAP_DXFMT_R8G8_TYPELESS 182
+#define SVGA3D_DEVCAP_DXFMT_R8G8_UNORM 183
+#define SVGA3D_DEVCAP_DXFMT_R8G8_UINT 184
+#define SVGA3D_DEVCAP_DXFMT_R8G8_SINT 185
+#define SVGA3D_DEVCAP_DXFMT_R16_TYPELESS 186
+#define SVGA3D_DEVCAP_DXFMT_R16_UNORM 187
+#define SVGA3D_DEVCAP_DXFMT_R16_UINT 188
+#define SVGA3D_DEVCAP_DXFMT_R16_SNORM 189
+#define SVGA3D_DEVCAP_DXFMT_R16_SINT 190
+#define SVGA3D_DEVCAP_DXFMT_R8_TYPELESS 191
+#define SVGA3D_DEVCAP_DXFMT_R8_UNORM 192
+#define SVGA3D_DEVCAP_DXFMT_R8_UINT 193
+#define SVGA3D_DEVCAP_DXFMT_R8_SNORM 194
+#define SVGA3D_DEVCAP_DXFMT_R8_SINT 195
+#define SVGA3D_DEVCAP_DXFMT_P8 196
+#define SVGA3D_DEVCAP_DXFMT_R9G9B9E5_SHAREDEXP 197
+#define SVGA3D_DEVCAP_DXFMT_R8G8_B8G8_UNORM 198
+#define SVGA3D_DEVCAP_DXFMT_G8R8_G8B8_UNORM 199
+#define SVGA3D_DEVCAP_DXFMT_BC1_TYPELESS 200
+#define SVGA3D_DEVCAP_DXFMT_BC1_UNORM_SRGB 201
+#define SVGA3D_DEVCAP_DXFMT_BC2_TYPELESS 202
+#define SVGA3D_DEVCAP_DXFMT_BC2_UNORM_SRGB 203
+#define SVGA3D_DEVCAP_DXFMT_BC3_TYPELESS 204
+#define SVGA3D_DEVCAP_DXFMT_BC3_UNORM_SRGB 205
+#define SVGA3D_DEVCAP_DXFMT_BC4_TYPELESS 206
+#define SVGA3D_DEVCAP_DXFMT_ATI1 207
+#define SVGA3D_DEVCAP_DXFMT_BC4_SNORM 208
+#define SVGA3D_DEVCAP_DXFMT_BC5_TYPELESS 209
+#define SVGA3D_DEVCAP_DXFMT_ATI2 210
+#define SVGA3D_DEVCAP_DXFMT_BC5_SNORM 211
+#define SVGA3D_DEVCAP_DXFMT_R10G10B10_XR_BIAS_A2_UNORM 212
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8A8_TYPELESS 213
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8A8_UNORM_SRGB 214
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8X8_TYPELESS 215
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8X8_UNORM_SRGB 216
+#define SVGA3D_DEVCAP_DXFMT_Z_DF16 217
+#define SVGA3D_DEVCAP_DXFMT_Z_DF24 218
+#define SVGA3D_DEVCAP_DXFMT_Z_D24S8_INT 219
+#define SVGA3D_DEVCAP_DXFMT_YV12 220
+#define SVGA3D_DEVCAP_DXFMT_R32G32B32A32_FLOAT 221
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_FLOAT 222
+#define SVGA3D_DEVCAP_DXFMT_R16G16B16A16_UNORM 223
+#define SVGA3D_DEVCAP_DXFMT_R32G32_FLOAT 224
+#define SVGA3D_DEVCAP_DXFMT_R10G10B10A2_UNORM 225
+#define SVGA3D_DEVCAP_DXFMT_R8G8B8A8_SNORM 226
+#define SVGA3D_DEVCAP_DXFMT_R16G16_FLOAT 227
+#define SVGA3D_DEVCAP_DXFMT_R16G16_UNORM 228
+#define SVGA3D_DEVCAP_DXFMT_R16G16_SNORM 229
+#define SVGA3D_DEVCAP_DXFMT_R32_FLOAT 230
+#define SVGA3D_DEVCAP_DXFMT_R8G8_SNORM 231
+#define SVGA3D_DEVCAP_DXFMT_R16_FLOAT 232
+#define SVGA3D_DEVCAP_DXFMT_D16_UNORM 233
+#define SVGA3D_DEVCAP_DXFMT_A8_UNORM 234
+#define SVGA3D_DEVCAP_DXFMT_BC1_UNORM 235
+#define SVGA3D_DEVCAP_DXFMT_BC2_UNORM 236
+#define SVGA3D_DEVCAP_DXFMT_BC3_UNORM 237
+#define SVGA3D_DEVCAP_DXFMT_B5G6R5_UNORM 238
+#define SVGA3D_DEVCAP_DXFMT_B5G5R5A1_UNORM 239
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8A8_UNORM 240
+#define SVGA3D_DEVCAP_DXFMT_B8G8R8X8_UNORM 241
+#define SVGA3D_DEVCAP_DXFMT_BC4_UNORM 242
+#define SVGA3D_DEVCAP_DXFMT_BC5_UNORM 243
+
+#define SVGA3D_DEVCAP_SM41 244
+#define SVGA3D_DEVCAP_MULTISAMPLE_2X 245
+#define SVGA3D_DEVCAP_MULTISAMPLE_4X 246
+
+#define SVGA3D_DEVCAP_MS_FULL_QUALITY 247
+
+#define SVGA3D_DEVCAP_LOGICOPS 248
+
+#define SVGA3D_DEVCAP_LOGIC_BLENDOPS 249
+
+#define SVGA3D_DEVCAP_DEAD12 250
+
+#define SVGA3D_DEVCAP_DXFMT_BC6H_TYPELESS 251
+#define SVGA3D_DEVCAP_DXFMT_BC6H_UF16 252
+#define SVGA3D_DEVCAP_DXFMT_BC6H_SF16 253
+#define SVGA3D_DEVCAP_DXFMT_BC7_TYPELESS 254
+#define SVGA3D_DEVCAP_DXFMT_BC7_UNORM 255
+#define SVGA3D_DEVCAP_DXFMT_BC7_UNORM_SRGB 256
+
+#define SVGA3D_DEVCAP_DEAD13 257
+
+#define SVGA3D_DEVCAP_SM5 258
+#define SVGA3D_DEVCAP_MULTISAMPLE_8X 259
+
+#define SVGA3D_DEVCAP_MAX 262
+
+#define SVGA3D_DXFMT_SUPPORTED (1 << 0)
+#define SVGA3D_DXFMT_SHADER_SAMPLE (1 << 1)
+#define SVGA3D_DXFMT_COLOR_RENDERTARGET (1 << 2)
+#define SVGA3D_DXFMT_DEPTH_RENDERTARGET (1 << 3)
+#define SVGA3D_DXFMT_BLENDABLE (1 << 4)
+#define SVGA3D_DXFMT_MIPS (1 << 5)
+#define SVGA3D_DXFMT_ARRAY (1 << 6)
+#define SVGA3D_DXFMT_VOLUME (1 << 7)
+#define SVGA3D_DXFMT_DX_VERTEX_BUFFER (1 << 8)
+#define SVGA3D_DXFMT_MULTISAMPLE (1 << 9)
+#define SVGA3D_DXFMT_MAX (1 << 10)
+
+typedef union {
+	SVGA3dBool b;
+	uint32 u;
+	int32 i;
+	float f;
+} SVGA3dDevCapResult;
+
+#endif
diff --git a/lib/svga/svga3d_dx.h b/lib/svga/svga3d_dx.h
new file mode 100644
index 00000000..a24aae85
--- /dev/null
+++ b/lib/svga/svga3d_dx.h
@@ -0,0 +1,1722 @@
+/**********************************************************
+ * Copyright 2012-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_dx.h --
+ *
+ *    SVGA 3d hardware definitions for DX10 support.
+ */
+
+#ifndef _SVGA3D_DX_H_
+#define _SVGA3D_DX_H_
+
+#include "svga_reg.h"
+#include "svga3d_limits.h"
+#include "svga3d_types.h"
+
+#define SVGA3D_INPUT_MIN 0
+#define SVGA3D_INPUT_PER_VERTEX_DATA 0
+#define SVGA3D_INPUT_PER_INSTANCE_DATA 1
+#define SVGA3D_INPUT_MAX 2
+typedef uint32 SVGA3dInputClassification;
+
+#define SVGA3D_COLOR_WRITE_ENABLE_RED (1 << 0)
+#define SVGA3D_COLOR_WRITE_ENABLE_GREEN (1 << 1)
+#define SVGA3D_COLOR_WRITE_ENABLE_BLUE (1 << 2)
+#define SVGA3D_COLOR_WRITE_ENABLE_ALPHA (1 << 3)
+#define SVGA3D_COLOR_WRITE_ENABLE_ALL                                      \
+	(SVGA3D_COLOR_WRITE_ENABLE_RED | SVGA3D_COLOR_WRITE_ENABLE_GREEN | \
+	 SVGA3D_COLOR_WRITE_ENABLE_BLUE | SVGA3D_COLOR_WRITE_ENABLE_ALPHA)
+typedef uint8 SVGA3dColorWriteEnable;
+
+#define SVGA3D_DEPTH_WRITE_MASK_ZERO 0
+#define SVGA3D_DEPTH_WRITE_MASK_ALL 1
+typedef uint8 SVGA3dDepthWriteMask;
+
+#define SVGA3D_FILTER_MIP_LINEAR (1 << 0)
+#define SVGA3D_FILTER_MAG_LINEAR (1 << 2)
+#define SVGA3D_FILTER_MIN_LINEAR (1 << 4)
+#define SVGA3D_FILTER_ANISOTROPIC (1 << 6)
+#define SVGA3D_FILTER_COMPARE (1 << 7)
+typedef uint32 SVGA3dFilter;
+
+#define SVGA3D_CULL_INVALID 0
+#define SVGA3D_CULL_MIN 1
+#define SVGA3D_CULL_NONE 1
+#define SVGA3D_CULL_FRONT 2
+#define SVGA3D_CULL_BACK 3
+#define SVGA3D_CULL_MAX 4
+typedef uint8 SVGA3dCullMode;
+
+#define SVGA3D_COMPARISON_INVALID 0
+#define SVGA3D_COMPARISON_MIN 1
+#define SVGA3D_COMPARISON_NEVER 1
+#define SVGA3D_COMPARISON_LESS 2
+#define SVGA3D_COMPARISON_EQUAL 3
+#define SVGA3D_COMPARISON_LESS_EQUAL 4
+#define SVGA3D_COMPARISON_GREATER 5
+#define SVGA3D_COMPARISON_NOT_EQUAL 6
+#define SVGA3D_COMPARISON_GREATER_EQUAL 7
+#define SVGA3D_COMPARISON_ALWAYS 8
+#define SVGA3D_COMPARISON_MAX 9
+typedef uint8 SVGA3dComparisonFunc;
+
+#define SVGA3D_MULTISAMPLE_RAST_DISABLE 0
+#define SVGA3D_MULTISAMPLE_RAST_ENABLE 1
+#define SVGA3D_MULTISAMPLE_RAST_DX_MAX 1
+#define SVGA3D_MULTISAMPLE_RAST_DISABLE_LINE 2
+#define SVGA3D_MULTISAMPLE_RAST_MAX 2
+typedef uint8 SVGA3dMultisampleRastEnable;
+
+#define SVGA3D_DX_MAX_VERTEXBUFFERS 32
+#define SVGA3D_DX_MAX_VERTEXINPUTREGISTERS 16
+#define SVGA3D_DX_SM41_MAX_VERTEXINPUTREGISTERS 32
+#define SVGA3D_DX_MAX_SOTARGETS 4
+#define SVGA3D_DX_MAX_SRVIEWS 128
+#define SVGA3D_DX_MAX_CONSTBUFFERS 16
+#define SVGA3D_DX_MAX_SAMPLERS 16
+#define SVGA3D_DX_MAX_CLASS_INSTANCES 253
+
+#define SVGA3D_DX_MAX_CONSTBUF_BINDING_SIZE (4096 * 4 * (uint32)sizeof(uint32))
+
+typedef uint32 SVGA3dShaderResourceViewId;
+typedef uint32 SVGA3dRenderTargetViewId;
+typedef uint32 SVGA3dDepthStencilViewId;
+typedef uint32 SVGA3dUAViewId;
+
+typedef uint32 SVGA3dShaderId;
+typedef uint32 SVGA3dElementLayoutId;
+typedef uint32 SVGA3dSamplerId;
+typedef uint32 SVGA3dBlendStateId;
+typedef uint32 SVGA3dDepthStencilStateId;
+typedef uint32 SVGA3dRasterizerStateId;
+typedef uint32 SVGA3dQueryId;
+typedef uint32 SVGA3dStreamOutputId;
+
+typedef union {
+	struct {
+		uint32 r;
+		uint32 g;
+		uint32 b;
+		uint32 a;
+	};
+
+	uint32 value[4];
+} SVGA3dRGBAUint32;
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 cid;
+	SVGAMobId mobid;
+} SVGAOTableDXContextEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineContext {
+	uint32 cid;
+} SVGA3dCmdDXDefineContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyContext {
+	uint32 cid;
+} SVGA3dCmdDXDestroyContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindContext {
+	uint32 cid;
+	SVGAMobId mobid;
+	uint32 validContents;
+} SVGA3dCmdDXBindContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXReadbackContext {
+	uint32 cid;
+} SVGA3dCmdDXReadbackContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXInvalidateContext {
+	uint32 cid;
+} SVGA3dCmdDXInvalidateContext;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetSingleConstantBuffer {
+	uint32 slot;
+	SVGA3dShaderType type;
+	SVGA3dSurfaceId sid;
+	uint32 offsetInBytes;
+	uint32 sizeInBytes;
+} SVGA3dCmdDXSetSingleConstantBuffer;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetShaderResources {
+	uint32 startView;
+	SVGA3dShaderType type;
+
+} SVGA3dCmdDXSetShaderResources;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetShader {
+	SVGA3dShaderId shaderId;
+	SVGA3dShaderType type;
+} SVGA3dCmdDXSetShader;
+#pragma pack(pop)
+
+typedef union {
+	struct {
+		uint32 cbOffset : 12;
+		uint32 cbId : 4;
+		uint32 baseSamp : 4;
+		uint32 baseTex : 7;
+		uint32 reserved : 5;
+	};
+	uint32 value;
+} SVGA3dIfaceData;
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetShaderIface {
+	SVGA3dShaderType type;
+	uint32 numClassInstances;
+	uint32 index;
+	uint32 iface;
+	SVGA3dIfaceData data;
+} SVGA3dCmdDXSetShaderIface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindShaderIface {
+	uint32 cid;
+	SVGAMobId mobid;
+	uint32 offsetInBytes;
+} SVGA3dCmdDXBindShaderIface;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetSamplers {
+	uint32 startSampler;
+	SVGA3dShaderType type;
+
+} SVGA3dCmdDXSetSamplers;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDraw {
+	uint32 vertexCount;
+	uint32 startVertexLocation;
+} SVGA3dCmdDXDraw;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawIndexed {
+	uint32 indexCount;
+	uint32 startIndexLocation;
+	int32 baseVertexLocation;
+} SVGA3dCmdDXDrawIndexed;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawInstanced {
+	uint32 vertexCountPerInstance;
+	uint32 instanceCount;
+	uint32 startVertexLocation;
+	uint32 startInstanceLocation;
+} SVGA3dCmdDXDrawInstanced;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawIndexedInstanced {
+	uint32 indexCountPerInstance;
+	uint32 instanceCount;
+	uint32 startIndexLocation;
+	int32 baseVertexLocation;
+	uint32 startInstanceLocation;
+} SVGA3dCmdDXDrawIndexedInstanced;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawIndexedInstancedIndirect {
+	SVGA3dSurfaceId argsBufferSid;
+	uint32 byteOffsetForArgs;
+} SVGA3dCmdDXDrawIndexedInstancedIndirect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawInstancedIndirect {
+	SVGA3dSurfaceId argsBufferSid;
+	uint32 byteOffsetForArgs;
+} SVGA3dCmdDXDrawInstancedIndirect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDrawAuto {
+	uint32 pad0;
+} SVGA3dCmdDXDrawAuto;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDispatch {
+	uint32 threadGroupCountX;
+	uint32 threadGroupCountY;
+	uint32 threadGroupCountZ;
+} SVGA3dCmdDXDispatch;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDispatchIndirect {
+	SVGA3dSurfaceId argsBufferSid;
+	uint32 byteOffsetForArgs;
+} SVGA3dCmdDXDispatchIndirect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetInputLayout {
+	SVGA3dElementLayoutId elementLayoutId;
+} SVGA3dCmdDXSetInputLayout;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dVertexBuffer {
+	SVGA3dSurfaceId sid;
+	uint32 stride;
+	uint32 offset;
+} SVGA3dVertexBuffer;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetVertexBuffers {
+	uint32 startBuffer;
+
+} SVGA3dCmdDXSetVertexBuffers;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dVertexBuffer_v2 {
+	SVGA3dSurfaceId sid;
+	uint32 stride;
+	uint32 offset;
+	uint32 sizeInBytes;
+} SVGA3dVertexBuffer_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetVertexBuffers_v2 {
+	uint32 startBuffer;
+
+} SVGA3dCmdDXSetVertexBuffers_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dVertexBufferOffsetAndSize {
+	uint32 stride;
+	uint32 offset;
+	uint32 sizeInBytes;
+} SVGA3dVertexBufferOffsetAndSize;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetVertexBuffersOffsetAndSize {
+	uint32 startBuffer;
+
+} SVGA3dCmdDXSetVertexBuffersOffsetAndSize;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetIndexBuffer {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	uint32 offset;
+} SVGA3dCmdDXSetIndexBuffer;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetIndexBuffer_v2 {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	uint32 offset;
+	uint32 sizeInBytes;
+} SVGA3dCmdDXSetIndexBuffer_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetIndexBufferOffsetAndSize {
+	SVGA3dSurfaceFormat format;
+	uint32 offset;
+	uint32 sizeInBytes;
+} SVGA3dCmdDXSetIndexBufferOffsetAndSize;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetTopology {
+	SVGA3dPrimitiveType topology;
+} SVGA3dCmdDXSetTopology;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetRenderTargets {
+	SVGA3dDepthStencilViewId depthStencilViewId;
+
+} SVGA3dCmdDXSetRenderTargets;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetBlendState {
+	SVGA3dBlendStateId blendId;
+	float blendFactor[4];
+	uint32 sampleMask;
+} SVGA3dCmdDXSetBlendState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetDepthStencilState {
+	SVGA3dDepthStencilStateId depthStencilId;
+	uint32 stencilRef;
+} SVGA3dCmdDXSetDepthStencilState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetRasterizerState {
+	SVGA3dRasterizerStateId rasterizerId;
+} SVGA3dCmdDXSetRasterizerState;
+#pragma pack(pop)
+
+#define SVGA3D_DXQUERY_FLAG_PREDICATEHINT (1 << 0)
+typedef uint32 SVGA3dDXQueryFlags;
+
+#define SVGADX_QDSTATE_INVALID ((uint8)-1)
+#define SVGADX_QDSTATE_MIN 0
+#define SVGADX_QDSTATE_IDLE 0
+#define SVGADX_QDSTATE_ACTIVE 1
+#define SVGADX_QDSTATE_PENDING 2
+#define SVGADX_QDSTATE_FINISHED 3
+#define SVGADX_QDSTATE_MAX 4
+typedef uint8 SVGADXQueryDeviceState;
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dQueryTypeUint8 type;
+	uint16 pad0;
+	SVGADXQueryDeviceState state;
+	SVGA3dDXQueryFlags flags;
+	SVGAMobId mobid;
+	uint32 offset;
+} SVGACOTableDXQueryEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineQuery {
+	SVGA3dQueryId queryId;
+	SVGA3dQueryType type;
+	SVGA3dDXQueryFlags flags;
+} SVGA3dCmdDXDefineQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyQuery {
+	SVGA3dQueryId queryId;
+} SVGA3dCmdDXDestroyQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindQuery {
+	SVGA3dQueryId queryId;
+	SVGAMobId mobid;
+} SVGA3dCmdDXBindQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetQueryOffset {
+	SVGA3dQueryId queryId;
+	uint32 mobOffset;
+} SVGA3dCmdDXSetQueryOffset;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBeginQuery {
+	SVGA3dQueryId queryId;
+} SVGA3dCmdDXBeginQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXEndQuery {
+	SVGA3dQueryId queryId;
+} SVGA3dCmdDXEndQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXReadbackQuery {
+	SVGA3dQueryId queryId;
+} SVGA3dCmdDXReadbackQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXMoveQuery {
+	SVGA3dQueryId queryId;
+	SVGAMobId mobid;
+	uint32 mobOffset;
+} SVGA3dCmdDXMoveQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindAllQuery {
+	uint32 cid;
+	SVGAMobId mobid;
+} SVGA3dCmdDXBindAllQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXReadbackAllQuery {
+	uint32 cid;
+} SVGA3dCmdDXReadbackAllQuery;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetPredication {
+	SVGA3dQueryId queryId;
+	uint32 predicateValue;
+} SVGA3dCmdDXSetPredication;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct MKS3dDXSOState {
+	uint32 offset;
+	uint32 intOffset;
+	uint32 vertexCount;
+	uint32 dead;
+} SVGA3dDXSOState;
+#pragma pack(pop)
+
+#define SVGA3D_DX_SO_OFFSET_APPEND ((uint32)~0u)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dSoTarget {
+	SVGA3dSurfaceId sid;
+	uint32 offset;
+	uint32 sizeInBytes;
+} SVGA3dSoTarget;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetSOTargets {
+	uint32 pad0;
+
+} SVGA3dCmdDXSetSOTargets;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dViewport {
+	float x;
+	float y;
+	float width;
+	float height;
+	float minDepth;
+	float maxDepth;
+} SVGA3dViewport;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetViewports {
+	uint32 pad0;
+
+} SVGA3dCmdDXSetViewports;
+#pragma pack(pop)
+
+#define SVGA3D_DX_MAX_VIEWPORTS 16
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetScissorRects {
+	uint32 pad0;
+
+} SVGA3dCmdDXSetScissorRects;
+#pragma pack(pop)
+
+#define SVGA3D_DX_MAX_SCISSORRECTS 16
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXClearRenderTargetView {
+	SVGA3dRenderTargetViewId renderTargetViewId;
+	SVGA3dRGBAFloat rgba;
+} SVGA3dCmdDXClearRenderTargetView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXClearDepthStencilView {
+	uint16 flags;
+	uint16 stencil;
+	SVGA3dDepthStencilViewId depthStencilViewId;
+	float depth;
+} SVGA3dCmdDXClearDepthStencilView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredCopyRegion {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dCopyBox box;
+} SVGA3dCmdDXPredCopyRegion;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredStagingCopyRegion {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dCopyBox box;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+} SVGA3dCmdDXPredStagingCopyRegion;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredCopy {
+	SVGA3dSurfaceId dstSid;
+	SVGA3dSurfaceId srcSid;
+} SVGA3dCmdDXPredCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredConvertRegion {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dBox destBox;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dBox srcBox;
+} SVGA3dCmdDXPredConvertRegion;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredStagingConvertRegion {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dBox destBox;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dBox srcBox;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+} SVGA3dCmdDXPredStagingConvertRegion;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredConvert {
+	SVGA3dSurfaceId dstSid;
+	SVGA3dSurfaceId srcSid;
+} SVGA3dCmdDXPredConvert;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredStagingConvert {
+	SVGA3dSurfaceId dstSid;
+	SVGA3dSurfaceId srcSid;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+} SVGA3dCmdDXPredStagingConvert;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBufferCopy {
+	SVGA3dSurfaceId dest;
+	SVGA3dSurfaceId src;
+	uint32 destX;
+	uint32 srcX;
+	uint32 width;
+} SVGA3dCmdDXBufferCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXStagingBufferCopy {
+	SVGA3dSurfaceId dest;
+	SVGA3dSurfaceId src;
+	uint32 destX;
+	uint32 srcX;
+	uint32 width;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+} SVGA3dCmdDXStagingBufferCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dSurfaceFormat copyFormat;
+} SVGA3dCmdDXResolveCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId dstSid;
+	uint32 dstSubResource;
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dSurfaceFormat copyFormat;
+} SVGA3dCmdDXPredResolveCopy;
+#pragma pack(pop)
+
+typedef uint32 SVGA3dDXPresentBltMode;
+#define SVGADX_PRESENTBLT_LINEAR (1 << 0)
+#define SVGADX_PRESENTBLT_FORCE_SRC_SRGB (1 << 1)
+#define SVGADX_PRESENTBLT_FORCE_SRC_XRBIAS (1 << 2)
+#define SVGADX_PRESENTBLT_MODE_MAX (1 << 3)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPresentBlt {
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dSurfaceId dstSid;
+	uint32 destSubResource;
+	SVGA3dBox boxSrc;
+	SVGA3dBox boxDest;
+	SVGA3dDXPresentBltMode mode;
+} SVGA3dCmdDXPresentBlt;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXGenMips {
+	SVGA3dShaderResourceViewId shaderResourceViewId;
+} SVGA3dCmdDXGenMips;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXUpdateSubResource {
+	SVGA3dSurfaceId sid;
+	uint32 subResource;
+	SVGA3dBox box;
+} SVGA3dCmdDXUpdateSubResource;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXReadbackSubResource {
+	SVGA3dSurfaceId sid;
+	uint32 subResource;
+} SVGA3dCmdDXReadbackSubResource;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXInvalidateSubResource {
+	SVGA3dSurfaceId sid;
+	uint32 subResource;
+} SVGA3dCmdDXInvalidateSubResource;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXTransferFromBuffer {
+	SVGA3dSurfaceId srcSid;
+	uint32 srcOffset;
+	uint32 srcPitch;
+	uint32 srcSlicePitch;
+	SVGA3dSurfaceId destSid;
+	uint32 destSubResource;
+	SVGA3dBox destBox;
+} SVGA3dCmdDXTransferFromBuffer;
+#pragma pack(pop)
+
+#define SVGA3D_TRANSFER_TO_BUFFER_READBACK (1 << 0)
+#define SVGA3D_TRANSFER_TO_BUFFER_FLAGS_MASK (1 << 0)
+typedef uint32 SVGA3dTransferToBufferFlags;
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXTransferToBuffer {
+	SVGA3dSurfaceId srcSid;
+	uint32 srcSubResource;
+	SVGA3dBox srcBox;
+	SVGA3dSurfaceId destSid;
+	uint32 destOffset;
+	uint32 destPitch;
+	uint32 destSlicePitch;
+	SVGA3dTransferToBufferFlags flags;
+} SVGA3dCmdDXTransferToBuffer;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredTransferFromBuffer {
+	SVGA3dSurfaceId srcSid;
+	uint32 srcOffset;
+	uint32 srcPitch;
+	uint32 srcSlicePitch;
+	SVGA3dSurfaceId destSid;
+	uint32 destSubResource;
+	SVGA3dBox destBox;
+} SVGA3dCmdDXPredTransferFromBuffer;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSurfaceCopyAndReadback {
+	SVGA3dSurfaceId srcSid;
+	SVGA3dSurfaceId destSid;
+	SVGA3dCopyBox box;
+} SVGA3dCmdDXSurfaceCopyAndReadback;
+#pragma pack(pop)
+
+typedef uint32 SVGADXHintId;
+#define SVGA_DX_HINT_NONE 0
+#define SVGA_DX_HINT_PREFETCH_OBJECT 1
+#define SVGA_DX_HINT_PREEVICT_OBJECT 2
+#define SVGA_DX_HINT_PREFETCH_COBJECT 3
+#define SVGA_DX_HINT_PREEVICT_COBJECT 4
+#define SVGA_DX_HINT_MAX 5
+
+#pragma pack(push, 1)
+typedef struct SVGAObjectRef {
+	SVGAOTableType type;
+	uint32 id;
+} SVGAObjectRef;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGACObjectRef {
+	SVGACOTableType type;
+	uint32 cid;
+	uint32 id;
+} SVGACObjectRef;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXHint {
+	SVGADXHintId hintId;
+
+} SVGA3dCmdDXHint;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBufferUpdate {
+	SVGA3dSurfaceId sid;
+	uint32 x;
+	uint32 width;
+} SVGA3dCmdDXBufferUpdate;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetConstantBufferOffset {
+	uint32 slot;
+	uint32 offsetInBytes;
+} SVGA3dCmdDXSetConstantBufferOffset;
+#pragma pack(pop)
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetVSConstantBufferOffset;
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetPSConstantBufferOffset;
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetGSConstantBufferOffset;
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetHSConstantBufferOffset;
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetDSConstantBufferOffset;
+
+typedef SVGA3dCmdDXSetConstantBufferOffset SVGA3dCmdDXSetCSConstantBufferOffset;
+
+#define SVGA3D_BUFFEREX_SRV_RAW (1 << 0)
+#define SVGA3D_BUFFEREX_SRV_FLAGS_MAX (1 << 1)
+#define SVGA3D_BUFFEREX_SRV_FLAGS_MASK (SVGA3D_BUFFEREX_SRV_FLAGS_MAX - 1)
+typedef uint32 SVGA3dBufferExFlags;
+
+#pragma pack(push, 1)
+typedef struct {
+	union {
+		struct {
+			uint32 firstElement;
+			uint32 numElements;
+			uint32 pad0;
+			uint32 pad1;
+		} buffer;
+		struct {
+			uint32 mostDetailedMip;
+			uint32 firstArraySlice;
+			uint32 mipLevels;
+			uint32 arraySize;
+		} tex;
+		struct {
+			uint32 firstElement;
+			uint32 numElements;
+			SVGA3dBufferExFlags flags;
+			uint32 pad0;
+		} bufferex;
+	};
+} SVGA3dShaderResourceViewDesc;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	SVGA3dShaderResourceViewDesc desc;
+	uint32 pad;
+} SVGACOTableDXSRViewEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineShaderResourceView {
+	SVGA3dShaderResourceViewId shaderResourceViewId;
+
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+
+	SVGA3dShaderResourceViewDesc desc;
+} SVGA3dCmdDXDefineShaderResourceView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyShaderResourceView {
+	SVGA3dShaderResourceViewId shaderResourceViewId;
+} SVGA3dCmdDXDestroyShaderResourceView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dRenderTargetViewDesc {
+	union {
+		struct {
+			uint32 firstElement;
+			uint32 numElements;
+			uint32 padding0;
+		} buffer;
+		struct {
+			uint32 mipSlice;
+			uint32 firstArraySlice;
+			uint32 arraySize;
+		} tex;
+		struct {
+			uint32 mipSlice;
+			uint32 firstW;
+			uint32 wSize;
+		} tex3D;
+	};
+} SVGA3dRenderTargetViewDesc;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	SVGA3dRenderTargetViewDesc desc;
+	uint32 pad[2];
+} SVGACOTableDXRTViewEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineRenderTargetView {
+	SVGA3dRenderTargetViewId renderTargetViewId;
+
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+
+	SVGA3dRenderTargetViewDesc desc;
+} SVGA3dCmdDXDefineRenderTargetView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyRenderTargetView {
+	SVGA3dRenderTargetViewId renderTargetViewId;
+} SVGA3dCmdDXDestroyRenderTargetView;
+#pragma pack(pop)
+
+#define SVGA3D_DXDSVIEW_CREATE_READ_ONLY_DEPTH 0x01
+#define SVGA3D_DXDSVIEW_CREATE_READ_ONLY_STENCIL 0x02
+#define SVGA3D_DXDSVIEW_CREATE_FLAG_MASK 0x03
+typedef uint8 SVGA3DCreateDSViewFlags;
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	uint32 mipSlice;
+	uint32 firstArraySlice;
+	uint32 arraySize;
+	SVGA3DCreateDSViewFlags flags;
+	uint8 pad0;
+	uint16 pad1;
+	uint32 pad2;
+} SVGACOTableDXDSViewEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineDepthStencilView {
+	SVGA3dDepthStencilViewId depthStencilViewId;
+
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	uint32 mipSlice;
+	uint32 firstArraySlice;
+	uint32 arraySize;
+	SVGA3DCreateDSViewFlags flags;
+	uint8 pad0;
+	uint16 pad1;
+} SVGA3dCmdDXDefineDepthStencilView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineDepthStencilView_v2 {
+	SVGA3dDepthStencilViewId depthStencilViewId;
+
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	uint32 mipSlice;
+	uint32 firstArraySlice;
+	uint32 arraySize;
+	SVGA3DCreateDSViewFlags flags;
+	uint8 pad0;
+	uint16 pad1;
+} SVGA3dCmdDXDefineDepthStencilView_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyDepthStencilView {
+	SVGA3dDepthStencilViewId depthStencilViewId;
+} SVGA3dCmdDXDestroyDepthStencilView;
+#pragma pack(pop)
+
+#define SVGA3D_UABUFFER_RAW (1 << 0)
+#define SVGA3D_UABUFFER_APPEND (1 << 1)
+#define SVGA3D_UABUFFER_COUNTER (1 << 2)
+typedef uint32 SVGA3dUABufferFlags;
+
+#pragma pack(push, 1)
+typedef struct {
+	union {
+		struct {
+			uint32 firstElement;
+			uint32 numElements;
+			SVGA3dUABufferFlags flags;
+			uint32 padding0;
+			uint32 padding1;
+		} buffer;
+		struct {
+			uint32 mipSlice;
+			uint32 firstArraySlice;
+			uint32 arraySize;
+			uint32 padding0;
+			uint32 padding1;
+		} tex;
+		struct {
+			uint32 mipSlice;
+			uint32 firstW;
+			uint32 wSize;
+			uint32 padding0;
+			uint32 padding1;
+		} tex3D;
+	};
+} SVGA3dUAViewDesc;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+	SVGA3dUAViewDesc desc;
+	uint32 structureCount;
+	uint32 pad[7];
+} SVGACOTableDXUAViewEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineUAView {
+	SVGA3dUAViewId uaViewId;
+
+	SVGA3dSurfaceId sid;
+	SVGA3dSurfaceFormat format;
+	SVGA3dResourceType resourceDimension;
+
+	SVGA3dUAViewDesc desc;
+} SVGA3dCmdDXDefineUAView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyUAView {
+	SVGA3dUAViewId uaViewId;
+} SVGA3dCmdDXDestroyUAView;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXClearUAViewUint {
+	SVGA3dUAViewId uaViewId;
+	SVGA3dRGBAUint32 value;
+} SVGA3dCmdDXClearUAViewUint;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXClearUAViewFloat {
+	SVGA3dUAViewId uaViewId;
+	SVGA3dRGBAFloat value;
+} SVGA3dCmdDXClearUAViewFloat;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXCopyStructureCount {
+	SVGA3dUAViewId srcUAViewId;
+	SVGA3dSurfaceId destSid;
+	uint32 destByteOffset;
+} SVGA3dCmdDXCopyStructureCount;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetStructureCount {
+	SVGA3dUAViewId uaViewId;
+	uint32 structureCount;
+} SVGA3dCmdDXSetStructureCount;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetUAViews {
+	uint32 uavSpliceIndex;
+
+} SVGA3dCmdDXSetUAViews;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetCSUAViews {
+	uint32 startIndex;
+
+} SVGA3dCmdDXSetCSUAViews;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dInputElementDesc {
+	uint32 inputSlot;
+	uint32 alignedByteOffset;
+	SVGA3dSurfaceFormat format;
+	SVGA3dInputClassification inputSlotClass;
+	uint32 instanceDataStepRate;
+	uint32 inputRegister;
+} SVGA3dInputElementDesc;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 elid;
+	uint32 numDescs;
+	SVGA3dInputElementDesc descs[32];
+	uint32 pad[62];
+} SVGACOTableDXElementLayoutEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineElementLayout {
+	SVGA3dElementLayoutId elementLayoutId;
+
+} SVGA3dCmdDXDefineElementLayout;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyElementLayout {
+	SVGA3dElementLayoutId elementLayoutId;
+} SVGA3dCmdDXDestroyElementLayout;
+#pragma pack(pop)
+
+#define SVGA3D_DX_MAX_RENDER_TARGETS 8
+
+#pragma pack(push, 1)
+typedef struct SVGA3dDXBlendStatePerRT {
+	uint8 blendEnable;
+	uint8 srcBlend;
+	uint8 destBlend;
+	uint8 blendOp;
+	uint8 srcBlendAlpha;
+	uint8 destBlendAlpha;
+	uint8 blendOpAlpha;
+	SVGA3dColorWriteEnable renderTargetWriteMask;
+	uint8 logicOpEnable;
+	uint8 logicOp;
+	uint16 pad0;
+} SVGA3dDXBlendStatePerRT;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint8 alphaToCoverageEnable;
+	uint8 independentBlendEnable;
+	uint16 pad0;
+	SVGA3dDXBlendStatePerRT perRT[SVGA3D_DX_MAX_RENDER_TARGETS];
+	uint32 pad1[7];
+} SVGACOTableDXBlendStateEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineBlendState {
+	SVGA3dBlendStateId blendId;
+	uint8 alphaToCoverageEnable;
+	uint8 independentBlendEnable;
+	uint16 pad0;
+	SVGA3dDXBlendStatePerRT perRT[SVGA3D_DX_MAX_RENDER_TARGETS];
+} SVGA3dCmdDXDefineBlendState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyBlendState {
+	SVGA3dBlendStateId blendId;
+} SVGA3dCmdDXDestroyBlendState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint8 depthEnable;
+	SVGA3dDepthWriteMask depthWriteMask;
+	SVGA3dComparisonFunc depthFunc;
+	uint8 stencilEnable;
+	uint8 frontEnable;
+	uint8 backEnable;
+	uint8 stencilReadMask;
+	uint8 stencilWriteMask;
+
+	uint8 frontStencilFailOp;
+	uint8 frontStencilDepthFailOp;
+	uint8 frontStencilPassOp;
+	SVGA3dComparisonFunc frontStencilFunc;
+
+	uint8 backStencilFailOp;
+	uint8 backStencilDepthFailOp;
+	uint8 backStencilPassOp;
+	SVGA3dComparisonFunc backStencilFunc;
+} SVGACOTableDXDepthStencilEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineDepthStencilState {
+	SVGA3dDepthStencilStateId depthStencilId;
+
+	uint8 depthEnable;
+	SVGA3dDepthWriteMask depthWriteMask;
+	SVGA3dComparisonFunc depthFunc;
+	uint8 stencilEnable;
+	uint8 frontEnable;
+	uint8 backEnable;
+	uint8 stencilReadMask;
+	uint8 stencilWriteMask;
+
+	uint8 frontStencilFailOp;
+	uint8 frontStencilDepthFailOp;
+	uint8 frontStencilPassOp;
+	SVGA3dComparisonFunc frontStencilFunc;
+
+	uint8 backStencilFailOp;
+	uint8 backStencilDepthFailOp;
+	uint8 backStencilPassOp;
+	SVGA3dComparisonFunc backStencilFunc;
+} SVGA3dCmdDXDefineDepthStencilState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyDepthStencilState {
+	SVGA3dDepthStencilStateId depthStencilId;
+} SVGA3dCmdDXDestroyDepthStencilState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint8 fillMode;
+	SVGA3dCullMode cullMode;
+	uint8 frontCounterClockwise;
+	uint8 provokingVertexLast;
+	int32 depthBias;
+	float depthBiasClamp;
+	float slopeScaledDepthBias;
+	uint8 depthClipEnable;
+	uint8 scissorEnable;
+	SVGA3dMultisampleRastEnable multisampleEnable;
+	uint8 antialiasedLineEnable;
+	float lineWidth;
+	uint8 lineStippleEnable;
+	uint8 lineStippleFactor;
+	uint16 lineStipplePattern;
+	uint8 forcedSampleCount;
+	uint8 mustBeZero[3];
+} SVGACOTableDXRasterizerStateEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineRasterizerState {
+	SVGA3dRasterizerStateId rasterizerId;
+
+	uint8 fillMode;
+	SVGA3dCullMode cullMode;
+	uint8 frontCounterClockwise;
+	uint8 provokingVertexLast;
+	int32 depthBias;
+	float depthBiasClamp;
+	float slopeScaledDepthBias;
+	uint8 depthClipEnable;
+	uint8 scissorEnable;
+	SVGA3dMultisampleRastEnable multisampleEnable;
+	uint8 antialiasedLineEnable;
+	float lineWidth;
+	uint8 lineStippleEnable;
+	uint8 lineStippleFactor;
+	uint16 lineStipplePattern;
+} SVGA3dCmdDXDefineRasterizerState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineRasterizerState_v2 {
+	SVGA3dRasterizerStateId rasterizerId;
+
+	uint8 fillMode;
+	SVGA3dCullMode cullMode;
+	uint8 frontCounterClockwise;
+	uint8 provokingVertexLast;
+	int32 depthBias;
+	float depthBiasClamp;
+	float slopeScaledDepthBias;
+	uint8 depthClipEnable;
+	uint8 scissorEnable;
+	SVGA3dMultisampleRastEnable multisampleEnable;
+	uint8 antialiasedLineEnable;
+	float lineWidth;
+	uint8 lineStippleEnable;
+	uint8 lineStippleFactor;
+	uint16 lineStipplePattern;
+	uint32 forcedSampleCount;
+} SVGA3dCmdDXDefineRasterizerState_v2;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyRasterizerState {
+	SVGA3dRasterizerStateId rasterizerId;
+} SVGA3dCmdDXDestroyRasterizerState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGA3dFilter filter;
+	uint8 addressU;
+	uint8 addressV;
+	uint8 addressW;
+	uint8 pad0;
+	float mipLODBias;
+	uint8 maxAnisotropy;
+	SVGA3dComparisonFunc comparisonFunc;
+	uint16 pad1;
+	SVGA3dRGBAFloat borderColor;
+	float minLOD;
+	float maxLOD;
+	uint32 pad2[6];
+} SVGACOTableDXSamplerEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineSamplerState {
+	SVGA3dSamplerId samplerId;
+	SVGA3dFilter filter;
+	uint8 addressU;
+	uint8 addressV;
+	uint8 addressW;
+	uint8 pad0;
+	float mipLODBias;
+	uint8 maxAnisotropy;
+	SVGA3dComparisonFunc comparisonFunc;
+	uint16 pad1;
+	SVGA3dRGBAFloat borderColor;
+	float minLOD;
+	float maxLOD;
+} SVGA3dCmdDXDefineSamplerState;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroySamplerState {
+	SVGA3dSamplerId samplerId;
+} SVGA3dCmdDXDestroySamplerState;
+#pragma pack(pop)
+
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_UNDEFINED 0
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_POSITION 1
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_CLIP_DISTANCE 2
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_CULL_DISTANCE 3
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_RENDER_TARGET_ARRAY_INDEX 4
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_VIEWPORT_ARRAY_INDEX 5
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_VERTEX_ID 6
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_PRIMITIVE_ID 7
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_INSTANCE_ID 8
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_IS_FRONT_FACE 9
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_SAMPLE_INDEX 10
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_U_EQ_0_EDGE_TESSFACTOR 11
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_V_EQ_0_EDGE_TESSFACTOR 12
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_U_EQ_1_EDGE_TESSFACTOR 13
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_V_EQ_1_EDGE_TESSFACTOR 14
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_U_INSIDE_TESSFACTOR 15
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_QUAD_V_INSIDE_TESSFACTOR 16
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_TRI_U_EQ_0_EDGE_TESSFACTOR 17
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_TRI_V_EQ_0_EDGE_TESSFACTOR 18
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_TRI_W_EQ_0_EDGE_TESSFACTOR 19
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_TRI_INSIDE_TESSFACTOR 20
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_LINE_DETAIL_TESSFACTOR 21
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_FINAL_LINE_DENSITY_TESSFACTOR 22
+#define SVGADX_SIGNATURE_SEMANTIC_NAME_MAX 23
+typedef uint32 SVGA3dDXSignatureSemanticName;
+
+#define SVGADX_SIGNATURE_REGISTER_COMPONENT_UNKNOWN 0
+typedef uint32 SVGA3dDXSignatureRegisterComponentType;
+
+#define SVGADX_SIGNATURE_MIN_PRECISION_DEFAULT 0
+typedef uint32 SVGA3dDXSignatureMinPrecision;
+
+#pragma pack(push, 1)
+typedef struct SVGA3dDXSignatureEntry {
+	uint32 registerIndex;
+	SVGA3dDXSignatureSemanticName semanticName;
+	uint32 mask;
+	SVGA3dDXSignatureRegisterComponentType componentType;
+	SVGA3dDXSignatureMinPrecision minPrecision;
+} SVGA3dDXShaderSignatureEntry;
+#pragma pack(pop)
+
+#define SVGADX_SIGNATURE_HEADER_VERSION_0 0x08a92d12
+
+#pragma pack(push, 1)
+typedef struct SVGA3dDXSignatureHeader {
+	uint32 headerVersion;
+	uint32 numInputSignatures;
+	uint32 numOutputSignatures;
+	uint32 numPatchConstantSignatures;
+} SVGA3dDXShaderSignatureHeader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineShader {
+	SVGA3dShaderId shaderId;
+	SVGA3dShaderType type;
+	uint32 sizeInBytes;
+} SVGA3dCmdDXDefineShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGACOTableDXShaderEntry {
+	SVGA3dShaderType type;
+	uint32 sizeInBytes;
+	uint32 offsetInBytes;
+	SVGAMobId mobid;
+	uint32 pad[4];
+} SVGACOTableDXShaderEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyShader {
+	SVGA3dShaderId shaderId;
+} SVGA3dCmdDXDestroyShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindShader {
+	uint32 cid;
+	uint32 shid;
+	SVGAMobId mobid;
+	uint32 offsetInBytes;
+} SVGA3dCmdDXBindShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindAllShader {
+	uint32 cid;
+	SVGAMobId mobid;
+} SVGA3dCmdDXBindAllShader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXCondBindAllShader {
+	uint32 cid;
+	SVGAMobId testMobid;
+	SVGAMobId mobid;
+} SVGA3dCmdDXCondBindAllShader;
+#pragma pack(pop)
+
+#define SVGA3D_MAX_DX10_STREAMOUT_DECLS 64
+#define SVGA3D_MAX_STREAMOUT_DECLS 512
+
+#pragma pack(push, 1)
+typedef struct SVGA3dStreamOutputDeclarationEntry {
+	uint32 outputSlot;
+	uint32 registerIndex;
+	uint8 registerMask;
+	uint8 pad0;
+	uint16 pad1;
+	uint32 stream;
+} SVGA3dStreamOutputDeclarationEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGAOTableStreamOutputEntry {
+	uint32 numOutputStreamEntries;
+	SVGA3dStreamOutputDeclarationEntry decl[SVGA3D_MAX_DX10_STREAMOUT_DECLS];
+	uint32 streamOutputStrideInBytes[SVGA3D_DX_MAX_SOTARGETS];
+	uint32 rasterizedStream;
+	uint32 numOutputStreamStrides;
+	uint32 mobid;
+	uint32 offsetInBytes;
+	uint8 usesMob;
+	uint8 pad0;
+	uint16 pad1;
+	uint32 pad2[246];
+} SVGACOTableDXStreamOutputEntry;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineStreamOutput {
+	SVGA3dStreamOutputId soid;
+	uint32 numOutputStreamEntries;
+	SVGA3dStreamOutputDeclarationEntry decl[SVGA3D_MAX_DX10_STREAMOUT_DECLS];
+	uint32 streamOutputStrideInBytes[SVGA3D_DX_MAX_SOTARGETS];
+	uint32 rasterizedStream;
+} SVGA3dCmdDXDefineStreamOutput;
+#pragma pack(pop)
+
+#define SVGA3D_DX_SO_NO_RASTERIZED_STREAM 0xFFFFFFFF
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDefineStreamOutputWithMob {
+	SVGA3dStreamOutputId soid;
+	uint32 numOutputStreamEntries;
+	uint32 numOutputStreamStrides;
+	uint32 streamOutputStrideInBytes[SVGA3D_DX_MAX_SOTARGETS];
+	uint32 rasterizedStream;
+} SVGA3dCmdDXDefineStreamOutputWithMob;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXBindStreamOutput {
+	SVGA3dStreamOutputId soid;
+	uint32 mobid;
+	uint32 offsetInBytes;
+	uint32 sizeInBytes;
+} SVGA3dCmdDXBindStreamOutput;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXDestroyStreamOutput {
+	SVGA3dStreamOutputId soid;
+} SVGA3dCmdDXDestroyStreamOutput;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetStreamOutput {
+	SVGA3dStreamOutputId soid;
+} SVGA3dCmdDXSetStreamOutput;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetMinLOD {
+	SVGA3dSurfaceId sid;
+	float minLOD;
+} SVGA3dCmdDXSetMinLOD;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 value;
+	uint32 mobId;
+	uint32 mobOffset;
+} SVGA3dCmdDXMobFence64;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXSetCOTable {
+	uint32 cid;
+	uint32 mobid;
+	SVGACOTableType type;
+	uint32 validSizeInBytes;
+} SVGA3dCmdDXSetCOTable;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXGrowCOTable {
+	uint32 cid;
+	uint32 mobid;
+	SVGACOTableType type;
+	uint32 validSizeInBytes;
+} SVGA3dCmdDXGrowCOTable;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXReadbackCOTable {
+	uint32 cid;
+	SVGACOTableType type;
+} SVGA3dCmdDXReadbackCOTable;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXCopyCOTableIntoMob {
+	uint32 cid;
+	SVGACOTableType type;
+	uint32 mobid;
+} SVGA3dCmdDXCopyCOTableIntoMob;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXPredStagingCopy {
+	SVGA3dSurfaceId dstSid;
+	SVGA3dSurfaceId srcSid;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+
+} SVGA3dCmdDXPredStagingCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCmdDXStagingCopy {
+	SVGA3dSurfaceId dstSid;
+	SVGA3dSurfaceId srcSid;
+	uint8 readback;
+	uint8 unsynchronized;
+	uint8 mustBeZero[2];
+
+} SVGA3dCmdDXStagingCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCOTableData {
+	uint32 mobid;
+} SVGA3dCOTableData;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dBufferBinding {
+	uint32 bufferId;
+	uint32 stride;
+	uint32 offset;
+} SVGA3dBufferBinding;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dConstantBufferBinding {
+	uint32 sid;
+	uint32 offsetInBytes;
+	uint32 sizeInBytes;
+} SVGA3dConstantBufferBinding;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGADXInputAssemblyMobFormat {
+	uint32 layoutId;
+	SVGA3dBufferBinding vertexBuffers[SVGA3D_DX_MAX_VERTEXBUFFERS];
+	uint32 indexBufferSid;
+	uint32 pad;
+	uint32 indexBufferOffset;
+	uint32 indexBufferFormat;
+	uint32 topology;
+} SVGADXInputAssemblyMobFormat;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGADXContextMobFormat {
+	SVGADXInputAssemblyMobFormat inputAssembly;
+
+	struct {
+		uint32 blendStateId;
+		uint32 blendFactor[4];
+		uint32 sampleMask;
+		uint32 depthStencilStateId;
+		uint32 stencilRef;
+		uint32 rasterizerStateId;
+		uint32 depthStencilViewId;
+		uint32 renderTargetViewIds[SVGA3D_DX_MAX_RENDER_TARGETS];
+	} renderState;
+
+	uint32 pad0[8];
+
+	struct {
+		uint32 targets[SVGA3D_DX_MAX_SOTARGETS];
+		uint32 soid;
+	} streamOut;
+
+	uint32 pad1[10];
+
+	uint32 uavSpliceIndex;
+
+	uint8 numViewports;
+	uint8 numScissorRects;
+	uint16 pad2[1];
+
+	uint32 pad3[3];
+
+	SVGA3dViewport viewports[SVGA3D_DX_MAX_VIEWPORTS];
+	uint32 pad4[32];
+
+	SVGASignedRect scissorRects[SVGA3D_DX_MAX_SCISSORRECTS];
+	uint32 pad5[64];
+
+	struct {
+		uint32 queryID;
+		uint32 value;
+	} predication;
+
+	SVGAMobId shaderIfaceMobid;
+	uint32 shaderIfaceOffset;
+	struct {
+		uint32 shaderId;
+		SVGA3dConstantBufferBinding
+			constantBuffers[SVGA3D_DX_MAX_CONSTBUFFERS];
+		uint32 shaderResources[SVGA3D_DX_MAX_SRVIEWS];
+		uint32 samplers[SVGA3D_DX_MAX_SAMPLERS];
+	} shaderState[SVGA3D_NUM_SHADERTYPE];
+	uint32 pad6[26];
+
+	SVGA3dQueryId queryID[SVGA3D_MAX_QUERY];
+
+	SVGA3dCOTableData cotables[SVGA_COTABLE_MAX];
+
+	uint32 pad7[64];
+
+	uint32 uaViewIds[SVGA3D_DX11_1_MAX_UAVIEWS];
+	uint32 csuaViewIds[SVGA3D_DX11_1_MAX_UAVIEWS];
+
+	uint32 pad8[188];
+} SVGADXContextMobFormat;
+#pragma pack(pop)
+
+#define SVGA3D_DX_MAX_CLASS_INSTANCES_PADDED 256
+
+#pragma pack(push, 1)
+typedef struct SVGADXShaderIfaceMobFormat {
+	struct {
+		uint32 numClassInstances;
+		uint32 iface[SVGA3D_DX_MAX_CLASS_INSTANCES_PADDED];
+		SVGA3dIfaceData data[SVGA3D_DX_MAX_CLASS_INSTANCES_PADDED];
+	} shaderIfaceState[SVGA3D_NUM_SHADERTYPE];
+
+	uint32 pad0[1018];
+} SVGADXShaderIfaceMobFormat;
+#pragma pack(pop)
+
+#endif
diff --git a/lib/svga/svga3d_limits.h b/lib/svga/svga3d_limits.h
new file mode 100644
index 00000000..a71246db
--- /dev/null
+++ b/lib/svga/svga3d_limits.h
@@ -0,0 +1,83 @@
+/**********************************************************
+ * Copyright 2012-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_limits.h --
+ *
+ *    SVGA 3d hardware limits
+ */
+
+#ifndef _SVGA3D_LIMITS_H_
+#define _SVGA3D_LIMITS_H_
+
+#define SVGA3D_HB_MAX_CONTEXT_IDS 256
+#define SVGA3D_HB_MAX_SURFACE_IDS (32 * 1024)
+
+#define SVGA3D_DX_MAX_RENDER_TARGETS 8
+#define SVGA3D_DX11_MAX_UAVIEWS 8
+#define SVGA3D_DX11_1_MAX_UAVIEWS 64
+#define SVGA3D_MAX_UAVIEWS (SVGA3D_DX11_1_MAX_UAVIEWS)
+#define SVGA3D_DX11_MAX_SIMULTANEOUS_RTUAV (SVGA3D_DX11_MAX_UAVIEWS)
+#define SVGA3D_DX11_1_MAX_SIMULTANEOUS_RTUAV (SVGA3D_DX11_1_MAX_UAVIEWS)
+#define SVGA3D_MAX_SIMULTANEOUS_RTUAV (SVGA3D_MAX_UAVIEWS)
+
+#define SVGA3D_HB_MAX_SURFACE_SIZE MBYTES_2_BYTES(128)
+
+#define SVGA3D_MAX_SHADERIDS 5000
+
+#define SVGA3D_MAX_SIMULTANEOUS_SHADERS 20000
+
+#define SVGA3D_NUM_TEXTURE_UNITS 32
+#define SVGA3D_NUM_LIGHTS 8
+
+#define SVGA3D_MAX_VIDEOPROCESSOR_SAMPLERS 32
+
+#define SVGA3D_MAX_SHADER_MEMORY_BYTES (8 * 1024 * 1024)
+#define SVGA3D_MAX_SHADER_MEMORY \
+	(SVGA3D_MAX_SHADER_MEMORY_BYTES / sizeof(uint32))
+
+#define SVGA3D_MAX_SHADER_THREAD_GROUPS 65535
+
+#define SVGA3D_MAX_CLIP_PLANES 6
+
+#define SVGA3D_MAX_TEXTURE_COORDS 8
+
+#define SVGA3D_MAX_SURFACE_FACES 6
+
+#define SVGA3D_SM4_MAX_SURFACE_ARRAYSIZE 512
+#define SVGA3D_SM5_MAX_SURFACE_ARRAYSIZE 2048
+#define SVGA3D_MAX_SURFACE_ARRAYSIZE SVGA3D_SM5_MAX_SURFACE_ARRAYSIZE
+
+#define SVGA3D_MAX_VERTEX_ARRAYS 32
+
+#define SVGA3D_MAX_DRAW_PRIMITIVE_RANGES 32
+
+#define SVGA3D_MAX_SAMPLES 8
+
+#define SVGA3D_MIN_SBX_DATA_SIZE (GBYTES_2_BYTES(1))
+#define SVGA3D_MAX_SBX_DATA_SIZE (GBYTES_2_BYTES(4))
+
+#endif
diff --git a/lib/svga/svga3d_reg.h b/lib/svga/svga3d_reg.h
new file mode 100644
index 00000000..0388cfa3
--- /dev/null
+++ b/lib/svga/svga3d_reg.h
@@ -0,0 +1,44 @@
+/**********************************************************
+ * Copyright 1998-2015 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_reg.h --
+ *
+ *    SVGA 3d hardware definitions
+ */
+
+#ifndef _SVGA3D_REG_H_
+#define _SVGA3D_REG_H_
+
+#include "svga_reg.h"
+
+#include "svga3d_types.h"
+#include "svga3d_limits.h"
+#include "svga3d_cmd.h"
+#include "svga3d_dx.h"
+#include "svga3d_devcaps.h"
+
+#endif
diff --git a/lib/svga/svga3d_surfacedefs.h b/lib/svga/svga3d_surfacedefs.h
new file mode 100644
index 00000000..f36ee918
--- /dev/null
+++ b/lib/svga/svga3d_surfacedefs.h
@@ -0,0 +1,1559 @@
+/**********************************************************
+ * Copyright 2008-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_surfacedefs.h --
+ *
+ *    Surface definitions for SVGA3d.
+ */
+
+#ifndef _SVGA3D_SURFACEDEFS_H_
+#define _SVGA3D_SURFACEDEFS_H_
+
+#include "svga3d_types.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+struct SVGAUseCaps;
+
+#if defined(_WIN32) && !defined(__GNUC__)
+
+#define STATIC_CONST __declspec(selectany) extern const
+#else
+#define STATIC_CONST static const
+#endif
+
+typedef enum SVGA3dBlockDesc {
+
+	SVGA3DBLOCKDESC_NONE = 0,
+
+	SVGA3DBLOCKDESC_BLUE = 1 << 0,
+	SVGA3DBLOCKDESC_W = 1 << 0,
+	SVGA3DBLOCKDESC_BUMP_L = 1 << 0,
+
+	SVGA3DBLOCKDESC_GREEN = 1 << 1,
+	SVGA3DBLOCKDESC_V = 1 << 1,
+
+	SVGA3DBLOCKDESC_RED = 1 << 2,
+	SVGA3DBLOCKDESC_U = 1 << 2,
+	SVGA3DBLOCKDESC_LUMINANCE = 1 << 2,
+
+	SVGA3DBLOCKDESC_ALPHA = 1 << 3,
+	SVGA3DBLOCKDESC_Q = 1 << 3,
+
+	SVGA3DBLOCKDESC_BUFFER = 1 << 4,
+
+	SVGA3DBLOCKDESC_COMPRESSED = 1 << 5,
+
+	SVGA3DBLOCKDESC_FP = 1 << 6,
+
+	SVGA3DBLOCKDESC_PLANAR_YUV = 1 << 7,
+
+	SVGA3DBLOCKDESC_2PLANAR_YUV = 1 << 8,
+
+	SVGA3DBLOCKDESC_3PLANAR_YUV = 1 << 9,
+
+	SVGA3DBLOCKDESC_STENCIL = 1 << 11,
+
+	SVGA3DBLOCKDESC_TYPELESS = 1 << 12,
+
+	SVGA3DBLOCKDESC_SINT = 1 << 13,
+
+	SVGA3DBLOCKDESC_UINT = 1 << 14,
+
+	SVGA3DBLOCKDESC_NORM = 1 << 15,
+
+	SVGA3DBLOCKDESC_SRGB = 1 << 16,
+
+	SVGA3DBLOCKDESC_EXP = 1 << 17,
+
+	SVGA3DBLOCKDESC_COLOR = 1 << 18,
+
+	SVGA3DBLOCKDESC_DEPTH = 1 << 19,
+
+	SVGA3DBLOCKDESC_BUMP = 1 << 20,
+
+	SVGA3DBLOCKDESC_YUV_VIDEO = 1 << 21,
+
+	SVGA3DBLOCKDESC_MIXED = 1 << 22,
+
+	SVGA3DBLOCKDESC_CX = 1 << 23,
+
+	SVGA3DBLOCKDESC_BC1 = 1 << 24,
+	SVGA3DBLOCKDESC_BC2 = 1 << 25,
+	SVGA3DBLOCKDESC_BC3 = 1 << 26,
+	SVGA3DBLOCKDESC_BC4 = 1 << 27,
+	SVGA3DBLOCKDESC_BC5 = 1 << 28,
+	SVGA3DBLOCKDESC_BC6H = 1 << 29,
+	SVGA3DBLOCKDESC_BC7 = 1 << 30,
+	SVGA3DBLOCKDESC_COMPRESSED_MASK =
+		SVGA3DBLOCKDESC_BC1 | SVGA3DBLOCKDESC_BC2 |
+		SVGA3DBLOCKDESC_BC3 | SVGA3DBLOCKDESC_BC4 |
+		SVGA3DBLOCKDESC_BC5 | SVGA3DBLOCKDESC_BC6H |
+		SVGA3DBLOCKDESC_BC7,
+
+	SVGA3DBLOCKDESC_A_UINT = SVGA3DBLOCKDESC_ALPHA | SVGA3DBLOCKDESC_UINT |
+				 SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_A_UNORM = SVGA3DBLOCKDESC_A_UINT | SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_R_UINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_UINT |
+				 SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_R_UNORM = SVGA3DBLOCKDESC_R_UINT | SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_R_SINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_SINT |
+				 SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_R_SNORM = SVGA3DBLOCKDESC_R_SINT | SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_G_UINT = SVGA3DBLOCKDESC_GREEN | SVGA3DBLOCKDESC_UINT |
+				 SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RG_UINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				  SVGA3DBLOCKDESC_UINT | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RG_UNORM = SVGA3DBLOCKDESC_RG_UINT |
+				   SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_RG_SINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				  SVGA3DBLOCKDESC_SINT | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RG_SNORM = SVGA3DBLOCKDESC_RG_SINT |
+				   SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_RGB_UINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				   SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_UINT |
+				   SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGB_SINT = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				   SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_SINT |
+				   SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGB_UNORM = SVGA3DBLOCKDESC_RGB_UINT |
+				    SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_RGB_UNORM_SRGB = SVGA3DBLOCKDESC_RGB_UNORM |
+					 SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_RGBA_UINT =
+		SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+		SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_ALPHA |
+		SVGA3DBLOCKDESC_UINT | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGBA_UNORM = SVGA3DBLOCKDESC_RGBA_UINT |
+				     SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_RGBA_UNORM_SRGB = SVGA3DBLOCKDESC_RGBA_UNORM |
+					  SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_RGBA_SINT =
+		SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+		SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_ALPHA |
+		SVGA3DBLOCKDESC_SINT | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGBA_SNORM = SVGA3DBLOCKDESC_RGBA_SINT |
+				     SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_RGBA_FP = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				  SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_ALPHA |
+				  SVGA3DBLOCKDESC_FP | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_UV = SVGA3DBLOCKDESC_U | SVGA3DBLOCKDESC_V |
+			     SVGA3DBLOCKDESC_BUMP,
+	SVGA3DBLOCKDESC_UVL = SVGA3DBLOCKDESC_UV | SVGA3DBLOCKDESC_BUMP_L |
+			      SVGA3DBLOCKDESC_MIXED | SVGA3DBLOCKDESC_BUMP,
+	SVGA3DBLOCKDESC_UVW = SVGA3DBLOCKDESC_UV | SVGA3DBLOCKDESC_W |
+			      SVGA3DBLOCKDESC_BUMP,
+	SVGA3DBLOCKDESC_UVWA = SVGA3DBLOCKDESC_UVW | SVGA3DBLOCKDESC_ALPHA |
+			       SVGA3DBLOCKDESC_MIXED | SVGA3DBLOCKDESC_BUMP,
+	SVGA3DBLOCKDESC_UVWQ = SVGA3DBLOCKDESC_U | SVGA3DBLOCKDESC_V |
+			       SVGA3DBLOCKDESC_W | SVGA3DBLOCKDESC_Q |
+			       SVGA3DBLOCKDESC_BUMP,
+	SVGA3DBLOCKDESC_L_UNORM = SVGA3DBLOCKDESC_LUMINANCE |
+				  SVGA3DBLOCKDESC_UINT | SVGA3DBLOCKDESC_NORM |
+				  SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_LA_UNORM = SVGA3DBLOCKDESC_LUMINANCE |
+				   SVGA3DBLOCKDESC_ALPHA |
+				   SVGA3DBLOCKDESC_UINT | SVGA3DBLOCKDESC_NORM |
+				   SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_R_FP = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_FP |
+			       SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RG_FP = SVGA3DBLOCKDESC_R_FP | SVGA3DBLOCKDESC_GREEN |
+				SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGB_FP = SVGA3DBLOCKDESC_RG_FP | SVGA3DBLOCKDESC_BLUE |
+				 SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_YUV = SVGA3DBLOCKDESC_YUV_VIDEO | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_AYUV = SVGA3DBLOCKDESC_ALPHA |
+			       SVGA3DBLOCKDESC_YUV_VIDEO |
+			       SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_RGB_EXP = SVGA3DBLOCKDESC_RED | SVGA3DBLOCKDESC_GREEN |
+				  SVGA3DBLOCKDESC_BLUE | SVGA3DBLOCKDESC_EXP |
+				  SVGA3DBLOCKDESC_COLOR,
+
+	SVGA3DBLOCKDESC_COMP_TYPELESS = SVGA3DBLOCKDESC_COMPRESSED |
+					SVGA3DBLOCKDESC_TYPELESS,
+	SVGA3DBLOCKDESC_COMP_UNORM =
+		SVGA3DBLOCKDESC_COMPRESSED | SVGA3DBLOCKDESC_UINT |
+		SVGA3DBLOCKDESC_NORM | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_COMP_SNORM =
+		SVGA3DBLOCKDESC_COMPRESSED | SVGA3DBLOCKDESC_SINT |
+		SVGA3DBLOCKDESC_NORM | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_COMP_UNORM_SRGB = SVGA3DBLOCKDESC_COMP_UNORM |
+					  SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_BC1_COMP_TYPELESS = SVGA3DBLOCKDESC_BC1 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC1_COMP_UNORM = SVGA3DBLOCKDESC_BC1 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC1_COMP_UNORM_SRGB = SVGA3DBLOCKDESC_BC1_COMP_UNORM |
+					      SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_BC2_COMP_TYPELESS = SVGA3DBLOCKDESC_BC2 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC2_COMP_UNORM = SVGA3DBLOCKDESC_BC2 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC2_COMP_UNORM_SRGB = SVGA3DBLOCKDESC_BC2_COMP_UNORM |
+					      SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_BC3_COMP_TYPELESS = SVGA3DBLOCKDESC_BC3 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC3_COMP_UNORM = SVGA3DBLOCKDESC_BC3 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC3_COMP_UNORM_SRGB = SVGA3DBLOCKDESC_BC3_COMP_UNORM |
+					      SVGA3DBLOCKDESC_SRGB,
+	SVGA3DBLOCKDESC_BC4_COMP_TYPELESS = SVGA3DBLOCKDESC_BC4 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC4_COMP_UNORM = SVGA3DBLOCKDESC_BC4 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC4_COMP_SNORM = SVGA3DBLOCKDESC_BC4 |
+					 SVGA3DBLOCKDESC_COMP_SNORM,
+	SVGA3DBLOCKDESC_BC5_COMP_TYPELESS = SVGA3DBLOCKDESC_BC5 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC5_COMP_UNORM = SVGA3DBLOCKDESC_BC5 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC5_COMP_SNORM = SVGA3DBLOCKDESC_BC5 |
+					 SVGA3DBLOCKDESC_COMP_SNORM,
+	SVGA3DBLOCKDESC_BC6H_COMP_TYPELESS = SVGA3DBLOCKDESC_BC6H |
+					     SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC6H_COMP_UF16 = SVGA3DBLOCKDESC_BC6H |
+					 SVGA3DBLOCKDESC_COMPRESSED,
+	SVGA3DBLOCKDESC_BC6H_COMP_SF16 = SVGA3DBLOCKDESC_BC6H |
+					 SVGA3DBLOCKDESC_COMPRESSED,
+	SVGA3DBLOCKDESC_BC7_COMP_TYPELESS = SVGA3DBLOCKDESC_BC7 |
+					    SVGA3DBLOCKDESC_COMP_TYPELESS,
+	SVGA3DBLOCKDESC_BC7_COMP_UNORM = SVGA3DBLOCKDESC_BC7 |
+					 SVGA3DBLOCKDESC_COMP_UNORM,
+	SVGA3DBLOCKDESC_BC7_COMP_UNORM_SRGB = SVGA3DBLOCKDESC_BC7_COMP_UNORM |
+					      SVGA3DBLOCKDESC_SRGB,
+
+	SVGA3DBLOCKDESC_NV12 =
+		SVGA3DBLOCKDESC_YUV_VIDEO | SVGA3DBLOCKDESC_PLANAR_YUV |
+		SVGA3DBLOCKDESC_2PLANAR_YUV | SVGA3DBLOCKDESC_COLOR,
+	SVGA3DBLOCKDESC_YV12 =
+		SVGA3DBLOCKDESC_YUV_VIDEO | SVGA3DBLOCKDESC_PLANAR_YUV |
+		SVGA3DBLOCKDESC_3PLANAR_YUV | SVGA3DBLOCKDESC_COLOR,
+
+	SVGA3DBLOCKDESC_DEPTH_UINT = SVGA3DBLOCKDESC_DEPTH |
+				     SVGA3DBLOCKDESC_UINT,
+	SVGA3DBLOCKDESC_DEPTH_UNORM = SVGA3DBLOCKDESC_DEPTH_UINT |
+				      SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_DS = SVGA3DBLOCKDESC_DEPTH | SVGA3DBLOCKDESC_STENCIL,
+	SVGA3DBLOCKDESC_DS_UINT = SVGA3DBLOCKDESC_DEPTH |
+				  SVGA3DBLOCKDESC_STENCIL |
+				  SVGA3DBLOCKDESC_UINT,
+	SVGA3DBLOCKDESC_DS_UNORM = SVGA3DBLOCKDESC_DS_UINT |
+				   SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_DEPTH_FP = SVGA3DBLOCKDESC_DEPTH | SVGA3DBLOCKDESC_FP,
+
+	SVGA3DBLOCKDESC_UV_UINT = SVGA3DBLOCKDESC_UV | SVGA3DBLOCKDESC_UINT,
+	SVGA3DBLOCKDESC_UV_SNORM = SVGA3DBLOCKDESC_UV | SVGA3DBLOCKDESC_SINT |
+				   SVGA3DBLOCKDESC_NORM,
+	SVGA3DBLOCKDESC_UVCX_SNORM = SVGA3DBLOCKDESC_UV_SNORM |
+				     SVGA3DBLOCKDESC_CX,
+	SVGA3DBLOCKDESC_UVWQ_SNORM = SVGA3DBLOCKDESC_UVWQ |
+				     SVGA3DBLOCKDESC_SINT |
+				     SVGA3DBLOCKDESC_NORM,
+} SVGA3dBlockDesc;
+
+typedef struct SVGA3dChannelDef {
+	union {
+		uint8 blue;
+		uint8 w_bump;
+		uint8 l_bump;
+		uint8 uv_video;
+		uint8 u_video;
+	};
+	union {
+		uint8 green;
+		uint8 stencil;
+		uint8 v_bump;
+		uint8 v_video;
+	};
+	union {
+		uint8 red;
+		uint8 u_bump;
+		uint8 luminance;
+		uint8 y_video;
+		uint8 depth;
+		uint8 data;
+	};
+	union {
+		uint8 alpha;
+		uint8 q_bump;
+		uint8 exp;
+	};
+} SVGA3dChannelDef;
+
+typedef struct SVGA3dSurfaceDesc {
+	SVGA3dSurfaceFormat format;
+	SVGA3dBlockDesc blockDesc;
+
+	SVGA3dSize blockSize;
+	uint32 bytesPerBlock;
+	uint32 pitchBytesPerBlock;
+
+	SVGA3dChannelDef bitDepth;
+	SVGA3dChannelDef bitOffset;
+} SVGA3dSurfaceDesc;
+
+STATIC_CONST SVGA3dSurfaceDesc g_SVGA3dSurfaceDescs[] = {
+	{ SVGA3D_FORMAT_INVALID,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 1, 1, 1 },
+	  0,
+	  0,
+	  { { 0 }, { 0 }, { 0 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_X8R8G8B8,
+	  SVGA3DBLOCKDESC_RGB_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_A8R8G8B8,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_R5G6B5,
+	  SVGA3DBLOCKDESC_RGB_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 5 }, { 6 }, { 5 }, { 0 } },
+	  { { 0 }, { 5 }, { 11 }, { 0 } } },
+
+	{ SVGA3D_X1R5G5B5,
+	  SVGA3DBLOCKDESC_RGB_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 5 }, { 5 }, { 5 }, { 0 } },
+	  { { 0 }, { 5 }, { 10 }, { 0 } } },
+
+	{ SVGA3D_A1R5G5B5,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 5 }, { 5 }, { 5 }, { 1 } },
+	  { { 0 }, { 5 }, { 10 }, { 15 } } },
+
+	{ SVGA3D_A4R4G4B4,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 4 }, { 4 }, { 4 }, { 4 } },
+	  { { 0 }, { 4 }, { 8 }, { 12 } } },
+
+	{ SVGA3D_Z_D32,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_Z_D16,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_Z_D24S8,
+	  SVGA3DBLOCKDESC_DS_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 24 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_Z_D15S1,
+	  SVGA3DBLOCKDESC_DS_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 1 }, { 15 }, { 0 } },
+	  { { 0 }, { 0 }, { 1 }, { 0 } } },
+
+	{ SVGA3D_LUMINANCE8,
+	  SVGA3DBLOCKDESC_L_UNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_LUMINANCE4_ALPHA4,
+	  SVGA3DBLOCKDESC_LA_UNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 4 }, { 4 } },
+	  { { 0 }, { 0 }, { 0 }, { 4 } } },
+
+	{ SVGA3D_LUMINANCE16,
+	  SVGA3DBLOCKDESC_L_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_LUMINANCE8_ALPHA8,
+	  SVGA3DBLOCKDESC_LA_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 8 }, { 8 } },
+	  { { 0 }, { 0 }, { 0 }, { 8 } } },
+
+	{ SVGA3D_DXT1,
+	  SVGA3DBLOCKDESC_BC1_COMP_UNORM,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_DXT2,
+	  SVGA3DBLOCKDESC_BC2_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_DXT3,
+	  SVGA3DBLOCKDESC_BC2_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_DXT4,
+	  SVGA3DBLOCKDESC_BC3_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_DXT5,
+	  SVGA3DBLOCKDESC_BC3_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BUMPU8V8,
+	  SVGA3DBLOCKDESC_UV_SNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BUMPL6V5U5,
+	  SVGA3DBLOCKDESC_UVL,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 6 }, { 5 }, { 5 }, { 0 } },
+	  { { 10 }, { 5 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BUMPX8L8V8U8,
+	  SVGA3DBLOCKDESC_UVL,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 16 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_FORMAT_DEAD1,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 1, 1, 1 },
+	  3,
+	  3,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 16 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_ARGB_S10E5,
+	  SVGA3DBLOCKDESC_RGBA_FP,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_ARGB_S23E8,
+	  SVGA3DBLOCKDESC_RGBA_FP,
+	  { 1, 1, 1 },
+	  16,
+	  16,
+	  { { 32 }, { 32 }, { 32 }, { 32 } },
+	  { { 64 }, { 32 }, { 0 }, { 96 } } },
+
+	{ SVGA3D_A2R10G10B10,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 0 }, { 10 }, { 20 }, { 30 } } },
+
+	{ SVGA3D_V8U8,
+	  SVGA3DBLOCKDESC_UV_SNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_Q8W8V8U8,
+	  SVGA3DBLOCKDESC_UVWQ_SNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_CxV8U8,
+	  SVGA3DBLOCKDESC_UVCX_SNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_X8L8V8U8,
+	  SVGA3DBLOCKDESC_UVL,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 16 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_A2W10V10U10,
+	  SVGA3DBLOCKDESC_UVWA,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 20 }, { 10 }, { 0 }, { 30 } } },
+
+	{ SVGA3D_ALPHA8,
+	  SVGA3DBLOCKDESC_A_UNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 0 }, { 8 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R_S10E5,
+	  SVGA3DBLOCKDESC_R_FP,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R_S23E8,
+	  SVGA3DBLOCKDESC_R_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_RG_S10E5,
+	  SVGA3DBLOCKDESC_RG_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_RG_S23E8,
+	  SVGA3DBLOCKDESC_RG_FP,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 32 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BUFFER,
+	  SVGA3DBLOCKDESC_BUFFER,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_Z_D24X8,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 24 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_V16U16,
+	  SVGA3DBLOCKDESC_UV_SNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_G16R16,
+	  SVGA3DBLOCKDESC_RG_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_A16B16G16R16,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_UYVY,
+	  SVGA3DBLOCKDESC_YUV,
+	  { 2, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_YUY2,
+	  SVGA3DBLOCKDESC_YUV,
+	  { 2, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 0 }, { 8 }, { 0 } },
+	  { { 8 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_NV12,
+	  SVGA3DBLOCKDESC_NV12,
+	  { 2, 2, 1 },
+	  6,
+	  2,
+	  { { 0 }, { 0 }, { 48 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_FORMAT_DEAD2,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_R32G32B32A32_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  16,
+	  16,
+	  { { 32 }, { 32 }, { 32 }, { 32 } },
+	  { { 64 }, { 32 }, { 0 }, { 96 } } },
+
+	{ SVGA3D_R32G32B32A32_UINT,
+	  SVGA3DBLOCKDESC_RGBA_UINT,
+	  { 1, 1, 1 },
+	  16,
+	  16,
+	  { { 32 }, { 32 }, { 32 }, { 32 } },
+	  { { 64 }, { 32 }, { 0 }, { 96 } } },
+
+	{ SVGA3D_R32G32B32A32_SINT,
+	  SVGA3DBLOCKDESC_RGBA_SINT,
+	  { 1, 1, 1 },
+	  16,
+	  16,
+	  { { 32 }, { 32 }, { 32 }, { 32 } },
+	  { { 64 }, { 32 }, { 0 }, { 96 } } },
+
+	{ SVGA3D_R32G32B32_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  12,
+	  12,
+	  { { 32 }, { 32 }, { 32 }, { 0 } },
+	  { { 64 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32B32_FLOAT,
+	  SVGA3DBLOCKDESC_RGB_FP,
+	  { 1, 1, 1 },
+	  12,
+	  12,
+	  { { 32 }, { 32 }, { 32 }, { 0 } },
+	  { { 64 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32B32_UINT,
+	  SVGA3DBLOCKDESC_RGB_UINT,
+	  { 1, 1, 1 },
+	  12,
+	  12,
+	  { { 32 }, { 32 }, { 32 }, { 0 } },
+	  { { 64 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32B32_SINT,
+	  SVGA3DBLOCKDESC_RGB_SINT,
+	  { 1, 1, 1 },
+	  12,
+	  12,
+	  { { 32 }, { 32 }, { 32 }, { 0 } },
+	  { { 64 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16G16B16A16_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R16G16B16A16_UINT,
+	  SVGA3DBLOCKDESC_RGBA_UINT,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R16G16B16A16_SNORM,
+	  SVGA3DBLOCKDESC_RGBA_SNORM,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R16G16B16A16_SINT,
+	  SVGA3DBLOCKDESC_RGBA_SINT,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R32G32_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 32 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32_UINT,
+	  SVGA3DBLOCKDESC_RG_UINT,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 32 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32_SINT,
+	  SVGA3DBLOCKDESC_RG_SINT,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 32 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G8X24_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 8 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_D32_FLOAT_S8X24_UINT,
+	  SVGA3DBLOCKDESC_DS,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 8 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32_FLOAT_X8X24,
+	  SVGA3DBLOCKDESC_R_FP,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_X32_G8X24_UINT,
+	  SVGA3DBLOCKDESC_G_UINT,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 8 }, { 0 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R10G10B10A2_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 20 }, { 10 }, { 0 }, { 30 } } },
+
+	{ SVGA3D_R10G10B10A2_UINT,
+	  SVGA3DBLOCKDESC_RGBA_UINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 20 }, { 10 }, { 0 }, { 30 } } },
+
+	{ SVGA3D_R11G11B10_FLOAT,
+	  SVGA3DBLOCKDESC_RGB_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 11 }, { 11 }, { 0 } },
+	  { { 22 }, { 11 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8B8A8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R8G8B8A8_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R8G8B8A8_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_RGBA_UNORM_SRGB,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R8G8B8A8_UINT,
+	  SVGA3DBLOCKDESC_RGBA_UINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R8G8B8A8_SINT,
+	  SVGA3DBLOCKDESC_RGBA_SINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R16G16_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16G16_UINT,
+	  SVGA3DBLOCKDESC_RG_UINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16G16_SINT,
+	  SVGA3DBLOCKDESC_RG_SINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_D32_FLOAT,
+	  SVGA3DBLOCKDESC_DEPTH_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32_UINT,
+	  SVGA3DBLOCKDESC_R_UINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32_SINT,
+	  SVGA3DBLOCKDESC_R_SINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R24G8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 24 }, { 0 } },
+	  { { 0 }, { 24 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_D24_UNORM_S8_UINT,
+	  SVGA3DBLOCKDESC_DS_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 24 }, { 0 } },
+	  { { 0 }, { 24 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R24_UNORM_X8,
+	  SVGA3DBLOCKDESC_R_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 24 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_X24_G8_UINT,
+	  SVGA3DBLOCKDESC_G_UINT,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 0 }, { 0 } },
+	  { { 0 }, { 24 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8_UNORM,
+	  SVGA3DBLOCKDESC_RG_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8_UINT,
+	  SVGA3DBLOCKDESC_RG_UINT,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8_SINT,
+	  SVGA3DBLOCKDESC_RG_SINT,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_UNORM,
+	  SVGA3DBLOCKDESC_R_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_UINT,
+	  SVGA3DBLOCKDESC_R_UINT,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_SNORM,
+	  SVGA3DBLOCKDESC_R_SNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_SINT,
+	  SVGA3DBLOCKDESC_R_SINT,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8_UNORM,
+	  SVGA3DBLOCKDESC_R_UNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8_UINT,
+	  SVGA3DBLOCKDESC_R_UINT,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8_SNORM,
+	  SVGA3DBLOCKDESC_R_SNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8_SINT,
+	  SVGA3DBLOCKDESC_R_SINT,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_P8,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R9G9B9E5_SHAREDEXP,
+	  SVGA3DBLOCKDESC_RGB_EXP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 9 }, { 9 }, { 9 }, { 5 } },
+	  { { 18 }, { 9 }, { 0 }, { 27 } } },
+
+	{ SVGA3D_R8G8_B8G8_UNORM,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 2, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_G8R8_G8B8_UNORM,
+	  SVGA3DBLOCKDESC_NONE,
+	  { 2, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC1_TYPELESS,
+	  SVGA3DBLOCKDESC_BC1_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC1_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_BC1_COMP_UNORM_SRGB,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC2_TYPELESS,
+	  SVGA3DBLOCKDESC_BC2_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC2_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_BC2_COMP_UNORM_SRGB,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC3_TYPELESS,
+	  SVGA3DBLOCKDESC_BC3_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC3_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_BC3_COMP_UNORM_SRGB,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC4_TYPELESS,
+	  SVGA3DBLOCKDESC_BC4_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_ATI1,
+	  SVGA3DBLOCKDESC_BC4_COMP_UNORM,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC4_SNORM,
+	  SVGA3DBLOCKDESC_BC4_COMP_SNORM,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC5_TYPELESS,
+	  SVGA3DBLOCKDESC_BC5_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_ATI2,
+	  SVGA3DBLOCKDESC_BC5_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC5_SNORM,
+	  SVGA3DBLOCKDESC_BC5_COMP_SNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R10G10B10_XR_BIAS_A2_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 20 }, { 10 }, { 0 }, { 30 } } },
+
+	{ SVGA3D_B8G8R8A8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_B8G8R8A8_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_RGBA_UNORM_SRGB,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_B8G8R8X8_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_B8G8R8X8_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_RGB_UNORM_SRGB,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_Z_DF16,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_Z_DF24,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 24 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_Z_D24S8_INT,
+	  SVGA3DBLOCKDESC_DS_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 8 }, { 24 }, { 0 } },
+	  { { 0 }, { 0 }, { 8 }, { 0 } } },
+
+	{ SVGA3D_YV12,
+	  SVGA3DBLOCKDESC_YV12,
+	  { 2, 2, 1 },
+	  6,
+	  2,
+	  { { 0 }, { 0 }, { 48 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32G32B32A32_FLOAT,
+	  SVGA3DBLOCKDESC_RGBA_FP,
+	  { 1, 1, 1 },
+	  16,
+	  16,
+	  { { 32 }, { 32 }, { 32 }, { 32 } },
+	  { { 64 }, { 32 }, { 0 }, { 96 } } },
+
+	{ SVGA3D_R16G16B16A16_FLOAT,
+	  SVGA3DBLOCKDESC_RGBA_FP,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R16G16B16A16_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 16 }, { 16 }, { 16 }, { 16 } },
+	  { { 32 }, { 16 }, { 0 }, { 48 } } },
+
+	{ SVGA3D_R32G32_FLOAT,
+	  SVGA3DBLOCKDESC_RG_FP,
+	  { 1, 1, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 32 }, { 32 }, { 0 } },
+	  { { 0 }, { 32 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R10G10B10A2_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 10 }, { 10 }, { 2 } },
+	  { { 20 }, { 10 }, { 0 }, { 30 } } },
+
+	{ SVGA3D_R8G8B8A8_SNORM,
+	  SVGA3DBLOCKDESC_RGBA_SNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 16 }, { 8 }, { 0 }, { 24 } } },
+
+	{ SVGA3D_R16G16_FLOAT,
+	  SVGA3DBLOCKDESC_RG_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16G16_UNORM,
+	  SVGA3DBLOCKDESC_RG_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16G16_SNORM,
+	  SVGA3DBLOCKDESC_RG_SNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 16 }, { 16 }, { 0 } },
+	  { { 0 }, { 16 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R32_FLOAT,
+	  SVGA3DBLOCKDESC_R_FP,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 0 }, { 0 }, { 32 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R8G8_SNORM,
+	  SVGA3DBLOCKDESC_RG_SNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_R16_FLOAT,
+	  SVGA3DBLOCKDESC_R_FP,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_D16_UNORM,
+	  SVGA3DBLOCKDESC_DEPTH_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 0 }, { 0 }, { 16 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_A8_UNORM,
+	  SVGA3DBLOCKDESC_A_UNORM,
+	  { 1, 1, 1 },
+	  1,
+	  1,
+	  { { 0 }, { 0 }, { 0 }, { 8 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC1_UNORM,
+	  SVGA3DBLOCKDESC_BC1_COMP_UNORM,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC2_UNORM,
+	  SVGA3DBLOCKDESC_BC2_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC3_UNORM,
+	  SVGA3DBLOCKDESC_BC3_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_B5G6R5_UNORM,
+	  SVGA3DBLOCKDESC_RGB_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 5 }, { 6 }, { 5 }, { 0 } },
+	  { { 0 }, { 5 }, { 11 }, { 0 } } },
+
+	{ SVGA3D_B5G5R5A1_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 5 }, { 5 }, { 5 }, { 1 } },
+	  { { 0 }, { 5 }, { 10 }, { 15 } } },
+
+	{ SVGA3D_B8G8R8A8_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_B8G8R8X8_UNORM,
+	  SVGA3DBLOCKDESC_RGB_UNORM,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 0 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_BC4_UNORM,
+	  SVGA3DBLOCKDESC_BC4_COMP_UNORM,
+	  { 4, 4, 1 },
+	  8,
+	  8,
+	  { { 0 }, { 0 }, { 64 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC5_UNORM,
+	  SVGA3DBLOCKDESC_BC5_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_B4G4R4A4_UNORM,
+	  SVGA3DBLOCKDESC_RGBA_UNORM,
+	  { 1, 1, 1 },
+	  2,
+	  2,
+	  { { 4 }, { 4 }, { 4 }, { 4 } },
+	  { { 0 }, { 4 }, { 8 }, { 12 } } },
+
+	{ SVGA3D_BC6H_TYPELESS,
+	  SVGA3DBLOCKDESC_BC6H_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC6H_UF16,
+	  SVGA3DBLOCKDESC_BC6H_COMP_UF16,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC6H_SF16,
+	  SVGA3DBLOCKDESC_BC6H_COMP_SF16,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC7_TYPELESS,
+	  SVGA3DBLOCKDESC_BC7_COMP_TYPELESS,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC7_UNORM,
+	  SVGA3DBLOCKDESC_BC7_COMP_UNORM,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_BC7_UNORM_SRGB,
+	  SVGA3DBLOCKDESC_BC7_COMP_UNORM_SRGB,
+	  { 4, 4, 1 },
+	  16,
+	  16,
+	  { { 0 }, { 0 }, { 128 }, { 0 } },
+	  { { 0 }, { 0 }, { 0 }, { 0 } } },
+
+	{ SVGA3D_AYUV,
+	  SVGA3DBLOCKDESC_AYUV,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 8 }, { 8 }, { 8 }, { 8 } },
+	  { { 0 }, { 8 }, { 16 }, { 24 } } },
+
+	{ SVGA3D_R11G11B10_TYPELESS,
+	  SVGA3DBLOCKDESC_TYPELESS,
+	  { 1, 1, 1 },
+	  4,
+	  4,
+	  { { 10 }, { 11 }, { 11 }, { 0 } },
+	  { { 22 }, { 11 }, { 0 }, { 0 } } },
+};
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif
diff --git a/lib/svga/svga3d_types.h b/lib/svga/svga3d_types.h
new file mode 100644
index 00000000..e2c74db8
--- /dev/null
+++ b/lib/svga/svga3d_types.h
@@ -0,0 +1,1554 @@
+/**********************************************************
+ * Copyright 2012-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga3d_types.h --
+ *
+ *    SVGA 3d hardware definitions for basic types
+ */
+
+#ifndef _SVGA3D_TYPES_H_
+#define _SVGA3D_TYPES_H_
+
+#include "vm_basic_types.h"
+
+#define SVGA3D_INVALID_ID ((uint32)-1)
+
+#define SVGA3D_RESOURCE_TYPE_MIN 1
+#define SVGA3D_RESOURCE_BUFFER 1
+#define SVGA3D_RESOURCE_TEXTURE1D 2
+#define SVGA3D_RESOURCE_TEXTURE2D 3
+#define SVGA3D_RESOURCE_TEXTURE3D 4
+#define SVGA3D_RESOURCE_TEXTURECUBE 5
+#define SVGA3D_RESOURCE_TYPE_DX10_MAX 6
+#define SVGA3D_RESOURCE_BUFFEREX 6
+#define SVGA3D_RESOURCE_TYPE_MAX 7
+typedef uint32 SVGA3dResourceType;
+
+typedef uint8 SVGABool8;
+typedef uint32 SVGA3dBool;
+typedef uint32 SVGA3dColor;
+
+typedef uint32 SVGA3dSurfaceId;
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 numerator;
+	uint32 denominator;
+} SVGA3dFraction64;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCopyRect {
+	uint32 x;
+	uint32 y;
+	uint32 w;
+	uint32 h;
+	uint32 srcx;
+	uint32 srcy;
+} SVGA3dCopyRect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dCopyBox {
+	uint32 x;
+	uint32 y;
+	uint32 z;
+	uint32 w;
+	uint32 h;
+	uint32 d;
+	uint32 srcx;
+	uint32 srcy;
+	uint32 srcz;
+} SVGA3dCopyBox;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dRect {
+	uint32 x;
+	uint32 y;
+	uint32 w;
+	uint32 h;
+} SVGA3dRect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 x;
+	uint32 y;
+	uint32 z;
+	uint32 w;
+	uint32 h;
+	uint32 d;
+} SVGA3dBox;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	int32 x;
+	int32 y;
+	int32 z;
+	int32 w;
+	int32 h;
+	int32 d;
+} SVGA3dSignedBox;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 x;
+	uint32 y;
+	uint32 z;
+} SVGA3dPoint;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef union {
+	struct {
+		float r;
+		float g;
+		float b;
+		float a;
+	};
+
+	float value[4];
+} SVGA3dRGBAFloat;
+#pragma pack(pop)
+
+typedef enum SVGA3dSurfaceFormat {
+	SVGA3D_FORMAT_INVALID = 0,
+
+	SVGA3D_X8R8G8B8 = 1,
+	SVGA3D_FORMAT_MIN = 1,
+
+	SVGA3D_A8R8G8B8 = 2,
+
+	SVGA3D_R5G6B5 = 3,
+	SVGA3D_X1R5G5B5 = 4,
+	SVGA3D_A1R5G5B5 = 5,
+	SVGA3D_A4R4G4B4 = 6,
+
+	SVGA3D_Z_D32 = 7,
+	SVGA3D_Z_D16 = 8,
+	SVGA3D_Z_D24S8 = 9,
+	SVGA3D_Z_D15S1 = 10,
+
+	SVGA3D_LUMINANCE8 = 11,
+	SVGA3D_LUMINANCE4_ALPHA4 = 12,
+	SVGA3D_LUMINANCE16 = 13,
+	SVGA3D_LUMINANCE8_ALPHA8 = 14,
+
+	SVGA3D_DXT1 = 15,
+	SVGA3D_DXT2 = 16,
+	SVGA3D_DXT3 = 17,
+	SVGA3D_DXT4 = 18,
+	SVGA3D_DXT5 = 19,
+
+	SVGA3D_BUMPU8V8 = 20,
+	SVGA3D_BUMPL6V5U5 = 21,
+	SVGA3D_BUMPX8L8V8U8 = 22,
+	SVGA3D_FORMAT_DEAD1 = 23,
+
+	SVGA3D_ARGB_S10E5 = 24,
+	SVGA3D_ARGB_S23E8 = 25,
+
+	SVGA3D_A2R10G10B10 = 26,
+
+	SVGA3D_V8U8 = 27,
+	SVGA3D_Q8W8V8U8 = 28,
+	SVGA3D_CxV8U8 = 29,
+
+	SVGA3D_X8L8V8U8 = 30,
+	SVGA3D_A2W10V10U10 = 31,
+
+	SVGA3D_ALPHA8 = 32,
+
+	SVGA3D_R_S10E5 = 33,
+	SVGA3D_R_S23E8 = 34,
+	SVGA3D_RG_S10E5 = 35,
+	SVGA3D_RG_S23E8 = 36,
+
+	SVGA3D_BUFFER = 37,
+
+	SVGA3D_Z_D24X8 = 38,
+
+	SVGA3D_V16U16 = 39,
+
+	SVGA3D_G16R16 = 40,
+	SVGA3D_A16B16G16R16 = 41,
+
+	SVGA3D_UYVY = 42,
+	SVGA3D_YUY2 = 43,
+
+	SVGA3D_NV12 = 44,
+
+	SVGA3D_FORMAT_DEAD2 = 45,
+
+	SVGA3D_R32G32B32A32_TYPELESS = 46,
+	SVGA3D_R32G32B32A32_UINT = 47,
+	SVGA3D_R32G32B32A32_SINT = 48,
+	SVGA3D_R32G32B32_TYPELESS = 49,
+	SVGA3D_R32G32B32_FLOAT = 50,
+	SVGA3D_R32G32B32_UINT = 51,
+	SVGA3D_R32G32B32_SINT = 52,
+	SVGA3D_R16G16B16A16_TYPELESS = 53,
+	SVGA3D_R16G16B16A16_UINT = 54,
+	SVGA3D_R16G16B16A16_SNORM = 55,
+	SVGA3D_R16G16B16A16_SINT = 56,
+	SVGA3D_R32G32_TYPELESS = 57,
+	SVGA3D_R32G32_UINT = 58,
+	SVGA3D_R32G32_SINT = 59,
+	SVGA3D_R32G8X24_TYPELESS = 60,
+	SVGA3D_D32_FLOAT_S8X24_UINT = 61,
+	SVGA3D_R32_FLOAT_X8X24 = 62,
+	SVGA3D_X32_G8X24_UINT = 63,
+	SVGA3D_R10G10B10A2_TYPELESS = 64,
+	SVGA3D_R10G10B10A2_UINT = 65,
+	SVGA3D_R11G11B10_FLOAT = 66,
+	SVGA3D_R8G8B8A8_TYPELESS = 67,
+	SVGA3D_R8G8B8A8_UNORM = 68,
+	SVGA3D_R8G8B8A8_UNORM_SRGB = 69,
+	SVGA3D_R8G8B8A8_UINT = 70,
+	SVGA3D_R8G8B8A8_SINT = 71,
+	SVGA3D_R16G16_TYPELESS = 72,
+	SVGA3D_R16G16_UINT = 73,
+	SVGA3D_R16G16_SINT = 74,
+	SVGA3D_R32_TYPELESS = 75,
+	SVGA3D_D32_FLOAT = 76,
+	SVGA3D_R32_UINT = 77,
+	SVGA3D_R32_SINT = 78,
+	SVGA3D_R24G8_TYPELESS = 79,
+	SVGA3D_D24_UNORM_S8_UINT = 80,
+	SVGA3D_R24_UNORM_X8 = 81,
+	SVGA3D_X24_G8_UINT = 82,
+	SVGA3D_R8G8_TYPELESS = 83,
+	SVGA3D_R8G8_UNORM = 84,
+	SVGA3D_R8G8_UINT = 85,
+	SVGA3D_R8G8_SINT = 86,
+	SVGA3D_R16_TYPELESS = 87,
+	SVGA3D_R16_UNORM = 88,
+	SVGA3D_R16_UINT = 89,
+	SVGA3D_R16_SNORM = 90,
+	SVGA3D_R16_SINT = 91,
+	SVGA3D_R8_TYPELESS = 92,
+	SVGA3D_R8_UNORM = 93,
+	SVGA3D_R8_UINT = 94,
+	SVGA3D_R8_SNORM = 95,
+	SVGA3D_R8_SINT = 96,
+	SVGA3D_P8 = 97,
+	SVGA3D_R9G9B9E5_SHAREDEXP = 98,
+	SVGA3D_R8G8_B8G8_UNORM = 99,
+	SVGA3D_G8R8_G8B8_UNORM = 100,
+	SVGA3D_BC1_TYPELESS = 101,
+	SVGA3D_BC1_UNORM_SRGB = 102,
+	SVGA3D_BC2_TYPELESS = 103,
+	SVGA3D_BC2_UNORM_SRGB = 104,
+	SVGA3D_BC3_TYPELESS = 105,
+	SVGA3D_BC3_UNORM_SRGB = 106,
+	SVGA3D_BC4_TYPELESS = 107,
+	SVGA3D_ATI1 = 108,
+	SVGA3D_BC4_SNORM = 109,
+	SVGA3D_BC5_TYPELESS = 110,
+	SVGA3D_ATI2 = 111,
+	SVGA3D_BC5_SNORM = 112,
+	SVGA3D_R10G10B10_XR_BIAS_A2_UNORM = 113,
+	SVGA3D_B8G8R8A8_TYPELESS = 114,
+	SVGA3D_B8G8R8A8_UNORM_SRGB = 115,
+	SVGA3D_B8G8R8X8_TYPELESS = 116,
+	SVGA3D_B8G8R8X8_UNORM_SRGB = 117,
+
+	SVGA3D_Z_DF16 = 118,
+	SVGA3D_Z_DF24 = 119,
+	SVGA3D_Z_D24S8_INT = 120,
+
+	SVGA3D_YV12 = 121,
+
+	SVGA3D_R32G32B32A32_FLOAT = 122,
+	SVGA3D_R16G16B16A16_FLOAT = 123,
+	SVGA3D_R16G16B16A16_UNORM = 124,
+	SVGA3D_R32G32_FLOAT = 125,
+	SVGA3D_R10G10B10A2_UNORM = 126,
+	SVGA3D_R8G8B8A8_SNORM = 127,
+	SVGA3D_R16G16_FLOAT = 128,
+	SVGA3D_R16G16_UNORM = 129,
+	SVGA3D_R16G16_SNORM = 130,
+	SVGA3D_R32_FLOAT = 131,
+	SVGA3D_R8G8_SNORM = 132,
+	SVGA3D_R16_FLOAT = 133,
+	SVGA3D_D16_UNORM = 134,
+	SVGA3D_A8_UNORM = 135,
+	SVGA3D_BC1_UNORM = 136,
+	SVGA3D_BC2_UNORM = 137,
+	SVGA3D_BC3_UNORM = 138,
+	SVGA3D_B5G6R5_UNORM = 139,
+	SVGA3D_B5G5R5A1_UNORM = 140,
+	SVGA3D_B8G8R8A8_UNORM = 141,
+	SVGA3D_B8G8R8X8_UNORM = 142,
+	SVGA3D_BC4_UNORM = 143,
+	SVGA3D_BC5_UNORM = 144,
+	SVGA3D_B4G4R4A4_UNORM = 145,
+
+	SVGA3D_BC6H_TYPELESS = 146,
+	SVGA3D_BC6H_UF16 = 147,
+	SVGA3D_BC6H_SF16 = 148,
+	SVGA3D_BC7_TYPELESS = 149,
+	SVGA3D_BC7_UNORM = 150,
+	SVGA3D_BC7_UNORM_SRGB = 151,
+
+	SVGA3D_AYUV = 152,
+
+	SVGA3D_R11G11B10_TYPELESS = 153,
+
+	SVGA3D_FORMAT_MAX
+} SVGA3dSurfaceFormat;
+
+#define SVGA3D_SURFACE_CUBEMAP (1 << 0)
+
+#define SVGA3D_SURFACE_HINT_STATIC (CONST64U(1) << 1)
+#define SVGA3D_SURFACE_HINT_DYNAMIC (CONST64U(1) << 2)
+#define SVGA3D_SURFACE_HINT_INDEXBUFFER (CONST64U(1) << 3)
+#define SVGA3D_SURFACE_HINT_VERTEXBUFFER (CONST64U(1) << 4)
+#define SVGA3D_SURFACE_HINT_TEXTURE (CONST64U(1) << 5)
+#define SVGA3D_SURFACE_HINT_RENDERTARGET (CONST64U(1) << 6)
+#define SVGA3D_SURFACE_HINT_DEPTHSTENCIL (CONST64U(1) << 7)
+#define SVGA3D_SURFACE_HINT_WRITEONLY (CONST64U(1) << 8)
+#define SVGA3D_SURFACE_DEAD2 (CONST64U(1) << 9)
+#define SVGA3D_SURFACE_AUTOGENMIPMAPS (CONST64U(1) << 10)
+
+#define SVGA3D_SURFACE_DEAD1 (CONST64U(1) << 11)
+
+#define SVGA3D_SURFACE_MOB_PITCH (CONST64U(1) << 12)
+
+#define SVGA3D_SURFACE_INACTIVE (CONST64U(1) << 13)
+#define SVGA3D_SURFACE_HINT_RT_LOCKABLE (CONST64U(1) << 14)
+#define SVGA3D_SURFACE_VOLUME (CONST64U(1) << 15)
+
+#define SVGA3D_SURFACE_SCREENTARGET (CONST64U(1) << 16)
+
+#define SVGA3D_SURFACE_ALIGN16 (CONST64U(1) << 17)
+
+#define SVGA3D_SURFACE_1D (CONST64U(1) << 18)
+#define SVGA3D_SURFACE_ARRAY (CONST64U(1) << 19)
+
+#define SVGA3D_SURFACE_BIND_VERTEX_BUFFER (CONST64U(1) << 20)
+#define SVGA3D_SURFACE_BIND_INDEX_BUFFER (CONST64U(1) << 21)
+#define SVGA3D_SURFACE_BIND_CONSTANT_BUFFER (CONST64U(1) << 22)
+#define SVGA3D_SURFACE_BIND_SHADER_RESOURCE (CONST64U(1) << 23)
+#define SVGA3D_SURFACE_BIND_RENDER_TARGET (CONST64U(1) << 24)
+#define SVGA3D_SURFACE_BIND_DEPTH_STENCIL (CONST64U(1) << 25)
+#define SVGA3D_SURFACE_BIND_STREAM_OUTPUT (CONST64U(1) << 26)
+
+#define SVGA3D_SURFACE_STAGING_UPLOAD (CONST64U(1) << 27)
+#define SVGA3D_SURFACE_STAGING_DOWNLOAD (CONST64U(1) << 28)
+#define SVGA3D_SURFACE_HINT_INDIRECT_UPDATE (CONST64U(1) << 29)
+
+#define SVGA3D_SURFACE_TRANSFER_FROM_BUFFER (CONST64U(1) << 30)
+
+#define SVGA3D_SURFACE_RESERVED1 (CONST64U(1) << 31)
+#define SVGA3D_SURFACE_VADECODE SVGA3D_SURFACE_RESERVED1
+
+#define SVGA3D_SURFACE_MULTISAMPLE (CONST64U(1) << 32)
+
+#define SVGA3D_SURFACE_BIND_UAVIEW (CONST64U(1) << 33)
+
+#define SVGA3D_SURFACE_TRANSFER_TO_BUFFER (CONST64U(1) << 34)
+
+#define SVGA3D_SURFACE_BIND_LOGICOPS (CONST64U(1) << 35)
+
+#define SVGA3D_SURFACE_BIND_RAW_VIEWS (CONST64U(1) << 36)
+#define SVGA3D_SURFACE_BUFFER_STRUCTURED (CONST64U(1) << 37)
+
+#define SVGA3D_SURFACE_DRAWINDIRECT_ARGS (CONST64U(1) << 38)
+#define SVGA3D_SURFACE_RESOURCE_CLAMP (CONST64U(1) << 39)
+
+#define SVGA3D_SURFACE_STAGING_COPY (CONST64U(1) << 40)
+
+#define SVGA3D_SURFACE_FLAG_MAX (CONST64U(1) << 44)
+
+typedef uint32 SVGA3dSurface1Flags;
+typedef uint32 SVGA3dSurface2Flags;
+typedef uint64 SVGA3dSurfaceAllFlags;
+
+#define SVGA3D_SURFACE_FLAGS1_MASK ((uint64)MAX_UINT32)
+#define SVGA3D_SURFACE_FLAGS2_MASK (MAX_UINT64 & ~SVGA3D_SURFACE_FLAGS1_MASK)
+
+#define SVGA3D_SURFACE_HB_DISALLOWED_MASK                                      \
+	(SVGA3D_SURFACE_MOB_PITCH | SVGA3D_SURFACE_SCREENTARGET |              \
+	 SVGA3D_SURFACE_ALIGN16 | SVGA3D_SURFACE_BIND_CONSTANT_BUFFER |        \
+	 SVGA3D_SURFACE_BIND_STREAM_OUTPUT | SVGA3D_SURFACE_STAGING_UPLOAD |   \
+	 SVGA3D_SURFACE_STAGING_DOWNLOAD |                                     \
+	 SVGA3D_SURFACE_HINT_INDIRECT_UPDATE |                                 \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER | SVGA3D_SURFACE_MULTISAMPLE |    \
+	 SVGA3D_SURFACE_BIND_UAVIEW | SVGA3D_SURFACE_TRANSFER_TO_BUFFER |      \
+	 SVGA3D_SURFACE_BIND_LOGICOPS | SVGA3D_SURFACE_BIND_RAW_VIEWS |        \
+	 SVGA3D_SURFACE_BUFFER_STRUCTURED | SVGA3D_SURFACE_DRAWINDIRECT_ARGS | \
+	 SVGA3D_SURFACE_RESOURCE_CLAMP | SVGA3D_SURFACE_STAGING_COPY |         \
+	 SVGA3D_SURFACE_RESTRICT_UPDATE | SVGA3D_SURFACE_BIND_TENSOR |         \
+	 SVGA3D_SURFACE_LO_STAGING)
+
+#define SVGA3D_SURFACE_HB_PRESENT_DISALLOWED_MASK         \
+	(SVGA3D_SURFACE_1D | SVGA3D_SURFACE_MULTISAMPLE | \
+	 SVGA3D_SURFACE_STAGING_COPY)
+
+#define SVGA3D_SURFACE_2D_DISALLOWED_MASK                                   \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_AUTOGENMIPMAPS |           \
+	 SVGA3D_SURFACE_VOLUME | SVGA3D_SURFACE_1D |                        \
+	 SVGA3D_SURFACE_BIND_VERTEX_BUFFER |                                \
+	 SVGA3D_SURFACE_BIND_INDEX_BUFFER |                                 \
+	 SVGA3D_SURFACE_BIND_CONSTANT_BUFFER |                              \
+	 SVGA3D_SURFACE_BIND_DEPTH_STENCIL |                                \
+	 SVGA3D_SURFACE_BIND_STREAM_OUTPUT |                                \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER | SVGA3D_SURFACE_MULTISAMPLE | \
+	 SVGA3D_SURFACE_BIND_UAVIEW | SVGA3D_SURFACE_TRANSFER_TO_BUFFER |   \
+	 SVGA3D_SURFACE_BIND_RAW_VIEWS | SVGA3D_SURFACE_BUFFER_STRUCTURED | \
+	 SVGA3D_SURFACE_DRAWINDIRECT_ARGS | SVGA3D_SURFACE_RESOURCE_CLAMP | \
+	 SVGA3D_SURFACE_BIND_TENSOR)
+
+#define SVGA3D_SURFACE_BASICOPS_DISALLOWED_MASK                   \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_AUTOGENMIPMAPS | \
+	 SVGA3D_SURFACE_VOLUME | SVGA3D_SURFACE_1D |              \
+	 SVGA3D_SURFACE_MULTISAMPLE)
+
+#define SVGA3D_SURFACE_SCREENTARGET_DISALLOWED_MASK                            \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_AUTOGENMIPMAPS |              \
+	 SVGA3D_SURFACE_VOLUME | SVGA3D_SURFACE_1D |                           \
+	 SVGA3D_SURFACE_BIND_VERTEX_BUFFER |                                   \
+	 SVGA3D_SURFACE_BIND_INDEX_BUFFER |                                    \
+	 SVGA3D_SURFACE_BIND_CONSTANT_BUFFER |                                 \
+	 SVGA3D_SURFACE_BIND_DEPTH_STENCIL |                                   \
+	 SVGA3D_SURFACE_BIND_STREAM_OUTPUT | SVGA3D_SURFACE_INACTIVE |         \
+	 SVGA3D_SURFACE_STAGING_UPLOAD | SVGA3D_SURFACE_STAGING_DOWNLOAD |     \
+	 SVGA3D_SURFACE_HINT_INDIRECT_UPDATE |                                 \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER | SVGA3D_SURFACE_MULTISAMPLE |    \
+	 SVGA3D_SURFACE_TRANSFER_TO_BUFFER | SVGA3D_SURFACE_BIND_RAW_VIEWS |   \
+	 SVGA3D_SURFACE_BUFFER_STRUCTURED | SVGA3D_SURFACE_DRAWINDIRECT_ARGS | \
+	 SVGA3D_SURFACE_RESOURCE_CLAMP | SVGA3D_SURFACE_STAGING_COPY |         \
+	 SVGA3D_SURFACE_BIND_TENSOR | SVGA3D_SURFACE_LO_STAGING)
+
+#define SVGA3D_SURFACE_BUFFER_DISALLOWED_MASK                               \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_AUTOGENMIPMAPS |           \
+	 SVGA3D_SURFACE_VOLUME | SVGA3D_SURFACE_1D | SVGA3D_SURFACE_DEAD2 | \
+	 SVGA3D_SURFACE_ARRAY | SVGA3D_SURFACE_MULTISAMPLE |                \
+	 SVGA3D_SURFACE_MOB_PITCH | SVGA3D_SURFACE_RESOURCE_CLAMP)
+
+#define SVGA3D_SURFACE_MULTISAMPLE_DISALLOWED_MASK                          \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_AUTOGENMIPMAPS |           \
+	 SVGA3D_SURFACE_VOLUME | SVGA3D_SURFACE_1D |                        \
+	 SVGA3D_SURFACE_SCREENTARGET | SVGA3D_SURFACE_MOB_PITCH |           \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER | SVGA3D_SURFACE_BIND_UAVIEW | \
+	 SVGA3D_SURFACE_TRANSFER_TO_BUFFER | SVGA3D_SURFACE_BIND_LOGICOPS | \
+	 SVGA3D_SURFACE_BIND_RAW_VIEWS | SVGA3D_SURFACE_BUFFER_STRUCTURED | \
+	 SVGA3D_SURFACE_DRAWINDIRECT_ARGS | SVGA3D_SURFACE_STAGING_COPY)
+
+#define SVGA3D_SURFACE_DX_ONLY_MASK                                          \
+	(SVGA3D_SURFACE_BIND_STREAM_OUTPUT | SVGA3D_SURFACE_STAGING_UPLOAD | \
+	 SVGA3D_SURFACE_STAGING_DOWNLOAD |                                   \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER |                               \
+	 SVGA3D_SURFACE_TRANSFER_TO_BUFFER)
+
+#define SVGA3D_SURFACE_ANY_STAGING_MASK                                    \
+	(SVGA3D_SURFACE_STAGING_UPLOAD | SVGA3D_SURFACE_STAGING_DOWNLOAD | \
+	 SVGA3D_SURFACE_STAGING_COPY | SVGA3D_SURFACE_LO_STAGING)
+
+#define SVGA3D_SURFACE_ANY_NONHINT_STAGING_MASK \
+	(SVGA3D_SURFACE_ANY_STAGING_MASK & ~(SVGA3D_SURFACE_LO_STAGING))
+
+#define SVGA3D_SURFACE_BIND_MASK                                          \
+	(SVGA3D_SURFACE_BIND_VERTEX_BUFFER |                              \
+	 SVGA3D_SURFACE_BIND_INDEX_BUFFER |                               \
+	 SVGA3D_SURFACE_BIND_CONSTANT_BUFFER |                            \
+	 SVGA3D_SURFACE_BIND_SHADER_RESOURCE |                            \
+	 SVGA3D_SURFACE_BIND_RENDER_TARGET |                              \
+	 SVGA3D_SURFACE_BIND_DEPTH_STENCIL |                              \
+	 SVGA3D_SURFACE_BIND_STREAM_OUTPUT | SVGA3D_SURFACE_BIND_UAVIEW | \
+	 SVGA3D_SURFACE_BIND_LOGICOPS | SVGA3D_SURFACE_BIND_RAW_VIEWS |   \
+	 SVGA3D_SURFACE_BIND_TENSOR)
+
+#define SVGA3D_SURFACE_STAGING_DISALLOWED_MASK                              \
+	(SVGA3D_SURFACE_BIND_MASK | SVGA3D_SURFACE_AUTOGENMIPMAPS |         \
+	 SVGA3D_SURFACE_SCREENTARGET | SVGA3D_SURFACE_HINT_RENDERTARGET |   \
+	 SVGA3D_SURFACE_HINT_INDIRECT_UPDATE | SVGA3D_SURFACE_MULTISAMPLE | \
+	 SVGA3D_SURFACE_DRAWINDIRECT_ARGS | SVGA3D_SURFACE_RESOURCE_CLAMP | \
+	 SVGA3D_SURFACE_BIND_TENSOR)
+
+#define SVGA3D_SURFACE_STAGING_COPY_DISALLOWED_MASK \
+	(SVGA3D_SURFACE_STAGING_DISALLOWED_MASK |   \
+	 SVGA3D_SURFACE_TRANSFER_TO_BUFFER |        \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER)
+
+#define SVGA3D_SURFACE_LOGICOPS_DISALLOWED_MASK                             \
+	(SVGA3D_SURFACE_CUBEMAP | SVGA3D_SURFACE_DEAD2 |                    \
+	 SVGA3D_SURFACE_AUTOGENMIPMAPS | SVGA3D_SURFACE_VOLUME |            \
+	 SVGA3D_SURFACE_1D | SVGA3D_SURFACE_BIND_VERTEX_BUFFER |            \
+	 SVGA3D_SURFACE_BIND_INDEX_BUFFER |                                 \
+	 SVGA3D_SURFACE_BIND_CONSTANT_BUFFER |                              \
+	 SVGA3D_SURFACE_BIND_DEPTH_STENCIL |                                \
+	 SVGA3D_SURFACE_BIND_STREAM_OUTPUT |                                \
+	 SVGA3D_SURFACE_TRANSFER_FROM_BUFFER | SVGA3D_SURFACE_MULTISAMPLE | \
+	 SVGA3D_SURFACE_BIND_UAVIEW | SVGA3D_SURFACE_TRANSFER_TO_BUFFER |   \
+	 SVGA3D_SURFACE_BIND_RAW_VIEWS | SVGA3D_SURFACE_BUFFER_STRUCTURED | \
+	 SVGA3D_SURFACE_DRAWINDIRECT_ARGS | SVGA3D_SURFACE_RESOURCE_CLAMP | \
+	 SVGA3D_SURFACE_STAGING_COPY)
+
+#define SVGA3D_SURFACE_SM5_MASK                                                \
+	(SVGA3D_SURFACE_DRAWINDIRECT_ARGS | SVGA3D_SURFACE_BUFFER_STRUCTURED | \
+	 SVGA3D_SURFACE_BIND_RAW_VIEWS | SVGA3D_SURFACE_BIND_UAVIEW |          \
+	 SVGA3D_SURFACE_RESOURCE_CLAMP)
+
+#define SVGA3D_BUFFER_STRUCTURED_STRIDE_MAX 2048
+
+typedef enum {
+	SVGA3DFORMAT_OP_TEXTURE = 0x00000001,
+	SVGA3DFORMAT_OP_VOLUMETEXTURE = 0x00000002,
+	SVGA3DFORMAT_OP_CUBETEXTURE = 0x00000004,
+	SVGA3DFORMAT_OP_OFFSCREEN_RENDERTARGET = 0x00000008,
+	SVGA3DFORMAT_OP_SAME_FORMAT_RENDERTARGET = 0x00000010,
+	SVGA3DFORMAT_OP_ZSTENCIL = 0x00000040,
+	SVGA3DFORMAT_OP_ZSTENCIL_WITH_ARBITRARY_COLOR_DEPTH = 0x00000080,
+
+	SVGA3DFORMAT_OP_SAME_FORMAT_UP_TO_ALPHA_RENDERTARGET = 0x00000100,
+
+	SVGA3DFORMAT_OP_DISPLAYMODE = 0x00000400,
+
+	SVGA3DFORMAT_OP_3DACCELERATION = 0x00000800,
+
+	SVGA3DFORMAT_OP_PIXELSIZE = 0x00001000,
+
+	SVGA3DFORMAT_OP_CONVERT_TO_ARGB = 0x00002000,
+
+	SVGA3DFORMAT_OP_OFFSCREENPLAIN = 0x00004000,
+
+	SVGA3DFORMAT_OP_SRGBREAD = 0x00008000,
+
+	SVGA3DFORMAT_OP_BUMPMAP = 0x00010000,
+
+	SVGA3DFORMAT_OP_DMAP = 0x00020000,
+
+	SVGA3DFORMAT_OP_NOFILTER = 0x00040000,
+
+	SVGA3DFORMAT_OP_MEMBEROFGROUP_ARGB = 0x00080000,
+
+	SVGA3DFORMAT_OP_SRGBWRITE = 0x00100000,
+
+	SVGA3DFORMAT_OP_NOALPHABLEND = 0x00200000,
+
+	SVGA3DFORMAT_OP_AUTOGENMIPMAP = 0x00400000,
+
+	SVGA3DFORMAT_OP_VERTEXTEXTURE = 0x00800000,
+
+	SVGA3DFORMAT_OP_NOTEXCOORDWRAPNORMIP = 0x01000000
+} SVGA3dFormatOp;
+
+#define SVGA3D_FORMAT_POSITIVE                                                 \
+	(SVGA3DFORMAT_OP_TEXTURE | SVGA3DFORMAT_OP_VOLUMETEXTURE |             \
+	 SVGA3DFORMAT_OP_CUBETEXTURE |                                         \
+	 SVGA3DFORMAT_OP_OFFSCREEN_RENDERTARGET |                              \
+	 SVGA3DFORMAT_OP_SAME_FORMAT_RENDERTARGET | SVGA3DFORMAT_OP_ZSTENCIL | \
+	 SVGA3DFORMAT_OP_ZSTENCIL_WITH_ARBITRARY_COLOR_DEPTH |                 \
+	 SVGA3DFORMAT_OP_SAME_FORMAT_UP_TO_ALPHA_RENDERTARGET |                \
+	 SVGA3DFORMAT_OP_DISPLAYMODE | SVGA3DFORMAT_OP_3DACCELERATION |        \
+	 SVGA3DFORMAT_OP_PIXELSIZE | SVGA3DFORMAT_OP_CONVERT_TO_ARGB |         \
+	 SVGA3DFORMAT_OP_OFFSCREENPLAIN | SVGA3DFORMAT_OP_SRGBREAD |           \
+	 SVGA3DFORMAT_OP_BUMPMAP | SVGA3DFORMAT_OP_DMAP |                      \
+	 SVGA3DFORMAT_OP_MEMBEROFGROUP_ARGB | SVGA3DFORMAT_OP_SRGBWRITE |      \
+	 SVGA3DFORMAT_OP_AUTOGENMIPMAP | SVGA3DFORMAT_OP_VERTEXTEXTURE)
+
+#define SVGA3D_FORMAT_NEGATIVE                                     \
+	(SVGA3DFORMAT_OP_NOFILTER | SVGA3DFORMAT_OP_NOALPHABLEND | \
+	 SVGA3DFORMAT_OP_NOTEXCOORDWRAPNORMIP)
+
+typedef union {
+	uint32 value;
+	struct {
+		uint32 texture : 1;
+		uint32 volumeTexture : 1;
+		uint32 cubeTexture : 1;
+		uint32 offscreenRenderTarget : 1;
+		uint32 sameFormatRenderTarget : 1;
+		uint32 unknown1 : 1;
+		uint32 zStencil : 1;
+		uint32 zStencilArbitraryDepth : 1;
+		uint32 sameFormatUpToAlpha : 1;
+		uint32 unknown2 : 1;
+		uint32 displayMode : 1;
+		uint32 acceleration3d : 1;
+		uint32 pixelSize : 1;
+		uint32 convertToARGB : 1;
+		uint32 offscreenPlain : 1;
+		uint32 sRGBRead : 1;
+		uint32 bumpMap : 1;
+		uint32 dmap : 1;
+		uint32 noFilter : 1;
+		uint32 memberOfGroupARGB : 1;
+		uint32 sRGBWrite : 1;
+		uint32 noAlphaBlend : 1;
+		uint32 autoGenMipMap : 1;
+		uint32 vertexTexture : 1;
+		uint32 noTexCoordWrapNorMip : 1;
+	};
+} SVGA3dSurfaceFormatCaps;
+
+typedef enum {
+	SVGA3D_RS_INVALID = 0,
+	SVGA3D_RS_MIN = 1,
+	SVGA3D_RS_ZENABLE = 1,
+	SVGA3D_RS_ZWRITEENABLE = 2,
+	SVGA3D_RS_ALPHATESTENABLE = 3,
+	SVGA3D_RS_DITHERENABLE = 4,
+	SVGA3D_RS_BLENDENABLE = 5,
+	SVGA3D_RS_FOGENABLE = 6,
+	SVGA3D_RS_SPECULARENABLE = 7,
+	SVGA3D_RS_STENCILENABLE = 8,
+	SVGA3D_RS_LIGHTINGENABLE = 9,
+	SVGA3D_RS_NORMALIZENORMALS = 10,
+	SVGA3D_RS_POINTSPRITEENABLE = 11,
+	SVGA3D_RS_POINTSCALEENABLE = 12,
+	SVGA3D_RS_STENCILREF = 13,
+	SVGA3D_RS_STENCILMASK = 14,
+	SVGA3D_RS_STENCILWRITEMASK = 15,
+	SVGA3D_RS_FOGSTART = 16,
+	SVGA3D_RS_FOGEND = 17,
+	SVGA3D_RS_FOGDENSITY = 18,
+	SVGA3D_RS_POINTSIZE = 19,
+	SVGA3D_RS_POINTSIZEMIN = 20,
+	SVGA3D_RS_POINTSIZEMAX = 21,
+	SVGA3D_RS_POINTSCALE_A = 22,
+	SVGA3D_RS_POINTSCALE_B = 23,
+	SVGA3D_RS_POINTSCALE_C = 24,
+	SVGA3D_RS_FOGCOLOR = 25,
+	SVGA3D_RS_AMBIENT = 26,
+	SVGA3D_RS_CLIPPLANEENABLE = 27,
+	SVGA3D_RS_FOGMODE = 28,
+	SVGA3D_RS_FILLMODE = 29,
+	SVGA3D_RS_SHADEMODE = 30,
+	SVGA3D_RS_LINEPATTERN = 31,
+	SVGA3D_RS_SRCBLEND = 32,
+	SVGA3D_RS_DSTBLEND = 33,
+	SVGA3D_RS_BLENDEQUATION = 34,
+	SVGA3D_RS_CULLMODE = 35,
+	SVGA3D_RS_ZFUNC = 36,
+	SVGA3D_RS_ALPHAFUNC = 37,
+	SVGA3D_RS_STENCILFUNC = 38,
+	SVGA3D_RS_STENCILFAIL = 39,
+	SVGA3D_RS_STENCILZFAIL = 40,
+	SVGA3D_RS_STENCILPASS = 41,
+	SVGA3D_RS_ALPHAREF = 42,
+	SVGA3D_RS_FRONTWINDING = 43,
+	SVGA3D_RS_COORDINATETYPE = 44,
+	SVGA3D_RS_ZBIAS = 45,
+	SVGA3D_RS_RANGEFOGENABLE = 46,
+	SVGA3D_RS_COLORWRITEENABLE = 47,
+	SVGA3D_RS_VERTEXMATERIALENABLE = 48,
+	SVGA3D_RS_DIFFUSEMATERIALSOURCE = 49,
+	SVGA3D_RS_SPECULARMATERIALSOURCE = 50,
+	SVGA3D_RS_AMBIENTMATERIALSOURCE = 51,
+	SVGA3D_RS_EMISSIVEMATERIALSOURCE = 52,
+	SVGA3D_RS_TEXTUREFACTOR = 53,
+	SVGA3D_RS_LOCALVIEWER = 54,
+	SVGA3D_RS_SCISSORTESTENABLE = 55,
+	SVGA3D_RS_BLENDCOLOR = 56,
+	SVGA3D_RS_STENCILENABLE2SIDED = 57,
+	SVGA3D_RS_CCWSTENCILFUNC = 58,
+	SVGA3D_RS_CCWSTENCILFAIL = 59,
+	SVGA3D_RS_CCWSTENCILZFAIL = 60,
+	SVGA3D_RS_CCWSTENCILPASS = 61,
+	SVGA3D_RS_VERTEXBLEND = 62,
+	SVGA3D_RS_SLOPESCALEDEPTHBIAS = 63,
+	SVGA3D_RS_DEPTHBIAS = 64,
+
+	SVGA3D_RS_OUTPUTGAMMA = 65,
+	SVGA3D_RS_ZVISIBLE = 66,
+	SVGA3D_RS_LASTPIXEL = 67,
+	SVGA3D_RS_CLIPPING = 68,
+	SVGA3D_RS_WRAP0 = 69,
+	SVGA3D_RS_WRAP1 = 70,
+	SVGA3D_RS_WRAP2 = 71,
+	SVGA3D_RS_WRAP3 = 72,
+	SVGA3D_RS_WRAP4 = 73,
+	SVGA3D_RS_WRAP5 = 74,
+	SVGA3D_RS_WRAP6 = 75,
+	SVGA3D_RS_WRAP7 = 76,
+	SVGA3D_RS_WRAP8 = 77,
+	SVGA3D_RS_WRAP9 = 78,
+	SVGA3D_RS_WRAP10 = 79,
+	SVGA3D_RS_WRAP11 = 80,
+	SVGA3D_RS_WRAP12 = 81,
+	SVGA3D_RS_WRAP13 = 82,
+	SVGA3D_RS_WRAP14 = 83,
+	SVGA3D_RS_WRAP15 = 84,
+	SVGA3D_RS_MULTISAMPLEANTIALIAS = 85,
+	SVGA3D_RS_MULTISAMPLEMASK = 86,
+	SVGA3D_RS_INDEXEDVERTEXBLENDENABLE = 87,
+	SVGA3D_RS_TWEENFACTOR = 88,
+	SVGA3D_RS_ANTIALIASEDLINEENABLE = 89,
+	SVGA3D_RS_COLORWRITEENABLE1 = 90,
+	SVGA3D_RS_COLORWRITEENABLE2 = 91,
+	SVGA3D_RS_COLORWRITEENABLE3 = 92,
+	SVGA3D_RS_SEPARATEALPHABLENDENABLE = 93,
+	SVGA3D_RS_SRCBLENDALPHA = 94,
+	SVGA3D_RS_DSTBLENDALPHA = 95,
+	SVGA3D_RS_BLENDEQUATIONALPHA = 96,
+	SVGA3D_RS_TRANSPARENCYANTIALIAS = 97,
+	SVGA3D_RS_LINEWIDTH = 98,
+	SVGA3D_RS_MAX
+} SVGA3dRenderStateName;
+
+typedef enum {
+	SVGA3D_TRANSPARENCYANTIALIAS_NORMAL = 0,
+	SVGA3D_TRANSPARENCYANTIALIAS_ALPHATOCOVERAGE = 1,
+	SVGA3D_TRANSPARENCYANTIALIAS_SUPERSAMPLE = 2,
+	SVGA3D_TRANSPARENCYANTIALIAS_MAX
+} SVGA3dTransparencyAntialiasType;
+
+typedef enum {
+	SVGA3D_VERTEXMATERIAL_NONE = 0,
+	SVGA3D_VERTEXMATERIAL_DIFFUSE = 1,
+	SVGA3D_VERTEXMATERIAL_SPECULAR = 2,
+	SVGA3D_VERTEXMATERIAL_MAX = 3,
+} SVGA3dVertexMaterial;
+
+typedef enum {
+	SVGA3D_FILLMODE_INVALID = 0,
+	SVGA3D_FILLMODE_MIN = 1,
+	SVGA3D_FILLMODE_POINT = 1,
+	SVGA3D_FILLMODE_LINE = 2,
+	SVGA3D_FILLMODE_FILL = 3,
+	SVGA3D_FILLMODE_MAX
+} SVGA3dFillModeType;
+
+#pragma pack(push, 1)
+typedef union {
+	struct {
+		uint16 mode;
+		uint16 face;
+	};
+	uint32 uintValue;
+} SVGA3dFillMode;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA3D_SHADEMODE_INVALID = 0,
+	SVGA3D_SHADEMODE_FLAT = 1,
+	SVGA3D_SHADEMODE_SMOOTH = 2,
+	SVGA3D_SHADEMODE_PHONG = 3,
+	SVGA3D_SHADEMODE_MAX
+} SVGA3dShadeMode;
+
+#pragma pack(push, 1)
+typedef union {
+	struct {
+		uint16 repeat;
+		uint16 pattern;
+	};
+	uint32 uintValue;
+} SVGA3dLinePattern;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA3D_BLENDOP_INVALID = 0,
+	SVGA3D_BLENDOP_MIN = 1,
+	SVGA3D_BLENDOP_ZERO = 1,
+	SVGA3D_BLENDOP_ONE = 2,
+	SVGA3D_BLENDOP_SRCCOLOR = 3,
+	SVGA3D_BLENDOP_INVSRCCOLOR = 4,
+	SVGA3D_BLENDOP_SRCALPHA = 5,
+	SVGA3D_BLENDOP_INVSRCALPHA = 6,
+	SVGA3D_BLENDOP_DESTALPHA = 7,
+	SVGA3D_BLENDOP_INVDESTALPHA = 8,
+	SVGA3D_BLENDOP_DESTCOLOR = 9,
+	SVGA3D_BLENDOP_INVDESTCOLOR = 10,
+	SVGA3D_BLENDOP_SRCALPHASAT = 11,
+	SVGA3D_BLENDOP_BLENDFACTOR = 12,
+	SVGA3D_BLENDOP_INVBLENDFACTOR = 13,
+	SVGA3D_BLENDOP_SRC1COLOR = 14,
+	SVGA3D_BLENDOP_INVSRC1COLOR = 15,
+	SVGA3D_BLENDOP_SRC1ALPHA = 16,
+	SVGA3D_BLENDOP_INVSRC1ALPHA = 17,
+	SVGA3D_BLENDOP_BLENDFACTORALPHA = 18,
+	SVGA3D_BLENDOP_INVBLENDFACTORALPHA = 19,
+	SVGA3D_BLENDOP_MAX
+} SVGA3dBlendOp;
+
+typedef enum {
+	SVGA3D_BLENDEQ_INVALID = 0,
+	SVGA3D_BLENDEQ_MIN = 1,
+	SVGA3D_BLENDEQ_ADD = 1,
+	SVGA3D_BLENDEQ_SUBTRACT = 2,
+	SVGA3D_BLENDEQ_REVSUBTRACT = 3,
+	SVGA3D_BLENDEQ_MINIMUM = 4,
+	SVGA3D_BLENDEQ_MAXIMUM = 5,
+	SVGA3D_BLENDEQ_MAX
+} SVGA3dBlendEquation;
+
+typedef enum {
+	SVGA3D_DX11_LOGICOP_MIN = 0,
+	SVGA3D_DX11_LOGICOP_CLEAR = 0,
+	SVGA3D_DX11_LOGICOP_SET = 1,
+	SVGA3D_DX11_LOGICOP_COPY = 2,
+	SVGA3D_DX11_LOGICOP_COPY_INVERTED = 3,
+	SVGA3D_DX11_LOGICOP_NOOP = 4,
+	SVGA3D_DX11_LOGICOP_INVERT = 5,
+	SVGA3D_DX11_LOGICOP_AND = 6,
+	SVGA3D_DX11_LOGICOP_NAND = 7,
+	SVGA3D_DX11_LOGICOP_OR = 8,
+	SVGA3D_DX11_LOGICOP_NOR = 9,
+	SVGA3D_DX11_LOGICOP_XOR = 10,
+	SVGA3D_DX11_LOGICOP_EQUIV = 11,
+	SVGA3D_DX11_LOGICOP_AND_REVERSE = 12,
+	SVGA3D_DX11_LOGICOP_AND_INVERTED = 13,
+	SVGA3D_DX11_LOGICOP_OR_REVERSE = 14,
+	SVGA3D_DX11_LOGICOP_OR_INVERTED = 15,
+	SVGA3D_DX11_LOGICOP_MAX
+} SVGA3dDX11LogicOp;
+
+typedef enum {
+	SVGA3D_FRONTWINDING_INVALID = 0,
+	SVGA3D_FRONTWINDING_CW = 1,
+	SVGA3D_FRONTWINDING_MIN = 1,
+	SVGA3D_FRONTWINDING_CCW = 2,
+	SVGA3D_FRONTWINDING_MAX
+} SVGA3dFrontWinding;
+
+typedef enum {
+	SVGA3D_FACE_INVALID = 0,
+	SVGA3D_FACE_NONE = 1,
+	SVGA3D_FACE_MIN = 1,
+	SVGA3D_FACE_FRONT = 2,
+	SVGA3D_FACE_BACK = 3,
+	SVGA3D_FACE_FRONT_BACK = 4,
+	SVGA3D_FACE_MAX
+} SVGA3dFace;
+
+typedef enum {
+	SVGA3D_CMP_INVALID = 0,
+	SVGA3D_CMP_NEVER = 1,
+	SVGA3D_CMP_LESS = 2,
+	SVGA3D_CMP_EQUAL = 3,
+	SVGA3D_CMP_LESSEQUAL = 4,
+	SVGA3D_CMP_GREATER = 5,
+	SVGA3D_CMP_NOTEQUAL = 6,
+	SVGA3D_CMP_GREATEREQUAL = 7,
+	SVGA3D_CMP_ALWAYS = 8,
+	SVGA3D_CMP_MAX
+} SVGA3dCmpFunc;
+
+typedef enum {
+	SVGA3D_FOGFUNC_INVALID = 0,
+	SVGA3D_FOGFUNC_EXP = 1,
+	SVGA3D_FOGFUNC_EXP2 = 2,
+	SVGA3D_FOGFUNC_LINEAR = 3,
+	SVGA3D_FOGFUNC_PER_VERTEX = 4
+} SVGA3dFogFunction;
+
+typedef enum {
+	SVGA3D_FOGTYPE_INVALID = 0,
+	SVGA3D_FOGTYPE_VERTEX = 1,
+	SVGA3D_FOGTYPE_PIXEL = 2,
+	SVGA3D_FOGTYPE_MAX = 3
+} SVGA3dFogType;
+
+typedef enum {
+	SVGA3D_FOGBASE_INVALID = 0,
+	SVGA3D_FOGBASE_DEPTHBASED = 1,
+	SVGA3D_FOGBASE_RANGEBASED = 2,
+	SVGA3D_FOGBASE_MAX = 3
+} SVGA3dFogBase;
+
+typedef enum {
+	SVGA3D_STENCILOP_INVALID = 0,
+	SVGA3D_STENCILOP_MIN = 1,
+	SVGA3D_STENCILOP_KEEP = 1,
+	SVGA3D_STENCILOP_ZERO = 2,
+	SVGA3D_STENCILOP_REPLACE = 3,
+	SVGA3D_STENCILOP_INCRSAT = 4,
+	SVGA3D_STENCILOP_DECRSAT = 5,
+	SVGA3D_STENCILOP_INVERT = 6,
+	SVGA3D_STENCILOP_INCR = 7,
+	SVGA3D_STENCILOP_DECR = 8,
+	SVGA3D_STENCILOP_MAX
+} SVGA3dStencilOp;
+
+typedef enum {
+	SVGA3D_CLIPPLANE_0 = (1 << 0),
+	SVGA3D_CLIPPLANE_1 = (1 << 1),
+	SVGA3D_CLIPPLANE_2 = (1 << 2),
+	SVGA3D_CLIPPLANE_3 = (1 << 3),
+	SVGA3D_CLIPPLANE_4 = (1 << 4),
+	SVGA3D_CLIPPLANE_5 = (1 << 5),
+} SVGA3dClipPlanes;
+
+typedef enum {
+	SVGA3D_CLEAR_COLOR = 0x1,
+	SVGA3D_CLEAR_DEPTH = 0x2,
+	SVGA3D_CLEAR_STENCIL = 0x4,
+
+	SVGA3D_CLEAR_COLORFILL = 0x8
+} SVGA3dClearFlag;
+
+typedef enum {
+	SVGA3D_RT_DEPTH = 0,
+	SVGA3D_RT_MIN = 0,
+	SVGA3D_RT_STENCIL = 1,
+	SVGA3D_RT_COLOR0 = 2,
+	SVGA3D_RT_COLOR1 = 3,
+	SVGA3D_RT_COLOR2 = 4,
+	SVGA3D_RT_COLOR3 = 5,
+	SVGA3D_RT_COLOR4 = 6,
+	SVGA3D_RT_COLOR5 = 7,
+	SVGA3D_RT_COLOR6 = 8,
+	SVGA3D_RT_COLOR7 = 9,
+	SVGA3D_RT_MAX,
+	SVGA3D_RT_INVALID = ((uint32)-1),
+} SVGA3dRenderTargetType;
+
+#define SVGA3D_MAX_RT_COLOR (SVGA3D_RT_COLOR7 - SVGA3D_RT_COLOR0 + 1)
+
+#pragma pack(push, 1)
+typedef union {
+	struct {
+		uint32 red : 1;
+		uint32 green : 1;
+		uint32 blue : 1;
+		uint32 alpha : 1;
+	};
+	uint32 uintValue;
+} SVGA3dColorMask;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA3D_VBLEND_DISABLE = 0,
+	SVGA3D_VBLEND_1WEIGHT = 1,
+	SVGA3D_VBLEND_2WEIGHT = 2,
+	SVGA3D_VBLEND_3WEIGHT = 3,
+	SVGA3D_VBLEND_MAX = 4,
+} SVGA3dVertexBlendFlags;
+
+typedef enum {
+	SVGA3D_WRAPCOORD_0 = 1 << 0,
+	SVGA3D_WRAPCOORD_1 = 1 << 1,
+	SVGA3D_WRAPCOORD_2 = 1 << 2,
+	SVGA3D_WRAPCOORD_3 = 1 << 3,
+	SVGA3D_WRAPCOORD_ALL = 0xF,
+} SVGA3dWrapFlags;
+
+typedef enum {
+	SVGA3D_TS_INVALID = 0,
+	SVGA3D_TS_MIN = 1,
+	SVGA3D_TS_BIND_TEXTURE = 1,
+	SVGA3D_TS_COLOROP = 2,
+	SVGA3D_TS_COLORARG1 = 3,
+	SVGA3D_TS_COLORARG2 = 4,
+	SVGA3D_TS_ALPHAOP = 5,
+	SVGA3D_TS_ALPHAARG1 = 6,
+	SVGA3D_TS_ALPHAARG2 = 7,
+	SVGA3D_TS_ADDRESSU = 8,
+	SVGA3D_TS_ADDRESSV = 9,
+	SVGA3D_TS_MIPFILTER = 10,
+	SVGA3D_TS_MAGFILTER = 11,
+	SVGA3D_TS_MINFILTER = 12,
+	SVGA3D_TS_BORDERCOLOR = 13,
+	SVGA3D_TS_TEXCOORDINDEX = 14,
+	SVGA3D_TS_TEXTURETRANSFORMFLAGS = 15,
+	SVGA3D_TS_TEXCOORDGEN = 16,
+	SVGA3D_TS_BUMPENVMAT00 = 17,
+	SVGA3D_TS_BUMPENVMAT01 = 18,
+	SVGA3D_TS_BUMPENVMAT10 = 19,
+	SVGA3D_TS_BUMPENVMAT11 = 20,
+	SVGA3D_TS_TEXTURE_MIPMAP_LEVEL = 21,
+	SVGA3D_TS_TEXTURE_LOD_BIAS = 22,
+	SVGA3D_TS_TEXTURE_ANISOTROPIC_LEVEL = 23,
+	SVGA3D_TS_ADDRESSW = 24,
+
+	SVGA3D_TS_GAMMA = 25,
+	SVGA3D_TS_BUMPENVLSCALE = 26,
+	SVGA3D_TS_BUMPENVLOFFSET = 27,
+	SVGA3D_TS_COLORARG0 = 28,
+	SVGA3D_TS_ALPHAARG0 = 29,
+	SVGA3D_TS_PREGB_MAX = 30,
+	SVGA3D_TS_CONSTANT = 30,
+	SVGA3D_TS_COLOR_KEY_ENABLE = 31,
+	SVGA3D_TS_COLOR_KEY = 32,
+	SVGA3D_TS_MAX
+} SVGA3dTextureStateName;
+
+typedef enum {
+	SVGA3D_TC_INVALID = 0,
+	SVGA3D_TC_DISABLE = 1,
+	SVGA3D_TC_SELECTARG1 = 2,
+	SVGA3D_TC_SELECTARG2 = 3,
+	SVGA3D_TC_MODULATE = 4,
+	SVGA3D_TC_ADD = 5,
+	SVGA3D_TC_ADDSIGNED = 6,
+	SVGA3D_TC_SUBTRACT = 7,
+	SVGA3D_TC_BLENDTEXTUREALPHA = 8,
+	SVGA3D_TC_BLENDDIFFUSEALPHA = 9,
+	SVGA3D_TC_BLENDCURRENTALPHA = 10,
+	SVGA3D_TC_BLENDFACTORALPHA = 11,
+	SVGA3D_TC_MODULATE2X = 12,
+	SVGA3D_TC_MODULATE4X = 13,
+	SVGA3D_TC_DSDT = 14,
+	SVGA3D_TC_DOTPRODUCT3 = 15,
+	SVGA3D_TC_BLENDTEXTUREALPHAPM = 16,
+	SVGA3D_TC_ADDSIGNED2X = 17,
+	SVGA3D_TC_ADDSMOOTH = 18,
+	SVGA3D_TC_PREMODULATE = 19,
+	SVGA3D_TC_MODULATEALPHA_ADDCOLOR = 20,
+	SVGA3D_TC_MODULATECOLOR_ADDALPHA = 21,
+	SVGA3D_TC_MODULATEINVALPHA_ADDCOLOR = 22,
+	SVGA3D_TC_MODULATEINVCOLOR_ADDALPHA = 23,
+	SVGA3D_TC_BUMPENVMAPLUMINANCE = 24,
+	SVGA3D_TC_MULTIPLYADD = 25,
+	SVGA3D_TC_LERP = 26,
+	SVGA3D_TC_MAX
+} SVGA3dTextureCombiner;
+
+#define SVGA3D_TC_CAP_BIT(svga3d_tc_op) \
+	(svga3d_tc_op ? (1 << (svga3d_tc_op - 1)) : 0)
+
+typedef enum {
+	SVGA3D_TEX_ADDRESS_INVALID = 0,
+	SVGA3D_TEX_ADDRESS_MIN = 1,
+	SVGA3D_TEX_ADDRESS_WRAP = 1,
+	SVGA3D_TEX_ADDRESS_MIRROR = 2,
+	SVGA3D_TEX_ADDRESS_CLAMP = 3,
+	SVGA3D_TEX_ADDRESS_BORDER = 4,
+	SVGA3D_TEX_ADDRESS_MIRRORONCE = 5,
+	SVGA3D_TEX_ADDRESS_EDGE = 6,
+	SVGA3D_TEX_ADDRESS_MAX
+} SVGA3dTextureAddress;
+
+typedef enum {
+	SVGA3D_TEX_FILTER_NONE = 0,
+	SVGA3D_TEX_FILTER_MIN = 0,
+	SVGA3D_TEX_FILTER_NEAREST = 1,
+	SVGA3D_TEX_FILTER_LINEAR = 2,
+	SVGA3D_TEX_FILTER_ANISOTROPIC = 3,
+	SVGA3D_TEX_FILTER_FLATCUBIC = 4,
+	SVGA3D_TEX_FILTER_GAUSSIANCUBIC = 5,
+	SVGA3D_TEX_FILTER_PYRAMIDALQUAD = 6,
+	SVGA3D_TEX_FILTER_GAUSSIANQUAD = 7,
+	SVGA3D_TEX_FILTER_MAX
+} SVGA3dTextureFilter;
+
+typedef enum {
+	SVGA3D_TEX_TRANSFORM_OFF = 0,
+	SVGA3D_TEX_TRANSFORM_S = (1 << 0),
+	SVGA3D_TEX_TRANSFORM_T = (1 << 1),
+	SVGA3D_TEX_TRANSFORM_R = (1 << 2),
+	SVGA3D_TEX_TRANSFORM_Q = (1 << 3),
+	SVGA3D_TEX_PROJECTED = (1 << 15),
+} SVGA3dTexTransformFlags;
+
+typedef enum {
+	SVGA3D_TEXCOORD_GEN_OFF = 0,
+	SVGA3D_TEXCOORD_GEN_EYE_POSITION = 1,
+	SVGA3D_TEXCOORD_GEN_EYE_NORMAL = 2,
+	SVGA3D_TEXCOORD_GEN_REFLECTIONVECTOR = 3,
+	SVGA3D_TEXCOORD_GEN_SPHERE = 4,
+	SVGA3D_TEXCOORD_GEN_MAX
+} SVGA3dTextureCoordGen;
+
+typedef enum {
+	SVGA3D_TA_INVALID = 0,
+	SVGA3D_TA_TFACTOR = 1,
+	SVGA3D_TA_PREVIOUS = 2,
+	SVGA3D_TA_DIFFUSE = 3,
+	SVGA3D_TA_TEXTURE = 4,
+	SVGA3D_TA_SPECULAR = 5,
+	SVGA3D_TA_CONSTANT = 6,
+	SVGA3D_TA_MAX
+} SVGA3dTextureArgData;
+
+#define SVGA3D_TM_MASK_LEN 4
+
+typedef enum {
+	SVGA3D_TM_NONE = 0,
+	SVGA3D_TM_ALPHA = (1 << SVGA3D_TM_MASK_LEN),
+	SVGA3D_TM_ONE_MINUS = (2 << SVGA3D_TM_MASK_LEN),
+} SVGA3dTextureArgModifier;
+
+typedef enum {
+	SVGA3D_DECLUSAGE_POSITION = 0,
+	SVGA3D_DECLUSAGE_BLENDWEIGHT,
+	SVGA3D_DECLUSAGE_BLENDINDICES,
+	SVGA3D_DECLUSAGE_NORMAL,
+	SVGA3D_DECLUSAGE_PSIZE,
+	SVGA3D_DECLUSAGE_TEXCOORD,
+	SVGA3D_DECLUSAGE_TANGENT,
+	SVGA3D_DECLUSAGE_BINORMAL,
+	SVGA3D_DECLUSAGE_TESSFACTOR,
+	SVGA3D_DECLUSAGE_POSITIONT,
+	SVGA3D_DECLUSAGE_COLOR,
+	SVGA3D_DECLUSAGE_FOG,
+	SVGA3D_DECLUSAGE_DEPTH,
+	SVGA3D_DECLUSAGE_SAMPLE,
+	SVGA3D_DECLUSAGE_MAX
+} SVGA3dDeclUsage;
+
+typedef enum {
+	SVGA3D_DECLMETHOD_DEFAULT = 0,
+	SVGA3D_DECLMETHOD_PARTIALU,
+	SVGA3D_DECLMETHOD_PARTIALV,
+	SVGA3D_DECLMETHOD_CROSSUV,
+	SVGA3D_DECLMETHOD_UV,
+	SVGA3D_DECLMETHOD_LOOKUP,
+	SVGA3D_DECLMETHOD_LOOKUPPRESAMPLED,
+} SVGA3dDeclMethod;
+
+typedef enum {
+	SVGA3D_DECLTYPE_FLOAT1 = 0,
+	SVGA3D_DECLTYPE_FLOAT2 = 1,
+	SVGA3D_DECLTYPE_FLOAT3 = 2,
+	SVGA3D_DECLTYPE_FLOAT4 = 3,
+	SVGA3D_DECLTYPE_D3DCOLOR = 4,
+	SVGA3D_DECLTYPE_UBYTE4 = 5,
+	SVGA3D_DECLTYPE_SHORT2 = 6,
+	SVGA3D_DECLTYPE_SHORT4 = 7,
+	SVGA3D_DECLTYPE_UBYTE4N = 8,
+	SVGA3D_DECLTYPE_SHORT2N = 9,
+	SVGA3D_DECLTYPE_SHORT4N = 10,
+	SVGA3D_DECLTYPE_USHORT2N = 11,
+	SVGA3D_DECLTYPE_USHORT4N = 12,
+	SVGA3D_DECLTYPE_UDEC3 = 13,
+	SVGA3D_DECLTYPE_DEC3N = 14,
+	SVGA3D_DECLTYPE_FLOAT16_2 = 15,
+	SVGA3D_DECLTYPE_FLOAT16_4 = 16,
+	SVGA3D_DECLTYPE_MAX,
+} SVGA3dDeclType;
+
+typedef union {
+	struct {
+		uint32 count : 30;
+
+		uint32 indexedData : 1;
+
+		uint32 instanceData : 1;
+	};
+
+	uint32 value;
+} SVGA3dVertexDivisor;
+
+typedef enum {
+
+	SVGA3D_PRIMITIVE_INVALID = 0,
+	SVGA3D_PRIMITIVE_MIN = 0,
+	SVGA3D_PRIMITIVE_TRIANGLELIST = 1,
+	SVGA3D_PRIMITIVE_POINTLIST = 2,
+	SVGA3D_PRIMITIVE_LINELIST = 3,
+	SVGA3D_PRIMITIVE_LINESTRIP = 4,
+	SVGA3D_PRIMITIVE_TRIANGLESTRIP = 5,
+	SVGA3D_PRIMITIVE_TRIANGLEFAN = 6,
+	SVGA3D_PRIMITIVE_LINELIST_ADJ = 7,
+	SVGA3D_PRIMITIVE_PREDX_MAX = 7,
+	SVGA3D_PRIMITIVE_LINESTRIP_ADJ = 8,
+	SVGA3D_PRIMITIVE_TRIANGLELIST_ADJ = 9,
+	SVGA3D_PRIMITIVE_TRIANGLESTRIP_ADJ = 10,
+	SVGA3D_PRIMITIVE_DX10_MAX = 11,
+	SVGA3D_PRIMITIVE_1_CONTROL_POINT_PATCH = 11,
+	SVGA3D_PRIMITIVE_2_CONTROL_POINT_PATCH = 12,
+	SVGA3D_PRIMITIVE_3_CONTROL_POINT_PATCH = 13,
+	SVGA3D_PRIMITIVE_4_CONTROL_POINT_PATCH = 14,
+	SVGA3D_PRIMITIVE_5_CONTROL_POINT_PATCH = 15,
+	SVGA3D_PRIMITIVE_6_CONTROL_POINT_PATCH = 16,
+	SVGA3D_PRIMITIVE_7_CONTROL_POINT_PATCH = 17,
+	SVGA3D_PRIMITIVE_8_CONTROL_POINT_PATCH = 18,
+	SVGA3D_PRIMITIVE_9_CONTROL_POINT_PATCH = 19,
+	SVGA3D_PRIMITIVE_10_CONTROL_POINT_PATCH = 20,
+	SVGA3D_PRIMITIVE_11_CONTROL_POINT_PATCH = 21,
+	SVGA3D_PRIMITIVE_12_CONTROL_POINT_PATCH = 22,
+	SVGA3D_PRIMITIVE_13_CONTROL_POINT_PATCH = 23,
+	SVGA3D_PRIMITIVE_14_CONTROL_POINT_PATCH = 24,
+	SVGA3D_PRIMITIVE_15_CONTROL_POINT_PATCH = 25,
+	SVGA3D_PRIMITIVE_16_CONTROL_POINT_PATCH = 26,
+	SVGA3D_PRIMITIVE_17_CONTROL_POINT_PATCH = 27,
+	SVGA3D_PRIMITIVE_18_CONTROL_POINT_PATCH = 28,
+	SVGA3D_PRIMITIVE_19_CONTROL_POINT_PATCH = 29,
+	SVGA3D_PRIMITIVE_20_CONTROL_POINT_PATCH = 30,
+	SVGA3D_PRIMITIVE_21_CONTROL_POINT_PATCH = 31,
+	SVGA3D_PRIMITIVE_22_CONTROL_POINT_PATCH = 32,
+	SVGA3D_PRIMITIVE_23_CONTROL_POINT_PATCH = 33,
+	SVGA3D_PRIMITIVE_24_CONTROL_POINT_PATCH = 34,
+	SVGA3D_PRIMITIVE_25_CONTROL_POINT_PATCH = 35,
+	SVGA3D_PRIMITIVE_26_CONTROL_POINT_PATCH = 36,
+	SVGA3D_PRIMITIVE_27_CONTROL_POINT_PATCH = 37,
+	SVGA3D_PRIMITIVE_28_CONTROL_POINT_PATCH = 38,
+	SVGA3D_PRIMITIVE_29_CONTROL_POINT_PATCH = 39,
+	SVGA3D_PRIMITIVE_30_CONTROL_POINT_PATCH = 40,
+	SVGA3D_PRIMITIVE_31_CONTROL_POINT_PATCH = 41,
+	SVGA3D_PRIMITIVE_32_CONTROL_POINT_PATCH = 42,
+	SVGA3D_PRIMITIVE_MAX = 43
+} SVGA3dPrimitiveType;
+
+typedef enum {
+	SVGA3D_COORDINATE_INVALID = 0,
+	SVGA3D_COORDINATE_LEFTHANDED = 1,
+	SVGA3D_COORDINATE_RIGHTHANDED = 2,
+	SVGA3D_COORDINATE_MAX
+} SVGA3dCoordinateType;
+
+typedef enum {
+	SVGA3D_TRANSFORM_INVALID = 0,
+	SVGA3D_TRANSFORM_WORLD = 1,
+	SVGA3D_TRANSFORM_MIN = 1,
+	SVGA3D_TRANSFORM_VIEW = 2,
+	SVGA3D_TRANSFORM_PROJECTION = 3,
+	SVGA3D_TRANSFORM_TEXTURE0 = 4,
+	SVGA3D_TRANSFORM_TEXTURE1 = 5,
+	SVGA3D_TRANSFORM_TEXTURE2 = 6,
+	SVGA3D_TRANSFORM_TEXTURE3 = 7,
+	SVGA3D_TRANSFORM_TEXTURE4 = 8,
+	SVGA3D_TRANSFORM_TEXTURE5 = 9,
+	SVGA3D_TRANSFORM_TEXTURE6 = 10,
+	SVGA3D_TRANSFORM_TEXTURE7 = 11,
+	SVGA3D_TRANSFORM_WORLD1 = 12,
+	SVGA3D_TRANSFORM_WORLD2 = 13,
+	SVGA3D_TRANSFORM_WORLD3 = 14,
+	SVGA3D_TRANSFORM_MAX
+} SVGA3dTransformType;
+
+typedef enum {
+	SVGA3D_LIGHTTYPE_INVALID = 0,
+	SVGA3D_LIGHTTYPE_MIN = 1,
+	SVGA3D_LIGHTTYPE_POINT = 1,
+	SVGA3D_LIGHTTYPE_SPOT1 = 2,
+	SVGA3D_LIGHTTYPE_SPOT2 = 3,
+	SVGA3D_LIGHTTYPE_DIRECTIONAL = 4,
+	SVGA3D_LIGHTTYPE_MAX
+} SVGA3dLightType;
+
+typedef enum {
+	SVGA3D_CUBEFACE_POSX = 0,
+	SVGA3D_CUBEFACE_NEGX = 1,
+	SVGA3D_CUBEFACE_POSY = 2,
+	SVGA3D_CUBEFACE_NEGY = 3,
+	SVGA3D_CUBEFACE_POSZ = 4,
+	SVGA3D_CUBEFACE_NEGZ = 5,
+} SVGA3dCubeFace;
+
+typedef enum {
+	SVGA3D_SHADERTYPE_INVALID = 0,
+	SVGA3D_SHADERTYPE_MIN = 1,
+	SVGA3D_SHADERTYPE_VS = 1,
+	SVGA3D_SHADERTYPE_PS = 2,
+	SVGA3D_SHADERTYPE_PREDX_MAX = 3,
+	SVGA3D_SHADERTYPE_GS = 3,
+	SVGA3D_SHADERTYPE_DX10_MAX = 4,
+	SVGA3D_SHADERTYPE_HS = 4,
+	SVGA3D_SHADERTYPE_DS = 5,
+	SVGA3D_SHADERTYPE_CS = 6,
+	SVGA3D_SHADERTYPE_MAX = 7
+} SVGA3dShaderType;
+
+#define SVGA3D_NUM_SHADERTYPE_PREDX \
+	(SVGA3D_SHADERTYPE_PREDX_MAX - SVGA3D_SHADERTYPE_MIN)
+
+#define SVGA3D_NUM_SHADERTYPE_DX10 \
+	(SVGA3D_SHADERTYPE_DX10_MAX - SVGA3D_SHADERTYPE_MIN)
+
+#define SVGA3D_NUM_SHADERTYPE (SVGA3D_SHADERTYPE_MAX - SVGA3D_SHADERTYPE_MIN)
+
+typedef enum {
+	SVGA3D_CONST_TYPE_MIN = 0,
+	SVGA3D_CONST_TYPE_FLOAT = 0,
+	SVGA3D_CONST_TYPE_INT = 1,
+	SVGA3D_CONST_TYPE_BOOL = 2,
+	SVGA3D_CONST_TYPE_MAX = 3,
+} SVGA3dShaderConstType;
+
+#define SVGA3D_CONSTREG_MAX 256
+#define SVGA3D_CONSTINTREG_MAX 16
+#define SVGA3D_CONSTBOOLREG_MAX 16
+
+typedef enum {
+	SVGA3D_STRETCH_BLT_POINT = 0,
+	SVGA3D_STRETCH_BLT_LINEAR = 1,
+	SVGA3D_STRETCH_BLT_MAX
+} SVGA3dStretchBltMode;
+
+typedef enum {
+	SVGA3D_QUERYTYPE_INVALID = ((uint8)-1),
+	SVGA3D_QUERYTYPE_MIN = 0,
+	SVGA3D_QUERYTYPE_OCCLUSION = 0,
+	SVGA3D_QUERYTYPE_TIMESTAMP = 1,
+	SVGA3D_QUERYTYPE_TIMESTAMPDISJOINT = 2,
+	SVGA3D_QUERYTYPE_PIPELINESTATS = 3,
+	SVGA3D_QUERYTYPE_OCCLUSIONPREDICATE = 4,
+	SVGA3D_QUERYTYPE_STREAMOUTPUTSTATS = 5,
+	SVGA3D_QUERYTYPE_STREAMOVERFLOWPREDICATE = 6,
+	SVGA3D_QUERYTYPE_OCCLUSION64 = 7,
+	SVGA3D_QUERYTYPE_DX10_MAX = 8,
+	SVGA3D_QUERYTYPE_SOSTATS_STREAM0 = 8,
+	SVGA3D_QUERYTYPE_SOSTATS_STREAM1 = 9,
+	SVGA3D_QUERYTYPE_SOSTATS_STREAM2 = 10,
+	SVGA3D_QUERYTYPE_SOSTATS_STREAM3 = 11,
+	SVGA3D_QUERYTYPE_SOP_STREAM0 = 12,
+	SVGA3D_QUERYTYPE_SOP_STREAM1 = 13,
+	SVGA3D_QUERYTYPE_SOP_STREAM2 = 14,
+	SVGA3D_QUERYTYPE_SOP_STREAM3 = 15,
+	SVGA3D_QUERYTYPE_MAX
+} SVGA3dQueryType;
+
+typedef uint8 SVGA3dQueryTypeUint8;
+
+#define SVGA3D_NUM_QUERYTYPE (SVGA3D_QUERYTYPE_MAX - SVGA3D_QUERYTYPE_MIN)
+
+#define SVGA3D_MAX_QUERY 64
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 samplesRendered;
+} SVGADXOcclusionQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 passed;
+} SVGADXEventQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 timestamp;
+} SVGADXTimestampQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 realFrequency;
+	uint32 disjoint;
+} SVGADXTimestampDisjointQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 inputAssemblyVertices;
+	uint64 inputAssemblyPrimitives;
+	uint64 vertexShaderInvocations;
+	uint64 geometryShaderInvocations;
+	uint64 geometryShaderPrimitives;
+	uint64 clipperInvocations;
+	uint64 clipperPrimitives;
+	uint64 pixelShaderInvocations;
+	uint64 hullShaderInvocations;
+	uint64 domainShaderInvocations;
+	uint64 computeShaderInvocations;
+} SVGADXPipelineStatisticsQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 anySamplesRendered;
+} SVGADXOcclusionPredicateQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 numPrimitivesWritten;
+	uint64 numPrimitivesRequired;
+} SVGADXStreamOutStatisticsQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 overflowed;
+} SVGADXStreamOutPredicateQueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint64 samplesRendered;
+} SVGADXOcclusion64QueryResult;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef union SVGADXQueryResultUnion {
+	SVGADXOcclusionQueryResult occ;
+	SVGADXEventQueryResult event;
+	SVGADXTimestampQueryResult ts;
+	SVGADXTimestampDisjointQueryResult tsDisjoint;
+	SVGADXPipelineStatisticsQueryResult pipelineStats;
+	SVGADXOcclusionPredicateQueryResult occPred;
+	SVGADXStreamOutStatisticsQueryResult soStats;
+	SVGADXStreamOutPredicateQueryResult soPred;
+	SVGADXOcclusion64QueryResult occ64;
+} SVGADXQueryResultUnion;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA3D_QUERYSTATE_PENDING = 0,
+	SVGA3D_QUERYSTATE_SUCCEEDED = 1,
+	SVGA3D_QUERYSTATE_FAILED = 2,
+	SVGA3D_QUERYSTATE_NEW = 3,
+} SVGA3dQueryState;
+
+typedef enum {
+	SVGA3D_WRITE_HOST_VRAM = 1,
+	SVGA3D_READ_HOST_VRAM = 2,
+} SVGA3dTransferType;
+
+#define SVGA3D_LOGICOP_INVALID 0
+#define SVGA3D_LOGICOP_COPY 1
+
+#define SVGA3D_LOGICOP_MIN 1
+#define SVGA3D_LOGICOP_NOT 2
+#define SVGA3D_LOGICOP_AND 3
+#define SVGA3D_LOGICOP_OR 4
+#define SVGA3D_LOGICOP_XOR 5
+#define SVGA3D_LOGICOP_NXOR 6
+#define SVGA3D_LOGICOP_ROP3 7
+
+#define SVGA3D_LOGICOP_MAX 8
+
+typedef uint16 SVGA3dLogicOp;
+
+#define SVGA3D_LOGICOP_ROP3_INVALID ((uint16)-1)
+#define SVGA3D_LOGICOP_ROP3_MIN 0
+#define SVGA3D_LOGICOP_ROP3_MAX 256
+
+typedef uint16 SVGA3dLogicOpRop3;
+
+#pragma pack(push, 1)
+typedef struct {
+	union {
+		struct {
+			uint16 function;
+			uint8 type;
+			uint8 base;
+		};
+		uint32 uintValue;
+	};
+} SVGA3dFogMode;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dSurfaceImageId {
+	uint32 sid;
+	uint32 face;
+	uint32 mipmap;
+} SVGA3dSurfaceImageId;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGA3dSubSurfaceId {
+	uint32 sid;
+	uint32 subResourceId;
+} SVGA3dSubSurfaceId;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 width;
+	uint32 height;
+	uint32 depth;
+} SVGA3dSize;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA_OTABLE_MOB = 0,
+	SVGA_OTABLE_MIN = 0,
+	SVGA_OTABLE_SURFACE = 1,
+	SVGA_OTABLE_CONTEXT = 2,
+	SVGA_OTABLE_SHADER = 3,
+	SVGA_OTABLE_SCREENTARGET = 4,
+
+	SVGA_OTABLE_DX9_MAX = 5,
+
+	SVGA_OTABLE_DXCONTEXT = 5,
+	SVGA_OTABLE_DX_MAX = 6,
+
+	SVGA_OTABLE_DEVEL_MAX = 6,
+	SVGA_OTABLE_MAX = 6,
+
+	SVGA_OTABLE_RESERVED1 = 6,
+	SVGA_OTABLE_RESERVED2 = 7,
+	SVGA_OTABLE_BUG_1952836_MAX = 8,
+} SVGAOTableType;
+
+typedef enum {
+	SVGA_COTABLE_MIN = 0,
+	SVGA_COTABLE_RTVIEW = 0,
+	SVGA_COTABLE_DSVIEW = 1,
+	SVGA_COTABLE_SRVIEW = 2,
+	SVGA_COTABLE_ELEMENTLAYOUT = 3,
+	SVGA_COTABLE_BLENDSTATE = 4,
+	SVGA_COTABLE_DEPTHSTENCIL = 5,
+	SVGA_COTABLE_RASTERIZERSTATE = 6,
+	SVGA_COTABLE_SAMPLER = 7,
+	SVGA_COTABLE_STREAMOUTPUT = 8,
+	SVGA_COTABLE_DXQUERY = 9,
+	SVGA_COTABLE_DXSHADER = 10,
+	SVGA_COTABLE_DX10_MAX = 11,
+	SVGA_COTABLE_UAVIEW = 11,
+	SVGA_COTABLE_MAX = 12,
+} SVGACOTableType;
+
+#define SVGA_COTABLE_MAX_IDS (MAX_UINT16 - 2)
+
+typedef enum SVGAMobFormat {
+	SVGA3D_MOBFMT_INVALID = SVGA3D_INVALID_ID,
+	SVGA3D_MOBFMT_PT_0 = 0,
+	SVGA3D_MOBFMT_MIN = 0,
+	SVGA3D_MOBFMT_PT_1 = 1,
+	SVGA3D_MOBFMT_PT_2 = 2,
+	SVGA3D_MOBFMT_RANGE = 3,
+	SVGA3D_MOBFMT_PT64_0 = 4,
+	SVGA3D_MOBFMT_PT64_1 = 5,
+	SVGA3D_MOBFMT_PT64_2 = 6,
+	SVGA3D_MOBFMT_PREDX_MAX = 7,
+	SVGA3D_MOBFMT_EMPTY = 7,
+
+	SVGA3D_MOBFMT_MAX,
+
+	SVGA3D_MOBFMT_HB,
+} SVGAMobFormat;
+
+#define SVGA3D_MOB_EMPTY_BASE 1
+
+typedef enum SVGA3dMSPattern {
+	SVGA3D_MS_PATTERN_NONE = 0,
+	SVGA3D_MS_PATTERN_MIN = 0,
+	SVGA3D_MS_PATTERN_STANDARD = 1,
+	SVGA3D_MS_PATTERN_CENTER = 2,
+	SVGA3D_MS_PATTERN_MAX = 3,
+} SVGA3dMSPattern;
+
+typedef enum SVGA3dMSQualityLevel {
+	SVGA3D_MS_QUALITY_NONE = 0,
+	SVGA3D_MS_QUALITY_MIN = 0,
+	SVGA3D_MS_QUALITY_FULL = 1,
+	SVGA3D_MS_QUALITY_RESOLVED = 2,
+	SVGA3D_MS_QUALITY_MAX = 3,
+} SVGA3dMSQualityLevel;
+
+typedef enum SVGA3dFrameUpdateType {
+	SVGA3D_FRAME_END = 0,
+	SVGA3D_FRAME_MIN = 0,
+	SVGA3D_FRAME_PARTIAL = 1,
+	SVGA3D_FRAME_UNKNOWN = 2,
+	SVGA3D_FRAME_MAX = 3,
+} SVGA3dFrameUpdateType;
+
+#endif
diff --git a/lib/svga/svga_escape.h b/lib/svga/svga_escape.h
new file mode 100644
index 00000000..3b229083
--- /dev/null
+++ b/lib/svga/svga_escape.h
@@ -0,0 +1,54 @@
+/**********************************************************
+ * Copyright 2007,2020 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga_escape.h --
+ *
+ *    Definitions for our own (vendor-specific) SVGA Escape commands.
+ */
+
+#ifndef _SVGA_ESCAPE_H_
+#define _SVGA_ESCAPE_H_
+
+#define SVGA_ESCAPE_NSID_VMWARE 0x00000000
+#define SVGA_ESCAPE_NSID_DEVEL 0xFFFFFFFF
+
+#define SVGA_ESCAPE_VMWARE_MAJOR_MASK 0xFFFF0000
+
+#define SVGA_ESCAPE_VMWARE_HINT 0x00030000
+#define SVGA_ESCAPE_VMWARE_HINT_FULLSCREEN 0x00030001
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 command;
+	uint32 fullscreen;
+	struct {
+		int32 x, y;
+	} monitorPosition;
+} SVGAEscapeHintFullscreen;
+#pragma pack(pop)
+
+#endif
diff --git a/lib/svga/svga_overlay.h b/lib/svga/svga_overlay.h
new file mode 100644
index 00000000..0a197f08
--- /dev/null
+++ b/lib/svga/svga_overlay.h
@@ -0,0 +1,115 @@
+/**********************************************************
+ * Copyright 2007-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga_overlay.h --
+ *
+ *    Definitions for video-overlay support.
+ */
+
+#ifndef _SVGA_OVERLAY_H_
+#define _SVGA_OVERLAY_H_
+
+#include "svga_reg.h"
+
+#if defined __cplusplus
+extern "C" {
+#endif
+
+#define VMWARE_FOURCC_YV12 0x32315659
+#define VMWARE_FOURCC_YUY2 0x32595559
+#define VMWARE_FOURCC_UYVY 0x59565955
+
+typedef enum {
+	SVGA_OVERLAY_FORMAT_INVALID = 0,
+	SVGA_OVERLAY_FORMAT_YV12 = VMWARE_FOURCC_YV12,
+	SVGA_OVERLAY_FORMAT_YUY2 = VMWARE_FOURCC_YUY2,
+	SVGA_OVERLAY_FORMAT_UYVY = VMWARE_FOURCC_UYVY,
+} SVGAOverlayFormat;
+
+#define SVGA_VIDEO_COLORKEY_MASK 0x00ffffff
+
+#define SVGA_ESCAPE_VMWARE_VIDEO 0x00020000
+
+#define SVGA_ESCAPE_VMWARE_VIDEO_SET_REGS 0x00020001
+
+#define SVGA_ESCAPE_VMWARE_VIDEO_FLUSH 0x00020002
+
+typedef struct SVGAEscapeVideoSetRegs {
+	struct {
+		uint32 cmdType;
+		uint32 streamId;
+	} header;
+
+	struct {
+		uint32 registerId;
+		uint32 value;
+	} items[1];
+} SVGAEscapeVideoSetRegs;
+
+typedef struct SVGAEscapeVideoFlush {
+	uint32 cmdType;
+	uint32 streamId;
+} SVGAEscapeVideoFlush;
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 command;
+	uint32 overlay;
+} SVGAFifoEscapeCmdVideoBase;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAFifoEscapeCmdVideoBase videoCmd;
+} SVGAFifoEscapeCmdVideoFlush;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAFifoEscapeCmdVideoBase videoCmd;
+	struct {
+		uint32 regId;
+		uint32 value;
+	} items[1];
+} SVGAFifoEscapeCmdVideoSetRegs;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAFifoEscapeCmdVideoBase videoCmd;
+	struct {
+		uint32 regId;
+		uint32 value;
+	} items[SVGA_VIDEO_NUM_REGS];
+} SVGAFifoEscapeCmdVideoSetAllRegs;
+#pragma pack(pop)
+
+#if defined __cplusplus
+}
+#endif
+
+#endif
diff --git a/lib/svga/svga_reg.h b/lib/svga/svga_reg.h
new file mode 100644
index 00000000..3cb47d1f
--- /dev/null
+++ b/lib/svga/svga_reg.h
@@ -0,0 +1,897 @@
+/**********************************************************
+ * Copyright 1998-2021 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+/*
+ * svga_reg.h --
+ *
+ *    Virtual hardware definitions for the VMware SVGA II device.
+ */
+
+#ifndef _SVGA_REG_H_
+#define _SVGA_REG_H_
+
+#include "vm_basic_types.h"
+
+typedef enum {
+	SVGA_REG_ENABLE_DISABLE = 0,
+	SVGA_REG_ENABLE_ENABLE = (1 << 0),
+	SVGA_REG_ENABLE_HIDE = (1 << 1),
+} SvgaRegEnable;
+
+typedef uint32 SVGAMobId;
+
+#define SVGA_MAX_WIDTH 2560
+#define SVGA_MAX_HEIGHT 1600
+
+#define SVGA_MAX_BITS_PER_PIXEL 32
+#define SVGA_MAX_DEPTH 24
+#define SVGA_MAX_DISPLAYS 10
+#define SVGA_MAX_SCREEN_SIZE 8192
+#define SVGA_SCREEN_ROOT_LIMIT (SVGA_MAX_SCREEN_SIZE * SVGA_MAX_DISPLAYS)
+
+#define SVGA_CURSOR_ON_HIDE 0x0
+#define SVGA_CURSOR_ON_SHOW 0x1
+
+#define SVGA_CURSOR_ON_REMOVE_FROM_FB 0x2
+
+#define SVGA_CURSOR_ON_RESTORE_TO_FB 0x3
+
+#define SVGA_FB_MAX_TRACEABLE_SIZE 0x1000000
+
+#define SVGA_MAX_PSEUDOCOLOR_DEPTH 8
+#define SVGA_MAX_PSEUDOCOLORS (1 << SVGA_MAX_PSEUDOCOLOR_DEPTH)
+#define SVGA_NUM_PALETTE_REGS (3 * SVGA_MAX_PSEUDOCOLORS)
+
+#define SVGA_MAGIC 0x900000UL
+#define SVGA_MAKE_ID(ver) (SVGA_MAGIC << 8 | (ver))
+
+#define SVGA_VERSION_3 3
+#define SVGA_ID_3 SVGA_MAKE_ID(SVGA_VERSION_3)
+
+#define SVGA_VERSION_2 2
+#define SVGA_ID_2 SVGA_MAKE_ID(SVGA_VERSION_2)
+
+#define SVGA_VERSION_1 1
+#define SVGA_ID_1 SVGA_MAKE_ID(SVGA_VERSION_1)
+
+#define SVGA_VERSION_0 0
+#define SVGA_ID_0 SVGA_MAKE_ID(SVGA_VERSION_0)
+
+#define SVGA_ID_INVALID 0xFFFFFFFF
+
+#define SVGA_INDEX_PORT 0x0
+#define SVGA_VALUE_PORT 0x1
+#define SVGA_BIOS_PORT 0x2
+#define SVGA_IRQSTATUS_PORT 0x8
+
+#define SVGA_IRQFLAG_ANY_FENCE (1 << 0)
+#define SVGA_IRQFLAG_FIFO_PROGRESS (1 << 1)
+#define SVGA_IRQFLAG_FENCE_GOAL (1 << 2)
+#define SVGA_IRQFLAG_COMMAND_BUFFER (1 << 3)
+#define SVGA_IRQFLAG_ERROR (1 << 4)
+#define SVGA_IRQFLAG_REG_FENCE_GOAL (1 << 5)
+#define SVGA_IRQFLAG_MAX (1 << 6)
+
+#define SVGA_MAX_CURSOR_CMD_BYTES (40 * 1024)
+#define SVGA_MAX_CURSOR_CMD_DIMENSION 1024
+
+enum {
+	SVGA_REG_ID = 0,
+	SVGA_REG_ENABLE = 1,
+	SVGA_REG_WIDTH = 2,
+	SVGA_REG_HEIGHT = 3,
+	SVGA_REG_MAX_WIDTH = 4,
+	SVGA_REG_MAX_HEIGHT = 5,
+	SVGA_REG_DEPTH = 6,
+	SVGA_REG_BITS_PER_PIXEL = 7,
+	SVGA_REG_PSEUDOCOLOR = 8,
+	SVGA_REG_RED_MASK = 9,
+	SVGA_REG_GREEN_MASK = 10,
+	SVGA_REG_BLUE_MASK = 11,
+	SVGA_REG_BYTES_PER_LINE = 12,
+	SVGA_REG_FB_START = 13,
+	SVGA_REG_FB_OFFSET = 14,
+	SVGA_REG_VRAM_SIZE = 15,
+	SVGA_REG_FB_SIZE = 16,
+
+	SVGA_REG_ID_0_TOP = 17,
+
+	SVGA_REG_CAPABILITIES = 17,
+	SVGA_REG_MEM_START = 18,
+	SVGA_REG_MEM_SIZE = 19,
+	SVGA_REG_CONFIG_DONE = 20,
+	SVGA_REG_SYNC = 21,
+	SVGA_REG_BUSY = 22,
+	SVGA_REG_GUEST_ID = 23,
+	SVGA_REG_DEAD = 24,
+	SVGA_REG_CURSOR_X = 25,
+	SVGA_REG_CURSOR_Y = 26,
+	SVGA_REG_CURSOR_ON = 27,
+	SVGA_REG_HOST_BITS_PER_PIXEL = 28,
+	SVGA_REG_SCRATCH_SIZE = 29,
+	SVGA_REG_MEM_REGS = 30,
+	SVGA_REG_NUM_DISPLAYS = 31,
+	SVGA_REG_PITCHLOCK = 32,
+	SVGA_REG_IRQMASK = 33,
+
+	SVGA_REG_NUM_GUEST_DISPLAYS = 34,
+	SVGA_REG_DISPLAY_ID = 35,
+	SVGA_REG_DISPLAY_IS_PRIMARY = 36,
+	SVGA_REG_DISPLAY_POSITION_X = 37,
+	SVGA_REG_DISPLAY_POSITION_Y = 38,
+	SVGA_REG_DISPLAY_WIDTH = 39,
+	SVGA_REG_DISPLAY_HEIGHT = 40,
+
+	SVGA_REG_GMR_ID = 41,
+	SVGA_REG_GMR_DESCRIPTOR = 42,
+	SVGA_REG_GMR_MAX_IDS = 43,
+	SVGA_REG_GMR_MAX_DESCRIPTOR_LENGTH = 44,
+
+	SVGA_REG_TRACES = 45,
+	SVGA_REG_GMRS_MAX_PAGES = 46,
+	SVGA_REG_MEMORY_SIZE = 47,
+	SVGA_REG_COMMAND_LOW = 48,
+	SVGA_REG_COMMAND_HIGH = 49,
+
+	SVGA_REG_MAX_PRIMARY_MEM = 50,
+
+	SVGA_REG_SUGGESTED_GBOBJECT_MEM_SIZE_KB = 51,
+
+	SVGA_REG_DEV_CAP = 52,
+	SVGA_REG_CMD_PREPEND_LOW = 53,
+	SVGA_REG_CMD_PREPEND_HIGH = 54,
+	SVGA_REG_SCREENTARGET_MAX_WIDTH = 55,
+	SVGA_REG_SCREENTARGET_MAX_HEIGHT = 56,
+	SVGA_REG_MOB_MAX_SIZE = 57,
+	SVGA_REG_BLANK_SCREEN_TARGETS = 58,
+	SVGA_REG_CAP2 = 59,
+	SVGA_REG_DEVEL_CAP = 60,
+
+	SVGA_REG_GUEST_DRIVER_ID = 61,
+	SVGA_REG_GUEST_DRIVER_VERSION1 = 62,
+	SVGA_REG_GUEST_DRIVER_VERSION2 = 63,
+	SVGA_REG_GUEST_DRIVER_VERSION3 = 64,
+
+	SVGA_REG_CURSOR_MOBID = 65,
+	SVGA_REG_CURSOR_MAX_BYTE_SIZE = 66,
+	SVGA_REG_CURSOR_MAX_DIMENSION = 67,
+
+	SVGA_REG_FIFO_CAPS = 68,
+	SVGA_REG_FENCE = 69,
+
+	SVGA_REG_CURSOR4_ON = 70,
+	SVGA_REG_CURSOR4_X = 71,
+	SVGA_REG_CURSOR4_Y = 72,
+	SVGA_REG_CURSOR4_SCREEN_ID = 73,
+	SVGA_REG_CURSOR4_SUBMIT = 74,
+
+	SVGA_REG_SCREENDMA = 75,
+
+	SVGA_REG_GBOBJECT_MEM_SIZE_KB = 76,
+
+	SVGA_REG_REGS_START_HIGH32 = 77,
+	SVGA_REG_REGS_START_LOW32 = 78,
+	SVGA_REG_FB_START_HIGH32 = 79,
+	SVGA_REG_FB_START_LOW32 = 80,
+
+	SVGA_REG_MSHINT = 81,
+
+	SVGA_REG_IRQ_STATUS = 82,
+
+	SVGA_REG_DIRTY_TRACKING = 83,
+	SVGA_REG_FENCE_GOAL = 84,
+
+	SVGA_REG_TOP = 85,
+
+	SVGA_PALETTE_BASE = 1024,
+
+	SVGA_SCRATCH_BASE = SVGA_PALETTE_BASE + SVGA_NUM_PALETTE_REGS
+
+};
+
+typedef enum SVGARegGuestDriverId {
+	SVGA_REG_GUEST_DRIVER_ID_UNKNOWN = 0,
+	SVGA_REG_GUEST_DRIVER_ID_WDDM = 1,
+	SVGA_REG_GUEST_DRIVER_ID_LINUX = 2,
+	SVGA_REG_GUEST_DRIVER_ID_MAX,
+
+	SVGA_REG_GUEST_DRIVER_ID_SUBMIT = MAX_UINT32,
+} SVGARegGuestDriverId;
+
+typedef enum SVGARegMSHint {
+	SVGA_REG_MSHINT_DISABLED = 0,
+	SVGA_REG_MSHINT_FULL = 1,
+	SVGA_REG_MSHINT_RESOLVED = 2,
+} SVGARegMSHint;
+
+typedef enum SVGARegDirtyTracking {
+	SVGA_REG_DIRTY_TRACKING_PER_IMAGE = 0,
+	SVGA_REG_DIRTY_TRACKING_PER_SURFACE = 1,
+} SVGARegDirtyTracking;
+
+#define SVGA_GMR_NULL ((uint32)-1)
+#define SVGA_GMR_FRAMEBUFFER ((uint32)-2)
+
+#pragma pack(push, 1)
+typedef struct SVGAGuestMemDescriptor {
+	uint32 ppn;
+	uint32 numPages;
+} SVGAGuestMemDescriptor;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct SVGAGuestPtr {
+	uint32 gmrId;
+	uint32 offset;
+} SVGAGuestPtr;
+#pragma pack(pop)
+
+#define SVGA_CB_MAX_SIZE_DEFAULT (KBYTES_2_BYTES(512))
+#define SVGA_CB_MAX_SIZE_4MB (MBYTES_2_BYTES(4))
+#define SVGA_CB_MAX_SIZE SVGA_CB_MAX_SIZE_4MB
+#define SVGA_CB_MAX_QUEUED_PER_CONTEXT 32
+#define SVGA_CB_MAX_COMMAND_SIZE (32 * 1024)
+
+#define SVGA_CB_CONTEXT_MASK 0x3f
+typedef enum {
+	SVGA_CB_CONTEXT_DEVICE = 0x3f,
+	SVGA_CB_CONTEXT_0 = 0x0,
+	SVGA_CB_CONTEXT_1 = 0x1,
+	SVGA_CB_CONTEXT_MAX = 0x2,
+} SVGACBContext;
+
+typedef enum {
+
+	SVGA_CB_STATUS_NONE = 0,
+
+	SVGA_CB_STATUS_COMPLETED = 1,
+
+	SVGA_CB_STATUS_QUEUE_FULL = 2,
+
+	SVGA_CB_STATUS_COMMAND_ERROR = 3,
+
+	SVGA_CB_STATUS_CB_HEADER_ERROR = 4,
+
+	SVGA_CB_STATUS_PREEMPTED = 5,
+
+	SVGA_CB_STATUS_SUBMISSION_ERROR = 6,
+
+	SVGA_CB_STATUS_PARTIAL_COMPLETE = 7,
+} SVGACBStatus;
+
+typedef enum {
+	SVGA_CB_FLAG_NONE = 0,
+	SVGA_CB_FLAG_NO_IRQ = 1 << 0,
+	SVGA_CB_FLAG_DX_CONTEXT = 1 << 1,
+	SVGA_CB_FLAG_MOB = 1 << 2,
+} SVGACBFlags;
+
+#pragma pack(push, 1)
+typedef struct {
+	volatile SVGACBStatus status;
+	volatile uint32 errorOffset;
+	uint64 id;
+	SVGACBFlags flags;
+	uint32 length;
+	union {
+		PA pa;
+		struct {
+			SVGAMobId mobid;
+			uint32 mobOffset;
+		} mob;
+	} ptr;
+	uint32 offset;
+	uint32 dxContext;
+	uint32 mustBeZero[6];
+} SVGACBHeader;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA_DC_CMD_NOP = 0,
+	SVGA_DC_CMD_START_STOP_CONTEXT = 1,
+	SVGA_DC_CMD_PREEMPT = 2,
+	SVGA_DC_CMD_START_QUEUE = 3,
+	SVGA_DC_CMD_ASYNC_STOP_QUEUE = 4,
+	SVGA_DC_CMD_EMPTY_CONTEXT_QUEUE = 5,
+	SVGA_DC_CMD_MAX = 6
+} SVGADeviceContextCmdId;
+
+typedef struct SVGADCCmdStartStop {
+	uint32 enable;
+	SVGACBContext context;
+} SVGADCCmdStartStop;
+
+typedef struct SVGADCCmdPreempt {
+	SVGACBContext context;
+	uint32 ignoreIDZero;
+} SVGADCCmdPreempt;
+
+typedef struct SVGADCCmdStartQueue {
+	SVGACBContext context;
+} SVGADCCmdStartQueue;
+
+typedef struct SVGADCCmdAsyncStopQueue {
+	SVGACBContext context;
+} SVGADCCmdAsyncStopQueue;
+
+typedef struct SVGADCCmdEmptyQueue {
+	SVGACBContext context;
+} SVGADCCmdEmptyQueue;
+
+typedef struct SVGAGMRImageFormat {
+	union {
+		struct {
+			uint32 bitsPerPixel : 8;
+			uint32 colorDepth : 8;
+			uint32 reserved : 16;
+		};
+
+		uint32 value;
+	};
+} SVGAGMRImageFormat;
+
+#pragma pack(push, 1)
+typedef struct SVGAGuestImage {
+	SVGAGuestPtr ptr;
+
+	uint32 pitch;
+} SVGAGuestImage;
+#pragma pack(pop)
+
+typedef struct SVGAColorBGRX {
+	union {
+		struct {
+			uint32 b : 8;
+			uint32 g : 8;
+			uint32 r : 8;
+			uint32 x : 8;
+		};
+
+		uint32 value;
+	};
+} SVGAColorBGRX;
+
+#pragma pack(push, 1)
+typedef struct {
+	int32 left;
+	int32 top;
+	int32 right;
+	int32 bottom;
+} SVGASignedRect;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	int32 x;
+	int32 y;
+} SVGASignedPoint;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 x;
+	uint32 y;
+} SVGAUnsignedPoint;
+#pragma pack(pop)
+
+#define SVGA_CAP_NONE 0x00000000
+#define SVGA_CAP_RECT_COPY 0x00000002
+#define SVGA_CAP_CURSOR 0x00000020
+#define SVGA_CAP_CURSOR_BYPASS 0x00000040
+#define SVGA_CAP_CURSOR_BYPASS_2 0x00000080
+#define SVGA_CAP_8BIT_EMULATION 0x00000100
+#define SVGA_CAP_ALPHA_CURSOR 0x00000200
+#define SVGA_CAP_3D 0x00004000
+#define SVGA_CAP_EXTENDED_FIFO 0x00008000
+#define SVGA_CAP_MULTIMON 0x00010000
+#define SVGA_CAP_PITCHLOCK 0x00020000
+#define SVGA_CAP_IRQMASK 0x00040000
+#define SVGA_CAP_DISPLAY_TOPOLOGY 0x00080000
+#define SVGA_CAP_GMR 0x00100000
+#define SVGA_CAP_TRACES 0x00200000
+#define SVGA_CAP_GMR2 0x00400000
+#define SVGA_CAP_SCREEN_OBJECT_2 0x00800000
+#define SVGA_CAP_COMMAND_BUFFERS 0x01000000
+#define SVGA_CAP_DEAD1 0x02000000
+#define SVGA_CAP_CMD_BUFFERS_2 0x04000000
+#define SVGA_CAP_GBOBJECTS 0x08000000
+#define SVGA_CAP_DX 0x10000000
+#define SVGA_CAP_HP_CMD_QUEUE 0x20000000
+#define SVGA_CAP_NO_BB_RESTRICTION 0x40000000
+#define SVGA_CAP_CAP2_REGISTER 0x80000000
+
+#define SVGA_CAP2_NONE 0x00000000
+#define SVGA_CAP2_GROW_OTABLE 0x00000001
+#define SVGA_CAP2_INTRA_SURFACE_COPY 0x00000002
+#define SVGA_CAP2_DX2 0x00000004
+#define SVGA_CAP2_GB_MEMSIZE_2 0x00000008
+#define SVGA_CAP2_SCREENDMA_REG 0x00000010
+#define SVGA_CAP2_OTABLE_PTDEPTH_2 0x00000020
+#define SVGA_CAP2_NON_MS_TO_MS_STRETCHBLT 0x00000040
+#define SVGA_CAP2_CURSOR_MOB 0x00000080
+#define SVGA_CAP2_MSHINT 0x00000100
+#define SVGA_CAP2_CB_MAX_SIZE_4MB 0x00000200
+#define SVGA_CAP2_DX3 0x00000400
+#define SVGA_CAP2_FRAME_TYPE 0x00000800
+#define SVGA_CAP2_COTABLE_COPY 0x00001000
+#define SVGA_CAP2_TRACE_FULL_FB 0x00002000
+#define SVGA_CAP2_EXTRA_REGS 0x00004000
+#define SVGA_CAP2_LO_STAGING 0x00008000
+#define SVGA_CAP2_RESERVED 0x80000000
+
+typedef enum {
+	SVGABackdoorCapDeviceCaps = 0,
+	SVGABackdoorCapFifoCaps = 1,
+	SVGABackdoorCap3dHWVersion = 2,
+	SVGABackdoorCapDeviceCaps2 = 3,
+	SVGABackdoorCapDevelCaps = 4,
+	SVGABackdoorDevelRenderer = 5,
+	SVGABackdoorDevelUsingISB = 6,
+	SVGABackdoorCapMax = 7,
+} SVGABackdoorCapType;
+
+enum {
+
+	SVGA_FIFO_MIN = 0,
+	SVGA_FIFO_MAX,
+	SVGA_FIFO_NEXT_CMD,
+	SVGA_FIFO_STOP,
+
+	SVGA_FIFO_CAPABILITIES = 4,
+	SVGA_FIFO_FLAGS,
+
+	SVGA_FIFO_FENCE,
+
+	SVGA_FIFO_3D_HWVERSION,
+
+	SVGA_FIFO_PITCHLOCK,
+
+	SVGA_FIFO_CURSOR_ON,
+	SVGA_FIFO_CURSOR_X,
+	SVGA_FIFO_CURSOR_Y,
+	SVGA_FIFO_CURSOR_COUNT,
+	SVGA_FIFO_CURSOR_LAST_UPDATED,
+
+	SVGA_FIFO_RESERVED,
+
+	SVGA_FIFO_CURSOR_SCREEN_ID,
+
+	SVGA_FIFO_DEAD,
+
+	SVGA_FIFO_3D_HWVERSION_REVISED,
+
+	SVGA_FIFO_3D_CAPS = 32,
+	SVGA_FIFO_3D_CAPS_LAST = 32 + 255,
+
+	SVGA_FIFO_GUEST_3D_HWVERSION,
+	SVGA_FIFO_FENCE_GOAL,
+	SVGA_FIFO_BUSY,
+
+	SVGA_FIFO_NUM_REGS
+};
+
+#define SVGA_FIFO_3D_CAPS_SIZE (SVGA_FIFO_3D_CAPS_LAST - SVGA_FIFO_3D_CAPS + 1)
+
+#define SVGA3D_FIFO_CAPS_RECORD_DEVCAPS 0x100
+typedef uint32 SVGA3dFifoCapsRecordType;
+
+typedef uint32 SVGA3dFifoCapPair[2];
+
+#pragma pack(push, 1)
+typedef struct SVGA3dFifoCapsRecordHeader {
+	uint32 length;
+	SVGA3dFifoCapsRecordType type;
+
+} SVGA3dFifoCapsRecordHeader;
+#pragma pack(pop)
+
+#define SVGA_FIFO_EXTENDED_MANDATORY_REGS (SVGA_FIFO_3D_CAPS_LAST + 1)
+
+#define SVGA_FIFO_CAP_NONE 0
+#define SVGA_FIFO_CAP_FENCE (1 << 0)
+#define SVGA_FIFO_CAP_ACCELFRONT (1 << 1)
+#define SVGA_FIFO_CAP_PITCHLOCK (1 << 2)
+#define SVGA_FIFO_CAP_VIDEO (1 << 3)
+#define SVGA_FIFO_CAP_CURSOR_BYPASS_3 (1 << 4)
+#define SVGA_FIFO_CAP_ESCAPE (1 << 5)
+#define SVGA_FIFO_CAP_RESERVE (1 << 6)
+#define SVGA_FIFO_CAP_SCREEN_OBJECT (1 << 7)
+#define SVGA_FIFO_CAP_GMR2 (1 << 8)
+#define SVGA_FIFO_CAP_3D_HWVERSION_REVISED SVGA_FIFO_CAP_GMR2
+#define SVGA_FIFO_CAP_SCREEN_OBJECT_2 (1 << 9)
+#define SVGA_FIFO_CAP_DEAD (1 << 10)
+
+#define SVGA_FIFO_FLAG_NONE 0
+#define SVGA_FIFO_FLAG_ACCELFRONT (1 << 0)
+#define SVGA_FIFO_FLAG_RESERVED (1 << 31)
+
+#define SVGA_FIFO_RESERVED_UNKNOWN 0xffffffff
+
+#define SVGA_SCREENDMA_REG_UNDEFINED 0
+#define SVGA_SCREENDMA_REG_NOT_PRESENT 1
+#define SVGA_SCREENDMA_REG_PRESENT 2
+#define SVGA_SCREENDMA_REG_MAX 3
+
+#define SVGA_NUM_OVERLAY_UNITS 32
+
+#define SVGA_VIDEO_FLAG_COLORKEY 0x0001
+
+enum {
+	SVGA_VIDEO_ENABLED = 0,
+	SVGA_VIDEO_FLAGS,
+	SVGA_VIDEO_DATA_OFFSET,
+	SVGA_VIDEO_FORMAT,
+	SVGA_VIDEO_COLORKEY,
+	SVGA_VIDEO_SIZE,
+	SVGA_VIDEO_WIDTH,
+	SVGA_VIDEO_HEIGHT,
+	SVGA_VIDEO_SRC_X,
+	SVGA_VIDEO_SRC_Y,
+	SVGA_VIDEO_SRC_WIDTH,
+	SVGA_VIDEO_SRC_HEIGHT,
+	SVGA_VIDEO_DST_X,
+	SVGA_VIDEO_DST_Y,
+	SVGA_VIDEO_DST_WIDTH,
+	SVGA_VIDEO_DST_HEIGHT,
+	SVGA_VIDEO_PITCH_1,
+	SVGA_VIDEO_PITCH_2,
+	SVGA_VIDEO_PITCH_3,
+	SVGA_VIDEO_DATA_GMRID,
+	SVGA_VIDEO_DST_SCREEN_ID,
+	SVGA_VIDEO_NUM_REGS
+};
+
+#pragma pack(push, 1)
+typedef struct SVGAOverlayUnit {
+	uint32 enabled;
+	uint32 flags;
+	uint32 dataOffset;
+	uint32 format;
+	uint32 colorKey;
+	uint32 size;
+	uint32 width;
+	uint32 height;
+	uint32 srcX;
+	uint32 srcY;
+	uint32 srcWidth;
+	uint32 srcHeight;
+	int32 dstX;
+	int32 dstY;
+	uint32 dstWidth;
+	uint32 dstHeight;
+	uint32 pitches[3];
+	uint32 dataGMRId;
+	uint32 dstScreenId;
+} SVGAOverlayUnit;
+#pragma pack(pop)
+
+#define SVGA_INVALID_DISPLAY_ID ((uint32)-1)
+
+typedef struct SVGADisplayTopology {
+	uint16 displayId;
+	uint16 isPrimary;
+	uint32 width;
+	uint32 height;
+	uint32 positionX;
+	uint32 positionY;
+} SVGADisplayTopology;
+
+#define SVGA_SCREEN_MUST_BE_SET (1 << 0)
+#define SVGA_SCREEN_HAS_ROOT SVGA_SCREEN_MUST_BE_SET
+#define SVGA_SCREEN_IS_PRIMARY (1 << 1)
+#define SVGA_SCREEN_FULLSCREEN_HINT (1 << 2)
+
+#define SVGA_SCREEN_DEACTIVATE (1 << 3)
+
+#define SVGA_SCREEN_BLANKING (1 << 4)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 structSize;
+	uint32 id;
+	uint32 flags;
+	struct {
+		uint32 width;
+		uint32 height;
+	} size;
+	struct {
+		int32 x;
+		int32 y;
+	} root;
+
+	SVGAGuestImage backingStore;
+
+	uint32 cloneCount;
+} SVGAScreenObject;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA_CMD_INVALID_CMD = 0,
+	SVGA_CMD_UPDATE = 1,
+	SVGA_CMD_RECT_COPY = 3,
+	SVGA_CMD_RECT_ROP_COPY = 14,
+	SVGA_CMD_DEFINE_CURSOR = 19,
+	SVGA_CMD_DEFINE_ALPHA_CURSOR = 22,
+	SVGA_CMD_UPDATE_VERBOSE = 25,
+	SVGA_CMD_FRONT_ROP_FILL = 29,
+	SVGA_CMD_FENCE = 30,
+	SVGA_CMD_ESCAPE = 33,
+	SVGA_CMD_DEFINE_SCREEN = 34,
+	SVGA_CMD_DESTROY_SCREEN = 35,
+	SVGA_CMD_DEFINE_GMRFB = 36,
+	SVGA_CMD_BLIT_GMRFB_TO_SCREEN = 37,
+	SVGA_CMD_BLIT_SCREEN_TO_GMRFB = 38,
+	SVGA_CMD_ANNOTATION_FILL = 39,
+	SVGA_CMD_ANNOTATION_COPY = 40,
+	SVGA_CMD_DEFINE_GMR2 = 41,
+	SVGA_CMD_REMAP_GMR2 = 42,
+	SVGA_CMD_DEAD = 43,
+	SVGA_CMD_DEAD_2 = 44,
+	SVGA_CMD_NOP = 45,
+	SVGA_CMD_NOP_ERROR = 46,
+	SVGA_CMD_MAX
+} SVGAFifoCmdId;
+
+#define SVGA_CMD_MAX_DATASIZE (256 * 1024)
+#define SVGA_CMD_MAX_ARGS 64
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 x;
+	uint32 y;
+	uint32 width;
+	uint32 height;
+} SVGAFifoCmdUpdate;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 srcX;
+	uint32 srcY;
+	uint32 destX;
+	uint32 destY;
+	uint32 width;
+	uint32 height;
+} SVGAFifoCmdRectCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 srcX;
+	uint32 srcY;
+	uint32 destX;
+	uint32 destY;
+	uint32 width;
+	uint32 height;
+	uint32 rop;
+} SVGAFifoCmdRectRopCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 id;
+	uint32 hotspotX;
+	uint32 hotspotY;
+	uint32 width;
+	uint32 height;
+	uint32 andMaskDepth;
+	uint32 xorMaskDepth;
+
+} SVGAFifoCmdDefineCursor;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 id;
+	uint32 hotspotX;
+	uint32 hotspotY;
+	uint32 width;
+	uint32 height;
+
+} SVGAFifoCmdDefineAlphaCursor;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 hotspotX;
+	uint32 hotspotY;
+	uint32 width;
+	uint32 height;
+	uint32 andMaskDepth;
+	uint32 xorMaskDepth;
+
+} SVGAGBColorCursorHeader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 hotspotX;
+	uint32 hotspotY;
+	uint32 width;
+	uint32 height;
+
+} SVGAGBAlphaCursorHeader;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA_COLOR_CURSOR = 0,
+	SVGA_ALPHA_CURSOR = 1,
+} SVGAGBCursorType;
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAGBCursorType type;
+	union {
+		SVGAGBColorCursorHeader colorHeader;
+		SVGAGBAlphaCursorHeader alphaHeader;
+	} header;
+	uint32 sizeInBytes;
+
+} SVGAGBCursorHeader;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 x;
+	uint32 y;
+	uint32 width;
+	uint32 height;
+	uint32 reason;
+} SVGAFifoCmdUpdateVerbose;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 color;
+	uint32 x;
+	uint32 y;
+	uint32 width;
+	uint32 height;
+	uint32 rop;
+} SVGAFifoCmdFrontRopFill;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 fence;
+} SVGAFifoCmdFence;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 nsid;
+	uint32 size;
+
+} SVGAFifoCmdEscape;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAScreenObject screen;
+} SVGAFifoCmdDefineScreen;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 screenId;
+} SVGAFifoCmdDestroyScreen;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAGuestPtr ptr;
+	uint32 bytesPerLine;
+	SVGAGMRImageFormat format;
+} SVGAFifoCmdDefineGMRFB;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGASignedPoint srcOrigin;
+	SVGASignedRect destRect;
+	uint32 destScreenId;
+} SVGAFifoCmdBlitGMRFBToScreen;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGASignedPoint destOrigin;
+	SVGASignedRect srcRect;
+	uint32 srcScreenId;
+} SVGAFifoCmdBlitScreenToGMRFB;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGAColorBGRX color;
+} SVGAFifoCmdAnnotationFill;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	SVGASignedPoint srcOrigin;
+	uint32 srcScreenId;
+} SVGAFifoCmdAnnotationCopy;
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 gmrId;
+	uint32 numPages;
+} SVGAFifoCmdDefineGMR2;
+#pragma pack(pop)
+
+typedef enum {
+	SVGA_REMAP_GMR2_PPN32 = 0,
+	SVGA_REMAP_GMR2_VIA_GMR = (1 << 0),
+	SVGA_REMAP_GMR2_PPN64 = (1 << 1),
+	SVGA_REMAP_GMR2_SINGLE_PPN = (1 << 2),
+} SVGARemapGMR2Flags;
+
+#pragma pack(push, 1)
+typedef struct {
+	uint32 gmrId;
+	SVGARemapGMR2Flags flags;
+	uint32 offsetPages;
+	uint32 numPages;
+
+} SVGAFifoCmdRemapGMR2;
+#pragma pack(pop)
+
+#define SVGA_VRAM_MIN_SIZE (4 * 640 * 480)
+#define SVGA_VRAM_MIN_SIZE_3D (16 * 1024 * 1024)
+#define SVGA_VRAM_MAX_SIZE (128 * 1024 * 1024)
+#define SVGA_MEMORY_SIZE_MAX (1024 * 1024 * 1024)
+#define SVGA_FIFO_SIZE_MAX (2 * 1024 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_MIN (32 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_MAX_2GB (2 * 1024 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_MAX_3GB (3 * 1024 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_MAX_4GB (4 * 1024 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_MAX_8GB (8 * 1024 * 1024)
+#define SVGA_GRAPHICS_MEMORY_KB_DEFAULT (256 * 1024)
+
+#define SVGA_VRAM_SIZE_W2K (64 * 1024 * 1024)
+
+#if defined(VMX86_SERVER)
+#define SVGA_VRAM_SIZE (4 * 1024 * 1024)
+#define SVGA_VRAM_SIZE_3D (64 * 1024 * 1024)
+#define SVGA_FIFO_SIZE (256 * 1024)
+#define SVGA_FIFO_SIZE_3D (516 * 1024)
+#define SVGA_MEMORY_SIZE_DEFAULT (160 * 1024 * 1024)
+#define SVGA_AUTODETECT_DEFAULT FALSE
+#else
+#define SVGA_VRAM_SIZE (16 * 1024 * 1024)
+#define SVGA_VRAM_SIZE_3D SVGA_VRAM_MAX_SIZE
+#define SVGA_FIFO_SIZE (2 * 1024 * 1024)
+#define SVGA_FIFO_SIZE_3D SVGA_FIFO_SIZE
+#define SVGA_MEMORY_SIZE_DEFAULT (768 * 1024 * 1024)
+#define SVGA_AUTODETECT_DEFAULT TRUE
+#endif
+
+#define SVGA_FIFO_SIZE_GBOBJECTS (256 * 1024)
+#define SVGA_VRAM_SIZE_GBOBJECTS (4 * 1024 * 1024)
+
+#endif
diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
new file mode 100644
index 00000000..042bb147
--- /dev/null
+++ b/lib/svga/vm_basic_types.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**********************************************************
+ * Copyright 2015-2021 VMware, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+#ifndef VM_BASIC_TYPES_H
+#define VM_BASIC_TYPES_H
+
+#define PAGE_SHIFT 12
+#define PAGE_SIZE (1 << PAGE_SHIFT)
+#define PAGE_MASK (~(PAGE_SIZE - 1))
+#define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <ctype.h>
+
+typedef uint32_t uint32;
+typedef int32_t int32;
+typedef uint64_t uint64;
+typedef uint16_t uint16;
+typedef int16_t int16;
+typedef uint8_t uint8;
+typedef int8_t int8;
+
+typedef uint64 PA;
+typedef uint32 PPN;
+typedef uint32 PPN32;
+typedef uint64 PPN64;
+
+typedef bool Bool;
+
+#define MAX_UINT64 UINT64_MAX
+#define MAX_UINT32 UINT32_MAX
+#define MAX_UINT16 UINT16_MAX
+
+#define CONST64U(x) x##ULL
+
+#ifndef MBYTES_SHIFT
+#define MBYTES_SHIFT 20
+#endif
+#ifndef MBYTES_2_BYTES
+#define MBYTES_2_BYTES(_nbytes) ((uint64)(_nbytes) << MBYTES_SHIFT)
+#endif
+
+/*
+ * 64-bit atomic ops from linux
+ */
+typedef struct {
+	volatile long long counter;
+} atomic64_t;
+
+/*
+ * MKS Guest Stats types
+ */
+
+typedef struct MKSGuestStatCounter {
+	atomic64_t count;
+} MKSGuestStatCounter;
+
+typedef struct MKSGuestStatCounterTime {
+	MKSGuestStatCounter counter;
+	atomic64_t selfCycles;
+	atomic64_t totalCycles;
+} MKSGuestStatCounterTime;
+
+/*
+ * Flags for MKSGuestStatInfoEntry::flags below
+ */
+
+#define MKS_GUEST_STAT_FLAG_NONE 0
+#define MKS_GUEST_STAT_FLAG_TIME (1U << 0)
+
+typedef __attribute__((aligned(32))) struct MKSGuestStatInfoEntry {
+	union {
+		const char *s;
+		uint64 u;
+	} name;
+	union {
+		const char *s;
+		uint64 u;
+	} description;
+	uint64 flags;
+	union {
+		MKSGuestStatCounter *counter;
+		MKSGuestStatCounterTime *counterTime;
+		uint64 u;
+	} stat;
+} MKSGuestStatInfoEntry;
+
+#define INVALID_PPN64 ((PPN64)0x000fffffffffffffULL)
+#define vmw_num_pages(size) (PAGE_ALIGN(size) >> PAGE_SHIFT)
+
+#define MKS_GUEST_STAT_INSTANCE_DESC_LENGTH 1024
+#define MKS_GUEST_STAT_INSTANCE_MAX_STATS 4096
+#define MKS_GUEST_STAT_INSTANCE_MAX_STAT_PPNS              \
+	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS * \
+		       sizeof(MKSGuestStatCounterTime)))
+#define MKS_GUEST_STAT_INSTANCE_MAX_INFO_PPNS              \
+	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS * \
+		       sizeof(MKSGuestStatInfoEntry)))
+#define MKS_GUEST_STAT_AVERAGE_NAME_LENGTH 40
+#define MKS_GUEST_STAT_INSTANCE_MAX_STRS_PPNS              \
+	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS * \
+		       MKS_GUEST_STAT_AVERAGE_NAME_LENGTH))
+
+/*
+ * The MKSGuestStatInstanceDescriptor is used as main interface to
+ * communicate guest stats back to the host code.  The guest must
+ * allocate an instance of this structure at the start of a page and
+ * provide the physical address to the host.  From there the host code
+ * can walk this structure to find other (pinned) pages containing the
+ * stats data.
+ *
+ * Since the MKSGuestStatInfoEntry structures contain userlevel
+ * pointers, the InstanceDescriptor also contains pointers to the
+ * begining of these sections allowing the host side code to correctly
+ * interpret the pointers.
+ *
+ * Because the host side code never acknowledges anything back to the
+ * guest there is no strict requirement to maintain compatability
+ * across releases.  If the interface changes the host might not be
+ * able to log stats, but the guest will continue to run normally.
+ */
+
+typedef struct MKSGuestStatInstanceDescriptor {
+	uint64 reservedMBZ; /* must be zero for now. */
+	uint64 statStartVA; /* VA of the start of the stats section. */
+	uint64 strsStartVA; /* VA of the start of the strings section. */
+	uint64 statLength; /* length of the stats section in bytes. */
+	uint64 infoLength; /* length of the info entry section in bytes. */
+	uint64 strsLength; /* length of the strings section in bytes. */
+	PPN64 statPPNs[MKS_GUEST_STAT_INSTANCE_MAX_STAT_PPNS]; /* stat counters */
+	PPN64 infoPPNs[MKS_GUEST_STAT_INSTANCE_MAX_INFO_PPNS]; /* stat info */
+	PPN64 strsPPNs[MKS_GUEST_STAT_INSTANCE_MAX_STRS_PPNS]; /* strings */
+	char description[MKS_GUEST_STAT_INSTANCE_DESC_LENGTH];
+} MKSGuestStatInstanceDescriptor;
+
+#endif
diff --git a/meson.build b/meson.build
index 3e937f5a..8e5b8dff 100644
--- a/meson.build
+++ b/meson.build
@@ -260,6 +260,7 @@ includedir = get_option('includedir')
 libdir = get_option('libdir')
 libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
+vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
@@ -295,10 +296,17 @@ if get_option('use_rpath')
 		amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, '..')
 	endforeach
 	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
+
+	vmwgfx_rpathdir = '$ORIGIN'
+	foreach p : vmwgfxdir.split('/')
+		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
+	endforeach
+	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
+	vmwgfx_rpathdir = ''
 endif
 
 subdir('lib')
diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0b..eecb6668 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -453,6 +453,8 @@ test_list += 'sw_sync'
 
 subdir('amdgpu')
 
+subdir('vmwgfx')
+
 gen_testlist = find_program('generate_testlist.sh')
 test_list_target = custom_target('testlist',
 	      output : 'test-list.txt',
diff --git a/tests/vmwgfx/execution_buffer.c b/tests/vmwgfx/execution_buffer.c
new file mode 100644
index 00000000..5dfd1502
--- /dev/null
+++ b/tests/vmwgfx/execution_buffer.c
@@ -0,0 +1,306 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+#include <stdatomic.h>
+
+struct {
+	bool stress_test;
+} options;
+
+static struct option long_options[] = {
+	{ "stress-test", 0, 0, 's' },
+	{ NULL, 0, 0, 0 },
+};
+
+static int parse_options(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 's':
+		options.stress_test = 1;
+		igt_info("stress-test mode\n");
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static void check_mob_create_map(int fd)
+{
+	struct vmw_mob *mob_obj;
+	uint32 size = 4096;
+
+	/* create a new mob */
+	mob_obj = vmw_ioctl_mob_create(fd, size);
+	/* takes the created mob and maps it */
+	vmw_ioctl_mob_map(fd, mob_obj);
+	/* test that mapping is successful */
+	igt_assert_neq(mob_obj->map_count, 0);
+
+	vmw_ioctl_mob_unmap(mob_obj);
+	vmw_ioctl_mob_close_handle(fd, mob_obj);
+}
+
+static void check_buffer_create(int fd)
+{
+	struct vmw_surface *buffer_obj;
+	struct vmw_mob *mob_obj;
+	uint32 size = 4096;
+
+	mob_obj = vmw_ioctl_mob_create(fd, size);
+	/* creates a buffer from mob */
+	buffer_obj = vmw_ioctl_buffer_create(fd, 0, size, mob_obj);
+	/* checks that the buffer is allocated */
+	igt_assert_eq(buffer_obj->base.backup_size, size);
+
+	vmw_ioctl_surface_unref(fd, buffer_obj);
+	vmw_ioctl_mob_close_handle(fd, mob_obj);
+}
+
+static void check_execbuf_submit_fence(int fd, int32 cid)
+{
+	struct vmw_execbuf *command_buffer;
+	struct drm_vmw_fence_rep cmd_fence = { 0 };
+	const uint32 buffer_size = 128;
+
+	struct vmw_mob *mob;
+	struct vmw_surface *src_buffer;
+	struct vmw_surface *dst_buffer1, *dst_buffer2, *dst_buffer3;
+
+	uint32_t total_size = 0;
+	SVGA3dCmdDXBufferCopy copyCmd = { 0 };
+	uint32_t total_cmd_len = sizeof(SVGA3dCmdHeader) + sizeof copyCmd;
+
+	SVGA3dCmdReadbackGBSurface cmd;
+	struct vmw_mob fake_mob = { 0 };
+	char *readback;
+
+	char *data;
+	int i;
+
+	mob = vmw_ioctl_mob_create(fd, buffer_size);
+
+	data = vmw_ioctl_mob_map(fd, mob);
+	for (i = 0; i < buffer_size; ++i)
+		data[i] = i;
+	vmw_ioctl_mob_unmap(mob);
+
+	src_buffer = vmw_ioctl_buffer_create(
+		fd, SVGA3D_SURFACE_BIND_SHADER_RESOURCE, buffer_size, mob);
+	dst_buffer1 = vmw_ioctl_buffer_create(
+		fd, SVGA3D_SURFACE_BIND_SHADER_RESOURCE, buffer_size, NULL);
+	dst_buffer2 = vmw_ioctl_buffer_create(
+		fd, SVGA3D_SURFACE_BIND_SHADER_RESOURCE, buffer_size, NULL);
+	dst_buffer3 = vmw_ioctl_buffer_create(
+		fd, SVGA3D_SURFACE_BIND_SHADER_RESOURCE, buffer_size, NULL);
+	/* Create command buffer */
+	command_buffer = vmw_execbuf_create(fd, cid);
+	igt_assert(command_buffer != NULL);
+
+	copyCmd.src = src_buffer->base.handle;
+	copyCmd.dest = dst_buffer1->base.handle;
+	copyCmd.width = buffer_size;
+	copyCmd.srcX = 0;
+	copyCmd.destX = 0;
+	vmw_execbuf_append(command_buffer, SVGA_3D_CMD_DX_BUFFER_COPY, &copyCmd,
+			   sizeof copyCmd, NULL, 0);
+	total_size += total_cmd_len;
+	igt_assert_eq(command_buffer->offset, total_size);
+	igt_assert(command_buffer->offset < command_buffer->buffer_size);
+
+	for (i = 0; i < 4096; ++i) {
+		copyCmd.src = dst_buffer1->base.handle;
+		copyCmd.dest = dst_buffer2->base.handle;
+		vmw_execbuf_append(command_buffer, SVGA_3D_CMD_DX_BUFFER_COPY,
+				   &copyCmd, sizeof copyCmd, NULL, 0);
+		total_size += total_cmd_len;
+	}
+
+	copyCmd.src = dst_buffer2->base.handle;
+	copyCmd.dest = dst_buffer3->base.handle;
+	vmw_execbuf_append(command_buffer, SVGA_3D_CMD_DX_BUFFER_COPY, &copyCmd,
+			   sizeof copyCmd, NULL, 0);
+	total_size += total_cmd_len;
+
+	igt_assert_eq(command_buffer->offset, total_size);
+	igt_assert(command_buffer->offset < command_buffer->buffer_size);
+
+	vmw_execbuf_submit(command_buffer, &cmd_fence);
+	vmw_ioctl_fence_finish(fd, &cmd_fence);
+
+	cmd.sid = dst_buffer1->base.handle;
+	vmw_execbuf_append(command_buffer, SVGA_3D_CMD_READBACK_GB_SURFACE,
+			   &cmd, sizeof cmd, NULL, 0);
+	vmw_execbuf_submit(command_buffer, &cmd_fence);
+	vmw_ioctl_fence_finish(fd, &cmd_fence);
+
+	fake_mob.size = dst_buffer1->base.buffer_size;
+	fake_mob.handle = dst_buffer1->base.buffer_handle;
+	fake_mob.map_handle = dst_buffer1->base.buffer_map_handle;
+	readback = vmw_ioctl_mob_map(fd, &fake_mob);
+	for (i = 0; i < buffer_size; i++) {
+		int val = readback[i];
+		igt_assert_eq(i, val);
+	}
+	vmw_ioctl_mob_unmap(&fake_mob);
+
+	vmw_ioctl_surface_unref(fd, src_buffer);
+	vmw_ioctl_surface_unref(fd, dst_buffer1);
+	vmw_ioctl_surface_unref(fd, dst_buffer2);
+	vmw_ioctl_surface_unref(fd, dst_buffer3);
+	vmw_execbuf_destroy(command_buffer);
+	vmw_ioctl_mob_close_handle(fd, mob);
+}
+
+static int32 vmw_ioctl_command2(int drm_fd, int32_t cid, void *commands,
+				uint32_t size, struct drm_vmw_fence_rep *fence)
+{
+	struct drm_vmw_execbuf_arg arg = { 0 };
+	int ret;
+	const int argsize = sizeof(arg);
+
+	memset(&arg, 0, sizeof(arg));
+
+	arg.fence_rep = (unsigned long)fence;
+	arg.commands = (unsigned long)commands;
+	arg.command_size = size;
+	arg.throttle_us = 0; /* deprecated */
+	arg.version = DRM_VMW_EXECBUF_VERSION;
+	arg.context_handle = cid;
+
+	do {
+		ret = drmCommandWrite(drm_fd, DRM_VMW_EXECBUF, &arg, argsize);
+		if (ret == -EBUSY)
+			usleep(1000);
+	} while (ret == -ERESTART || ret == -EBUSY);
+	if (ret) {
+		return 1;
+	}
+	return 0;
+}
+
+static _Atomic(int32_t) context_id;
+static const uint32_t max_tries = 100000;
+
+static void *create_contexts(void *data)
+{
+	int fd = (uintptr_t)data;
+	uint32_t i;
+
+	for (i = 0; i < max_tries; ++i) {
+		int32_t cid = vmw_ioctl_context_create(fd);
+
+		atomic_store(&context_id, cid);
+
+		vmw_ioctl_context_destroy(fd, cid);
+	}
+	return 0;
+}
+
+static void *submit_queries(void *data)
+{
+	int fd = (uintptr_t)data;
+	uint32_t i;
+
+	for (i = 0; i < max_tries; ++i) {
+		struct vmw_execbuf *cmd_buf;
+		SVGA3dCmdDXDefineQuery cmd = {
+			.queryId = 0,
+			.type = SVGA3D_QUERYTYPE_TIMESTAMP,
+			.flags = 0,
+		};
+		int32_t cid = atomic_load(&context_id);
+
+		cmd_buf = vmw_execbuf_create(fd, cid);
+
+		vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_QUERY, &cmd,
+				   sizeof cmd, NULL, 0);
+
+		vmw_ioctl_command2(fd, cid, cmd_buf->buffer, cmd_buf->offset,
+				   NULL);
+		cmd_buf->offset = 0;
+		vmw_execbuf_destroy(cmd_buf);
+	}
+	return 0;
+}
+
+static void execbuf_stress_test(int fd)
+{
+	pthread_t threads[2];
+	void *status;
+	int ret;
+	ret = pthread_create(&threads[0], NULL, create_contexts,
+			     (void *)(uintptr_t)fd);
+	igt_assert_eq(ret, 0);
+	ret = pthread_create(&threads[1], NULL, submit_queries,
+			     (void *)(uintptr_t)fd);
+	igt_assert_eq(ret, 0);
+
+	pthread_join(threads[0], &status);
+	pthread_join(threads[1], &status);
+}
+
+igt_main_args("st:", long_options, NULL, parse_options, NULL)
+{
+	int fd;
+	int32 cid;
+
+	igt_fixture
+	{
+		fd = drm_open_driver_render(DRIVER_VMWGFX);
+		cid = vmw_ioctl_context_create(fd);
+	}
+
+	igt_subtest("mob-create-map")
+	{
+		check_mob_create_map(fd);
+	}
+
+	igt_subtest("buffer-create")
+	{
+		check_buffer_create(fd);
+	}
+
+	igt_subtest("execution-buffer-submit-sync")
+	{
+		check_execbuf_submit_fence(fd, cid);
+	}
+
+	if (options.stress_test) {
+		igt_subtest("execution-buffer-stress-test")
+		{
+			execbuf_stress_test(fd);
+		}
+	}
+
+	igt_fixture
+	{
+		vmw_ioctl_context_destroy(fd, cid);
+		close(fd);
+	}
+}
diff --git a/tests/vmwgfx/meson.build b/tests/vmwgfx/meson.build
new file mode 100644
index 00000000..5995b18c
--- /dev/null
+++ b/tests/vmwgfx/meson.build
@@ -0,0 +1,18 @@
+
+vmwgfx_progs = [
+	'tri',
+	'execution_buffer',
+	'surface_copy',
+	'mob_stress',
+	'ref_count'
+]
+vmwgfx_deps = test_deps
+
+foreach prog : vmwgfx_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : vmwgfx_deps,
+				       install_dir : vmwgfxdir,
+				       install_rpath : vmwgfx_rpathdir,
+				       install : true)
+	test_list += join_paths('vmwgfx', prog)
+endforeach
diff --git a/tests/vmwgfx/mob_stress.c b/tests/vmwgfx/mob_stress.c
new file mode 100644
index 00000000..db3a7ded
--- /dev/null
+++ b/tests/vmwgfx/mob_stress.c
@@ -0,0 +1,99 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+static void test_triangle_render(struct vmw_svga_device *device, int32 cid)
+{
+	uint8 *rendered_tri;
+	struct vmw_default_objects objects;
+
+	vmw_create_default_objects(device, cid, &objects,
+				   &vmw_default_rect_size);
+	rendered_tri = vmw_triangle_draw(device, cid, &objects, true);
+	vmw_triangle_assert_values(rendered_tri, objects.color_rt);
+
+	free(rendered_tri);
+	vmw_destroy_default_objects(device, &objects);
+}
+
+igt_main
+{
+	struct vmw_svga_device device;
+	int32 cid;
+	uint64 max_mob_mem;
+	uint64 max_mob_size;
+
+	igt_fixture
+	{
+		vmw_svga_device_init(&device, vmw_svga_device_node_render);
+		igt_require(device.drm_fd != -1);
+
+		cid = vmw_ioctl_context_create(device.drm_fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+
+		max_mob_mem = vmw_ioctl_get_param(device.drm_fd,
+						  DRM_VMW_PARAM_MAX_MOB_MEMORY);
+		max_mob_size = vmw_ioctl_get_param(device.drm_fd,
+						   DRM_VMW_PARAM_MAX_MOB_SIZE);
+	}
+
+	igt_subtest("max_mob_mem_stress")
+	{
+		uint32 mob_num;
+		struct vmw_mob **mob_objs;
+		int i;
+
+		mob_num = max_mob_mem / max_mob_size;
+		mob_objs = (struct vmw_mob **)calloc(mob_num,
+						     sizeof(struct vmw_mob *));
+
+		/* Enough mobs to reach max_mob_mem */
+		for (i = 0; i < mob_num; i++) {
+			char *readback;
+			mob_objs[i] = vmw_ioctl_mob_create(device.drm_fd,
+							   max_mob_size);
+			/* Writing mob to ensure it gets created */
+			readback =
+				vmw_ioctl_mob_map(device.drm_fd, mob_objs[i]);
+			memset(readback, 0, mob_objs[i]->size);
+			vmw_ioctl_mob_unmap(mob_objs[i]);
+		}
+
+		test_triangle_render(&device, cid);
+
+		for (i = 0; i < mob_num; i++) {
+			vmw_ioctl_mob_close_handle(device.drm_fd, mob_objs[i]);
+		}
+		free(mob_objs);
+	}
+
+	igt_fixture
+	{
+		vmw_ioctl_context_destroy(device.drm_fd, cid);
+		vmw_svga_device_fini(&device);
+	}
+}
\ No newline at end of file
diff --git a/tests/vmwgfx/ref_count.c b/tests/vmwgfx/ref_count.c
new file mode 100644
index 00000000..8a9318eb
--- /dev/null
+++ b/tests/vmwgfx/ref_count.c
@@ -0,0 +1,311 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+IGT_TEST_DESCRIPTION("Perform tests related to vmwgfx's ref_count codepaths.");
+
+static uint32 data[10] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
+
+static void write_to_mob(int fd, struct vmw_mob *mob)
+{
+	void *write_data;
+	write_data = vmw_ioctl_mob_map(fd, mob);
+	memcpy(write_data, data, sizeof(data));
+	vmw_ioctl_mob_unmap(mob);
+}
+
+static bool verify_mob_data(int fd, struct vmw_mob *mob)
+{
+	uint32 *read_data;
+	void *readback;
+	uint32 i;
+	bool data_is_equal = true;
+
+	read_data = malloc(mob->size);
+
+	readback = vmw_ioctl_mob_map(fd, mob);
+	memcpy(read_data, readback, sizeof(data));
+	vmw_ioctl_mob_unmap(mob);
+
+	for (i = 0; i < ARRAY_SIZE(data); i++) {
+		if (read_data[i] != data[i]) {
+			data_is_equal = false;
+			break;
+		}
+	}
+
+	free(read_data);
+	return data_is_equal;
+}
+
+static struct vmw_surface *
+create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
+{
+	struct vmw_mob mob = { 0 };
+	struct vmw_surface *surface;
+
+	surface = vmw_ioctl_create_surface_full(
+		fd, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
+		SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
+		SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, NULL,
+		drm_vmw_surface_flag_shareable);
+
+	mob.handle = surface->base.buffer_handle;
+	mob.map_handle = surface->base.buffer_map_handle;
+	mob.size = surface->base.buffer_size;
+
+	write_to_mob(fd, &mob);
+
+	return surface;
+}
+
+static bool ref_surface_and_check_contents(int32 fd, uint32 surface_handle)
+{
+	struct vmw_surface surface;
+	struct vmw_mob mob = { 0 };
+
+	surface = vmw_ioctl_surface_ref(fd, surface_handle,
+					DRM_VMW_HANDLE_LEGACY);
+
+	mob.handle = surface.base.handle;
+	mob.size = surface.base.buffer_size;
+	mob.map_handle = surface.base.buffer_map_handle;
+
+	return verify_mob_data(fd, &mob);
+}
+
+igt_main
+{
+	int32 fd1, fd2;
+	const uint32 size = sizeof(data);
+	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
+
+	igt_fixture
+	{
+		fd1 = drm_open_driver_render(DRIVER_VMWGFX);
+		fd2 = drm_open_driver_render(DRIVER_VMWGFX);
+		igt_require(fd1 != -1);
+		igt_require(fd2 != -1);
+	}
+
+	igt_subtest("surface_prime_transfer_explicit_mob")
+	{
+		struct vmw_mob *mob;
+		struct vmw_surface *surface;
+		int32 surface_fd;
+		uint32 surface_handle;
+
+		mob = vmw_ioctl_mob_create(fd1, size);
+		surface = vmw_ioctl_create_surface_full(
+			fd1, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
+			SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
+			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, mob,
+			drm_vmw_surface_flag_shareable);
+
+		write_to_mob(fd1, mob);
+
+		surface_fd =
+			prime_handle_to_fd_for_mmap(fd1, surface->base.handle);
+
+		vmw_ioctl_mob_close_handle(fd1, mob);
+		vmw_ioctl_surface_unref(fd1, surface);
+
+		surface_handle = prime_fd_to_handle(fd2, surface_fd);
+		close(surface_fd);
+
+		igt_assert(ref_surface_and_check_contents(fd2, surface_handle));
+	}
+
+	igt_subtest("surface_prime_transfer_implicit_mob")
+	{
+		struct vmw_surface *surface;
+		int32 surface_fd;
+		uint32 surface_handle;
+
+		surface = create_and_write_shareable_surface(fd1, surface_size);
+
+		surface_fd =
+			prime_handle_to_fd_for_mmap(fd1, surface->base.handle);
+
+		vmw_ioctl_surface_unref(fd1, surface);
+
+		surface_handle = prime_fd_to_handle(fd2, surface_fd);
+		close(surface_fd);
+
+		igt_assert(ref_surface_and_check_contents(fd2, surface_handle));
+	}
+
+	igt_subtest("surface_prime_transfer_fd_dup")
+	{
+		int32 surface_fd1, surface_fd2;
+		uint32 surface_handle;
+		struct vmw_surface *surface;
+
+		surface = create_and_write_shareable_surface(fd1, surface_size);
+
+		surface_fd1 =
+			prime_handle_to_fd_for_mmap(fd1, surface->base.handle);
+		vmw_ioctl_surface_unref(fd1, surface);
+
+		surface_fd2 = dup(surface_fd1);
+		close(surface_fd1);
+
+		surface_handle = prime_fd_to_handle(fd2, surface_fd2);
+		close(surface_fd2);
+
+		igt_assert(ref_surface_and_check_contents(fd2, surface_handle));
+	}
+
+	igt_subtest("surface_prime_transfer_two_surfaces")
+	{
+		int32 surface_fd;
+		uint32 surface_handle1, surface_handle2;
+		struct vmw_surface *surface1, *surface2;
+
+		surface1 =
+			create_and_write_shareable_surface(fd1, surface_size);
+		surface2 =
+			create_and_write_shareable_surface(fd1, surface_size);
+
+		surface_fd =
+			prime_handle_to_fd_for_mmap(fd1, surface1->base.handle);
+		vmw_ioctl_surface_unref(fd1, surface1);
+
+		surface_handle1 = prime_fd_to_handle(fd2, surface_fd);
+		close(surface_fd);
+
+		surface_fd =
+			prime_handle_to_fd_for_mmap(fd1, surface2->base.handle);
+		vmw_ioctl_surface_unref(fd1, surface2);
+
+		surface_handle2 = prime_fd_to_handle(fd2, surface_fd);
+		close(surface_fd);
+
+		igt_assert(
+			ref_surface_and_check_contents(fd2, surface_handle1));
+		igt_assert(
+			ref_surface_and_check_contents(fd2, surface_handle2));
+	}
+
+	igt_subtest("surface_prime_transfer_single_surface_multiple_handle")
+	{
+		int32 surface_fd;
+		uint32 surface_handle_old;
+		uint32 surface_handle1, surface_handle2, surface_handle3;
+		struct vmw_surface *surface;
+
+		surface = create_and_write_shareable_surface(fd1, surface_size);
+		surface_handle_old = surface->base.handle;
+
+		surface_fd =
+			prime_handle_to_fd_for_mmap(fd1, surface->base.handle);
+		vmw_ioctl_surface_unref(fd1, surface);
+
+		surface_handle1 = prime_fd_to_handle(fd1, surface_fd);
+		surface_handle2 = prime_fd_to_handle(fd2, surface_fd);
+		surface_handle3 = prime_fd_to_handle(fd2, surface_fd);
+		close(surface_fd);
+
+		igt_assert_eq_u32(surface_handle_old, surface_handle1);
+		igt_assert_eq_u32(surface_handle2, surface_handle3);
+
+		igt_assert(
+			ref_surface_and_check_contents(fd1, surface_handle1));
+		igt_assert(
+			ref_surface_and_check_contents(fd2, surface_handle2));
+	}
+
+	igt_subtest("mob_repeated_unref")
+	{
+		struct vmw_mob *mob;
+		int i = 0;
+
+		mob = vmw_ioctl_mob_create(fd1, size);
+		write_to_mob(fd1, mob);
+
+		/* Shouldn't crash on multiple invocations */
+		for (i = 0; i < 3; i++) {
+			int ret;
+			struct drm_vmw_handle_close_arg arg = {
+				.handle = mob->handle
+			};
+			ret = drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
+					      sizeof(arg));
+			igt_assert_eq(ret, 0);
+		}
+		free(mob);
+	}
+
+	igt_subtest("surface_repeated_unref")
+	{
+		struct vmw_surface *surface;
+		int i = 0;
+
+		surface = vmw_ioctl_create_surface_full(
+			fd1, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
+			SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
+			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, NULL,
+			drm_vmw_surface_flag_shareable);
+
+		/* Shouldn't crash on multiple invocations */
+		for (i = 0; i < 3; i++) {
+			struct drm_vmw_surface_arg s_arg = {
+				.sid = surface->base.handle,
+				.handle_type = DRM_VMW_HANDLE_LEGACY
+			};
+			drmCommandWrite(fd1, DRM_VMW_UNREF_SURFACE, &s_arg,
+					sizeof(s_arg));
+		}
+		free(surface);
+	}
+
+	igt_subtest("surface_alloc_ref_unref")
+	{
+		struct vmw_surface *surface;
+		struct vmw_surface ref_surface;
+		struct vmw_mob readback_mob = { 0 };
+
+		surface = create_and_write_shareable_surface(fd1, surface_size);
+
+		ref_surface = vmw_ioctl_surface_ref(fd1, surface->base.handle,
+						    DRM_VMW_HANDLE_LEGACY);
+
+		vmw_ioctl_surface_unref(fd1, surface);
+
+		readback_mob.handle = ref_surface.base.handle;
+		readback_mob.size = ref_surface.base.buffer_size;
+		readback_mob.map_handle = ref_surface.base.buffer_map_handle;
+
+		igt_assert(verify_mob_data(fd1, &readback_mob));
+	}
+
+	igt_fixture
+	{
+		close(fd1);
+		close(fd2);
+	}
+}
\ No newline at end of file
diff --git a/tests/vmwgfx/surface_copy.c b/tests/vmwgfx/surface_copy.c
new file mode 100644
index 00000000..3fb4db76
--- /dev/null
+++ b/tests/vmwgfx/surface_copy.c
@@ -0,0 +1,337 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+/**
+ * Compares two 2d surfaces to see if their size and contents are equal.
+ */
+static bool are_surfaces_identical(int fd, struct vmw_surface *s1,
+				   struct vmw_surface *s2)
+{
+	struct vmw_mob mob1 = { .size = s1->base.buffer_size,
+				.handle = s1->base.buffer_handle,
+				.map_handle = s1->base.buffer_map_handle };
+	struct vmw_mob mob2 = { .size = s2->base.buffer_size,
+				.handle = s2->base.buffer_handle,
+				.map_handle = s2->base.buffer_map_handle };
+	char *readback1;
+	char *readback2;
+	bool is_equal = true;
+	uint32 i, j;
+	uint32 stride1, stride2, height, width;
+
+	if ((s1->params.base.base_size.width !=
+	     s2->params.base.base_size.width) ||
+	    (s1->params.base.base_size.height !=
+	     s2->params.base.base_size.height)) {
+		return false;
+	}
+	width = s1->params.base.base_size.width;
+	height = s1->params.base.base_size.height;
+	stride1 = s1->params.buffer_byte_stride == 0 ?
+			  width :
+			  s1->params.buffer_byte_stride;
+	stride2 = s2->params.buffer_byte_stride == 0 ?
+			  width :
+			  s2->params.buffer_byte_stride;
+
+	readback1 = vmw_ioctl_mob_map(fd, &mob1);
+	readback2 = vmw_ioctl_mob_map(fd, &mob2);
+	for (i = 0; i < width; i++) {
+		for (j = 0; j < height; j++) {
+			if (readback1[j * stride1 + i] !=
+			    readback2[j * stride2 + i]) {
+				is_equal = false;
+				goto are_surfaces_identical_end;
+			}
+		}
+	}
+are_surfaces_identical_end:
+	vmw_ioctl_mob_unmap(&mob1);
+	vmw_ioctl_mob_unmap(&mob2);
+	return is_equal;
+}
+
+static void set_surface_value(int fd, struct vmw_surface *surface, char value)
+{
+	struct vmw_mob mob = { .size = surface->base.buffer_size,
+			       .handle = surface->base.buffer_handle,
+			       .map_handle = surface->base.buffer_map_handle };
+	char *readback;
+
+	readback = vmw_ioctl_mob_map(fd, &mob);
+	memset(readback, value, mob.size);
+	vmw_ioctl_mob_unmap(&mob);
+}
+
+static void exec_surface_copy(struct vmw_execbuf *cmd_buf,
+			      struct drm_vmw_fence_rep *cmd_fence,
+			      SVGA3dSurfaceImageId src,
+			      SVGA3dSurfaceImageId dest, SVGA3dCopyBox *box)
+{
+	vmw_cmd_surface_copy(cmd_buf, src, dest, box, 1);
+	vmw_execbuf_submit(cmd_buf, cmd_fence);
+	vmw_ioctl_fence_finish(cmd_buf->drm_fd, cmd_fence);
+}
+
+static void test_invalid_copies(int fd, int32 cid)
+{
+	struct vmw_surface *s1;
+	struct vmw_surface *s2;
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence;
+	SVGA3dSize surface_size;
+	SVGA3dCopyBox box;
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dest;
+	SVGA3dSurfaceImageId bad_surface;
+
+	surface_size.width = 128;
+	surface_size.height = 128;
+	surface_size.depth = 1;
+
+	igt_require(
+		vmw_is_format_supported(fd, SVGA3D_DEVCAP_SURFACEFMT_A8R8G8B8));
+
+	s1 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
+				       NULL);
+	s2 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
+				       NULL);
+	cmd_buf = vmw_execbuf_create(fd, cid);
+
+	box.x = 0;
+	box.y = 0;
+	box.z = 0;
+	box.w = 1;
+	box.h = 1;
+	box.d = 1;
+	box.srcx = 0;
+	box.srcy = 0;
+	box.srcz = 0;
+
+	src.sid = s1->base.handle;
+	src.face = 0;
+	src.mipmap = 0;
+	dest.sid = s2->base.handle;
+	dest.face = 0;
+	dest.mipmap = 0;
+
+	/* Testing a valid copy first */
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(are_surfaces_identical(fd, s1, s2));
+
+	/* Setting surfaces to different values */
+	set_surface_value(fd, s1, 0);
+	set_surface_value(fd, s2, 16);
+
+	/* Testing invalid copies */
+
+	/* x */
+	box.x = 129;
+	box.w = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.x = 0;
+	box.w = 129;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcx = 129;
+	box.w = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcx = 0;
+	box.w = 129;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	/* y */
+	box.y = 129;
+	box.h = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.y = 0;
+	box.h = 129;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcy = 129;
+	box.h = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcy = 0;
+	box.h = 129;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	/* z */
+	box.z = 2;
+	box.d = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.z = 0;
+	box.d = 2;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcz = 2;
+	box.d = 1;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	box.srcz = 0;
+	box.d = 2;
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	/* Invalid surface id */
+	bad_surface.sid = src.sid + dest.sid + 1;
+	bad_surface.face = 0;
+	bad_surface.mipmap = 0;
+
+	box.x = 0;
+	box.y = 0;
+	box.z = 0;
+	box.w = 1;
+	box.h = 1;
+	box.d = 1;
+	box.srcx = 0;
+	box.srcy = 0;
+	box.srcz = 0;
+
+	vmw_cmd_surface_copy(cmd_buf, bad_surface, dest, &box, 1);
+	igt_assert(vmw_execbuf_submit(cmd_buf, &cmd_fence) != 0);
+
+	vmw_cmd_surface_copy(cmd_buf, src, bad_surface, &box, 1);
+	igt_assert(vmw_execbuf_submit(cmd_buf, &cmd_fence) != 0);
+	vmw_ioctl_fence_finish(fd, &cmd_fence);
+
+	bad_surface.sid = src.sid;
+	bad_surface.face = 2;
+
+	exec_surface_copy(cmd_buf, &cmd_fence, bad_surface, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	exec_surface_copy(cmd_buf, &cmd_fence, src, bad_surface, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	vmw_execbuf_destroy(cmd_buf);
+	vmw_ioctl_surface_unref(fd, s1);
+	vmw_ioctl_surface_unref(fd, s2);
+}
+
+static void test_invalid_copies_3d(int fd, int32 cid)
+{
+	struct vmw_surface *s1;
+	struct vmw_surface *s2;
+	struct vmw_execbuf *cmd_buf;
+	struct drm_vmw_fence_rep cmd_fence;
+	SVGA3dSize surface_size;
+	SVGA3dCopyBox box;
+	SVGA3dSurfaceImageId src;
+	SVGA3dSurfaceImageId dest;
+
+	surface_size.width = 128;
+	surface_size.height = 128;
+	surface_size.depth = 1;
+
+	igt_require(
+		vmw_is_format_supported(fd, SVGA3D_DEVCAP_SURFACEFMT_A8R8G8B8));
+	igt_require(vmw_is_format_supported(fd, SVGA3D_DEVCAP_DXFMT_Z_D32));
+
+	s1 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
+				       NULL);
+	s2 = vmw_create_surface_simple(fd, 0, SVGA3D_Z_D32, surface_size, NULL);
+	cmd_buf = vmw_execbuf_create(fd, cid);
+
+	box.x = 0;
+	box.y = 0;
+	box.z = 0;
+	box.w = 10;
+	box.h = 10;
+	box.d = 10;
+	box.srcx = 0;
+	box.srcy = 0;
+	box.srcz = 0;
+
+	src.sid = s1->base.handle;
+	src.face = 0;
+	src.mipmap = 0;
+	dest.sid = s2->base.handle;
+	dest.face = 0;
+	dest.mipmap = 0;
+
+	set_surface_value(fd, s1, 0);
+	set_surface_value(fd, s2, 16);
+
+	exec_surface_copy(cmd_buf, &cmd_fence, src, dest, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	exec_surface_copy(cmd_buf, &cmd_fence, dest, src, &box);
+	igt_assert(!are_surfaces_identical(fd, s1, s2));
+
+	vmw_execbuf_destroy(cmd_buf);
+	vmw_ioctl_surface_unref(fd, s1);
+	vmw_ioctl_surface_unref(fd, s2);
+}
+
+igt_main
+{
+	int fd;
+	int32 cid;
+
+	igt_fixture
+	{
+		fd = drm_open_driver_render(DRIVER_VMWGFX);
+		igt_require(fd != -1);
+
+		cid = vmw_ioctl_context_create(fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+	}
+
+	igt_subtest("test_invalid_copies")
+	{
+		test_invalid_copies(fd, cid);
+	}
+
+	igt_subtest("test_invalid_copies_3d")
+	{
+		igt_require(vmw_ioctl_get_param(fd, DRM_VMW_PARAM_3D));
+		test_invalid_copies_3d(fd, cid);
+	}
+
+	igt_fixture
+	{
+		vmw_ioctl_context_destroy(fd, cid);
+		close(fd);
+	}
+}
\ No newline at end of file
diff --git a/tests/vmwgfx/tri.c b/tests/vmwgfx/tri.c
new file mode 100644
index 00000000..81ccb30b
--- /dev/null
+++ b/tests/vmwgfx/tri.c
@@ -0,0 +1,208 @@
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ * SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+static void draw_triangle(struct vmw_svga_device *device, int32 cid)
+{
+	struct vmw_default_objects objects;
+	uint8 *rendered_img;
+	bool save_status;
+
+	vmw_create_default_objects(device, cid, &objects,
+				   &vmw_default_rect_size);
+	rendered_img = vmw_triangle_draw(device, cid, &objects, true);
+
+	save_status = vmw_save_data_as_png(objects.color_rt, rendered_img,
+					   "vmwgfx_tri.png");
+	igt_assert(save_status);
+
+	vmw_triangle_assert_values(rendered_img, objects.color_rt);
+
+	/* Clean up */
+	free(rendered_img);
+	vmw_destroy_default_objects(device, &objects);
+}
+
+static void replace_with_coherent_rt(struct vmw_svga_device *device,
+				     int32 context_id,
+				     struct vmw_default_objects *objects,
+				     const SVGA3dSize *rt_size)
+{
+	struct vmw_execbuf *cmd_buf;
+	SVGA3dRenderTargetViewDesc rtv_desc = { 0 };
+	SVGA3dCmdDXDefineRenderTargetView rt_view_define_cmd = { 0 };
+	SVGA3dCmdDXDefineDepthStencilView ds_view_define_cmd = { 0 };
+
+	objects->color_rt = vmw_ioctl_create_surface_full(
+		device->drm_fd,
+		SVGA3D_SURFACE_HINT_TEXTURE | SVGA3D_SURFACE_HINT_RENDERTARGET |
+			SVGA3D_SURFACE_BIND_RENDER_TARGET,
+		SVGA3D_R8G8B8A8_UNORM, 0, SVGA3D_MS_PATTERN_NONE,
+		SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
+		NULL, drm_vmw_surface_flag_coherent);
+
+	objects->depth_rt = vmw_ioctl_create_surface_full(
+		device->drm_fd,
+		SVGA3D_SURFACE_HINT_DEPTHSTENCIL |
+			SVGA3D_SURFACE_HINT_RENDERTARGET |
+			SVGA3D_SURFACE_BIND_DEPTH_STENCIL,
+		SVGA3D_R24G8_TYPELESS, 0, SVGA3D_MS_PATTERN_NONE,
+		SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
+		NULL, drm_vmw_surface_flag_coherent);
+
+	cmd_buf = vmw_execbuf_create(device->drm_fd, context_id);
+
+	rtv_desc.tex.arraySize = 1;
+	rtv_desc.tex.firstArraySlice = 0;
+	rtv_desc.tex.mipSlice = 0;
+	vmw_bitvector_find_next_bit(device->rt_view_bv,
+				    &rt_view_define_cmd.renderTargetViewId);
+	rt_view_define_cmd.sid = objects->color_rt->base.handle;
+	rt_view_define_cmd.format = SVGA3D_R8G8B8A8_UNORM;
+	rt_view_define_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
+	rt_view_define_cmd.desc = rtv_desc;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_RENDERTARGET_VIEW,
+			   &rt_view_define_cmd, sizeof rt_view_define_cmd, NULL,
+			   0);
+	objects->color_rt_id = rt_view_define_cmd.renderTargetViewId;
+
+	vmw_bitvector_find_next_bit(device->ds_view_bv,
+				    &ds_view_define_cmd.depthStencilViewId);
+	ds_view_define_cmd.sid = objects->depth_rt->base.handle;
+	ds_view_define_cmd.format = SVGA3D_D24_UNORM_S8_UINT;
+	ds_view_define_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
+	ds_view_define_cmd.mipSlice = 0;
+	ds_view_define_cmd.firstArraySlice = 0,
+	ds_view_define_cmd.arraySize = 1;
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW,
+			   &ds_view_define_cmd, sizeof ds_view_define_cmd, NULL,
+			   0);
+	objects->ds_view_id = ds_view_define_cmd.depthStencilViewId;
+
+	vmw_execbuf_submit(cmd_buf, NULL);
+	vmw_execbuf_destroy(cmd_buf);
+}
+
+static void destroy_rt(struct vmw_svga_device *device, int32 context_id,
+		       struct vmw_default_objects *objects)
+{
+	struct vmw_execbuf *cmd_buf;
+
+	SVGA3dCmdDXDestroyRenderTargetView rt_view_cmd = {
+		.renderTargetViewId = objects->color_rt_id
+	};
+
+	SVGA3dCmdDXDestroyDepthStencilView ds_view_cmd = {
+		.depthStencilViewId = objects->ds_view_id
+	};
+
+	cmd_buf = vmw_execbuf_create(device->drm_fd, objects->context_id);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_RENDERTARGET_VIEW,
+			   &rt_view_cmd, sizeof rt_view_cmd, NULL, 0);
+
+	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_VIEW,
+			   &ds_view_cmd, sizeof ds_view_cmd, NULL, 0);
+
+	vmw_ioctl_surface_unref(device->drm_fd, objects->color_rt);
+	vmw_ioctl_surface_unref(device->drm_fd, objects->depth_rt);
+
+	vmw_bitvector_free_bit(device->rt_view_bv, objects->color_rt_id);
+	vmw_bitvector_free_bit(device->ds_view_bv, objects->ds_view_id);
+
+	vmw_execbuf_submit(cmd_buf, NULL);
+	vmw_execbuf_destroy(cmd_buf);
+}
+
+static void draw_triangle_on_coherent_rt(struct vmw_svga_device *device,
+					 int32 cid)
+{
+	struct vmw_default_objects objects;
+	uint8 *rendered_img;
+	struct vmw_surface *default_color_rt;
+	struct vmw_surface *default_depth_rt;
+	SVGA3dRenderTargetViewId default_color_rt_id;
+	SVGA3dDepthStencilViewId default_ds_view_id;
+
+	vmw_create_default_objects(device, cid, &objects,
+				   &vmw_default_rect_size);
+
+	/* Replace default rendertargets with coherent equivalents */
+	default_color_rt = objects.color_rt;
+	default_depth_rt = objects.depth_rt;
+	default_color_rt_id = objects.color_rt_id;
+	default_ds_view_id = objects.ds_view_id;
+	replace_with_coherent_rt(device, cid, &objects, &vmw_default_rect_size);
+
+	rendered_img = vmw_triangle_draw(device, cid, &objects, false);
+
+	vmw_triangle_assert_values(rendered_img, objects.color_rt);
+
+	/* Clean up */
+	free(rendered_img);
+
+	destroy_rt(device, cid, &objects);
+	objects.color_rt = default_color_rt;
+	objects.depth_rt = default_depth_rt;
+	objects.color_rt_id = default_color_rt_id;
+	objects.ds_view_id = default_ds_view_id;
+
+	vmw_destroy_default_objects(device, &objects);
+}
+
+igt_main
+{
+	struct vmw_svga_device device;
+	int32 cid;
+
+	igt_fixture
+	{
+		vmw_svga_device_init(&device, vmw_svga_device_node_render);
+		igt_require(device.drm_fd != -1);
+
+		cid = vmw_ioctl_context_create(device.drm_fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+	}
+
+	igt_subtest("tri")
+	{
+		draw_triangle(&device, cid);
+	}
+
+	/* Check that vmwgfx correctly handles coherent rendertarget
+           surfaces when no explicit sync is given from userspace */
+	igt_subtest("tri-no-sync-coherent")
+	{
+		draw_triangle_on_coherent_rt(&device, cid);
+	}
+
+	igt_fixture
+	{
+		vmw_ioctl_context_destroy(device.drm_fd, cid);
+		vmw_svga_device_fini(&device);
+	}
+}
\ No newline at end of file
-- 
2.37.2
