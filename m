Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2B110E07B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 05:17:14 +0000 (UTC)
Date: Fri, 20 Oct 2023 05:16:58 +0000
To: igt-dev@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Message-ID: <20231020051651.100647-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH v3] drm-uapi: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sync with drm-next commit 27442758e9b4e083bef3f164a1739475c01f3202.

This is required for:
https://patchwork.freedesktop.org/patch/547602/?series=3D120551&rev=3D4

v2: drop redefinitions from lib/i915/i915_drm_local.h

v3: refresh drm-next, only sync core DRM headers

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
---
 include/drm-uapi/drm.h        | 157 ++++++++++++++++++++++++++++----
 include/drm-uapi/drm_fourcc.h |   2 +-
 include/drm-uapi/drm_mode.h   | 166 +++++++++++++++++++++++++++-------
 3 files changed, 276 insertions(+), 49 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4c3a..02540248deb1 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -667,8 +667,11 @@ struct drm_gem_open {
  * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IM=
PORT
  * and &DRM_PRIME_CAP_EXPORT.
  *
- * PRIME buffers are exposed as dma-buf file descriptors. See
- * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
+ * Starting from kernel version 6.6, both &DRM_PRIME_CAP_IMPORT and
+ * &DRM_PRIME_CAP_EXPORT are always advertised.
+ *
+ * PRIME buffers are exposed as dma-buf file descriptors.
+ * See :ref:`prime_buffer_sharing`.
  */
 #define DRM_CAP_PRIME=09=09=090x5
 /**
@@ -676,6 +679,8 @@ struct drm_gem_open {
  *
  * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRI=
ME
  * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
+ *
+ * Starting from kernel version 6.6, this bit is always set in &DRM_CAP_PR=
IME.
  */
 #define  DRM_PRIME_CAP_IMPORT=09=090x1
 /**
@@ -683,6 +688,8 @@ struct drm_gem_open {
  *
  * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRI=
ME
  * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
+ *
+ * Starting from kernel version 6.6, this bit is always set in &DRM_CAP_PR=
IME.
  */
 #define  DRM_PRIME_CAP_EXPORT=09=090x2
 /**
@@ -750,15 +757,14 @@ struct drm_gem_open {
 /**
  * DRM_CAP_SYNCOBJ
  *
- * If set to 1, the driver supports sync objects. See
- * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ * If set to 1, the driver supports sync objects. See :ref:`drm_sync_objec=
ts`.
  */
 #define DRM_CAP_SYNCOBJ=09=090x13
 /**
  * DRM_CAP_SYNCOBJ_TIMELINE
  *
  * If set to 1, the driver supports timeline operations on sync objects. S=
ee
- * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ * :ref:`drm_sync_objects`.
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE=090x14
=20
@@ -903,6 +909,27 @@ struct drm_syncobj_timeline_wait {
 =09__u32 pad;
 };
=20
+/**
+ * struct drm_syncobj_eventfd
+ * @handle: syncobj handle.
+ * @flags: Zero to wait for the point to be signalled, or
+ *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to b=
e
+ *         available for the point.
+ * @point: syncobj timeline point (set to zero for binary syncobjs).
+ * @fd: Existing eventfd to sent events to.
+ * @pad: Must be zero.
+ *
+ * Register an eventfd to be signalled by a syncobj. The eventfd counter w=
ill
+ * be incremented by one.
+ */
+struct drm_syncobj_eventfd {
+=09__u32 handle;
+=09__u32 flags;
+=09__u64 point;
+=09__s32 fd;
+=09__u32 pad;
+};
+
=20
 struct drm_syncobj_array {
 =09__u64 handles;
@@ -966,6 +993,19 @@ extern "C" {
 #define DRM_IOCTL_GET_STATS             DRM_IOR( 0x06, struct drm_stats)
 #define DRM_IOCTL_SET_VERSION=09=09DRM_IOWR(0x07, struct drm_set_version)
 #define DRM_IOCTL_MODESET_CTL           DRM_IOW(0x08, struct drm_modeset_c=
tl)
+/**
+ * DRM_IOCTL_GEM_CLOSE - Close a GEM handle.
+ *
+ * GEM handles are not reference-counted by the kernel. User-space is
+ * responsible for managing their lifetime. For example, if user-space imp=
orts
+ * the same memory object twice on the same DRM file description, the same=
 GEM
+ * handle is returned by both imports, and user-space needs to ensure
+ * &DRM_IOCTL_GEM_CLOSE is performed once only. The same situation can hap=
pen
+ * when a memory object is allocated, then exported and imported again on =
the
+ * same DRM file description. The &DRM_IOCTL_MODE_GETFB2 IOCTL is an excep=
tion
+ * and always returns fresh new GEM handles even if an existing GEM handle
+ * already refers to the same memory object before the IOCTL is performed.
+ */
 #define DRM_IOCTL_GEM_CLOSE=09=09DRM_IOW (0x09, struct drm_gem_close)
 #define DRM_IOCTL_GEM_FLINK=09=09DRM_IOWR(0x0a, struct drm_gem_flink)
 #define DRM_IOCTL_GEM_OPEN=09=09DRM_IOWR(0x0b, struct drm_gem_open)
@@ -1006,7 +1046,37 @@ extern "C" {
 #define DRM_IOCTL_UNLOCK=09=09DRM_IOW( 0x2b, struct drm_lock)
 #define DRM_IOCTL_FINISH=09=09DRM_IOW( 0x2c, struct drm_lock)
=20
+/**
+ * DRM_IOCTL_PRIME_HANDLE_TO_FD - Convert a GEM handle to a DMA-BUF FD.
+ *
+ * User-space sets &drm_prime_handle.handle with the GEM handle to export =
and
+ * &drm_prime_handle.flags, and gets back a DMA-BUF file descriptor in
+ * &drm_prime_handle.fd.
+ *
+ * The export can fail for any driver-specific reason, e.g. because export=
 is
+ * not supported for this specific GEM handle (but might be for others).
+ *
+ * Support for exporting DMA-BUFs is advertised via &DRM_PRIME_CAP_EXPORT.
+ */
 #define DRM_IOCTL_PRIME_HANDLE_TO_FD    DRM_IOWR(0x2d, struct drm_prime_ha=
ndle)
+/**
+ * DRM_IOCTL_PRIME_FD_TO_HANDLE - Convert a DMA-BUF FD to a GEM handle.
+ *
+ * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor to
+ * import, and gets back a GEM handle in &drm_prime_handle.handle.
+ * &drm_prime_handle.flags is unused.
+ *
+ * If an existing GEM handle refers to the memory object backing the DMA-B=
UF,
+ * that GEM handle is returned. Therefore user-space which needs to handle
+ * arbitrary DMA-BUFs must have a user-space lookup data structure to manu=
ally
+ * reference-count duplicated GEM handles. For more information see
+ * &DRM_IOCTL_GEM_CLOSE.
+ *
+ * The import can fail for any driver-specific reason, e.g. because import=
 is
+ * only supported for DMA-BUFs allocated on this DRM device.
+ *
+ * Support for importing DMA-BUFs is advertised via &DRM_PRIME_CAP_IMPORT.
+ */
 #define DRM_IOCTL_PRIME_FD_TO_HANDLE    DRM_IOWR(0x2e, struct drm_prime_ha=
ndle)
=20
 #define DRM_IOCTL_AGP_ACQUIRE=09=09DRM_IO(  0x30)
@@ -1090,8 +1160,38 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER=09DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=09DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
=20
+/**
+ * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
+ *
+ * This queries metadata about a framebuffer. User-space fills
+ * &drm_mode_fb_cmd2.fb_id as the input, and the kernels fills the rest of=
 the
+ * struct as the output.
+ *
+ * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.ha=
ndles
+ * will be filled with GEM buffer handles. Fresh new GEM handles are alway=
s
+ * returned, even if another GEM handle referring to the same memory objec=
t
+ * already exists on the DRM file description. The caller is responsible f=
or
+ * removing the new handles, e.g. via the &DRM_IOCTL_GEM_CLOSE IOCTL. The =
same
+ * new handle will be returned for multiple planes in case they use the sa=
me
+ * memory object. Planes are valid until one has a zero handle -- this can=
 be
+ * used to compute the number of planes.
+ *
+ * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are vali=
d
+ * until one has a zero &drm_mode_fb_cmd2.pitches.
+ *
+ * If the framebuffer has a format modifier, &DRM_MODE_FB_MODIFIERS will b=
e set
+ * in &drm_mode_fb_cmd2.flags and &drm_mode_fb_cmd2.modifier will contain =
the
+ * modifier. Otherwise, user-space must ignore &drm_mode_fb_cmd2.modifier.
+ *
+ * To obtain DMA-BUF FDs for each plane without leaking GEM handles, user-=
space
+ * can export each handle via &DRM_IOCTL_PRIME_HANDLE_TO_FD, then immediat=
ely
+ * close each unique handle via &DRM_IOCTL_GEM_CLOSE, making sure to not
+ * double-close handles which are specified multiple times in the array.
+ */
 #define DRM_IOCTL_MODE_GETFB2=09=09DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
=20
+#define DRM_IOCTL_SYNCOBJ_EVENTFD=09DRM_IOWR(0xCF, struct drm_syncobj_even=
tfd)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
@@ -1103,25 +1203,50 @@ extern "C" {
 #define DRM_COMMAND_BASE                0x40
 #define DRM_COMMAND_END=09=09=090xA0
=20
-/*
- * Header for events written back to userspace on the drm fd.  The
- * type defines the type of event, the length specifies the total
- * length of the event (including the header), and user_data is
- * typically a 64 bit value passed with the ioctl that triggered the
- * event.  A read on the drm fd will always only return complete
- * events, that is, if for example the read buffer is 100 bytes, and
- * there are two 64 byte events pending, only one will be returned.
- *
- * Event types 0 - 0x7fffffff are generic drm events, 0x80000000 and
- * up are chipset specific.
+/**
+ * struct drm_event - Header for DRM events
+ * @type: event type.
+ * @length: total number of payload bytes (including header).
+ *
+ * This struct is a header for events written back to user-space on the DR=
M FD.
+ * A read on the DRM FD will always only return complete events: e.g. if t=
he
+ * read buffer is 100 bytes large and there are two 64 byte events pending=
,
+ * only one will be returned.
+ *
+ * Event types 0 - 0x7fffffff are generic DRM events, 0x80000000 and
+ * up are chipset specific. Generic DRM events include &DRM_EVENT_VBLANK,
+ * &DRM_EVENT_FLIP_COMPLETE and &DRM_EVENT_CRTC_SEQUENCE.
  */
 struct drm_event {
 =09__u32 type;
 =09__u32 length;
 };
=20
+/**
+ * DRM_EVENT_VBLANK - vertical blanking event
+ *
+ * This event is sent in response to &DRM_IOCTL_WAIT_VBLANK with the
+ * &_DRM_VBLANK_EVENT flag set.
+ *
+ * The event payload is a struct drm_event_vblank.
+ */
 #define DRM_EVENT_VBLANK 0x01
+/**
+ * DRM_EVENT_FLIP_COMPLETE - page-flip completion event
+ *
+ * This event is sent in response to an atomic commit or legacy page-flip =
with
+ * the &DRM_MODE_PAGE_FLIP_EVENT flag set.
+ *
+ * The event payload is a struct drm_event_vblank.
+ */
 #define DRM_EVENT_FLIP_COMPLETE 0x02
+/**
+ * DRM_EVENT_CRTC_SEQUENCE - CRTC sequence event
+ *
+ * This event is sent in response to &DRM_IOCTL_CRTC_QUEUE_SEQUENCE.
+ *
+ * The event payload is a struct drm_event_crtc_sequence.
+ */
 #define DRM_EVENT_CRTC_SEQUENCE=090x03
=20
 struct drm_event_vblank {
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 8db7fd3f743e..6b6235f7a7cd 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -934,7 +934,7 @@ extern "C" {
  * which corresponds to the "generic" kind used for simple single-sample
  * uncompressed color formats on Fermi - Volta GPUs.
  */
-static inline __u64
+static __inline__ __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
 =09if (!(modifier & 0x10) || (modifier & (0xff << 12)))
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e4a2570a6058..ea1b639bcb28 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -488,6 +488,9 @@ struct drm_mode_get_connector {
 =09 * This is not an object ID. This is a per-type connector number. Each
 =09 * (type, type_id) combination is unique across all connectors of a DRM
 =09 * device.
+=09 *
+=09 * The (type, type_id) combination is not a stable identifier: the
+=09 * type_id can change depending on the driver probe order.
 =09 */
 =09__u32 connector_type_id;
=20
@@ -663,41 +666,73 @@ struct drm_mode_fb_cmd {
 #define DRM_MODE_FB_INTERLACED=09(1<<0) /* for interlaced framebuffers */
 #define DRM_MODE_FB_MODIFIERS=09(1<<1) /* enables ->modifer[] */
=20
+/**
+ * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
+ *
+ * This struct holds frame-buffer metadata. There are two ways to use it:
+ *
+ * - User-space can fill this struct and perform a &DRM_IOCTL_MODE_ADDFB2
+ *   ioctl to register a new frame-buffer. The new frame-buffer object ID =
will
+ *   be set by the kernel in @fb_id.
+ * - User-space can set @fb_id and perform a &DRM_IOCTL_MODE_GETFB2 ioctl =
to
+ *   fetch metadata about an existing frame-buffer.
+ *
+ * In case of planar formats, this struct allows up to 4 buffer objects wi=
th
+ * offsets and pitches per plane. The pitch and offset order are dictated =
by
+ * the format FourCC as defined by ``drm_fourcc.h``, e.g. NV12 is describe=
d as:
+ *
+ *     YUV 4:2:0 image with a plane of 8-bit Y samples followed by an
+ *     interleaved U/V plane containing 8-bit 2x2 subsampled colour differ=
ence
+ *     samples.
+ *
+ * So it would consist of a Y plane at ``offsets[0]`` and a UV plane at
+ * ``offsets[1]``.
+ *
+ * To accommodate tiled, compressed, etc formats, a modifier can be specif=
ied.
+ * For more information see the "Format Modifiers" section. Note that even
+ * though it looks like we have a modifier per-plane, we in fact do not. T=
he
+ * modifier for each plane must be identical. Thus all combinations of
+ * different data layouts for multi-plane formats must be enumerated as
+ * separate modifiers.
+ *
+ * All of the entries in @handles, @pitches, @offsets and @modifier must b=
e
+ * zero when unused. Warning, for @offsets and @modifier zero can't be use=
d to
+ * figure out whether the entry is used or not since it's a valid value (a=
 zero
+ * offset is common, and a zero modifier is &DRM_FORMAT_MOD_LINEAR).
+ */
 struct drm_mode_fb_cmd2 {
+=09/** @fb_id: Object ID of the frame-buffer. */
 =09__u32 fb_id;
+=09/** @width: Width of the frame-buffer. */
 =09__u32 width;
+=09/** @height: Height of the frame-buffer. */
 =09__u32 height;
-=09__u32 pixel_format; /* fourcc code from drm_fourcc.h */
-=09__u32 flags; /* see above flags */
+=09/**
+=09 * @pixel_format: FourCC format code, see ``DRM_FORMAT_*`` constants in
+=09 * ``drm_fourcc.h``.
+=09 */
+=09__u32 pixel_format;
+=09/**
+=09 * @flags: Frame-buffer flags (see &DRM_MODE_FB_INTERLACED and
+=09 * &DRM_MODE_FB_MODIFIERS).
+=09 */
+=09__u32 flags;
=20
-=09/*
-=09 * In case of planar formats, this ioctl allows up to 4
-=09 * buffer objects with offsets and pitches per plane.
-=09 * The pitch and offset order is dictated by the fourcc,
-=09 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
-=09 *
-=09 *   YUV 4:2:0 image with a plane of 8 bit Y samples
-=09 *   followed by an interleaved U/V plane containing
-=09 *   8 bit 2x2 subsampled colour difference samples.
-=09 *
-=09 * So it would consist of Y as offsets[0] and UV as
-=09 * offsets[1].  Note that offsets[0] will generally
-=09 * be 0 (but this is not required).
-=09 *
-=09 * To accommodate tiled, compressed, etc formats, a
-=09 * modifier can be specified.  The default value of zero
-=09 * indicates "native" format as specified by the fourcc.
-=09 * Vendor specific modifier token.  Note that even though
-=09 * it looks like we have a modifier per-plane, we in fact
-=09 * do not. The modifier for each plane must be identical.
-=09 * Thus all combinations of different data layouts for
-=09 * multi plane formats must be enumerated as separate
-=09 * modifiers.
+=09/**
+=09 * @handles: GEM buffer handle, one per plane. Set to 0 if the plane is
+=09 * unused. The same handle can be used for multiple planes.
 =09 */
 =09__u32 handles[4];
-=09__u32 pitches[4]; /* pitch for each plane */
-=09__u32 offsets[4]; /* offset of each plane */
-=09__u64 modifier[4]; /* ie, tiling, compress */
+=09/** @pitches: Pitch (aka. stride) in bytes, one per plane. */
+=09__u32 pitches[4];
+=09/** @offsets: Offset into the buffer in bytes, one per plane. */
+=09__u32 offsets[4];
+=09/**
+=09 * @modifier: Format modifier, one per plane. See ``DRM_FORMAT_MOD_*``
+=09 * constants in ``drm_fourcc.h``. All planes must use the same
+=09 * modifier. Ignored unless &DRM_MODE_FB_MODIFIERS is set in @flags.
+=09 */
+=09__u64 modifier[4];
 };
=20
 #define DRM_MODE_FB_DIRTY_ANNOTATE_COPY 0x01
@@ -802,6 +837,11 @@ struct drm_color_ctm {
 =09/*
 =09 * Conversion matrix in S31.32 sign-magnitude
 =09 * (not two's complement!) format.
+=09 *
+=09 * out   matrix    in
+=09 * |R|   |0 1 2|   |R|
+=09 * |G| =3D |3 4 5| x |G|
+=09 * |B|   |6 7 8|   |B|
 =09 */
 =09__u64 matrix[9];
 };
@@ -846,7 +886,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} display_primaries[3];
+=09} display_primaries[3];
 =09/**
 =09 * @white_point: White Point of Colorspace Data.
 =09 * These are coded as unsigned 16-bit values in units of
@@ -857,7 +897,7 @@ struct hdr_metadata_infoframe {
 =09 */
 =09struct {
 =09=09__u16 x, y;
-=09=09} white_point;
+=09} white_point;
 =09/**
 =09 * @max_display_mastering_luminance: Max Mastering Display Luminance.
 =09 * This value is coded as an unsigned 16-bit value in units of 1 cd/m2,
@@ -903,12 +943,31 @@ struct hdr_output_metadata {
 =09};
 };
=20
+/**
+ * DRM_MODE_PAGE_FLIP_EVENT
+ *
+ * Request that the kernel sends back a vblank event (see
+ * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when th=
e
+ * page-flip is done.
+ */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
+/**
+ * DRM_MODE_PAGE_FLIP_ASYNC
+ *
+ * Request that the page-flip is performed as soon as possible, ie. with n=
o
+ * delay due to waiting for vblank. This may cause tearing to be visible o=
n
+ * the screen.
+ */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
 #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
 #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
 =09=09=09=09   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
+/**
+ * DRM_MODE_PAGE_FLIP_FLAGS
+ *
+ * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
+ */
 #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_ASYNC | \
 =09=09=09=09  DRM_MODE_PAGE_FLIP_TARGET)
@@ -1002,11 +1061,53 @@ struct drm_mode_destroy_dumb {
 =09__u32 handle;
 };
=20
-/* page-flip flags are valid, plus: */
+/**
+ * DRM_MODE_ATOMIC_TEST_ONLY
+ *
+ * Do not apply the atomic commit, instead check whether the hardware supp=
orts
+ * this configuration.
+ *
+ * See &drm_mode_config_funcs.atomic_check for more details on test-only
+ * commits.
+ */
 #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
+/**
+ * DRM_MODE_ATOMIC_NONBLOCK
+ *
+ * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_ATOM=
IC
+ * IOCTL returns immediately instead of waiting for the changes to be appl=
ied
+ * in hardware. Note, the driver will still check that the update can be
+ * applied before retuning.
+ */
 #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
+/**
+ * DRM_MODE_ATOMIC_ALLOW_MODESET
+ *
+ * Allow the update to result in temporary or transient visible artifacts =
while
+ * the update is being applied. Applying the update may also take signific=
antly
+ * more time than a page flip. All visual artifacts will disappear by the =
time
+ * the update is completed, as signalled through the vblank event's timest=
amp
+ * (see struct drm_event_vblank).
+ *
+ * This flag must be set when the KMS update might cause visible artifacts=
.
+ * Without this flag such KMS update will return a EINVAL error. What kind=
 of
+ * update may cause visible artifacts depends on the driver and the hardwa=
re.
+ * User-space that needs to know beforehand if an update might cause visib=
le
+ * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
+ * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
+ *
+ * To the best of the driver's knowledge, visual artifacts are guaranteed =
to
+ * not appear when this flag is not set. Some sinks might display visual
+ * artifacts outside of the driver's control.
+ */
 #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
=20
+/**
+ * DRM_MODE_ATOMIC_FLAGS
+ *
+ * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
+ * &drm_mode_atomic.flags.
+ */
 #define DRM_MODE_ATOMIC_FLAGS (\
 =09=09DRM_MODE_PAGE_FLIP_EVENT |\
 =09=09DRM_MODE_PAGE_FLIP_ASYNC |\
@@ -1112,7 +1213,8 @@ struct drm_mode_destroy_blob {
  * Lease mode resources, creating another drm_master.
  *
  * The @object_ids array must reference at least one CRTC, one connector a=
nd
- * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
+ * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled. Alternatively=
,
+ * the lease can be completely empty.
  */
 struct drm_mode_create_lease {
 =09/** @object_ids: Pointer to array of object ids (__u32) */

base-commit: 042dfe090ff9c9813c822dc8ecba3d4adcc7e3bb
--=20
2.42.0

