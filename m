Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E85C47DDC
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E010410F1A3;
	Tue, 23 Jan 2024 23:30:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D8E10F028
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 23:30:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NNOnX3007049; Tue, 23 Jan 2024 23:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=73KYY18FAbsEo90pNxUkHzmxv8MLT9bQVVJL3UPiKU8
 =; b=Z209QA3rJdVttWvdvj0ryKR1GB57Dn/xbR1ijDCWRlaquddh3Z+uf5jvP5L
 Vt01WX+9CUP/Zbsb3OTaZnmnOySlFHKk6g6Bavs93XEeEK39EXhNtXhW3YPe0zlO
 JfR6z49HtyAuLL8ixWzYPaHSVy3Djyoz1dNToqSjUivua3BlzETDqYvKyUDbCwdm
 X2Nh/sN1a7/ZdrMe3bvs3L/gHxTSFKRqsbYh81IQRcSeR7h0B3lfi8A5Rdd7ieMX
 aXP8IFvV6n57JomSZJXC98k8xgRWuL1DkiLMOz6VUSK+sBaPP8VkT/fr+pafO8Jr
 NPxdK8JoG+WlfmZWKGE+q/tyYWA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhdra06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NNTi36007239
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 15:29:43 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 23 Jan 2024 15:28:55 -0800
Subject: [PATCH i-g-t v2 2/6] drm-uapi: Sync with drm-next
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20240123-solid-fill-v2-2-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
In-Reply-To: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052582; l=235181;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=H31/gZSwinW/v1UJ2mmcbmD0nSrB+Tz7wuUJzeZUp3k=;
 b=Lt4rPEt2tB9ZpqhuHLeJ6jLeNsoUaHgKhxzMmW3WIm4FtiVqBH5FWO9o4hiMrYdnrS6jvhh8S
 Za51Y6Tj/G6D9eBKAHzqFSwDeFeaRRhc2r00S6Em6ObXFV5qAsKicag
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BKORwaMHcvDzvUPmHW7sl_gMCiNDWfVB
X-Proofpoint-ORIG-GUID: BKORwaMHcvDzvUPmHW7sl_gMCiNDWfVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_13,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401230175
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Sync with drm-next commit cff601b45723f9a1415a6599fc24e073a7295cef

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm-uapi/drm.h              |   92 +-
 include/drm-uapi/drm_fourcc.h       |   12 +-
 include/drm-uapi/drm_mode.h         |   61 +-
 include/drm-uapi/habanalabs_accel.h | 2368 +++++++++++++++++++++++++++++++++++
 include/drm-uapi/i810_drm.h         |  292 -----
 include/drm-uapi/ivpu_accel.h       |  327 +++++
 include/drm-uapi/mga_drm.h          |  427 -------
 include/drm-uapi/msm_drm.h          |    3 +
 include/drm-uapi/pvr_drm.h          | 1295 +++++++++++++++++++
 include/drm-uapi/qaic_accel.h       |  410 ++++++
 include/drm-uapi/r128_drm.h         |  336 -----
 include/drm-uapi/savage_drm.h       |  220 ----
 include/drm-uapi/sis_drm.h          |   77 --
 include/drm-uapi/v3d_drm.h          |  245 +++-
 include/drm-uapi/via_drm.h          |  282 -----
 include/drm-uapi/virtgpu_drm.h      |    2 +
 16 files changed, 4797 insertions(+), 1652 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248deb1..4e4f7c2c39e4 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -707,7 +707,8 @@ struct drm_gem_open {
 /**
  * DRM_CAP_ASYNC_PAGE_FLIP
  *
- * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for legacy
+ * page-flips.
  */
 #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
 /**
@@ -767,6 +768,13 @@ struct drm_gem_open {
  * :ref:`drm_sync_objects`.
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
+/**
+ * DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC for atomic
+ * commits.
+ */
+#define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
@@ -836,6 +844,31 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
+ *
+ * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio and
+ * virtualbox) have additional restrictions for cursor planes (thus
+ * making cursor planes on those drivers not truly universal,) e.g.
+ * they need cursor planes to act like one would expect from a mouse
+ * cursor and have correctly set hotspot properties.
+ * If this client cap is not set the DRM core will hide cursor plane on
+ * those virtualized drivers because not setting it implies that the
+ * client is not capable of dealing with those extra restictions.
+ * Clients which do set cursor hotspot and treat the cursor plane
+ * like a mouse cursor should set this property.
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * Setting this property on drivers which do not special case
+ * cursor planes (i.e. non-virtualized drivers) will return
+ * EOPNOTSUPP, which can be used by userspace to gauge
+ * requirements of the hardware/drivers they're running on.
+ *
+ * This capability is always supported for atomic-capable virtualized
+ * drivers starting from kernel version 6.6.
+ */
+#define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
@@ -887,6 +920,7 @@ struct drm_syncobj_transfer {
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
+#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline to deadline_nsec */
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
@@ -895,6 +929,14 @@ struct drm_syncobj_wait {
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
 	__u32 pad;
+	/**
+	 * @deadline_nsec - fence deadline hint
+	 *
+	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
+	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
+	 * set.
+	 */
+	__u64 deadline_nsec;
 };
 
 struct drm_syncobj_timeline_wait {
@@ -907,6 +949,14 @@ struct drm_syncobj_timeline_wait {
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
 	__u32 pad;
+	/**
+	 * @deadline_nsec - fence deadline hint
+	 *
+	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
+	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
+	 * set.
+	 */
+	__u64 deadline_nsec;
 };
 
 /**
@@ -1128,6 +1178,26 @@ extern "C" {
 #define DRM_IOCTL_MODE_PAGE_FLIP	DRM_IOWR(0xB0, struct drm_mode_crtc_page_flip)
 #define DRM_IOCTL_MODE_DIRTYFB		DRM_IOWR(0xB1, struct drm_mode_fb_dirty_cmd)
 
+/**
+ * DRM_IOCTL_MODE_CREATE_DUMB - Create a new dumb buffer object.
+ *
+ * KMS dumb buffers provide a very primitive way to allocate a buffer object
+ * suitable for scanout and map it for software rendering. KMS dumb buffers are
+ * not suitable for hardware-accelerated rendering nor video decoding. KMS dumb
+ * buffers are not suitable to be displayed on any other device than the KMS
+ * device where they were allocated from. Also see
+ * :ref:`kms_dumb_buffer_objects`.
+ *
+ * The IOCTL argument is a struct drm_mode_create_dumb.
+ *
+ * User-space is expected to create a KMS dumb buffer via this IOCTL, then add
+ * it as a KMS framebuffer via &DRM_IOCTL_MODE_ADDFB and map it via
+ * &DRM_IOCTL_MODE_MAP_DUMB.
+ *
+ * &DRM_CAP_DUMB_BUFFER indicates whether this IOCTL is supported.
+ * &DRM_CAP_DUMB_PREFERRED_DEPTH and &DRM_CAP_DUMB_PREFER_SHADOW indicate
+ * driver preferences for dumb buffers.
+ */
 #define DRM_IOCTL_MODE_CREATE_DUMB DRM_IOWR(0xB2, struct drm_mode_create_dumb)
 #define DRM_IOCTL_MODE_MAP_DUMB    DRM_IOWR(0xB3, struct drm_mode_map_dumb)
 #define DRM_IOCTL_MODE_DESTROY_DUMB    DRM_IOWR(0xB4, struct drm_mode_destroy_dumb)
@@ -1192,6 +1262,26 @@ extern "C" {
 
 #define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCF, struct drm_syncobj_eventfd)
 
+/**
+ * DRM_IOCTL_MODE_CLOSEFB - Close a framebuffer.
+ *
+ * This closes a framebuffer previously added via ADDFB/ADDFB2. The IOCTL
+ * argument is a framebuffer object ID.
+ *
+ * This IOCTL is similar to &DRM_IOCTL_MODE_RMFB, except it doesn't disable
+ * planes and CRTCs. As long as the framebuffer is used by a plane, it's kept
+ * alive. When the plane no longer uses the framebuffer (because the
+ * framebuffer is replaced with another one, or the plane is disabled), the
+ * framebuffer is cleaned up.
+ *
+ * This is useful to implement flicker-free transitions between two processes.
+ *
+ * Depending on the threat model, user-space may want to ensure that the
+ * framebuffer doesn't expose any sensitive user information: closed
+ * framebuffers attached to a plane can be read back by the next DRM master.
+ */
+#define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 6b6235f7a7cd..5d7240e726f6 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -54,7 +54,7 @@ extern "C" {
  * Format modifiers may change any property of the buffer, including the number
  * of planes and/or the required allocation size. Format modifiers are
  * vendor-namespaced, and as such the relationship between a fourcc code and a
- * modifier is specific to the modifer being used. For example, some modifiers
+ * modifier is specific to the modifier being used. For example, some modifiers
  * may preserve meaning - such as number of planes - from the fourcc code,
  * whereas others may not.
  *
@@ -79,7 +79,7 @@ extern "C" {
  *   format.
  * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
  *   see modifiers as opaque tokens they can check for equality and intersect.
- *   These users musn't need to know to reason about the modifier value
+ *   These users mustn't need to know to reason about the modifier value
  *   (i.e. they are not expected to extract information out of the modifier).
  *
  * Vendors should document their modifier usage in as much detail as
@@ -323,6 +323,8 @@ extern "C" {
  * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
  */
 #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
+#define DRM_FORMAT_NV30		fourcc_code('N', 'V', '3', '0') /* non-subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
@@ -538,7 +540,7 @@ extern "C" {
  * This is a tiled layout using 4Kb tiles in row-major layout.
  * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
  * are arranged in four groups (two wide, two high) with column-major layout.
- * Each group therefore consits out of four 256 byte units, which are also laid
+ * Each group therefore consists out of four 256 byte units, which are also laid
  * out as 2x2 column-major.
  * 256 byte units are made out of four 64 byte blocks of pixels, producing
  * either a square block or a 2:1 unit.
@@ -1101,7 +1103,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 
 /*
- * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
+ * The top 4 bits (out of the 56 bits allotted for specifying vendor specific
  * modifiers) denote the category for modifiers. Currently we have three
  * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
  * sixteen different categories.
@@ -1417,7 +1419,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * Amlogic FBC Memory Saving mode
  *
  * Indicates the storage is packed when pixel size is multiple of word
- * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * boundaries, i.e. 8bit should be stored in this mode to save allocation
  * memory.
  *
  * This mode reduces body layout to 3072 bytes per 64x32 superblock with
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index ea1b639bcb28..7040e7ea80c7 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -36,10 +36,10 @@ extern "C" {
 /**
  * DOC: overview
  *
- * DRM exposes many UAPI and structure definition to have a consistent
- * and standardized interface with user.
+ * DRM exposes many UAPI and structure definitions to have a consistent
+ * and standardized interface with users.
  * Userspace can refer to these structure definitions and UAPI formats
- * to communicate to driver
+ * to communicate to drivers.
  */
 
 #define DRM_CONNECTOR_NAME_LEN	32
@@ -540,7 +540,7 @@ struct drm_mode_get_connector {
 /* the PROP_ATOMIC flag is used to hide properties from userspace that
  * is not aware of atomic properties.  This is mostly to work around
  * older userspace (DDX drivers) that read/write each prop they find,
- * witout being aware that this could be triggering a lengthy modeset.
+ * without being aware that this could be triggering a lengthy modeset.
  */
 #define DRM_MODE_PROP_ATOMIC        0x80000000
 
@@ -664,7 +664,7 @@ struct drm_mode_fb_cmd {
 };
 
 #define DRM_MODE_FB_INTERLACED	(1<<0) /* for interlaced framebuffers */
-#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifer[] */
+#define DRM_MODE_FB_MODIFIERS	(1<<1) /* enables ->modifier[] */
 
 /**
  * struct drm_mode_fb_cmd2 - Frame-buffer metadata.
@@ -846,6 +846,14 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -881,8 +889,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @display_primaries.x: X cordinate of color primary.
-	 * @display_primaries.y: Y cordinate of color primary.
+	 * @display_primaries.x: X coordinate of color primary.
+	 * @display_primaries.y: Y coordinate of color primary.
 	 */
 	struct {
 		__u16 x, y;
@@ -892,8 +900,8 @@ struct hdr_metadata_infoframe {
 	 * These are coded as unsigned 16-bit values in units of
 	 * 0.00002, where 0x0000 represents zero and 0xC350
 	 * represents 1.0000.
-	 * @white_point.x: X cordinate of whitepoint of color primary.
-	 * @white_point.y: Y cordinate of whitepoint of color primary.
+	 * @white_point.x: X coordinate of whitepoint of color primary.
+	 * @white_point.y: Y coordinate of whitepoint of color primary.
 	 */
 	struct {
 		__u16 x, y;
@@ -957,6 +965,15 @@ struct hdr_output_metadata {
  * Request that the page-flip is performed as soon as possible, ie. with no
  * delay due to waiting for vblank. This may cause tearing to be visible on
  * the screen.
+ *
+ * When used with atomic uAPI, the driver will return an error if the hardware
+ * doesn't support performing an asynchronous page-flip for this update.
+ * User-space should handle this, e.g. by falling back to a regular page-flip.
+ *
+ * Note, some hardware might need to perform one last synchronous page-flip
+ * before being able to switch to asynchronous page-flips. As an exception,
+ * the driver will return success even though that first page-flip is not
+ * asynchronous.
  */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
@@ -1032,13 +1049,25 @@ struct drm_mode_crtc_page_flip_target {
 	__u64 user_data;
 };
 
-/* create a dumb scanout buffer */
+/**
+ * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
+ * @height: buffer height in pixels
+ * @width: buffer width in pixels
+ * @bpp: bits per pixel
+ * @flags: must be zero
+ * @handle: buffer object handle
+ * @pitch: number of bytes between two consecutive lines
+ * @size: size of the whole buffer in bytes
+ *
+ * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
+ * the kernel fills @handle, @pitch and @size.
+ */
 struct drm_mode_create_dumb {
 	__u32 height;
 	__u32 width;
 	__u32 bpp;
 	__u32 flags;
-	/* handle, pitch, size will be returned */
+
 	__u32 handle;
 	__u32 pitch;
 	__u64 size;
@@ -1311,6 +1340,16 @@ struct drm_mode_rect {
 	__s32 y2;
 };
 
+/**
+ * struct drm_mode_closefb
+ * @fb_id: Framebuffer ID.
+ * @pad: Must be zero.
+ */
+struct drm_mode_closefb {
+	__u32 fb_id;
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/habanalabs_accel.h b/include/drm-uapi/habanalabs_accel.h
new file mode 100644
index 000000000000..a512dc4cffd0
--- /dev/null
+++ b/include/drm-uapi/habanalabs_accel.h
@@ -0,0 +1,2368 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+ *
+ * Copyright 2016-2023 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+#ifndef HABANALABS_H_
+#define HABANALABS_H_
+
+#include <drm/drm.h>
+
+/*
+ * Defines that are asic-specific but constitutes as ABI between kernel driver
+ * and userspace
+ */
+#define GOYA_KMD_SRAM_RESERVED_SIZE_FROM_START		0x8000	/* 32KB */
+#define GAUDI_DRIVER_SRAM_RESERVED_SIZE_FROM_START	0x80	/* 128 bytes */
+
+/*
+ * 128 SOBs reserved for collective wait
+ * 16 SOBs reserved for sync stream
+ */
+#define GAUDI_FIRST_AVAILABLE_W_S_SYNC_OBJECT		144
+
+/*
+ * 64 monitors reserved for collective wait
+ * 8 monitors reserved for sync stream
+ */
+#define GAUDI_FIRST_AVAILABLE_W_S_MONITOR		72
+
+/* Max number of elements in timestamps registration buffers */
+#define	TS_MAX_ELEMENTS_NUM				(1 << 20) /* 1MB */
+
+/*
+ * Goya queue Numbering
+ *
+ * The external queues (PCI DMA channels) MUST be before the internal queues
+ * and each group (PCI DMA channels and internal) must be contiguous inside
+ * itself but there can be a gap between the two groups (although not
+ * recommended)
+ */
+
+enum goya_queue_id {
+	GOYA_QUEUE_ID_DMA_0 = 0,
+	GOYA_QUEUE_ID_DMA_1 = 1,
+	GOYA_QUEUE_ID_DMA_2 = 2,
+	GOYA_QUEUE_ID_DMA_3 = 3,
+	GOYA_QUEUE_ID_DMA_4 = 4,
+	GOYA_QUEUE_ID_CPU_PQ = 5,
+	GOYA_QUEUE_ID_MME = 6,	/* Internal queues start here */
+	GOYA_QUEUE_ID_TPC0 = 7,
+	GOYA_QUEUE_ID_TPC1 = 8,
+	GOYA_QUEUE_ID_TPC2 = 9,
+	GOYA_QUEUE_ID_TPC3 = 10,
+	GOYA_QUEUE_ID_TPC4 = 11,
+	GOYA_QUEUE_ID_TPC5 = 12,
+	GOYA_QUEUE_ID_TPC6 = 13,
+	GOYA_QUEUE_ID_TPC7 = 14,
+	GOYA_QUEUE_ID_SIZE
+};
+
+/*
+ * Gaudi queue Numbering
+ * External queues (PCI DMA channels) are DMA_0_*, DMA_1_* and DMA_5_*.
+ * Except one CPU queue, all the rest are internal queues.
+ */
+
+enum gaudi_queue_id {
+	GAUDI_QUEUE_ID_DMA_0_0 = 0,	/* external */
+	GAUDI_QUEUE_ID_DMA_0_1 = 1,	/* external */
+	GAUDI_QUEUE_ID_DMA_0_2 = 2,	/* external */
+	GAUDI_QUEUE_ID_DMA_0_3 = 3,	/* external */
+	GAUDI_QUEUE_ID_DMA_1_0 = 4,	/* external */
+	GAUDI_QUEUE_ID_DMA_1_1 = 5,	/* external */
+	GAUDI_QUEUE_ID_DMA_1_2 = 6,	/* external */
+	GAUDI_QUEUE_ID_DMA_1_3 = 7,	/* external */
+	GAUDI_QUEUE_ID_CPU_PQ = 8,	/* CPU */
+	GAUDI_QUEUE_ID_DMA_2_0 = 9,	/* internal */
+	GAUDI_QUEUE_ID_DMA_2_1 = 10,	/* internal */
+	GAUDI_QUEUE_ID_DMA_2_2 = 11,	/* internal */
+	GAUDI_QUEUE_ID_DMA_2_3 = 12,	/* internal */
+	GAUDI_QUEUE_ID_DMA_3_0 = 13,	/* internal */
+	GAUDI_QUEUE_ID_DMA_3_1 = 14,	/* internal */
+	GAUDI_QUEUE_ID_DMA_3_2 = 15,	/* internal */
+	GAUDI_QUEUE_ID_DMA_3_3 = 16,	/* internal */
+	GAUDI_QUEUE_ID_DMA_4_0 = 17,	/* internal */
+	GAUDI_QUEUE_ID_DMA_4_1 = 18,	/* internal */
+	GAUDI_QUEUE_ID_DMA_4_2 = 19,	/* internal */
+	GAUDI_QUEUE_ID_DMA_4_3 = 20,	/* internal */
+	GAUDI_QUEUE_ID_DMA_5_0 = 21,	/* internal */
+	GAUDI_QUEUE_ID_DMA_5_1 = 22,	/* internal */
+	GAUDI_QUEUE_ID_DMA_5_2 = 23,	/* internal */
+	GAUDI_QUEUE_ID_DMA_5_3 = 24,	/* internal */
+	GAUDI_QUEUE_ID_DMA_6_0 = 25,	/* internal */
+	GAUDI_QUEUE_ID_DMA_6_1 = 26,	/* internal */
+	GAUDI_QUEUE_ID_DMA_6_2 = 27,	/* internal */
+	GAUDI_QUEUE_ID_DMA_6_3 = 28,	/* internal */
+	GAUDI_QUEUE_ID_DMA_7_0 = 29,	/* internal */
+	GAUDI_QUEUE_ID_DMA_7_1 = 30,	/* internal */
+	GAUDI_QUEUE_ID_DMA_7_2 = 31,	/* internal */
+	GAUDI_QUEUE_ID_DMA_7_3 = 32,	/* internal */
+	GAUDI_QUEUE_ID_MME_0_0 = 33,	/* internal */
+	GAUDI_QUEUE_ID_MME_0_1 = 34,	/* internal */
+	GAUDI_QUEUE_ID_MME_0_2 = 35,	/* internal */
+	GAUDI_QUEUE_ID_MME_0_3 = 36,	/* internal */
+	GAUDI_QUEUE_ID_MME_1_0 = 37,	/* internal */
+	GAUDI_QUEUE_ID_MME_1_1 = 38,	/* internal */
+	GAUDI_QUEUE_ID_MME_1_2 = 39,	/* internal */
+	GAUDI_QUEUE_ID_MME_1_3 = 40,	/* internal */
+	GAUDI_QUEUE_ID_TPC_0_0 = 41,	/* internal */
+	GAUDI_QUEUE_ID_TPC_0_1 = 42,	/* internal */
+	GAUDI_QUEUE_ID_TPC_0_2 = 43,	/* internal */
+	GAUDI_QUEUE_ID_TPC_0_3 = 44,	/* internal */
+	GAUDI_QUEUE_ID_TPC_1_0 = 45,	/* internal */
+	GAUDI_QUEUE_ID_TPC_1_1 = 46,	/* internal */
+	GAUDI_QUEUE_ID_TPC_1_2 = 47,	/* internal */
+	GAUDI_QUEUE_ID_TPC_1_3 = 48,	/* internal */
+	GAUDI_QUEUE_ID_TPC_2_0 = 49,	/* internal */
+	GAUDI_QUEUE_ID_TPC_2_1 = 50,	/* internal */
+	GAUDI_QUEUE_ID_TPC_2_2 = 51,	/* internal */
+	GAUDI_QUEUE_ID_TPC_2_3 = 52,	/* internal */
+	GAUDI_QUEUE_ID_TPC_3_0 = 53,	/* internal */
+	GAUDI_QUEUE_ID_TPC_3_1 = 54,	/* internal */
+	GAUDI_QUEUE_ID_TPC_3_2 = 55,	/* internal */
+	GAUDI_QUEUE_ID_TPC_3_3 = 56,	/* internal */
+	GAUDI_QUEUE_ID_TPC_4_0 = 57,	/* internal */
+	GAUDI_QUEUE_ID_TPC_4_1 = 58,	/* internal */
+	GAUDI_QUEUE_ID_TPC_4_2 = 59,	/* internal */
+	GAUDI_QUEUE_ID_TPC_4_3 = 60,	/* internal */
+	GAUDI_QUEUE_ID_TPC_5_0 = 61,	/* internal */
+	GAUDI_QUEUE_ID_TPC_5_1 = 62,	/* internal */
+	GAUDI_QUEUE_ID_TPC_5_2 = 63,	/* internal */
+	GAUDI_QUEUE_ID_TPC_5_3 = 64,	/* internal */
+	GAUDI_QUEUE_ID_TPC_6_0 = 65,	/* internal */
+	GAUDI_QUEUE_ID_TPC_6_1 = 66,	/* internal */
+	GAUDI_QUEUE_ID_TPC_6_2 = 67,	/* internal */
+	GAUDI_QUEUE_ID_TPC_6_3 = 68,	/* internal */
+	GAUDI_QUEUE_ID_TPC_7_0 = 69,	/* internal */
+	GAUDI_QUEUE_ID_TPC_7_1 = 70,	/* internal */
+	GAUDI_QUEUE_ID_TPC_7_2 = 71,	/* internal */
+	GAUDI_QUEUE_ID_TPC_7_3 = 72,	/* internal */
+	GAUDI_QUEUE_ID_NIC_0_0 = 73,	/* internal */
+	GAUDI_QUEUE_ID_NIC_0_1 = 74,	/* internal */
+	GAUDI_QUEUE_ID_NIC_0_2 = 75,	/* internal */
+	GAUDI_QUEUE_ID_NIC_0_3 = 76,	/* internal */
+	GAUDI_QUEUE_ID_NIC_1_0 = 77,	/* internal */
+	GAUDI_QUEUE_ID_NIC_1_1 = 78,	/* internal */
+	GAUDI_QUEUE_ID_NIC_1_2 = 79,	/* internal */
+	GAUDI_QUEUE_ID_NIC_1_3 = 80,	/* internal */
+	GAUDI_QUEUE_ID_NIC_2_0 = 81,	/* internal */
+	GAUDI_QUEUE_ID_NIC_2_1 = 82,	/* internal */
+	GAUDI_QUEUE_ID_NIC_2_2 = 83,	/* internal */
+	GAUDI_QUEUE_ID_NIC_2_3 = 84,	/* internal */
+	GAUDI_QUEUE_ID_NIC_3_0 = 85,	/* internal */
+	GAUDI_QUEUE_ID_NIC_3_1 = 86,	/* internal */
+	GAUDI_QUEUE_ID_NIC_3_2 = 87,	/* internal */
+	GAUDI_QUEUE_ID_NIC_3_3 = 88,	/* internal */
+	GAUDI_QUEUE_ID_NIC_4_0 = 89,	/* internal */
+	GAUDI_QUEUE_ID_NIC_4_1 = 90,	/* internal */
+	GAUDI_QUEUE_ID_NIC_4_2 = 91,	/* internal */
+	GAUDI_QUEUE_ID_NIC_4_3 = 92,	/* internal */
+	GAUDI_QUEUE_ID_NIC_5_0 = 93,	/* internal */
+	GAUDI_QUEUE_ID_NIC_5_1 = 94,	/* internal */
+	GAUDI_QUEUE_ID_NIC_5_2 = 95,	/* internal */
+	GAUDI_QUEUE_ID_NIC_5_3 = 96,	/* internal */
+	GAUDI_QUEUE_ID_NIC_6_0 = 97,	/* internal */
+	GAUDI_QUEUE_ID_NIC_6_1 = 98,	/* internal */
+	GAUDI_QUEUE_ID_NIC_6_2 = 99,	/* internal */
+	GAUDI_QUEUE_ID_NIC_6_3 = 100,	/* internal */
+	GAUDI_QUEUE_ID_NIC_7_0 = 101,	/* internal */
+	GAUDI_QUEUE_ID_NIC_7_1 = 102,	/* internal */
+	GAUDI_QUEUE_ID_NIC_7_2 = 103,	/* internal */
+	GAUDI_QUEUE_ID_NIC_7_3 = 104,	/* internal */
+	GAUDI_QUEUE_ID_NIC_8_0 = 105,	/* internal */
+	GAUDI_QUEUE_ID_NIC_8_1 = 106,	/* internal */
+	GAUDI_QUEUE_ID_NIC_8_2 = 107,	/* internal */
+	GAUDI_QUEUE_ID_NIC_8_3 = 108,	/* internal */
+	GAUDI_QUEUE_ID_NIC_9_0 = 109,	/* internal */
+	GAUDI_QUEUE_ID_NIC_9_1 = 110,	/* internal */
+	GAUDI_QUEUE_ID_NIC_9_2 = 111,	/* internal */
+	GAUDI_QUEUE_ID_NIC_9_3 = 112,	/* internal */
+	GAUDI_QUEUE_ID_SIZE
+};
+
+/*
+ * In GAUDI2 we have two modes of operation in regard to queues:
+ * 1. Legacy mode, where each QMAN exposes 4 streams to the user
+ * 2. F/W mode, where we use F/W to schedule the JOBS to the different queues.
+ *
+ * When in legacy mode, the user sends the queue id per JOB according to
+ * enum gaudi2_queue_id below.
+ *
+ * When in F/W mode, the user sends a stream id per Command Submission. The
+ * stream id is a running number from 0 up to (N-1), where N is the number
+ * of streams the F/W exposes and is passed to the user in
+ * struct hl_info_hw_ip_info
+ */
+
+enum gaudi2_queue_id {
+	GAUDI2_QUEUE_ID_PDMA_0_0 = 0,
+	GAUDI2_QUEUE_ID_PDMA_0_1 = 1,
+	GAUDI2_QUEUE_ID_PDMA_0_2 = 2,
+	GAUDI2_QUEUE_ID_PDMA_0_3 = 3,
+	GAUDI2_QUEUE_ID_PDMA_1_0 = 4,
+	GAUDI2_QUEUE_ID_PDMA_1_1 = 5,
+	GAUDI2_QUEUE_ID_PDMA_1_2 = 6,
+	GAUDI2_QUEUE_ID_PDMA_1_3 = 7,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0 = 8,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_0_1 = 9,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_0_2 = 10,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_0_3 = 11,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_1_0 = 12,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_1_1 = 13,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_1_2 = 14,
+	GAUDI2_QUEUE_ID_DCORE0_EDMA_1_3 = 15,
+	GAUDI2_QUEUE_ID_DCORE0_MME_0_0 = 16,
+	GAUDI2_QUEUE_ID_DCORE0_MME_0_1 = 17,
+	GAUDI2_QUEUE_ID_DCORE0_MME_0_2 = 18,
+	GAUDI2_QUEUE_ID_DCORE0_MME_0_3 = 19,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_0_0 = 20,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_0_1 = 21,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_0_2 = 22,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_0_3 = 23,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_1_0 = 24,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_1_1 = 25,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_1_2 = 26,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_1_3 = 27,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_2_0 = 28,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_2_1 = 29,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_2_2 = 30,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_2_3 = 31,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_3_0 = 32,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_3_1 = 33,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_3_2 = 34,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_3_3 = 35,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_4_0 = 36,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_4_1 = 37,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_4_2 = 38,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_4_3 = 39,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_5_0 = 40,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_5_1 = 41,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_5_2 = 42,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_5_3 = 43,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_6_0 = 44,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_6_1 = 45,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_6_2 = 46,
+	GAUDI2_QUEUE_ID_DCORE0_TPC_6_3 = 47,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0 = 48,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_0_1 = 49,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_0_2 = 50,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_0_3 = 51,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_1_0 = 52,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_1_1 = 53,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_1_2 = 54,
+	GAUDI2_QUEUE_ID_DCORE1_EDMA_1_3 = 55,
+	GAUDI2_QUEUE_ID_DCORE1_MME_0_0 = 56,
+	GAUDI2_QUEUE_ID_DCORE1_MME_0_1 = 57,
+	GAUDI2_QUEUE_ID_DCORE1_MME_0_2 = 58,
+	GAUDI2_QUEUE_ID_DCORE1_MME_0_3 = 59,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_0_0 = 60,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_0_1 = 61,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_0_2 = 62,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_0_3 = 63,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_1_0 = 64,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_1_1 = 65,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_1_2 = 66,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_1_3 = 67,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_2_0 = 68,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_2_1 = 69,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_2_2 = 70,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_2_3 = 71,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_3_0 = 72,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_3_1 = 73,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_3_2 = 74,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_3_3 = 75,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_4_0 = 76,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_4_1 = 77,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_4_2 = 78,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_4_3 = 79,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_5_0 = 80,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_5_1 = 81,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_5_2 = 82,
+	GAUDI2_QUEUE_ID_DCORE1_TPC_5_3 = 83,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0 = 84,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_0_1 = 85,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_0_2 = 86,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_0_3 = 87,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_1_0 = 88,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_1_1 = 89,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_1_2 = 90,
+	GAUDI2_QUEUE_ID_DCORE2_EDMA_1_3 = 91,
+	GAUDI2_QUEUE_ID_DCORE2_MME_0_0 = 92,
+	GAUDI2_QUEUE_ID_DCORE2_MME_0_1 = 93,
+	GAUDI2_QUEUE_ID_DCORE2_MME_0_2 = 94,
+	GAUDI2_QUEUE_ID_DCORE2_MME_0_3 = 95,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_0_0 = 96,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_0_1 = 97,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_0_2 = 98,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_0_3 = 99,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_1_0 = 100,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_1_1 = 101,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_1_2 = 102,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_1_3 = 103,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_2_0 = 104,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_2_1 = 105,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_2_2 = 106,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_2_3 = 107,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_3_0 = 108,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_3_1 = 109,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_3_2 = 110,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_3_3 = 111,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_4_0 = 112,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_4_1 = 113,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_4_2 = 114,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_4_3 = 115,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_5_0 = 116,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_5_1 = 117,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_5_2 = 118,
+	GAUDI2_QUEUE_ID_DCORE2_TPC_5_3 = 119,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0 = 120,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_0_1 = 121,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_0_2 = 122,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_0_3 = 123,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_1_0 = 124,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_1_1 = 125,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_1_2 = 126,
+	GAUDI2_QUEUE_ID_DCORE3_EDMA_1_3 = 127,
+	GAUDI2_QUEUE_ID_DCORE3_MME_0_0 = 128,
+	GAUDI2_QUEUE_ID_DCORE3_MME_0_1 = 129,
+	GAUDI2_QUEUE_ID_DCORE3_MME_0_2 = 130,
+	GAUDI2_QUEUE_ID_DCORE3_MME_0_3 = 131,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_0_0 = 132,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_0_1 = 133,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_0_2 = 134,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_0_3 = 135,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_1_0 = 136,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_1_1 = 137,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_1_2 = 138,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_1_3 = 139,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_2_0 = 140,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_2_1 = 141,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_2_2 = 142,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_2_3 = 143,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_3_0 = 144,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_3_1 = 145,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_3_2 = 146,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_3_3 = 147,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_4_0 = 148,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_4_1 = 149,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_4_2 = 150,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_4_3 = 151,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_5_0 = 152,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_5_1 = 153,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_5_2 = 154,
+	GAUDI2_QUEUE_ID_DCORE3_TPC_5_3 = 155,
+	GAUDI2_QUEUE_ID_NIC_0_0 = 156,
+	GAUDI2_QUEUE_ID_NIC_0_1 = 157,
+	GAUDI2_QUEUE_ID_NIC_0_2 = 158,
+	GAUDI2_QUEUE_ID_NIC_0_3 = 159,
+	GAUDI2_QUEUE_ID_NIC_1_0 = 160,
+	GAUDI2_QUEUE_ID_NIC_1_1 = 161,
+	GAUDI2_QUEUE_ID_NIC_1_2 = 162,
+	GAUDI2_QUEUE_ID_NIC_1_3 = 163,
+	GAUDI2_QUEUE_ID_NIC_2_0 = 164,
+	GAUDI2_QUEUE_ID_NIC_2_1 = 165,
+	GAUDI2_QUEUE_ID_NIC_2_2 = 166,
+	GAUDI2_QUEUE_ID_NIC_2_3 = 167,
+	GAUDI2_QUEUE_ID_NIC_3_0 = 168,
+	GAUDI2_QUEUE_ID_NIC_3_1 = 169,
+	GAUDI2_QUEUE_ID_NIC_3_2 = 170,
+	GAUDI2_QUEUE_ID_NIC_3_3 = 171,
+	GAUDI2_QUEUE_ID_NIC_4_0 = 172,
+	GAUDI2_QUEUE_ID_NIC_4_1 = 173,
+	GAUDI2_QUEUE_ID_NIC_4_2 = 174,
+	GAUDI2_QUEUE_ID_NIC_4_3 = 175,
+	GAUDI2_QUEUE_ID_NIC_5_0 = 176,
+	GAUDI2_QUEUE_ID_NIC_5_1 = 177,
+	GAUDI2_QUEUE_ID_NIC_5_2 = 178,
+	GAUDI2_QUEUE_ID_NIC_5_3 = 179,
+	GAUDI2_QUEUE_ID_NIC_6_0 = 180,
+	GAUDI2_QUEUE_ID_NIC_6_1 = 181,
+	GAUDI2_QUEUE_ID_NIC_6_2 = 182,
+	GAUDI2_QUEUE_ID_NIC_6_3 = 183,
+	GAUDI2_QUEUE_ID_NIC_7_0 = 184,
+	GAUDI2_QUEUE_ID_NIC_7_1 = 185,
+	GAUDI2_QUEUE_ID_NIC_7_2 = 186,
+	GAUDI2_QUEUE_ID_NIC_7_3 = 187,
+	GAUDI2_QUEUE_ID_NIC_8_0 = 188,
+	GAUDI2_QUEUE_ID_NIC_8_1 = 189,
+	GAUDI2_QUEUE_ID_NIC_8_2 = 190,
+	GAUDI2_QUEUE_ID_NIC_8_3 = 191,
+	GAUDI2_QUEUE_ID_NIC_9_0 = 192,
+	GAUDI2_QUEUE_ID_NIC_9_1 = 193,
+	GAUDI2_QUEUE_ID_NIC_9_2 = 194,
+	GAUDI2_QUEUE_ID_NIC_9_3 = 195,
+	GAUDI2_QUEUE_ID_NIC_10_0 = 196,
+	GAUDI2_QUEUE_ID_NIC_10_1 = 197,
+	GAUDI2_QUEUE_ID_NIC_10_2 = 198,
+	GAUDI2_QUEUE_ID_NIC_10_3 = 199,
+	GAUDI2_QUEUE_ID_NIC_11_0 = 200,
+	GAUDI2_QUEUE_ID_NIC_11_1 = 201,
+	GAUDI2_QUEUE_ID_NIC_11_2 = 202,
+	GAUDI2_QUEUE_ID_NIC_11_3 = 203,
+	GAUDI2_QUEUE_ID_NIC_12_0 = 204,
+	GAUDI2_QUEUE_ID_NIC_12_1 = 205,
+	GAUDI2_QUEUE_ID_NIC_12_2 = 206,
+	GAUDI2_QUEUE_ID_NIC_12_3 = 207,
+	GAUDI2_QUEUE_ID_NIC_13_0 = 208,
+	GAUDI2_QUEUE_ID_NIC_13_1 = 209,
+	GAUDI2_QUEUE_ID_NIC_13_2 = 210,
+	GAUDI2_QUEUE_ID_NIC_13_3 = 211,
+	GAUDI2_QUEUE_ID_NIC_14_0 = 212,
+	GAUDI2_QUEUE_ID_NIC_14_1 = 213,
+	GAUDI2_QUEUE_ID_NIC_14_2 = 214,
+	GAUDI2_QUEUE_ID_NIC_14_3 = 215,
+	GAUDI2_QUEUE_ID_NIC_15_0 = 216,
+	GAUDI2_QUEUE_ID_NIC_15_1 = 217,
+	GAUDI2_QUEUE_ID_NIC_15_2 = 218,
+	GAUDI2_QUEUE_ID_NIC_15_3 = 219,
+	GAUDI2_QUEUE_ID_NIC_16_0 = 220,
+	GAUDI2_QUEUE_ID_NIC_16_1 = 221,
+	GAUDI2_QUEUE_ID_NIC_16_2 = 222,
+	GAUDI2_QUEUE_ID_NIC_16_3 = 223,
+	GAUDI2_QUEUE_ID_NIC_17_0 = 224,
+	GAUDI2_QUEUE_ID_NIC_17_1 = 225,
+	GAUDI2_QUEUE_ID_NIC_17_2 = 226,
+	GAUDI2_QUEUE_ID_NIC_17_3 = 227,
+	GAUDI2_QUEUE_ID_NIC_18_0 = 228,
+	GAUDI2_QUEUE_ID_NIC_18_1 = 229,
+	GAUDI2_QUEUE_ID_NIC_18_2 = 230,
+	GAUDI2_QUEUE_ID_NIC_18_3 = 231,
+	GAUDI2_QUEUE_ID_NIC_19_0 = 232,
+	GAUDI2_QUEUE_ID_NIC_19_1 = 233,
+	GAUDI2_QUEUE_ID_NIC_19_2 = 234,
+	GAUDI2_QUEUE_ID_NIC_19_3 = 235,
+	GAUDI2_QUEUE_ID_NIC_20_0 = 236,
+	GAUDI2_QUEUE_ID_NIC_20_1 = 237,
+	GAUDI2_QUEUE_ID_NIC_20_2 = 238,
+	GAUDI2_QUEUE_ID_NIC_20_3 = 239,
+	GAUDI2_QUEUE_ID_NIC_21_0 = 240,
+	GAUDI2_QUEUE_ID_NIC_21_1 = 241,
+	GAUDI2_QUEUE_ID_NIC_21_2 = 242,
+	GAUDI2_QUEUE_ID_NIC_21_3 = 243,
+	GAUDI2_QUEUE_ID_NIC_22_0 = 244,
+	GAUDI2_QUEUE_ID_NIC_22_1 = 245,
+	GAUDI2_QUEUE_ID_NIC_22_2 = 246,
+	GAUDI2_QUEUE_ID_NIC_22_3 = 247,
+	GAUDI2_QUEUE_ID_NIC_23_0 = 248,
+	GAUDI2_QUEUE_ID_NIC_23_1 = 249,
+	GAUDI2_QUEUE_ID_NIC_23_2 = 250,
+	GAUDI2_QUEUE_ID_NIC_23_3 = 251,
+	GAUDI2_QUEUE_ID_ROT_0_0 = 252,
+	GAUDI2_QUEUE_ID_ROT_0_1 = 253,
+	GAUDI2_QUEUE_ID_ROT_0_2 = 254,
+	GAUDI2_QUEUE_ID_ROT_0_3 = 255,
+	GAUDI2_QUEUE_ID_ROT_1_0 = 256,
+	GAUDI2_QUEUE_ID_ROT_1_1 = 257,
+	GAUDI2_QUEUE_ID_ROT_1_2 = 258,
+	GAUDI2_QUEUE_ID_ROT_1_3 = 259,
+	GAUDI2_QUEUE_ID_CPU_PQ = 260,
+	GAUDI2_QUEUE_ID_SIZE
+};
+
+/*
+ * Engine Numbering
+ *
+ * Used in the "busy_engines_mask" field in `struct hl_info_hw_idle'
+ */
+
+enum goya_engine_id {
+	GOYA_ENGINE_ID_DMA_0 = 0,
+	GOYA_ENGINE_ID_DMA_1,
+	GOYA_ENGINE_ID_DMA_2,
+	GOYA_ENGINE_ID_DMA_3,
+	GOYA_ENGINE_ID_DMA_4,
+	GOYA_ENGINE_ID_MME_0,
+	GOYA_ENGINE_ID_TPC_0,
+	GOYA_ENGINE_ID_TPC_1,
+	GOYA_ENGINE_ID_TPC_2,
+	GOYA_ENGINE_ID_TPC_3,
+	GOYA_ENGINE_ID_TPC_4,
+	GOYA_ENGINE_ID_TPC_5,
+	GOYA_ENGINE_ID_TPC_6,
+	GOYA_ENGINE_ID_TPC_7,
+	GOYA_ENGINE_ID_SIZE
+};
+
+enum gaudi_engine_id {
+	GAUDI_ENGINE_ID_DMA_0 = 0,
+	GAUDI_ENGINE_ID_DMA_1,
+	GAUDI_ENGINE_ID_DMA_2,
+	GAUDI_ENGINE_ID_DMA_3,
+	GAUDI_ENGINE_ID_DMA_4,
+	GAUDI_ENGINE_ID_DMA_5,
+	GAUDI_ENGINE_ID_DMA_6,
+	GAUDI_ENGINE_ID_DMA_7,
+	GAUDI_ENGINE_ID_MME_0,
+	GAUDI_ENGINE_ID_MME_1,
+	GAUDI_ENGINE_ID_MME_2,
+	GAUDI_ENGINE_ID_MME_3,
+	GAUDI_ENGINE_ID_TPC_0,
+	GAUDI_ENGINE_ID_TPC_1,
+	GAUDI_ENGINE_ID_TPC_2,
+	GAUDI_ENGINE_ID_TPC_3,
+	GAUDI_ENGINE_ID_TPC_4,
+	GAUDI_ENGINE_ID_TPC_5,
+	GAUDI_ENGINE_ID_TPC_6,
+	GAUDI_ENGINE_ID_TPC_7,
+	GAUDI_ENGINE_ID_NIC_0,
+	GAUDI_ENGINE_ID_NIC_1,
+	GAUDI_ENGINE_ID_NIC_2,
+	GAUDI_ENGINE_ID_NIC_3,
+	GAUDI_ENGINE_ID_NIC_4,
+	GAUDI_ENGINE_ID_NIC_5,
+	GAUDI_ENGINE_ID_NIC_6,
+	GAUDI_ENGINE_ID_NIC_7,
+	GAUDI_ENGINE_ID_NIC_8,
+	GAUDI_ENGINE_ID_NIC_9,
+	GAUDI_ENGINE_ID_SIZE
+};
+
+enum gaudi2_engine_id {
+	GAUDI2_DCORE0_ENGINE_ID_EDMA_0 = 0,
+	GAUDI2_DCORE0_ENGINE_ID_EDMA_1,
+	GAUDI2_DCORE0_ENGINE_ID_MME,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_0,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_1,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_2,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_3,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_4,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_5,
+	GAUDI2_DCORE0_ENGINE_ID_DEC_0,
+	GAUDI2_DCORE0_ENGINE_ID_DEC_1,
+	GAUDI2_DCORE1_ENGINE_ID_EDMA_0,
+	GAUDI2_DCORE1_ENGINE_ID_EDMA_1,
+	GAUDI2_DCORE1_ENGINE_ID_MME,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_0,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_1,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_2,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_3,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_4,
+	GAUDI2_DCORE1_ENGINE_ID_TPC_5,
+	GAUDI2_DCORE1_ENGINE_ID_DEC_0,
+	GAUDI2_DCORE1_ENGINE_ID_DEC_1,
+	GAUDI2_DCORE2_ENGINE_ID_EDMA_0,
+	GAUDI2_DCORE2_ENGINE_ID_EDMA_1,
+	GAUDI2_DCORE2_ENGINE_ID_MME,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_0,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_1,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_2,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_3,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_4,
+	GAUDI2_DCORE2_ENGINE_ID_TPC_5,
+	GAUDI2_DCORE2_ENGINE_ID_DEC_0,
+	GAUDI2_DCORE2_ENGINE_ID_DEC_1,
+	GAUDI2_DCORE3_ENGINE_ID_EDMA_0,
+	GAUDI2_DCORE3_ENGINE_ID_EDMA_1,
+	GAUDI2_DCORE3_ENGINE_ID_MME,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_0,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_1,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_2,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_3,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_4,
+	GAUDI2_DCORE3_ENGINE_ID_TPC_5,
+	GAUDI2_DCORE3_ENGINE_ID_DEC_0,
+	GAUDI2_DCORE3_ENGINE_ID_DEC_1,
+	GAUDI2_DCORE0_ENGINE_ID_TPC_6,
+	GAUDI2_ENGINE_ID_PDMA_0,
+	GAUDI2_ENGINE_ID_PDMA_1,
+	GAUDI2_ENGINE_ID_ROT_0,
+	GAUDI2_ENGINE_ID_ROT_1,
+	GAUDI2_PCIE_ENGINE_ID_DEC_0,
+	GAUDI2_PCIE_ENGINE_ID_DEC_1,
+	GAUDI2_ENGINE_ID_NIC0_0,
+	GAUDI2_ENGINE_ID_NIC0_1,
+	GAUDI2_ENGINE_ID_NIC1_0,
+	GAUDI2_ENGINE_ID_NIC1_1,
+	GAUDI2_ENGINE_ID_NIC2_0,
+	GAUDI2_ENGINE_ID_NIC2_1,
+	GAUDI2_ENGINE_ID_NIC3_0,
+	GAUDI2_ENGINE_ID_NIC3_1,
+	GAUDI2_ENGINE_ID_NIC4_0,
+	GAUDI2_ENGINE_ID_NIC4_1,
+	GAUDI2_ENGINE_ID_NIC5_0,
+	GAUDI2_ENGINE_ID_NIC5_1,
+	GAUDI2_ENGINE_ID_NIC6_0,
+	GAUDI2_ENGINE_ID_NIC6_1,
+	GAUDI2_ENGINE_ID_NIC7_0,
+	GAUDI2_ENGINE_ID_NIC7_1,
+	GAUDI2_ENGINE_ID_NIC8_0,
+	GAUDI2_ENGINE_ID_NIC8_1,
+	GAUDI2_ENGINE_ID_NIC9_0,
+	GAUDI2_ENGINE_ID_NIC9_1,
+	GAUDI2_ENGINE_ID_NIC10_0,
+	GAUDI2_ENGINE_ID_NIC10_1,
+	GAUDI2_ENGINE_ID_NIC11_0,
+	GAUDI2_ENGINE_ID_NIC11_1,
+	GAUDI2_ENGINE_ID_PCIE,
+	GAUDI2_ENGINE_ID_PSOC,
+	GAUDI2_ENGINE_ID_ARC_FARM,
+	GAUDI2_ENGINE_ID_KDMA,
+	GAUDI2_ENGINE_ID_SIZE
+};
+
+/*
+ * ASIC specific PLL index
+ *
+ * Used to retrieve in frequency info of different IPs via HL_INFO_PLL_FREQUENCY under
+ * DRM_IOCTL_HL_INFO IOCTL.
+ * The enums need to be used as an index in struct hl_pll_frequency_info.
+ */
+
+enum hl_goya_pll_index {
+	HL_GOYA_CPU_PLL = 0,
+	HL_GOYA_IC_PLL,
+	HL_GOYA_MC_PLL,
+	HL_GOYA_MME_PLL,
+	HL_GOYA_PCI_PLL,
+	HL_GOYA_EMMC_PLL,
+	HL_GOYA_TPC_PLL,
+	HL_GOYA_PLL_MAX
+};
+
+enum hl_gaudi_pll_index {
+	HL_GAUDI_CPU_PLL = 0,
+	HL_GAUDI_PCI_PLL,
+	HL_GAUDI_SRAM_PLL,
+	HL_GAUDI_HBM_PLL,
+	HL_GAUDI_NIC_PLL,
+	HL_GAUDI_DMA_PLL,
+	HL_GAUDI_MESH_PLL,
+	HL_GAUDI_MME_PLL,
+	HL_GAUDI_TPC_PLL,
+	HL_GAUDI_IF_PLL,
+	HL_GAUDI_PLL_MAX
+};
+
+enum hl_gaudi2_pll_index {
+	HL_GAUDI2_CPU_PLL = 0,
+	HL_GAUDI2_PCI_PLL,
+	HL_GAUDI2_SRAM_PLL,
+	HL_GAUDI2_HBM_PLL,
+	HL_GAUDI2_NIC_PLL,
+	HL_GAUDI2_DMA_PLL,
+	HL_GAUDI2_MESH_PLL,
+	HL_GAUDI2_MME_PLL,
+	HL_GAUDI2_TPC_PLL,
+	HL_GAUDI2_IF_PLL,
+	HL_GAUDI2_VID_PLL,
+	HL_GAUDI2_MSS_PLL,
+	HL_GAUDI2_PLL_MAX
+};
+
+/**
+ * enum hl_goya_dma_direction - Direction of DMA operation inside a LIN_DMA packet that is
+ *                              submitted to the GOYA's DMA QMAN. This attribute is not relevant
+ *                              to the H/W but the kernel driver use it to parse the packet's
+ *                              addresses and patch/validate them.
+ * @HL_DMA_HOST_TO_DRAM: DMA operation from Host memory to GOYA's DDR.
+ * @HL_DMA_HOST_TO_SRAM: DMA operation from Host memory to GOYA's SRAM.
+ * @HL_DMA_DRAM_TO_SRAM: DMA operation from GOYA's DDR to GOYA's SRAM.
+ * @HL_DMA_SRAM_TO_DRAM: DMA operation from GOYA's SRAM to GOYA's DDR.
+ * @HL_DMA_SRAM_TO_HOST: DMA operation from GOYA's SRAM to Host memory.
+ * @HL_DMA_DRAM_TO_HOST: DMA operation from GOYA's DDR to Host memory.
+ * @HL_DMA_DRAM_TO_DRAM: DMA operation from GOYA's DDR to GOYA's DDR.
+ * @HL_DMA_SRAM_TO_SRAM: DMA operation from GOYA's SRAM to GOYA's SRAM.
+ * @HL_DMA_ENUM_MAX: number of values in enum
+ */
+enum hl_goya_dma_direction {
+	HL_DMA_HOST_TO_DRAM,
+	HL_DMA_HOST_TO_SRAM,
+	HL_DMA_DRAM_TO_SRAM,
+	HL_DMA_SRAM_TO_DRAM,
+	HL_DMA_SRAM_TO_HOST,
+	HL_DMA_DRAM_TO_HOST,
+	HL_DMA_DRAM_TO_DRAM,
+	HL_DMA_SRAM_TO_SRAM,
+	HL_DMA_ENUM_MAX
+};
+
+/**
+ * enum hl_device_status - Device status information.
+ * @HL_DEVICE_STATUS_OPERATIONAL: Device is operational.
+ * @HL_DEVICE_STATUS_IN_RESET: Device is currently during reset.
+ * @HL_DEVICE_STATUS_MALFUNCTION: Device is unusable.
+ * @HL_DEVICE_STATUS_NEEDS_RESET: Device needs reset because auto reset was disabled.
+ * @HL_DEVICE_STATUS_IN_DEVICE_CREATION: Device is operational but its creation is still in
+ *                                       progress.
+ * @HL_DEVICE_STATUS_IN_RESET_AFTER_DEVICE_RELEASE: Device is currently during reset that was
+ *                                                  triggered because the user released the device
+ * @HL_DEVICE_STATUS_LAST: Last status.
+ */
+enum hl_device_status {
+	HL_DEVICE_STATUS_OPERATIONAL,
+	HL_DEVICE_STATUS_IN_RESET,
+	HL_DEVICE_STATUS_MALFUNCTION,
+	HL_DEVICE_STATUS_NEEDS_RESET,
+	HL_DEVICE_STATUS_IN_DEVICE_CREATION,
+	HL_DEVICE_STATUS_IN_RESET_AFTER_DEVICE_RELEASE,
+	HL_DEVICE_STATUS_LAST = HL_DEVICE_STATUS_IN_RESET_AFTER_DEVICE_RELEASE
+};
+
+enum hl_server_type {
+	HL_SERVER_TYPE_UNKNOWN = 0,
+	HL_SERVER_GAUDI_HLS1 = 1,
+	HL_SERVER_GAUDI_HLS1H = 2,
+	HL_SERVER_GAUDI_TYPE1 = 3,
+	HL_SERVER_GAUDI_TYPE2 = 4,
+	HL_SERVER_GAUDI2_HLS2 = 5,
+	HL_SERVER_GAUDI2_TYPE1 = 7
+};
+
+/*
+ * Notifier event values - for the notification mechanism and the HL_INFO_GET_EVENTS command
+ *
+ * HL_NOTIFIER_EVENT_TPC_ASSERT		- Indicates TPC assert event
+ * HL_NOTIFIER_EVENT_UNDEFINED_OPCODE	- Indicates undefined operation code
+ * HL_NOTIFIER_EVENT_DEVICE_RESET	- Indicates device requires a reset
+ * HL_NOTIFIER_EVENT_CS_TIMEOUT		- Indicates CS timeout error
+ * HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE	- Indicates device is unavailable
+ * HL_NOTIFIER_EVENT_USER_ENGINE_ERR	- Indicates device engine in error state
+ * HL_NOTIFIER_EVENT_GENERAL_HW_ERR     - Indicates device HW error
+ * HL_NOTIFIER_EVENT_RAZWI              - Indicates razwi happened
+ * HL_NOTIFIER_EVENT_PAGE_FAULT         - Indicates page fault happened
+ * HL_NOTIFIER_EVENT_CRITICAL_HW_ERR    - Indicates a HW error that requires SW abort and
+ *                                        HW reset
+ * HL_NOTIFIER_EVENT_CRITICAL_FW_ERR    - Indicates a FW error that requires SW abort and
+ *                                        HW reset
+ */
+#define HL_NOTIFIER_EVENT_TPC_ASSERT		(1ULL << 0)
+#define HL_NOTIFIER_EVENT_UNDEFINED_OPCODE	(1ULL << 1)
+#define HL_NOTIFIER_EVENT_DEVICE_RESET		(1ULL << 2)
+#define HL_NOTIFIER_EVENT_CS_TIMEOUT		(1ULL << 3)
+#define HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE	(1ULL << 4)
+#define HL_NOTIFIER_EVENT_USER_ENGINE_ERR	(1ULL << 5)
+#define HL_NOTIFIER_EVENT_GENERAL_HW_ERR	(1ULL << 6)
+#define HL_NOTIFIER_EVENT_RAZWI			(1ULL << 7)
+#define HL_NOTIFIER_EVENT_PAGE_FAULT		(1ULL << 8)
+#define HL_NOTIFIER_EVENT_CRITICL_HW_ERR	(1ULL << 9)
+#define HL_NOTIFIER_EVENT_CRITICL_FW_ERR	(1ULL << 10)
+
+/* Opcode for management ioctl
+ *
+ * HW_IP_INFO            - Receive information about different IP blocks in the
+ *                         device.
+ * HL_INFO_HW_EVENTS     - Receive an array describing how many times each event
+ *                         occurred since the last hard reset.
+ * HL_INFO_DRAM_USAGE    - Retrieve the dram usage inside the device and of the
+ *                         specific context. This is relevant only for devices
+ *                         where the dram is managed by the kernel driver
+ * HL_INFO_HW_IDLE       - Retrieve information about the idle status of each
+ *                         internal engine.
+ * HL_INFO_DEVICE_STATUS - Retrieve the device's status. This opcode doesn't
+ *                         require an open context.
+ * HL_INFO_DEVICE_UTILIZATION  - Retrieve the total utilization of the device
+ *                               over the last period specified by the user.
+ *                               The period can be between 100ms to 1s, in
+ *                               resolution of 100ms. The return value is a
+ *                               percentage of the utilization rate.
+ * HL_INFO_HW_EVENTS_AGGREGATE - Receive an array describing how many times each
+ *                               event occurred since the driver was loaded.
+ * HL_INFO_CLK_RATE            - Retrieve the current and maximum clock rate
+ *                               of the device in MHz. The maximum clock rate is
+ *                               configurable via sysfs parameter
+ * HL_INFO_RESET_COUNT   - Retrieve the counts of the soft and hard reset
+ *                         operations performed on the device since the last
+ *                         time the driver was loaded.
+ * HL_INFO_TIME_SYNC     - Retrieve the device's time alongside the host's time
+ *                         for synchronization.
+ * HL_INFO_CS_COUNTERS   - Retrieve command submission counters
+ * HL_INFO_PCI_COUNTERS  - Retrieve PCI counters
+ * HL_INFO_CLK_THROTTLE_REASON - Retrieve clock throttling reason
+ * HL_INFO_SYNC_MANAGER  - Retrieve sync manager info per dcore
+ * HL_INFO_TOTAL_ENERGY  - Retrieve total energy consumption
+ * HL_INFO_PLL_FREQUENCY - Retrieve PLL frequency
+ * HL_INFO_POWER         - Retrieve power information
+ * HL_INFO_OPEN_STATS    - Retrieve info regarding recent device open calls
+ * HL_INFO_DRAM_REPLACED_ROWS - Retrieve DRAM replaced rows info
+ * HL_INFO_DRAM_PENDING_ROWS - Retrieve DRAM pending rows num
+ * HL_INFO_LAST_ERR_OPEN_DEV_TIME - Retrieve timestamp of the last time the device was opened
+ *                                  and CS timeout or razwi error occurred.
+ * HL_INFO_CS_TIMEOUT_EVENT - Retrieve CS timeout timestamp and its related CS sequence number.
+ * HL_INFO_RAZWI_EVENT - Retrieve parameters of razwi:
+ *                            Timestamp of razwi.
+ *                            The address which accessing it caused the razwi.
+ *                            Razwi initiator.
+ *                            Razwi cause, was it a page fault or MMU access error.
+ *                            May return 0 even though no new data is available, in that case
+ *                            timestamp will be 0.
+ * HL_INFO_DEV_MEM_ALLOC_PAGE_SIZES - Retrieve valid page sizes for device memory allocation
+ * HL_INFO_SECURED_ATTESTATION - Retrieve attestation report of the boot.
+ * HL_INFO_REGISTER_EVENTFD   - Register eventfd for event notifications.
+ * HL_INFO_UNREGISTER_EVENTFD - Unregister eventfd
+ * HL_INFO_GET_EVENTS         - Retrieve the last occurred events
+ * HL_INFO_UNDEFINED_OPCODE_EVENT - Retrieve last undefined opcode error information.
+ *                                  May return 0 even though no new data is available, in that case
+ *                                  timestamp will be 0.
+ * HL_INFO_ENGINE_STATUS - Retrieve the status of all the h/w engines in the asic.
+ * HL_INFO_PAGE_FAULT_EVENT - Retrieve parameters of captured page fault.
+ *                            May return 0 even though no new data is available, in that case
+ *                            timestamp will be 0.
+ * HL_INFO_USER_MAPPINGS - Retrieve user mappings, captured after page fault event.
+ * HL_INFO_FW_GENERIC_REQ - Send generic request to FW.
+ * HL_INFO_HW_ERR_EVENT   - Retrieve information on the reported HW error.
+ *                          May return 0 even though no new data is available, in that case
+ *                          timestamp will be 0.
+ * HL_INFO_FW_ERR_EVENT   - Retrieve information on the reported FW error.
+ *                          May return 0 even though no new data is available, in that case
+ *                          timestamp will be 0.
+ * HL_INFO_USER_ENGINE_ERR_EVENT - Retrieve the last engine id that reported an error.
+ */
+#define HL_INFO_HW_IP_INFO			0
+#define HL_INFO_HW_EVENTS			1
+#define HL_INFO_DRAM_USAGE			2
+#define HL_INFO_HW_IDLE				3
+#define HL_INFO_DEVICE_STATUS			4
+#define HL_INFO_DEVICE_UTILIZATION		6
+#define HL_INFO_HW_EVENTS_AGGREGATE		7
+#define HL_INFO_CLK_RATE			8
+#define HL_INFO_RESET_COUNT			9
+#define HL_INFO_TIME_SYNC			10
+#define HL_INFO_CS_COUNTERS			11
+#define HL_INFO_PCI_COUNTERS			12
+#define HL_INFO_CLK_THROTTLE_REASON		13
+#define HL_INFO_SYNC_MANAGER			14
+#define HL_INFO_TOTAL_ENERGY			15
+#define HL_INFO_PLL_FREQUENCY			16
+#define HL_INFO_POWER				17
+#define HL_INFO_OPEN_STATS			18
+#define HL_INFO_DRAM_REPLACED_ROWS		21
+#define HL_INFO_DRAM_PENDING_ROWS		22
+#define HL_INFO_LAST_ERR_OPEN_DEV_TIME		23
+#define HL_INFO_CS_TIMEOUT_EVENT		24
+#define HL_INFO_RAZWI_EVENT			25
+#define HL_INFO_DEV_MEM_ALLOC_PAGE_SIZES	26
+#define HL_INFO_SECURED_ATTESTATION		27
+#define HL_INFO_REGISTER_EVENTFD		28
+#define HL_INFO_UNREGISTER_EVENTFD		29
+#define HL_INFO_GET_EVENTS			30
+#define HL_INFO_UNDEFINED_OPCODE_EVENT		31
+#define HL_INFO_ENGINE_STATUS			32
+#define HL_INFO_PAGE_FAULT_EVENT		33
+#define HL_INFO_USER_MAPPINGS			34
+#define HL_INFO_FW_GENERIC_REQ			35
+#define HL_INFO_HW_ERR_EVENT			36
+#define HL_INFO_FW_ERR_EVENT			37
+#define HL_INFO_USER_ENGINE_ERR_EVENT		38
+#define HL_INFO_DEV_SIGNED			40
+
+#define HL_INFO_VERSION_MAX_LEN			128
+#define HL_INFO_CARD_NAME_MAX_LEN		16
+
+/* Maximum buffer size for retrieving engines status */
+#define HL_ENGINES_DATA_MAX_SIZE	SZ_1M
+
+/**
+ * struct hl_info_hw_ip_info - hardware information on various IPs in the ASIC
+ * @sram_base_address: The first SRAM physical base address that is free to be
+ *                     used by the user.
+ * @dram_base_address: The first DRAM virtual or physical base address that is
+ *                     free to be used by the user.
+ * @dram_size: The DRAM size that is available to the user.
+ * @sram_size: The SRAM size that is available to the user.
+ * @num_of_events: The number of events that can be received from the f/w. This
+ *                 is needed so the user can what is the size of the h/w events
+ *                 array he needs to pass to the kernel when he wants to fetch
+ *                 the event counters.
+ * @device_id: PCI device ID of the ASIC.
+ * @module_id: Module ID of the ASIC for mezzanine cards in servers
+ *             (From OCP spec).
+ * @decoder_enabled_mask: Bit-mask that represents which decoders are enabled.
+ * @first_available_interrupt_id: The first available interrupt ID for the user
+ *                                to be used when it works with user interrupts.
+ *                                Relevant for Gaudi2 and later.
+ * @server_type: Server type that the Gaudi ASIC is currently installed in.
+ *               The value is according to enum hl_server_type
+ * @cpld_version: CPLD version on the board.
+ * @psoc_pci_pll_nr: PCI PLL NR value. Needed by the profiler in some ASICs.
+ * @psoc_pci_pll_nf: PCI PLL NF value. Needed by the profiler in some ASICs.
+ * @psoc_pci_pll_od: PCI PLL OD value. Needed by the profiler in some ASICs.
+ * @psoc_pci_pll_div_factor: PCI PLL DIV factor value. Needed by the profiler
+ *                           in some ASICs.
+ * @tpc_enabled_mask: Bit-mask that represents which TPCs are enabled. Relevant
+ *                    for Goya/Gaudi only.
+ * @dram_enabled: Whether the DRAM is enabled.
+ * @security_enabled: Whether security is enabled on device.
+ * @mme_master_slave_mode: Indicate whether the MME is working in master/slave
+ *                         configuration. Relevant for Gaudi2 and later.
+ * @cpucp_version: The CPUCP f/w version.
+ * @card_name: The card name as passed by the f/w.
+ * @tpc_enabled_mask_ext: Bit-mask that represents which TPCs are enabled.
+ *                        Relevant for Gaudi2 and later.
+ * @dram_page_size: The DRAM physical page size.
+ * @edma_enabled_mask: Bit-mask that represents which EDMAs are enabled.
+ *                     Relevant for Gaudi2 and later.
+ * @number_of_user_interrupts: The number of interrupts that are available to the userspace
+ *                             application to use. Relevant for Gaudi2 and later.
+ * @device_mem_alloc_default_page_size: default page size used in device memory allocation.
+ * @revision_id: PCI revision ID of the ASIC.
+ * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
+ * @rotator_enabled_mask: Bit-mask that represents which rotators are enabled.
+ *                        Relevant for Gaudi3 and later.
+ * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
+ *                                  in order to raise events toward FW.
+ * @reserved_dram_size: DRAM size reserved for driver and firmware.
+ */
+struct hl_info_hw_ip_info {
+	__u64 sram_base_address;
+	__u64 dram_base_address;
+	__u64 dram_size;
+	__u32 sram_size;
+	__u32 num_of_events;
+	__u32 device_id;
+	__u32 module_id;
+	__u32 decoder_enabled_mask;
+	__u16 first_available_interrupt_id;
+	__u16 server_type;
+	__u32 cpld_version;
+	__u32 psoc_pci_pll_nr;
+	__u32 psoc_pci_pll_nf;
+	__u32 psoc_pci_pll_od;
+	__u32 psoc_pci_pll_div_factor;
+	__u8 tpc_enabled_mask;
+	__u8 dram_enabled;
+	__u8 security_enabled;
+	__u8 mme_master_slave_mode;
+	__u8 cpucp_version[HL_INFO_VERSION_MAX_LEN];
+	__u8 card_name[HL_INFO_CARD_NAME_MAX_LEN];
+	__u64 tpc_enabled_mask_ext;
+	__u64 dram_page_size;
+	__u32 edma_enabled_mask;
+	__u16 number_of_user_interrupts;
+	__u8 reserved1;
+	__u8 reserved2;
+	__u64 reserved3;
+	__u64 device_mem_alloc_default_page_size;
+	__u64 reserved4;
+	__u64 reserved5;
+	__u32 reserved6;
+	__u8 reserved7;
+	__u8 revision_id;
+	__u16 tpc_interrupt_id;
+	__u32 rotator_enabled_mask;
+	__u32 reserved9;
+	__u64 engine_core_interrupt_reg_addr;
+	__u64 reserved_dram_size;
+};
+
+struct hl_info_dram_usage {
+	__u64 dram_free_mem;
+	__u64 ctx_dram_mem;
+};
+
+#define HL_BUSY_ENGINES_MASK_EXT_SIZE	4
+
+struct hl_info_hw_idle {
+	__u32 is_idle;
+	/*
+	 * Bitmask of busy engines.
+	 * Bits definition is according to `enum <chip>_engine_id'.
+	 */
+	__u32 busy_engines_mask;
+
+	/*
+	 * Extended Bitmask of busy engines.
+	 * Bits definition is according to `enum <chip>_engine_id'.
+	 */
+	__u64 busy_engines_mask_ext[HL_BUSY_ENGINES_MASK_EXT_SIZE];
+};
+
+struct hl_info_device_status {
+	__u32 status;
+	__u32 pad;
+};
+
+struct hl_info_device_utilization {
+	__u32 utilization;
+	__u32 pad;
+};
+
+struct hl_info_clk_rate {
+	__u32 cur_clk_rate_mhz;
+	__u32 max_clk_rate_mhz;
+};
+
+struct hl_info_reset_count {
+	__u32 hard_reset_cnt;
+	__u32 soft_reset_cnt;
+};
+
+struct hl_info_time_sync {
+	__u64 device_time;
+	__u64 host_time;
+	__u64 tsc_time;
+};
+
+/**
+ * struct hl_info_pci_counters - pci counters
+ * @rx_throughput: PCI rx throughput KBps
+ * @tx_throughput: PCI tx throughput KBps
+ * @replay_cnt: PCI replay counter
+ */
+struct hl_info_pci_counters {
+	__u64 rx_throughput;
+	__u64 tx_throughput;
+	__u64 replay_cnt;
+};
+
+enum hl_clk_throttling_type {
+	HL_CLK_THROTTLE_TYPE_POWER,
+	HL_CLK_THROTTLE_TYPE_THERMAL,
+	HL_CLK_THROTTLE_TYPE_MAX
+};
+
+/* clk_throttling_reason masks */
+#define HL_CLK_THROTTLE_POWER		(1 << HL_CLK_THROTTLE_TYPE_POWER)
+#define HL_CLK_THROTTLE_THERMAL		(1 << HL_CLK_THROTTLE_TYPE_THERMAL)
+
+/**
+ * struct hl_info_clk_throttle - clock throttling reason
+ * @clk_throttling_reason: each bit represents a clk throttling reason
+ * @clk_throttling_timestamp_us: represents CPU timestamp in microseconds of the start-event
+ * @clk_throttling_duration_ns: the clock throttle time in nanosec
+ */
+struct hl_info_clk_throttle {
+	__u32 clk_throttling_reason;
+	__u32 pad;
+	__u64 clk_throttling_timestamp_us[HL_CLK_THROTTLE_TYPE_MAX];
+	__u64 clk_throttling_duration_ns[HL_CLK_THROTTLE_TYPE_MAX];
+};
+
+/**
+ * struct hl_info_energy - device energy information
+ * @total_energy_consumption: total device energy consumption
+ */
+struct hl_info_energy {
+	__u64 total_energy_consumption;
+};
+
+#define HL_PLL_NUM_OUTPUTS 4
+
+struct hl_pll_frequency_info {
+	__u16 output[HL_PLL_NUM_OUTPUTS];
+};
+
+/**
+ * struct hl_open_stats_info - device open statistics information
+ * @open_counter: ever growing counter, increased on each successful dev open
+ * @last_open_period_ms: duration (ms) device was open last time
+ * @is_compute_ctx_active: Whether there is an active compute context executing
+ * @compute_ctx_in_release: true if the current compute context is being released
+ */
+struct hl_open_stats_info {
+	__u64 open_counter;
+	__u64 last_open_period_ms;
+	__u8 is_compute_ctx_active;
+	__u8 compute_ctx_in_release;
+	__u8 pad[6];
+};
+
+/**
+ * struct hl_power_info - power information
+ * @power: power consumption
+ */
+struct hl_power_info {
+	__u64 power;
+};
+
+/**
+ * struct hl_info_sync_manager - sync manager information
+ * @first_available_sync_object: first available sob
+ * @first_available_monitor: first available monitor
+ * @first_available_cq: first available cq
+ */
+struct hl_info_sync_manager {
+	__u32 first_available_sync_object;
+	__u32 first_available_monitor;
+	__u32 first_available_cq;
+	__u32 reserved;
+};
+
+/**
+ * struct hl_info_cs_counters - command submission counters
+ * @total_out_of_mem_drop_cnt: total dropped due to memory allocation issue
+ * @ctx_out_of_mem_drop_cnt: context dropped due to memory allocation issue
+ * @total_parsing_drop_cnt: total dropped due to error in packet parsing
+ * @ctx_parsing_drop_cnt: context dropped due to error in packet parsing
+ * @total_queue_full_drop_cnt: total dropped due to queue full
+ * @ctx_queue_full_drop_cnt: context dropped due to queue full
+ * @total_device_in_reset_drop_cnt: total dropped due to device in reset
+ * @ctx_device_in_reset_drop_cnt: context dropped due to device in reset
+ * @total_max_cs_in_flight_drop_cnt: total dropped due to maximum CS in-flight
+ * @ctx_max_cs_in_flight_drop_cnt: context dropped due to maximum CS in-flight
+ * @total_validation_drop_cnt: total dropped due to validation error
+ * @ctx_validation_drop_cnt: context dropped due to validation error
+ */
+struct hl_info_cs_counters {
+	__u64 total_out_of_mem_drop_cnt;
+	__u64 ctx_out_of_mem_drop_cnt;
+	__u64 total_parsing_drop_cnt;
+	__u64 ctx_parsing_drop_cnt;
+	__u64 total_queue_full_drop_cnt;
+	__u64 ctx_queue_full_drop_cnt;
+	__u64 total_device_in_reset_drop_cnt;
+	__u64 ctx_device_in_reset_drop_cnt;
+	__u64 total_max_cs_in_flight_drop_cnt;
+	__u64 ctx_max_cs_in_flight_drop_cnt;
+	__u64 total_validation_drop_cnt;
+	__u64 ctx_validation_drop_cnt;
+};
+
+/**
+ * struct hl_info_last_err_open_dev_time - last error boot information.
+ * @timestamp: timestamp of last time the device was opened and error occurred.
+ */
+struct hl_info_last_err_open_dev_time {
+	__s64 timestamp;
+};
+
+/**
+ * struct hl_info_cs_timeout_event - last CS timeout information.
+ * @timestamp: timestamp when last CS timeout event occurred.
+ * @seq: sequence number of last CS timeout event.
+ */
+struct hl_info_cs_timeout_event {
+	__s64 timestamp;
+	__u64 seq;
+};
+
+#define HL_RAZWI_NA_ENG_ID U16_MAX
+#define HL_RAZWI_MAX_NUM_OF_ENGINES_PER_RTR 128
+#define HL_RAZWI_READ		BIT(0)
+#define HL_RAZWI_WRITE		BIT(1)
+#define HL_RAZWI_LBW		BIT(2)
+#define HL_RAZWI_HBW		BIT(3)
+#define HL_RAZWI_RR		BIT(4)
+#define HL_RAZWI_ADDR_DEC	BIT(5)
+
+/**
+ * struct hl_info_razwi_event - razwi information.
+ * @timestamp: timestamp of razwi.
+ * @addr: address which accessing it caused razwi.
+ * @engine_id: engine id of the razwi initiator, if it was initiated by engine that does not
+ *             have engine id it will be set to HL_RAZWI_NA_ENG_ID. If there are several possible
+ *             engines which caused the razwi, it will hold all of them.
+ * @num_of_possible_engines: contains number of possible engine ids. In some asics, razwi indication
+ *                           might be common for several engines and there is no way to get the
+ *                           exact engine. In this way, engine_id array will be filled with all
+ *                           possible engines caused this razwi. Also, there might be possibility
+ *                           in gaudi, where we don't indication on specific engine, in that case
+ *                           the value of this parameter will be zero.
+ * @flags: bitmask for additional data: HL_RAZWI_READ - razwi caused by read operation
+ *                                      HL_RAZWI_WRITE - razwi caused by write operation
+ *                                      HL_RAZWI_LBW - razwi caused by lbw fabric transaction
+ *                                      HL_RAZWI_HBW - razwi caused by hbw fabric transaction
+ *                                      HL_RAZWI_RR - razwi caused by range register
+ *                                      HL_RAZWI_ADDR_DEC - razwi caused by address decode error
+ *         Note: this data is not supported by all asics, in that case the relevant bits will not
+ *               be set.
+ */
+struct hl_info_razwi_event {
+	__s64 timestamp;
+	__u64 addr;
+	__u16 engine_id[HL_RAZWI_MAX_NUM_OF_ENGINES_PER_RTR];
+	__u16 num_of_possible_engines;
+	__u8 flags;
+	__u8 pad[5];
+};
+
+#define MAX_QMAN_STREAMS_INFO		4
+#define OPCODE_INFO_MAX_ADDR_SIZE	8
+/**
+ * struct hl_info_undefined_opcode_event - info about last undefined opcode error
+ * @timestamp: timestamp of the undefined opcode error
+ * @cb_addr_streams: CB addresses (per stream) that are currently exists in the PQ
+ *                   entries. In case all streams array entries are
+ *                   filled with values, it means the execution was in Lower-CP.
+ * @cq_addr: the address of the current handled command buffer
+ * @cq_size: the size of the current handled command buffer
+ * @cb_addr_streams_len: num of streams - actual len of cb_addr_streams array.
+ *                       should be equal to 1 in case of undefined opcode
+ *                       in Upper-CP (specific stream) and equal to 4 incase
+ *                       of undefined opcode in Lower-CP.
+ * @engine_id: engine-id that the error occurred on
+ * @stream_id: the stream id the error occurred on. In case the stream equals to
+ *             MAX_QMAN_STREAMS_INFO it means the error occurred on a Lower-CP.
+ */
+struct hl_info_undefined_opcode_event {
+	__s64 timestamp;
+	__u64 cb_addr_streams[MAX_QMAN_STREAMS_INFO][OPCODE_INFO_MAX_ADDR_SIZE];
+	__u64 cq_addr;
+	__u32 cq_size;
+	__u32 cb_addr_streams_len;
+	__u32 engine_id;
+	__u32 stream_id;
+};
+
+/**
+ * struct hl_info_hw_err_event - info about HW error
+ * @timestamp: timestamp of error occurrence
+ * @event_id: The async event ID (specific to each device type).
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_hw_err_event {
+	__s64 timestamp;
+	__u16 event_id;
+	__u16 pad[3];
+};
+
+/* FW error definition for event_type in struct hl_info_fw_err_event */
+enum hl_info_fw_err_type {
+	HL_INFO_FW_HEARTBEAT_ERR,
+	HL_INFO_FW_REPORTED_ERR,
+};
+
+/**
+ * struct hl_info_fw_err_event - info about FW error
+ * @timestamp: time-stamp of error occurrence
+ * @err_type: The type of event as defined in hl_info_fw_err_type.
+ * @event_id: The async event ID (specific to each device type, applicable only when event type is
+ *             HL_INFO_FW_REPORTED_ERR).
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_fw_err_event {
+	__s64 timestamp;
+	__u16 err_type;
+	__u16 event_id;
+	__u32 pad;
+};
+
+/**
+ * struct hl_info_engine_err_event - engine error info
+ * @timestamp: time-stamp of error occurrence
+ * @engine_id: engine id who reported the error.
+ * @error_count: Amount of errors reported.
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_engine_err_event {
+	__s64 timestamp;
+	__u16 engine_id;
+	__u16 error_count;
+	__u32 pad;
+};
+
+/**
+ * struct hl_info_dev_memalloc_page_sizes - valid page sizes in device mem alloc information.
+ * @page_order_bitmask: bitmap in which a set bit represents the order of the supported page size
+ *                      (e.g. 0x2100000 means that 1MB and 32MB pages are supported).
+ */
+struct hl_info_dev_memalloc_page_sizes {
+	__u64 page_order_bitmask;
+};
+
+#define SEC_PCR_DATA_BUF_SZ	256
+#define SEC_PCR_QUOTE_BUF_SZ	510	/* (512 - 2) 2 bytes used for size */
+#define SEC_SIGNATURE_BUF_SZ	255	/* (256 - 1) 1 byte used for size */
+#define SEC_PUB_DATA_BUF_SZ	510	/* (512 - 2) 2 bytes used for size */
+#define SEC_CERTIFICATE_BUF_SZ	2046	/* (2048 - 2) 2 bytes used for size */
+#define SEC_DEV_INFO_BUF_SZ	5120
+
+/*
+ * struct hl_info_sec_attest - attestation report of the boot
+ * @nonce: number only used once. random number provided by host. this also passed to the quote
+ *         command as a qualifying data.
+ * @pcr_quote_len: length of the attestation quote data (bytes)
+ * @pub_data_len: length of the public data (bytes)
+ * @certificate_len: length of the certificate (bytes)
+ * @pcr_num_reg: number of PCR registers in the pcr_data array
+ * @pcr_reg_len: length of each PCR register in the pcr_data array (bytes)
+ * @quote_sig_len: length of the attestation report signature (bytes)
+ * @pcr_data: raw values of the PCR registers
+ * @pcr_quote: attestation report data structure
+ * @quote_sig: signature structure of the attestation report
+ * @public_data: public key for the signed attestation
+ *		 (outPublic + name + qualifiedName)
+ * @certificate: certificate for the attestation signing key
+ */
+struct hl_info_sec_attest {
+	__u32 nonce;
+	__u16 pcr_quote_len;
+	__u16 pub_data_len;
+	__u16 certificate_len;
+	__u8 pcr_num_reg;
+	__u8 pcr_reg_len;
+	__u8 quote_sig_len;
+	__u8 pcr_data[SEC_PCR_DATA_BUF_SZ];
+	__u8 pcr_quote[SEC_PCR_QUOTE_BUF_SZ];
+	__u8 quote_sig[SEC_SIGNATURE_BUF_SZ];
+	__u8 public_data[SEC_PUB_DATA_BUF_SZ];
+	__u8 certificate[SEC_CERTIFICATE_BUF_SZ];
+	__u8 pad0[2];
+};
+
+/*
+ * struct hl_info_signed - device information signed by a secured device.
+ * @nonce: number only used once. random number provided by host. this also passed to the quote
+ *         command as a qualifying data.
+ * @pub_data_len: length of the public data (bytes)
+ * @certificate_len: length of the certificate (bytes)
+ * @info_sig_len: length of the attestation signature (bytes)
+ * @public_data: public key info signed info data (outPublic + name + qualifiedName)
+ * @certificate: certificate for the signing key
+ * @info_sig: signature of the info + nonce data.
+ * @dev_info_len: length of device info (bytes)
+ * @dev_info: device info as byte array.
+ */
+struct hl_info_signed {
+	__u32 nonce;
+	__u16 pub_data_len;
+	__u16 certificate_len;
+	__u8 info_sig_len;
+	__u8 public_data[SEC_PUB_DATA_BUF_SZ];
+	__u8 certificate[SEC_CERTIFICATE_BUF_SZ];
+	__u8 info_sig[SEC_SIGNATURE_BUF_SZ];
+	__u16 dev_info_len;
+	__u8 dev_info[SEC_DEV_INFO_BUF_SZ];
+	__u8 pad[2];
+};
+
+/**
+ * struct hl_page_fault_info - page fault information.
+ * @timestamp: timestamp of page fault.
+ * @addr: address which accessing it caused page fault.
+ * @engine_id: engine id which caused the page fault, supported only in gaudi3.
+ */
+struct hl_page_fault_info {
+	__s64 timestamp;
+	__u64 addr;
+	__u16 engine_id;
+	__u8 pad[6];
+};
+
+/**
+ * struct hl_user_mapping - user mapping information.
+ * @dev_va: device virtual address.
+ * @size: virtual address mapping size.
+ */
+struct hl_user_mapping {
+	__u64 dev_va;
+	__u64 size;
+};
+
+enum gaudi_dcores {
+	HL_GAUDI_WS_DCORE,
+	HL_GAUDI_WN_DCORE,
+	HL_GAUDI_EN_DCORE,
+	HL_GAUDI_ES_DCORE
+};
+
+/**
+ * struct hl_info_args - Main structure to retrieve device related information.
+ * @return_pointer: User space address of the relevant structure related to HL_INFO_* operation
+ *                  mentioned in @op.
+ * @return_size: Size of the structure used in @return_pointer, just like "size" in "snprintf", it
+ *               limits how many bytes the kernel can write. For hw_events array, the size should be
+ *               hl_info_hw_ip_info.num_of_events * sizeof(__u32).
+ * @op: Defines which type of information to be retrieved. Refer HL_INFO_* for details.
+ * @dcore_id: DCORE id for which the information is relevant (for Gaudi refer to enum gaudi_dcores).
+ * @ctx_id: Context ID of the user. Currently not in use.
+ * @period_ms: Period value, in milliseconds, for utilization rate in range 100ms - 1000ms in 100 ms
+ *             resolution. Currently not in use.
+ * @pll_index: Index as defined in hl_<asic type>_pll_index enumeration.
+ * @eventfd: event file descriptor for event notifications.
+ * @user_buffer_actual_size: Actual data size which was copied to user allocated buffer by the
+ *                           driver. It is possible for the user to allocate buffer larger than
+ *                           needed, hence updating this variable so user will know the exact amount
+ *                           of bytes copied by the kernel to the buffer.
+ * @sec_attest_nonce: Nonce number used for attestation report.
+ * @array_size: Number of array members copied to user buffer.
+ *              Relevant for HL_INFO_USER_MAPPINGS info ioctl.
+ * @fw_sub_opcode: generic requests sub opcodes.
+ * @pad: Padding to 64 bit.
+ */
+struct hl_info_args {
+	__u64 return_pointer;
+	__u32 return_size;
+	__u32 op;
+
+	union {
+		__u32 dcore_id;
+		__u32 ctx_id;
+		__u32 period_ms;
+		__u32 pll_index;
+		__u32 eventfd;
+		__u32 user_buffer_actual_size;
+		__u32 sec_attest_nonce;
+		__u32 array_size;
+		__u32 fw_sub_opcode;
+	};
+
+	__u32 pad;
+};
+
+/* Opcode to create a new command buffer */
+#define HL_CB_OP_CREATE		0
+/* Opcode to destroy previously created command buffer */
+#define HL_CB_OP_DESTROY	1
+/* Opcode to retrieve information about a command buffer */
+#define HL_CB_OP_INFO		2
+
+/* 2MB minus 32 bytes for 2xMSG_PROT */
+#define HL_MAX_CB_SIZE		(0x200000 - 32)
+
+/* Indicates whether the command buffer should be mapped to the device's MMU */
+#define HL_CB_FLAGS_MAP			0x1
+
+/* Used with HL_CB_OP_INFO opcode to get the device va address for kernel mapped CB */
+#define HL_CB_FLAGS_GET_DEVICE_VA	0x2
+
+struct hl_cb_in {
+	/* Handle of CB or 0 if we want to create one */
+	__u64 cb_handle;
+	/* HL_CB_OP_* */
+	__u32 op;
+
+	/* Size of CB. Maximum size is HL_MAX_CB_SIZE. The minimum size that
+	 * will be allocated, regardless of this parameter's value, is PAGE_SIZE
+	 */
+	__u32 cb_size;
+
+	/* Context ID - Currently not in use */
+	__u32 ctx_id;
+	/* HL_CB_FLAGS_* */
+	__u32 flags;
+};
+
+struct hl_cb_out {
+	union {
+		/* Handle of CB */
+		__u64 cb_handle;
+
+		union {
+			/* Information about CB */
+			struct {
+				/* Usage count of CB */
+				__u32 usage_cnt;
+				__u32 pad;
+			};
+
+			/* CB mapped address to device MMU */
+			__u64 device_va;
+		};
+	};
+};
+
+union hl_cb_args {
+	struct hl_cb_in in;
+	struct hl_cb_out out;
+};
+
+/* HL_CS_CHUNK_FLAGS_ values
+ *
+ * HL_CS_CHUNK_FLAGS_USER_ALLOC_CB:
+ *      Indicates if the CB was allocated and mapped by userspace
+ *      (relevant to Gaudi2 and later). User allocated CB is a command buffer,
+ *      allocated by the user, via malloc (or similar). After allocating the
+ *      CB, the user invokes - “memory ioctl” to map the user memory into a
+ *      device virtual address. The user provides this address via the
+ *      cb_handle field. The interface provides the ability to create a
+ *      large CBs, Which aren’t limited to “HL_MAX_CB_SIZE”. Therefore, it
+ *      increases the PCI-DMA queues throughput. This CB allocation method
+ *      also reduces the use of Linux DMA-able memory pool. Which are limited
+ *      and used by other Linux sub-systems.
+ */
+#define HL_CS_CHUNK_FLAGS_USER_ALLOC_CB 0x1
+
+/*
+ * This structure size must always be fixed to 64-bytes for backward
+ * compatibility
+ */
+struct hl_cs_chunk {
+	union {
+		/* Goya/Gaudi:
+		 * For external queue, this represents a Handle of CB on the
+		 * Host.
+		 * For internal queue in Goya, this represents an SRAM or
+		 * a DRAM address of the internal CB. In Gaudi, this might also
+		 * represent a mapped host address of the CB.
+		 *
+		 * Gaudi2 onwards:
+		 * For H/W queue, this represents either a Handle of CB on the
+		 * Host, or an SRAM, a DRAM, or a mapped host address of the CB.
+		 *
+		 * A mapped host address is in the device address space, after
+		 * a host address was mapped by the device MMU.
+		 */
+		__u64 cb_handle;
+
+		/* Relevant only when HL_CS_FLAGS_WAIT or
+		 * HL_CS_FLAGS_COLLECTIVE_WAIT is set
+		 * This holds address of array of u64 values that contain
+		 * signal CS sequence numbers. The wait described by
+		 * this job will listen on all those signals
+		 * (wait event per signal)
+		 */
+		__u64 signal_seq_arr;
+
+		/*
+		 * Relevant only when HL_CS_FLAGS_WAIT or
+		 * HL_CS_FLAGS_COLLECTIVE_WAIT is set
+		 * along with HL_CS_FLAGS_ENCAP_SIGNALS.
+		 * This is the CS sequence which has the encapsulated signals.
+		 */
+		__u64 encaps_signal_seq;
+	};
+
+	/* Index of queue to put the CB on */
+	__u32 queue_index;
+
+	union {
+		/*
+		 * Size of command buffer with valid packets
+		 * Can be smaller then actual CB size
+		 */
+		__u32 cb_size;
+
+		/* Relevant only when HL_CS_FLAGS_WAIT or
+		 * HL_CS_FLAGS_COLLECTIVE_WAIT is set.
+		 * Number of entries in signal_seq_arr
+		 */
+		__u32 num_signal_seq_arr;
+
+		/* Relevant only when HL_CS_FLAGS_WAIT or
+		 * HL_CS_FLAGS_COLLECTIVE_WAIT is set along
+		 * with HL_CS_FLAGS_ENCAP_SIGNALS
+		 * This set the signals range that the user want to wait for
+		 * out of the whole reserved signals range.
+		 * e.g if the signals range is 20, and user don't want
+		 * to wait for signal 8, so he set this offset to 7, then
+		 * he call the API again with 9 and so on till 20.
+		 */
+		__u32 encaps_signal_offset;
+	};
+
+	/* HL_CS_CHUNK_FLAGS_* */
+	__u32 cs_chunk_flags;
+
+	/* Relevant only when HL_CS_FLAGS_COLLECTIVE_WAIT is set.
+	 * This holds the collective engine ID. The wait described by this job
+	 * will sync with this engine and with all NICs before completion.
+	 */
+	__u32 collective_engine_id;
+
+	/* Align structure to 64 bytes */
+	__u32 pad[10];
+};
+
+/* SIGNAL/WAIT/COLLECTIVE_WAIT flags are mutually exclusive */
+#define HL_CS_FLAGS_FORCE_RESTORE		0x1
+#define HL_CS_FLAGS_SIGNAL			0x2
+#define HL_CS_FLAGS_WAIT			0x4
+#define HL_CS_FLAGS_COLLECTIVE_WAIT		0x8
+
+#define HL_CS_FLAGS_TIMESTAMP			0x20
+#define HL_CS_FLAGS_STAGED_SUBMISSION		0x40
+#define HL_CS_FLAGS_STAGED_SUBMISSION_FIRST	0x80
+#define HL_CS_FLAGS_STAGED_SUBMISSION_LAST	0x100
+#define HL_CS_FLAGS_CUSTOM_TIMEOUT		0x200
+#define HL_CS_FLAGS_SKIP_RESET_ON_TIMEOUT	0x400
+
+/*
+ * The encapsulated signals CS is merged into the existing CS ioctls.
+ * In order to use this feature need to follow the below procedure:
+ * 1. Reserve signals, set the CS type to HL_CS_FLAGS_RESERVE_SIGNALS_ONLY
+ *    the output of this API will be the SOB offset from CFG_BASE.
+ *    this address will be used to patch CB cmds to do the signaling for this
+ *    SOB by incrementing it's value.
+ *    for reverting the reservation use HL_CS_FLAGS_UNRESERVE_SIGNALS_ONLY
+ *    CS type, note that this might fail if out-of-sync happened to the SOB
+ *    value, in case other signaling request to the same SOB occurred between
+ *    reserve-unreserve calls.
+ * 2. Use the staged CS to do the encapsulated signaling jobs.
+ *    use HL_CS_FLAGS_STAGED_SUBMISSION and HL_CS_FLAGS_STAGED_SUBMISSION_FIRST
+ *    along with HL_CS_FLAGS_ENCAP_SIGNALS flag, and set encaps_signal_offset
+ *    field. This offset allows app to wait on part of the reserved signals.
+ * 3. Use WAIT/COLLECTIVE WAIT CS along with HL_CS_FLAGS_ENCAP_SIGNALS flag
+ *    to wait for the encapsulated signals.
+ */
+#define HL_CS_FLAGS_ENCAP_SIGNALS		0x800
+#define HL_CS_FLAGS_RESERVE_SIGNALS_ONLY	0x1000
+#define HL_CS_FLAGS_UNRESERVE_SIGNALS_ONLY	0x2000
+
+/*
+ * The engine cores CS is merged into the existing CS ioctls.
+ * Use it to control the engine cores mode.
+ */
+#define HL_CS_FLAGS_ENGINE_CORE_COMMAND		0x4000
+
+/*
+ * The flush HBW PCI writes is merged into the existing CS ioctls.
+ * Used to flush all HBW PCI writes.
+ * This is a blocking operation and for this reason the user shall not use
+ * the return sequence number (which will be invalid anyway)
+ */
+#define HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES	0x8000
+
+/*
+ * The engines CS is merged into the existing CS ioctls.
+ * Use it to control engines modes.
+ */
+#define HL_CS_FLAGS_ENGINES_COMMAND		0x10000
+
+#define HL_CS_STATUS_SUCCESS		0
+
+#define HL_MAX_JOBS_PER_CS		512
+
+/*
+ * enum hl_engine_command - engine command
+ *
+ * @HL_ENGINE_CORE_HALT: engine core halt
+ * @HL_ENGINE_CORE_RUN: engine core run
+ * @HL_ENGINE_STALL: user engine/s stall
+ * @HL_ENGINE_RESUME: user engine/s resume
+ */
+enum hl_engine_command {
+	HL_ENGINE_CORE_HALT = 1,
+	HL_ENGINE_CORE_RUN = 2,
+	HL_ENGINE_STALL = 3,
+	HL_ENGINE_RESUME = 4,
+	HL_ENGINE_COMMAND_MAX
+};
+
+struct hl_cs_in {
+
+	union {
+		struct {
+			/* this holds address of array of hl_cs_chunk for restore phase */
+			__u64 chunks_restore;
+
+			/* holds address of array of hl_cs_chunk for execution phase */
+			__u64 chunks_execute;
+		};
+
+		/* Valid only when HL_CS_FLAGS_ENGINE_CORE_COMMAND is set */
+		struct {
+			/* this holds address of array of uint32 for engine_cores */
+			__u64 engine_cores;
+
+			/* number of engine cores in engine_cores array */
+			__u32 num_engine_cores;
+
+			/* the core command to be sent towards engine cores */
+			__u32 core_command;
+		};
+
+		/* Valid only when HL_CS_FLAGS_ENGINES_COMMAND is set */
+		struct {
+			/* this holds address of array of uint32 for engines */
+			__u64 engines;
+
+			/* number of engines in engines array */
+			__u32 num_engines;
+
+			/* the engine command to be sent towards engines */
+			__u32 engine_command;
+		};
+	};
+
+	union {
+		/*
+		 * Sequence number of a staged submission CS
+		 * valid only if HL_CS_FLAGS_STAGED_SUBMISSION is set and
+		 * HL_CS_FLAGS_STAGED_SUBMISSION_FIRST is unset.
+		 */
+		__u64 seq;
+
+		/*
+		 * Encapsulated signals handle id
+		 * Valid for two flows:
+		 * 1. CS with encapsulated signals:
+		 *    when HL_CS_FLAGS_STAGED_SUBMISSION and
+		 *    HL_CS_FLAGS_STAGED_SUBMISSION_FIRST
+		 *    and HL_CS_FLAGS_ENCAP_SIGNALS are set.
+		 * 2. unreserve signals:
+		 *    valid when HL_CS_FLAGS_UNRESERVE_SIGNALS_ONLY is set.
+		 */
+		__u32 encaps_sig_handle_id;
+
+		/* Valid only when HL_CS_FLAGS_RESERVE_SIGNALS_ONLY is set */
+		struct {
+			/* Encapsulated signals number */
+			__u32 encaps_signals_count;
+
+			/* Encapsulated signals queue index (stream) */
+			__u32 encaps_signals_q_idx;
+		};
+	};
+
+	/* Number of chunks in restore phase array. Maximum number is
+	 * HL_MAX_JOBS_PER_CS
+	 */
+	__u32 num_chunks_restore;
+
+	/* Number of chunks in execution array. Maximum number is
+	 * HL_MAX_JOBS_PER_CS
+	 */
+	__u32 num_chunks_execute;
+
+	/* timeout in seconds - valid only if HL_CS_FLAGS_CUSTOM_TIMEOUT
+	 * is set
+	 */
+	__u32 timeout;
+
+	/* HL_CS_FLAGS_* */
+	__u32 cs_flags;
+
+	/* Context ID - Currently not in use */
+	__u32 ctx_id;
+	__u8 pad[4];
+};
+
+struct hl_cs_out {
+	union {
+		/*
+		 * seq holds the sequence number of the CS to pass to wait
+		 * ioctl. All values are valid except for 0 and ULLONG_MAX
+		 */
+		__u64 seq;
+
+		/* Valid only when HL_CS_FLAGS_RESERVE_SIGNALS_ONLY is set */
+		struct {
+			/* This is the reserved signal handle id */
+			__u32 handle_id;
+
+			/* This is the signals count */
+			__u32 count;
+		};
+	};
+
+	/* HL_CS_STATUS */
+	__u32 status;
+
+	/*
+	 * SOB base address offset
+	 * Valid only when HL_CS_FLAGS_RESERVE_SIGNALS_ONLY or HL_CS_FLAGS_SIGNAL is set
+	 */
+	__u32 sob_base_addr_offset;
+
+	/*
+	 * Count of completed signals in SOB before current signal submission.
+	 * Valid only when (HL_CS_FLAGS_ENCAP_SIGNALS & HL_CS_FLAGS_STAGED_SUBMISSION)
+	 * or HL_CS_FLAGS_SIGNAL is set
+	 */
+	__u16 sob_count_before_submission;
+	__u16 pad[3];
+};
+
+union hl_cs_args {
+	struct hl_cs_in in;
+	struct hl_cs_out out;
+};
+
+#define HL_WAIT_CS_FLAGS_INTERRUPT		0x2
+#define HL_WAIT_CS_FLAGS_INTERRUPT_MASK		0xFFF00000
+#define HL_WAIT_CS_FLAGS_ANY_CQ_INTERRUPT	0xFFF00000
+#define HL_WAIT_CS_FLAGS_ANY_DEC_INTERRUPT	0xFFE00000
+#define HL_WAIT_CS_FLAGS_MULTI_CS		0x4
+#define HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ	0x10
+#define HL_WAIT_CS_FLAGS_REGISTER_INTERRUPT	0x20
+
+#define HL_WAIT_MULTI_CS_LIST_MAX_LEN	32
+
+struct hl_wait_cs_in {
+	union {
+		struct {
+			/*
+			 * In case of wait_cs holds the CS sequence number.
+			 * In case of wait for multi CS hold a user pointer to
+			 * an array of CS sequence numbers
+			 */
+			__u64 seq;
+			/* Absolute timeout to wait for command submission
+			 * in microseconds
+			 */
+			__u64 timeout_us;
+		};
+
+		struct {
+			union {
+				/* User address for completion comparison.
+				 * upon interrupt, driver will compare the value pointed
+				 * by this address with the supplied target value.
+				 * in order not to perform any comparison, set address
+				 * to all 1s.
+				 * Relevant only when HL_WAIT_CS_FLAGS_INTERRUPT is set
+				 */
+				__u64 addr;
+
+				/* cq_counters_handle to a kernel mapped cb which contains
+				 * cq counters.
+				 * Relevant only when HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ is set
+				 */
+				__u64 cq_counters_handle;
+			};
+
+			/* Target value for completion comparison */
+			__u64 target;
+		};
+	};
+
+	/* Context ID - Currently not in use */
+	__u32 ctx_id;
+
+	/* HL_WAIT_CS_FLAGS_*
+	 * If HL_WAIT_CS_FLAGS_INTERRUPT is set, this field should include
+	 * interrupt id according to HL_WAIT_CS_FLAGS_INTERRUPT_MASK
+	 *
+	 * in order to wait for any CQ interrupt, set interrupt value to
+	 * HL_WAIT_CS_FLAGS_ANY_CQ_INTERRUPT.
+	 *
+	 * in order to wait for any decoder interrupt, set interrupt value to
+	 * HL_WAIT_CS_FLAGS_ANY_DEC_INTERRUPT.
+	 */
+	__u32 flags;
+
+	union {
+		struct {
+			/* Multi CS API info- valid entries in multi-CS array */
+			__u8 seq_arr_len;
+			__u8 pad[7];
+		};
+
+		/* Absolute timeout to wait for an interrupt in microseconds.
+		 * Relevant only when HL_WAIT_CS_FLAGS_INTERRUPT is set
+		 */
+		__u64 interrupt_timeout_us;
+	};
+
+	/*
+	 * cq counter offset inside the counters cb pointed by cq_counters_handle above.
+	 * upon interrupt, driver will compare the value pointed
+	 * by this address (cq_counters_handle + cq_counters_offset)
+	 * with the supplied target value.
+	 * relevant only when HL_WAIT_CS_FLAGS_INTERRUPT_KERNEL_CQ is set
+	 */
+	__u64 cq_counters_offset;
+
+	/*
+	 * Timestamp_handle timestamps buffer handle.
+	 * relevant only when HL_WAIT_CS_FLAGS_REGISTER_INTERRUPT is set
+	 */
+	__u64 timestamp_handle;
+
+	/*
+	 * Timestamp_offset is offset inside the timestamp buffer pointed by timestamp_handle above.
+	 * upon interrupt, if the cq reached the target value then driver will write
+	 * timestamp to this offset.
+	 * relevant only when HL_WAIT_CS_FLAGS_REGISTER_INTERRUPT is set
+	 */
+	__u64 timestamp_offset;
+};
+
+#define HL_WAIT_CS_STATUS_COMPLETED	0
+#define HL_WAIT_CS_STATUS_BUSY		1
+#define HL_WAIT_CS_STATUS_TIMEDOUT	2
+#define HL_WAIT_CS_STATUS_ABORTED	3
+
+#define HL_WAIT_CS_STATUS_FLAG_GONE		0x1
+#define HL_WAIT_CS_STATUS_FLAG_TIMESTAMP_VLD	0x2
+
+struct hl_wait_cs_out {
+	/* HL_WAIT_CS_STATUS_* */
+	__u32 status;
+	/* HL_WAIT_CS_STATUS_FLAG* */
+	__u32 flags;
+	/*
+	 * valid only if HL_WAIT_CS_STATUS_FLAG_TIMESTAMP_VLD is set
+	 * for wait_cs: timestamp of CS completion
+	 * for wait_multi_cs: timestamp of FIRST CS completion
+	 */
+	__s64 timestamp_nsec;
+	/* multi CS completion bitmap */
+	__u32 cs_completion_map;
+	__u32 pad;
+};
+
+union hl_wait_cs_args {
+	struct hl_wait_cs_in in;
+	struct hl_wait_cs_out out;
+};
+
+/* Opcode to allocate device memory */
+#define HL_MEM_OP_ALLOC			0
+
+/* Opcode to free previously allocated device memory */
+#define HL_MEM_OP_FREE			1
+
+/* Opcode to map host and device memory */
+#define HL_MEM_OP_MAP			2
+
+/* Opcode to unmap previously mapped host and device memory */
+#define HL_MEM_OP_UNMAP			3
+
+/* Opcode to map a hw block */
+#define HL_MEM_OP_MAP_BLOCK		4
+
+/* Opcode to create DMA-BUF object for an existing device memory allocation
+ * and to export an FD of that DMA-BUF back to the caller
+ */
+#define HL_MEM_OP_EXPORT_DMABUF_FD	5
+
+/* Opcode to create timestamps pool for user interrupts registration support
+ * The memory will be allocated by the kernel driver, A timestamp buffer which the user
+ * will get handle to it for mmap, and another internal buffer used by the
+ * driver for registration management
+ * The memory will be freed when the user closes the file descriptor(ctx close)
+ */
+#define HL_MEM_OP_TS_ALLOC		6
+
+/* Memory flags */
+#define HL_MEM_CONTIGUOUS	0x1
+#define HL_MEM_SHARED		0x2
+#define HL_MEM_USERPTR		0x4
+#define HL_MEM_FORCE_HINT	0x8
+#define HL_MEM_PREFETCH		0x40
+
+/**
+ * structure hl_mem_in - structure that handle input args for memory IOCTL
+ * @union arg: union of structures to be used based on the input operation
+ * @op: specify the requested memory operation (one of the HL_MEM_OP_* definitions).
+ * @flags: flags for the memory operation (one of the HL_MEM_* definitions).
+ *         For the HL_MEM_OP_EXPORT_DMABUF_FD opcode, this field holds the DMA-BUF file/FD flags.
+ * @ctx_id: context ID - currently not in use.
+ * @num_of_elements: number of timestamp elements used only with HL_MEM_OP_TS_ALLOC opcode.
+ */
+struct hl_mem_in {
+	union {
+		/**
+		 * structure for device memory allocation (used with the HL_MEM_OP_ALLOC op)
+		 * @mem_size: memory size to allocate
+		 * @page_size: page size to use on allocation. when the value is 0 the default page
+		 *             size will be taken.
+		 */
+		struct {
+			__u64 mem_size;
+			__u64 page_size;
+		} alloc;
+
+		/**
+		 * structure for free-ing device memory (used with the HL_MEM_OP_FREE op)
+		 * @handle: handle returned from HL_MEM_OP_ALLOC
+		 */
+		struct {
+			__u64 handle;
+		} free;
+
+		/**
+		 * structure for mapping device memory (used with the HL_MEM_OP_MAP op)
+		 * @hint_addr: requested virtual address of mapped memory.
+		 *             the driver will try to map the requested region to this hint
+		 *             address, as long as the address is valid and not already mapped.
+		 *             the user should check the returned address of the IOCTL to make
+		 *             sure he got the hint address.
+		 *             passing 0 here means that the driver will choose the address itself.
+		 * @handle: handle returned from HL_MEM_OP_ALLOC.
+		 */
+		struct {
+			__u64 hint_addr;
+			__u64 handle;
+		} map_device;
+
+		/**
+		 * structure for mapping host memory (used with the HL_MEM_OP_MAP op)
+		 * @host_virt_addr: address of allocated host memory.
+		 * @hint_addr: requested virtual address of mapped memory.
+		 *             the driver will try to map the requested region to this hint
+		 *             address, as long as the address is valid and not already mapped.
+		 *             the user should check the returned address of the IOCTL to make
+		 *             sure he got the hint address.
+		 *             passing 0 here means that the driver will choose the address itself.
+		 * @size: size of allocated host memory.
+		 */
+		struct {
+			__u64 host_virt_addr;
+			__u64 hint_addr;
+			__u64 mem_size;
+		} map_host;
+
+		/**
+		 * structure for mapping hw block (used with the HL_MEM_OP_MAP_BLOCK op)
+		 * @block_addr:HW block address to map, a handle and size will be returned
+		 *             to the user and will be used to mmap the relevant block.
+		 *             only addresses from configuration space are allowed.
+		 */
+		struct {
+			__u64 block_addr;
+		} map_block;
+
+		/**
+		 * structure for unmapping host memory (used with the HL_MEM_OP_UNMAP op)
+		 * @device_virt_addr: virtual address returned from HL_MEM_OP_MAP
+		 */
+		struct {
+			__u64 device_virt_addr;
+		} unmap;
+
+		/**
+		 * structure for exporting DMABUF object (used with
+		 * the HL_MEM_OP_EXPORT_DMABUF_FD op)
+		 * @addr: for Gaudi1, the driver expects a physical address
+		 *        inside the device's DRAM. this is because in Gaudi1
+		 *        we don't have MMU that covers the device's DRAM.
+		 *        for all other ASICs, the driver expects a device
+		 *        virtual address that represents the start address of
+		 *        a mapped DRAM memory area inside the device.
+		 *        the address must be the same as was received from the
+		 *        driver during a previous HL_MEM_OP_MAP operation.
+		 * @mem_size: size of memory to export.
+		 * @offset: for Gaudi1, this value must be 0. For all other ASICs,
+		 *          the driver expects an offset inside of the memory area
+		 *          describe by addr. the offset represents the start
+		 *          address of that the exported dma-buf object describes.
+		 */
+		struct {
+			__u64 addr;
+			__u64 mem_size;
+			__u64 offset;
+		} export_dmabuf_fd;
+	};
+
+	__u32 op;
+	__u32 flags;
+	__u32 ctx_id;
+	__u32 num_of_elements;
+};
+
+struct hl_mem_out {
+	union {
+		/*
+		 * Used for HL_MEM_OP_MAP as the virtual address that was
+		 * assigned in the device VA space.
+		 * A value of 0 means the requested operation failed.
+		 */
+		__u64 device_virt_addr;
+
+		/*
+		 * Used in HL_MEM_OP_ALLOC
+		 * This is the assigned handle for the allocated memory
+		 */
+		__u64 handle;
+
+		struct {
+			/*
+			 * Used in HL_MEM_OP_MAP_BLOCK.
+			 * This is the assigned handle for the mapped block
+			 */
+			__u64 block_handle;
+
+			/*
+			 * Used in HL_MEM_OP_MAP_BLOCK
+			 * This is the size of the mapped block
+			 */
+			__u32 block_size;
+
+			__u32 pad;
+		};
+
+		/* Returned in HL_MEM_OP_EXPORT_DMABUF_FD. Represents the
+		 * DMA-BUF object that was created to describe a memory
+		 * allocation on the device's memory space. The FD should be
+		 * passed to the importer driver
+		 */
+		__s32 fd;
+	};
+};
+
+union hl_mem_args {
+	struct hl_mem_in in;
+	struct hl_mem_out out;
+};
+
+#define HL_DEBUG_MAX_AUX_VALUES		10
+
+struct hl_debug_params_etr {
+	/* Address in memory to allocate buffer */
+	__u64 buffer_address;
+
+	/* Size of buffer to allocate */
+	__u64 buffer_size;
+
+	/* Sink operation mode: SW fifo, HW fifo, Circular buffer */
+	__u32 sink_mode;
+	__u32 pad;
+};
+
+struct hl_debug_params_etf {
+	/* Address in memory to allocate buffer */
+	__u64 buffer_address;
+
+	/* Size of buffer to allocate */
+	__u64 buffer_size;
+
+	/* Sink operation mode: SW fifo, HW fifo, Circular buffer */
+	__u32 sink_mode;
+	__u32 pad;
+};
+
+struct hl_debug_params_stm {
+	/* Two bit masks for HW event and Stimulus Port */
+	__u64 he_mask;
+	__u64 sp_mask;
+
+	/* Trace source ID */
+	__u32 id;
+
+	/* Frequency for the timestamp register */
+	__u32 frequency;
+};
+
+struct hl_debug_params_bmon {
+	/* Two address ranges that the user can request to filter */
+	__u64 start_addr0;
+	__u64 addr_mask0;
+
+	__u64 start_addr1;
+	__u64 addr_mask1;
+
+	/* Capture window configuration */
+	__u32 bw_win;
+	__u32 win_capture;
+
+	/* Trace source ID */
+	__u32 id;
+
+	/* Control register */
+	__u32 control;
+
+	/* Two more address ranges that the user can request to filter */
+	__u64 start_addr2;
+	__u64 end_addr2;
+
+	__u64 start_addr3;
+	__u64 end_addr3;
+};
+
+struct hl_debug_params_spmu {
+	/* Event types selection */
+	__u64 event_types[HL_DEBUG_MAX_AUX_VALUES];
+
+	/* Number of event types selection */
+	__u32 event_types_num;
+
+	/* TRC configuration register values */
+	__u32 pmtrc_val;
+	__u32 trc_ctrl_host_val;
+	__u32 trc_en_host_val;
+};
+
+/* Opcode for ETR component */
+#define HL_DEBUG_OP_ETR		0
+/* Opcode for ETF component */
+#define HL_DEBUG_OP_ETF		1
+/* Opcode for STM component */
+#define HL_DEBUG_OP_STM		2
+/* Opcode for FUNNEL component */
+#define HL_DEBUG_OP_FUNNEL	3
+/* Opcode for BMON component */
+#define HL_DEBUG_OP_BMON	4
+/* Opcode for SPMU component */
+#define HL_DEBUG_OP_SPMU	5
+/* Opcode for timestamp (deprecated) */
+#define HL_DEBUG_OP_TIMESTAMP	6
+/* Opcode for setting the device into or out of debug mode. The enable
+ * variable should be 1 for enabling debug mode and 0 for disabling it
+ */
+#define HL_DEBUG_OP_SET_MODE	7
+
+struct hl_debug_args {
+	/*
+	 * Pointer to user input structure.
+	 * This field is relevant to specific opcodes.
+	 */
+	__u64 input_ptr;
+	/* Pointer to user output structure */
+	__u64 output_ptr;
+	/* Size of user input structure */
+	__u32 input_size;
+	/* Size of user output structure */
+	__u32 output_size;
+	/* HL_DEBUG_OP_* */
+	__u32 op;
+	/*
+	 * Register index in the component, taken from the debug_regs_index enum
+	 * in the various ASIC header files
+	 */
+	__u32 reg_idx;
+	/* Enable/disable */
+	__u32 enable;
+	/* Context ID - Currently not in use */
+	__u32 ctx_id;
+};
+
+#define HL_IOCTL_INFO		0x00
+#define HL_IOCTL_CB		0x01
+#define HL_IOCTL_CS		0x02
+#define HL_IOCTL_WAIT_CS	0x03
+#define HL_IOCTL_MEMORY		0x04
+#define HL_IOCTL_DEBUG		0x05
+
+/*
+ * Various information operations such as:
+ * - H/W IP information
+ * - Current dram usage
+ *
+ * The user calls this IOCTL with an opcode that describes the required
+ * information. The user should supply a pointer to a user-allocated memory
+ * chunk, which will be filled by the driver with the requested information.
+ *
+ * The user supplies the maximum amount of size to copy into the user's memory,
+ * in order to prevent data corruption in case of differences between the
+ * definitions of structures in kernel and userspace, e.g. in case of old
+ * userspace and new kernel driver
+ */
+#define DRM_IOCTL_HL_INFO	DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_INFO, struct hl_info_args)
+
+/*
+ * Command Buffer
+ * - Request a Command Buffer
+ * - Destroy a Command Buffer
+ *
+ * The command buffers are memory blocks that reside in DMA-able address
+ * space and are physically contiguous so they can be accessed by the device
+ * directly. They are allocated using the coherent DMA API.
+ *
+ * When creating a new CB, the IOCTL returns a handle of it, and the user-space
+ * process needs to use that handle to mmap the buffer so it can access them.
+ *
+ * In some instances, the device must access the command buffer through the
+ * device's MMU, and thus its memory should be mapped. In these cases, user can
+ * indicate the driver that such a mapping is required.
+ * The resulting device virtual address will be used internally by the driver,
+ * and won't be returned to user.
+ *
+ */
+#define DRM_IOCTL_HL_CB		DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_CB, union hl_cb_args)
+
+/*
+ * Command Submission
+ *
+ * To submit work to the device, the user need to call this IOCTL with a set
+ * of JOBS. That set of JOBS constitutes a CS object.
+ * Each JOB will be enqueued on a specific queue, according to the user's input.
+ * There can be more then one JOB per queue.
+ *
+ * The CS IOCTL will receive two sets of JOBS. One set is for "restore" phase
+ * and a second set is for "execution" phase.
+ * The JOBS on the "restore" phase are enqueued only after context-switch
+ * (or if its the first CS for this context). The user can also order the
+ * driver to run the "restore" phase explicitly
+ *
+ * Goya/Gaudi:
+ * There are two types of queues - external and internal. External queues
+ * are DMA queues which transfer data from/to the Host. All other queues are
+ * internal. The driver will get completion notifications from the device only
+ * on JOBS which are enqueued in the external queues.
+ *
+ * Gaudi2 onwards:
+ * There is a single type of queue for all types of engines, either DMA engines
+ * for transfers from/to the host or inside the device, or compute engines.
+ * The driver will get completion notifications from the device for all queues.
+ *
+ * For jobs on external queues, the user needs to create command buffers
+ * through the CB ioctl and give the CB's handle to the CS ioctl. For jobs on
+ * internal queues, the user needs to prepare a "command buffer" with packets
+ * on either the device SRAM/DRAM or the host, and give the device address of
+ * that buffer to the CS ioctl.
+ * For jobs on H/W queues both options of command buffers are valid.
+ *
+ * This IOCTL is asynchronous in regard to the actual execution of the CS. This
+ * means it returns immediately after ALL the JOBS were enqueued on their
+ * relevant queues. Therefore, the user mustn't assume the CS has been completed
+ * or has even started to execute.
+ *
+ * Upon successful enqueue, the IOCTL returns a sequence number which the user
+ * can use with the "Wait for CS" IOCTL to check whether the handle's CS
+ * non-internal JOBS have been completed. Note that if the CS has internal JOBS
+ * which can execute AFTER the external JOBS have finished, the driver might
+ * report that the CS has finished executing BEFORE the internal JOBS have
+ * actually finished executing.
+ *
+ * Even though the sequence number increments per CS, the user can NOT
+ * automatically assume that if CS with sequence number N finished, then CS
+ * with sequence number N-1 also finished. The user can make this assumption if
+ * and only if CS N and CS N-1 are exactly the same (same CBs for the same
+ * queues).
+ */
+#define DRM_IOCTL_HL_CS		DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_CS, union hl_cs_args)
+
+/*
+ * Wait for Command Submission
+ *
+ * The user can call this IOCTL with a handle it received from the CS IOCTL
+ * to wait until the handle's CS has finished executing. The user will wait
+ * inside the kernel until the CS has finished or until the user-requested
+ * timeout has expired.
+ *
+ * If the timeout value is 0, the driver won't sleep at all. It will check
+ * the status of the CS and return immediately
+ *
+ * The return value of the IOCTL is a standard Linux error code. The possible
+ * values are:
+ *
+ * EINTR     - Kernel waiting has been interrupted, e.g. due to OS signal
+ *             that the user process received
+ * ETIMEDOUT - The CS has caused a timeout on the device
+ * EIO       - The CS was aborted (usually because the device was reset)
+ * ENODEV    - The device wants to do hard-reset (so user need to close FD)
+ *
+ * The driver also returns a custom define in case the IOCTL call returned 0.
+ * The define can be one of the following:
+ *
+ * HL_WAIT_CS_STATUS_COMPLETED   - The CS has been completed successfully (0)
+ * HL_WAIT_CS_STATUS_BUSY        - The CS is still executing (0)
+ * HL_WAIT_CS_STATUS_TIMEDOUT    - The CS has caused a timeout on the device
+ *                                 (ETIMEDOUT)
+ * HL_WAIT_CS_STATUS_ABORTED     - The CS was aborted, usually because the
+ *                                 device was reset (EIO)
+ */
+#define DRM_IOCTL_HL_WAIT_CS	DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_WAIT_CS, union hl_wait_cs_args)
+
+/*
+ * Memory
+ * - Map host memory to device MMU
+ * - Unmap host memory from device MMU
+ *
+ * This IOCTL allows the user to map host memory to the device MMU
+ *
+ * For host memory, the IOCTL doesn't allocate memory. The user is supposed
+ * to allocate the memory in user-space (malloc/new). The driver pins the
+ * physical pages (up to the allowed limit by the OS), assigns a virtual
+ * address in the device VA space and initializes the device MMU.
+ *
+ * There is an option for the user to specify the requested virtual address.
+ *
+ */
+#define DRM_IOCTL_HL_MEMORY	DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_MEMORY, union hl_mem_args)
+
+/*
+ * Debug
+ * - Enable/disable the ETR/ETF/FUNNEL/STM/BMON/SPMU debug traces
+ *
+ * This IOCTL allows the user to get debug traces from the chip.
+ *
+ * Before the user can send configuration requests of the various
+ * debug/profile engines, it needs to set the device into debug mode.
+ * This is because the debug/profile infrastructure is shared component in the
+ * device and we can't allow multiple users to access it at the same time.
+ *
+ * Once a user set the device into debug mode, the driver won't allow other
+ * users to "work" with the device, i.e. open a FD. If there are multiple users
+ * opened on the device, the driver won't allow any user to debug the device.
+ *
+ * For each configuration request, the user needs to provide the register index
+ * and essential data such as buffer address and size.
+ *
+ * Once the user has finished using the debug/profile engines, he should
+ * set the device into non-debug mode, i.e. disable debug mode.
+ *
+ * The driver can decide to "kick out" the user if he abuses this interface.
+ *
+ */
+#define DRM_IOCTL_HL_DEBUG	DRM_IOWR(DRM_COMMAND_BASE + HL_IOCTL_DEBUG, struct hl_debug_args)
+
+#define HL_COMMAND_START	(DRM_COMMAND_BASE + HL_IOCTL_INFO)
+#define HL_COMMAND_END		(DRM_COMMAND_BASE + HL_IOCTL_DEBUG + 1)
+
+#endif /* HABANALABS_H_ */
diff --git a/include/drm-uapi/i810_drm.h b/include/drm-uapi/i810_drm.h
deleted file mode 100644
index d285d5e72e6a..000000000000
--- a/include/drm-uapi/i810_drm.h
+++ /dev/null
@@ -1,292 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _I810_DRM_H_
-#define _I810_DRM_H_
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-/* WARNING: These defines must be the same as what the Xserver uses.
- * if you change them, you must change the defines in the Xserver.
- */
-
-#ifndef _I810_DEFINES_
-#define _I810_DEFINES_
-
-#define I810_DMA_BUF_ORDER		12
-#define I810_DMA_BUF_SZ 		(1<<I810_DMA_BUF_ORDER)
-#define I810_DMA_BUF_NR 		256
-#define I810_NR_SAREA_CLIPRECTS 	8
-
-/* Each region is a minimum of 64k, and there are at most 64 of them.
- */
-#define I810_NR_TEX_REGIONS 64
-#define I810_LOG_MIN_TEX_REGION_SIZE 16
-#endif
-
-#define I810_UPLOAD_TEX0IMAGE  0x1	/* handled clientside */
-#define I810_UPLOAD_TEX1IMAGE  0x2	/* handled clientside */
-#define I810_UPLOAD_CTX        0x4
-#define I810_UPLOAD_BUFFERS    0x8
-#define I810_UPLOAD_TEX0       0x10
-#define I810_UPLOAD_TEX1       0x20
-#define I810_UPLOAD_CLIPRECTS  0x40
-
-/* Indices into buf.Setup where various bits of state are mirrored per
- * context and per buffer.  These can be fired at the card as a unit,
- * or in a piecewise fashion as required.
- */
-
-/* Destbuffer state
- *    - backbuffer linear offset and pitch -- invarient in the current dri
- *    - zbuffer linear offset and pitch -- also invarient
- *    - drawing origin in back and depth buffers.
- *
- * Keep the depth/back buffer state here to accommodate private buffers
- * in the future.
- */
-#define I810_DESTREG_DI0  0	/* CMD_OP_DESTBUFFER_INFO (2 dwords) */
-#define I810_DESTREG_DI1  1
-#define I810_DESTREG_DV0  2	/* GFX_OP_DESTBUFFER_VARS (2 dwords) */
-#define I810_DESTREG_DV1  3
-#define I810_DESTREG_DR0  4	/* GFX_OP_DRAWRECT_INFO (4 dwords) */
-#define I810_DESTREG_DR1  5
-#define I810_DESTREG_DR2  6
-#define I810_DESTREG_DR3  7
-#define I810_DESTREG_DR4  8
-#define I810_DEST_SETUP_SIZE 10
-
-/* Context state
- */
-#define I810_CTXREG_CF0   0	/* GFX_OP_COLOR_FACTOR */
-#define I810_CTXREG_CF1   1
-#define I810_CTXREG_ST0   2	/* GFX_OP_STIPPLE */
-#define I810_CTXREG_ST1   3
-#define I810_CTXREG_VF    4	/* GFX_OP_VERTEX_FMT */
-#define I810_CTXREG_MT    5	/* GFX_OP_MAP_TEXELS */
-#define I810_CTXREG_MC0   6	/* GFX_OP_MAP_COLOR_STAGES - stage 0 */
-#define I810_CTXREG_MC1   7	/* GFX_OP_MAP_COLOR_STAGES - stage 1 */
-#define I810_CTXREG_MC2   8	/* GFX_OP_MAP_COLOR_STAGES - stage 2 */
-#define I810_CTXREG_MA0   9	/* GFX_OP_MAP_ALPHA_STAGES - stage 0 */
-#define I810_CTXREG_MA1   10	/* GFX_OP_MAP_ALPHA_STAGES - stage 1 */
-#define I810_CTXREG_MA2   11	/* GFX_OP_MAP_ALPHA_STAGES - stage 2 */
-#define I810_CTXREG_SDM   12	/* GFX_OP_SRC_DEST_MONO */
-#define I810_CTXREG_FOG   13	/* GFX_OP_FOG_COLOR */
-#define I810_CTXREG_B1    14	/* GFX_OP_BOOL_1 */
-#define I810_CTXREG_B2    15	/* GFX_OP_BOOL_2 */
-#define I810_CTXREG_LCS   16	/* GFX_OP_LINEWIDTH_CULL_SHADE_MODE */
-#define I810_CTXREG_PV    17	/* GFX_OP_PV_RULE -- Invarient! */
-#define I810_CTXREG_ZA    18	/* GFX_OP_ZBIAS_ALPHAFUNC */
-#define I810_CTXREG_AA    19	/* GFX_OP_ANTIALIAS */
-#define I810_CTX_SETUP_SIZE 20
-
-/* Texture state (per tex unit)
- */
-#define I810_TEXREG_MI0  0	/* GFX_OP_MAP_INFO (4 dwords) */
-#define I810_TEXREG_MI1  1
-#define I810_TEXREG_MI2  2
-#define I810_TEXREG_MI3  3
-#define I810_TEXREG_MF   4	/* GFX_OP_MAP_FILTER */
-#define I810_TEXREG_MLC  5	/* GFX_OP_MAP_LOD_CTL */
-#define I810_TEXREG_MLL  6	/* GFX_OP_MAP_LOD_LIMITS */
-#define I810_TEXREG_MCS  7	/* GFX_OP_MAP_COORD_SETS ??? */
-#define I810_TEX_SETUP_SIZE 8
-
-/* Flags for clear ioctl
- */
-#define I810_FRONT   0x1
-#define I810_BACK    0x2
-#define I810_DEPTH   0x4
-
-typedef enum _drm_i810_init_func {
-	I810_INIT_DMA = 0x01,
-	I810_CLEANUP_DMA = 0x02,
-	I810_INIT_DMA_1_4 = 0x03
-} drm_i810_init_func_t;
-
-/* This is the init structure after v1.2 */
-typedef struct _drm_i810_init {
-	drm_i810_init_func_t func;
-	unsigned int mmio_offset;
-	unsigned int buffers_offset;
-	int sarea_priv_offset;
-	unsigned int ring_start;
-	unsigned int ring_end;
-	unsigned int ring_size;
-	unsigned int front_offset;
-	unsigned int back_offset;
-	unsigned int depth_offset;
-	unsigned int overlay_offset;
-	unsigned int overlay_physical;
-	unsigned int w;
-	unsigned int h;
-	unsigned int pitch;
-	unsigned int pitch_bits;
-} drm_i810_init_t;
-
-/* This is the init structure prior to v1.2 */
-typedef struct _drm_i810_pre12_init {
-	drm_i810_init_func_t func;
-	unsigned int mmio_offset;
-	unsigned int buffers_offset;
-	int sarea_priv_offset;
-	unsigned int ring_start;
-	unsigned int ring_end;
-	unsigned int ring_size;
-	unsigned int front_offset;
-	unsigned int back_offset;
-	unsigned int depth_offset;
-	unsigned int w;
-	unsigned int h;
-	unsigned int pitch;
-	unsigned int pitch_bits;
-} drm_i810_pre12_init_t;
-
-/* Warning: If you change the SAREA structure you must change the Xserver
- * structure as well */
-
-typedef struct _drm_i810_tex_region {
-	unsigned char next, prev;	/* indices to form a circular LRU  */
-	unsigned char in_use;	/* owned by a client, or free? */
-	int age;		/* tracked by clients to update local LRU's */
-} drm_i810_tex_region_t;
-
-typedef struct _drm_i810_sarea {
-	unsigned int ContextState[I810_CTX_SETUP_SIZE];
-	unsigned int BufferState[I810_DEST_SETUP_SIZE];
-	unsigned int TexState[2][I810_TEX_SETUP_SIZE];
-	unsigned int dirty;
-
-	unsigned int nbox;
-	struct drm_clip_rect boxes[I810_NR_SAREA_CLIPRECTS];
-
-	/* Maintain an LRU of contiguous regions of texture space.  If
-	 * you think you own a region of texture memory, and it has an
-	 * age different to the one you set, then you are mistaken and
-	 * it has been stolen by another client.  If global texAge
-	 * hasn't changed, there is no need to walk the list.
-	 *
-	 * These regions can be used as a proxy for the fine-grained
-	 * texture information of other clients - by maintaining them
-	 * in the same lru which is used to age their own textures,
-	 * clients have an approximate lru for the whole of global
-	 * texture space, and can make informed decisions as to which
-	 * areas to kick out.  There is no need to choose whether to
-	 * kick out your own texture or someone else's - simply eject
-	 * them all in LRU order.
-	 */
-
-	drm_i810_tex_region_t texList[I810_NR_TEX_REGIONS + 1];
-	/* Last elt is sentinal */
-	int texAge;		/* last time texture was uploaded */
-	int last_enqueue;	/* last time a buffer was enqueued */
-	int last_dispatch;	/* age of the most recently dispatched buffer */
-	int last_quiescent;	/*  */
-	int ctxOwner;		/* last context to upload state */
-
-	int vertex_prim;
-
-	int pf_enabled;		/* is pageflipping allowed? */
-	int pf_active;
-	int pf_current_page;	/* which buffer is being displayed? */
-} drm_i810_sarea_t;
-
-/* WARNING: If you change any of these defines, make sure to change the
- * defines in the Xserver file (xf86drmMga.h)
- */
-
-/* i810 specific ioctls
- * The device specific ioctl range is 0x40 to 0x79.
- */
-#define DRM_I810_INIT		0x00
-#define DRM_I810_VERTEX		0x01
-#define DRM_I810_CLEAR		0x02
-#define DRM_I810_FLUSH		0x03
-#define DRM_I810_GETAGE		0x04
-#define DRM_I810_GETBUF		0x05
-#define DRM_I810_SWAP		0x06
-#define DRM_I810_COPY		0x07
-#define DRM_I810_DOCOPY		0x08
-#define DRM_I810_OV0INFO	0x09
-#define DRM_I810_FSTATUS	0x0a
-#define DRM_I810_OV0FLIP	0x0b
-#define DRM_I810_MC		0x0c
-#define DRM_I810_RSTATUS	0x0d
-#define DRM_I810_FLIP		0x0e
-
-#define DRM_IOCTL_I810_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I810_INIT, drm_i810_init_t)
-#define DRM_IOCTL_I810_VERTEX		DRM_IOW( DRM_COMMAND_BASE + DRM_I810_VERTEX, drm_i810_vertex_t)
-#define DRM_IOCTL_I810_CLEAR		DRM_IOW( DRM_COMMAND_BASE + DRM_I810_CLEAR, drm_i810_clear_t)
-#define DRM_IOCTL_I810_FLUSH		DRM_IO(  DRM_COMMAND_BASE + DRM_I810_FLUSH)
-#define DRM_IOCTL_I810_GETAGE		DRM_IO(  DRM_COMMAND_BASE + DRM_I810_GETAGE)
-#define DRM_IOCTL_I810_GETBUF		DRM_IOWR(DRM_COMMAND_BASE + DRM_I810_GETBUF, drm_i810_dma_t)
-#define DRM_IOCTL_I810_SWAP		DRM_IO(  DRM_COMMAND_BASE + DRM_I810_SWAP)
-#define DRM_IOCTL_I810_COPY		DRM_IOW( DRM_COMMAND_BASE + DRM_I810_COPY, drm_i810_copy_t)
-#define DRM_IOCTL_I810_DOCOPY		DRM_IO(  DRM_COMMAND_BASE + DRM_I810_DOCOPY)
-#define DRM_IOCTL_I810_OV0INFO		DRM_IOR( DRM_COMMAND_BASE + DRM_I810_OV0INFO, drm_i810_overlay_t)
-#define DRM_IOCTL_I810_FSTATUS		DRM_IO ( DRM_COMMAND_BASE + DRM_I810_FSTATUS)
-#define DRM_IOCTL_I810_OV0FLIP		DRM_IO ( DRM_COMMAND_BASE + DRM_I810_OV0FLIP)
-#define DRM_IOCTL_I810_MC		DRM_IOW( DRM_COMMAND_BASE + DRM_I810_MC, drm_i810_mc_t)
-#define DRM_IOCTL_I810_RSTATUS		DRM_IO ( DRM_COMMAND_BASE + DRM_I810_RSTATUS)
-#define DRM_IOCTL_I810_FLIP             DRM_IO ( DRM_COMMAND_BASE + DRM_I810_FLIP)
-
-typedef struct _drm_i810_clear {
-	int clear_color;
-	int clear_depth;
-	int flags;
-} drm_i810_clear_t;
-
-/* These may be placeholders if we have more cliprects than
- * I810_NR_SAREA_CLIPRECTS.  In that case, the client sets discard to
- * false, indicating that the buffer will be dispatched again with a
- * new set of cliprects.
- */
-typedef struct _drm_i810_vertex {
-	int idx;		/* buffer index */
-	int used;		/* nr bytes in use */
-	int discard;		/* client is finished with the buffer? */
-} drm_i810_vertex_t;
-
-typedef struct _drm_i810_copy_t {
-	int idx;		/* buffer index */
-	int used;		/* nr bytes in use */
-	void *address;		/* Address to copy from */
-} drm_i810_copy_t;
-
-#define PR_TRIANGLES         (0x0<<18)
-#define PR_TRISTRIP_0        (0x1<<18)
-#define PR_TRISTRIP_1        (0x2<<18)
-#define PR_TRIFAN            (0x3<<18)
-#define PR_POLYGON           (0x4<<18)
-#define PR_LINES             (0x5<<18)
-#define PR_LINESTRIP         (0x6<<18)
-#define PR_RECTS             (0x7<<18)
-#define PR_MASK              (0x7<<18)
-
-typedef struct drm_i810_dma {
-	void *virtual;
-	int request_idx;
-	int request_size;
-	int granted;
-} drm_i810_dma_t;
-
-typedef struct _drm_i810_overlay_t {
-	unsigned int offset;	/* Address of the Overlay Regs */
-	unsigned int physical;
-} drm_i810_overlay_t;
-
-typedef struct _drm_i810_mc {
-	int idx;		/* buffer index */
-	int used;		/* nr bytes in use */
-	int num_blocks;		/* number of GFXBlocks */
-	int *length;		/* List of lengths for GFXBlocks (FUTURE) */
-	unsigned int last_render;	/* Last Render Request */
-} drm_i810_mc_t;
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif				/* _I810_DRM_H_ */
diff --git a/include/drm-uapi/ivpu_accel.h b/include/drm-uapi/ivpu_accel.h
new file mode 100644
index 000000000000..de1944e42c65
--- /dev/null
+++ b/include/drm-uapi/ivpu_accel.h
@@ -0,0 +1,327 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2020-2023 Intel Corporation
+ */
+
+#ifndef __UAPI_IVPU_DRM_H__
+#define __UAPI_IVPU_DRM_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_IVPU_DRIVER_MAJOR 1
+#define DRM_IVPU_DRIVER_MINOR 0
+
+#define DRM_IVPU_GET_PARAM		  0x00
+#define DRM_IVPU_SET_PARAM		  0x01
+#define DRM_IVPU_BO_CREATE		  0x02
+#define DRM_IVPU_BO_INFO		  0x03
+#define DRM_IVPU_SUBMIT			  0x05
+#define DRM_IVPU_BO_WAIT		  0x06
+
+#define DRM_IOCTL_IVPU_GET_PARAM                                               \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_GET_PARAM, struct drm_ivpu_param)
+
+#define DRM_IOCTL_IVPU_SET_PARAM                                               \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_IVPU_SET_PARAM, struct drm_ivpu_param)
+
+#define DRM_IOCTL_IVPU_BO_CREATE                                               \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_BO_CREATE, struct drm_ivpu_bo_create)
+
+#define DRM_IOCTL_IVPU_BO_INFO                                                 \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_BO_INFO, struct drm_ivpu_bo_info)
+
+#define DRM_IOCTL_IVPU_SUBMIT                                                  \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_IVPU_SUBMIT, struct drm_ivpu_submit)
+
+#define DRM_IOCTL_IVPU_BO_WAIT                                                 \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_IVPU_BO_WAIT, struct drm_ivpu_bo_wait)
+
+/**
+ * DOC: contexts
+ *
+ * VPU contexts have private virtual address space, job queues and priority.
+ * Each context is identified by an unique ID. Context is created on open().
+ */
+
+#define DRM_IVPU_PARAM_DEVICE_ID	    0
+#define DRM_IVPU_PARAM_DEVICE_REVISION	    1
+#define DRM_IVPU_PARAM_PLATFORM_TYPE	    2
+#define DRM_IVPU_PARAM_CORE_CLOCK_RATE	    3
+#define DRM_IVPU_PARAM_NUM_CONTEXTS	    4
+#define DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS 5
+#define DRM_IVPU_PARAM_CONTEXT_PRIORITY	    6
+#define DRM_IVPU_PARAM_CONTEXT_ID	    7
+#define DRM_IVPU_PARAM_FW_API_VERSION	    8
+#define DRM_IVPU_PARAM_ENGINE_HEARTBEAT	    9
+#define DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID  10
+#define DRM_IVPU_PARAM_TILE_CONFIG	    11
+#define DRM_IVPU_PARAM_SKU		    12
+#define DRM_IVPU_PARAM_CAPABILITIES	    13
+
+#define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
+
+#define DRM_IVPU_CONTEXT_PRIORITY_IDLE	    0
+#define DRM_IVPU_CONTEXT_PRIORITY_NORMAL    1
+#define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
+#define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
+
+/**
+ * DRM_IVPU_CAP_METRIC_STREAMER
+ *
+ * Metric streamer support. Provides sampling of various hardware performance
+ * metrics like DMA bandwidth and cache miss/hits. Can be used for profiling.
+ */
+#define DRM_IVPU_CAP_METRIC_STREAMER	1
+/**
+ * DRM_IVPU_CAP_DMA_MEMORY_RANGE
+ *
+ * Driver has capability to allocate separate memory range
+ * accessible by hardware DMA.
+ */
+#define DRM_IVPU_CAP_DMA_MEMORY_RANGE	2
+
+/**
+ * struct drm_ivpu_param - Get/Set VPU parameters
+ */
+struct drm_ivpu_param {
+	/**
+	 * @param:
+	 *
+	 * Supported params:
+	 *
+	 * %DRM_IVPU_PARAM_DEVICE_ID:
+	 * PCI Device ID of the VPU device (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_DEVICE_REVISION:
+	 * VPU device revision (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_PLATFORM_TYPE:
+	 * Returns %DRM_IVPU_PLATFORM_TYPE_SILICON on real hardware or device specific
+	 * platform type when executing on a simulator or emulator (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_CORE_CLOCK_RATE:
+	 * Current PLL frequency (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_NUM_CONTEXTS:
+	 * Maximum number of simultaneously existing contexts (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
+	 * Lowest VPU virtual address available in the current context (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_CONTEXT_PRIORITY:
+	 * Value of current context scheduling priority (read-write).
+	 * See DRM_IVPU_CONTEXT_PRIORITY_* for possible values.
+	 *
+	 * %DRM_IVPU_PARAM_CONTEXT_ID:
+	 * Current context ID, always greater than 0 (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_FW_API_VERSION:
+	 * Firmware API version array (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_ENGINE_HEARTBEAT:
+	 * Heartbeat value from an engine (read-only).
+	 * Engine ID (i.e. DRM_IVPU_ENGINE_COMPUTE) is given via index.
+	 *
+	 * %DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID:
+	 * Device-unique inference ID (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_TILE_CONFIG:
+	 * VPU tile configuration  (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_SKU:
+	 * VPU SKU ID (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_CAPABILITIES:
+	 * Supported capabilities (read-only)
+	 */
+	__u32 param;
+
+	/** @index: Index for params that have multiple instances */
+	__u32 index;
+
+	/** @value: Param value */
+	__u64 value;
+};
+
+#define DRM_IVPU_BO_SHAVE_MEM  0x00000001
+#define DRM_IVPU_BO_HIGH_MEM   DRM_IVPU_BO_SHAVE_MEM
+#define DRM_IVPU_BO_MAPPABLE   0x00000002
+#define DRM_IVPU_BO_DMA_MEM    0x00000004
+
+#define DRM_IVPU_BO_CACHED     0x00000000
+#define DRM_IVPU_BO_UNCACHED   0x00010000
+#define DRM_IVPU_BO_WC	       0x00020000
+#define DRM_IVPU_BO_CACHE_MASK 0x00030000
+
+#define DRM_IVPU_BO_FLAGS \
+	(DRM_IVPU_BO_HIGH_MEM | \
+	 DRM_IVPU_BO_MAPPABLE | \
+	 DRM_IVPU_BO_DMA_MEM | \
+	 DRM_IVPU_BO_CACHE_MASK)
+
+/**
+ * struct drm_ivpu_bo_create - Create BO backed by SHMEM
+ *
+ * Create GEM buffer object allocated in SHMEM memory.
+ */
+struct drm_ivpu_bo_create {
+	/** @size: The size in bytes of the allocated memory */
+	__u64 size;
+
+	/**
+	 * @flags:
+	 *
+	 * Supported flags:
+	 *
+	 * %DRM_IVPU_BO_HIGH_MEM:
+	 *
+	 * Allocate VPU address from >4GB range.
+	 * Buffer object with vpu address >4GB can be always accessed by the
+	 * VPU DMA engine, but some HW generation may not be able to access
+	 * this memory from then firmware running on the VPU management processor.
+	 * Suitable for input, output and some scratch buffers.
+	 *
+	 * %DRM_IVPU_BO_MAPPABLE:
+	 *
+	 * Buffer object can be mapped using mmap().
+	 *
+	 * %DRM_IVPU_BO_CACHED:
+	 *
+	 * Allocated BO will be cached on host side (WB) and snooped on the VPU side.
+	 * This is the default caching mode.
+	 *
+	 * %DRM_IVPU_BO_UNCACHED:
+	 *
+	 * Not supported. Use DRM_IVPU_BO_WC instead.
+	 *
+	 * %DRM_IVPU_BO_WC:
+	 *
+	 * Allocated BO will use write combining buffer for writes but reads will be
+	 * uncached.
+	 */
+	__u32 flags;
+
+	/** @handle: Returned GEM object handle */
+	__u32 handle;
+
+	/** @vpu_addr: Returned VPU virtual address */
+	__u64 vpu_addr;
+};
+
+/**
+ * struct drm_ivpu_bo_info - Query buffer object info
+ */
+struct drm_ivpu_bo_info {
+	/** @handle: Handle of the queried BO */
+	__u32 handle;
+
+	/** @flags: Returned flags used to create the BO */
+	__u32 flags;
+
+	/** @vpu_addr: Returned VPU virtual address */
+	__u64 vpu_addr;
+
+	/**
+	 * @mmap_offset:
+	 *
+	 * Returned offset to be used in mmap(). 0 in case the BO is not mappable.
+	 */
+	__u64 mmap_offset;
+
+	/** @size: Returned GEM object size, aligned to PAGE_SIZE */
+	__u64 size;
+};
+
+/* drm_ivpu_submit engines */
+#define DRM_IVPU_ENGINE_COMPUTE 0
+#define DRM_IVPU_ENGINE_COPY    1
+
+/**
+ * struct drm_ivpu_submit - Submit commands to the VPU
+ *
+ * Execute a single command buffer on a given VPU engine.
+ * Handles to all referenced buffer objects have to be provided in @buffers_ptr.
+ *
+ * User space may wait on job completion using %DRM_IVPU_BO_WAIT ioctl.
+ */
+struct drm_ivpu_submit {
+	/**
+	 * @buffers_ptr:
+	 *
+	 * A pointer to an u32 array of GEM handles of the BOs required for this job.
+	 * The number of elements in the array must be equal to the value given by @buffer_count.
+	 *
+	 * The first BO is the command buffer. The rest of array has to contain all
+	 * BOs referenced from the command buffer.
+	 */
+	__u64 buffers_ptr;
+
+	/** @buffer_count: Number of elements in the @buffers_ptr */
+	__u32 buffer_count;
+
+	/**
+	 * @engine: Select the engine this job should be executed on
+	 *
+	 * %DRM_IVPU_ENGINE_COMPUTE:
+	 *
+	 * Performs Deep Learning Neural Compute Inference Operations
+	 *
+	 * %DRM_IVPU_ENGINE_COPY:
+	 *
+	 * Performs memory copy operations to/from system memory allocated for VPU
+	 */
+	__u32 engine;
+
+	/** @flags: Reserved for future use - must be zero */
+	__u32 flags;
+
+	/**
+	 * @commands_offset:
+	 *
+	 * Offset inside the first buffer in @buffers_ptr containing commands
+	 * to be executed. The offset has to be 8-byte aligned.
+	 */
+	__u32 commands_offset;
+};
+
+/* drm_ivpu_bo_wait job status codes */
+#define DRM_IVPU_JOB_STATUS_SUCCESS 0
+
+/**
+ * struct drm_ivpu_bo_wait - Wait for BO to become inactive
+ *
+ * Blocks until a given buffer object becomes inactive.
+ * With @timeout_ms set to 0 returns immediately.
+ */
+struct drm_ivpu_bo_wait {
+	/** @handle: Handle to the buffer object to be waited on */
+	__u32 handle;
+
+	/** @flags: Reserved for future use - must be zero */
+	__u32 flags;
+
+	/** @timeout_ns: Absolute timeout in nanoseconds (may be zero) */
+	__s64 timeout_ns;
+
+	/**
+	 * @job_status:
+	 *
+	 * Job status code which is updated after the job is completed.
+	 * &DRM_IVPU_JOB_STATUS_SUCCESS or device specific error otherwise.
+	 * Valid only if @handle points to a command buffer.
+	 */
+	__u32 job_status;
+
+	/** @pad: Padding - must be zero */
+	__u32 pad;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __UAPI_IVPU_DRM_H__ */
diff --git a/include/drm-uapi/mga_drm.h b/include/drm-uapi/mga_drm.h
deleted file mode 100644
index 793001114821..000000000000
--- a/include/drm-uapi/mga_drm.h
+++ /dev/null
@@ -1,427 +0,0 @@
-/* mga_drm.h -- Public header for the Matrox g200/g400 driver -*- linux-c -*-
- * Created: Tue Jan 25 01:50:01 1999 by jhartmann@precisioninsight.com
- *
- * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
- * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
- * All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors:
- *    Jeff Hartmann <jhartmann@valinux.com>
- *    Keith Whitwell <keith@tungstengraphics.com>
- *
- * Rewritten by:
- *    Gareth Hughes <gareth@valinux.com>
- */
-
-#ifndef __MGA_DRM_H__
-#define __MGA_DRM_H__
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-/* WARNING: If you change any of these defines, make sure to change the
- * defines in the Xserver file (mga_sarea.h)
- */
-
-#ifndef __MGA_SAREA_DEFINES__
-#define __MGA_SAREA_DEFINES__
-
-/* WARP pipe flags
- */
-#define MGA_F			0x1	/* fog */
-#define MGA_A			0x2	/* alpha */
-#define MGA_S			0x4	/* specular */
-#define MGA_T2			0x8	/* multitexture */
-
-#define MGA_WARP_TGZ		0
-#define MGA_WARP_TGZF		(MGA_F)
-#define MGA_WARP_TGZA		(MGA_A)
-#define MGA_WARP_TGZAF		(MGA_F|MGA_A)
-#define MGA_WARP_TGZS		(MGA_S)
-#define MGA_WARP_TGZSF		(MGA_S|MGA_F)
-#define MGA_WARP_TGZSA		(MGA_S|MGA_A)
-#define MGA_WARP_TGZSAF		(MGA_S|MGA_F|MGA_A)
-#define MGA_WARP_T2GZ		(MGA_T2)
-#define MGA_WARP_T2GZF		(MGA_T2|MGA_F)
-#define MGA_WARP_T2GZA		(MGA_T2|MGA_A)
-#define MGA_WARP_T2GZAF		(MGA_T2|MGA_A|MGA_F)
-#define MGA_WARP_T2GZS		(MGA_T2|MGA_S)
-#define MGA_WARP_T2GZSF		(MGA_T2|MGA_S|MGA_F)
-#define MGA_WARP_T2GZSA		(MGA_T2|MGA_S|MGA_A)
-#define MGA_WARP_T2GZSAF	(MGA_T2|MGA_S|MGA_F|MGA_A)
-
-#define MGA_MAX_G200_PIPES	8	/* no multitex */
-#define MGA_MAX_G400_PIPES	16
-#define MGA_MAX_WARP_PIPES	MGA_MAX_G400_PIPES
-#define MGA_WARP_UCODE_SIZE	32768	/* in bytes */
-
-#define MGA_CARD_TYPE_G200	1
-#define MGA_CARD_TYPE_G400	2
-#define MGA_CARD_TYPE_G450	3	/* not currently used */
-#define MGA_CARD_TYPE_G550	4
-
-#define MGA_FRONT		0x1
-#define MGA_BACK		0x2
-#define MGA_DEPTH		0x4
-
-/* What needs to be changed for the current vertex dma buffer?
- */
-#define MGA_UPLOAD_CONTEXT	0x1
-#define MGA_UPLOAD_TEX0		0x2
-#define MGA_UPLOAD_TEX1		0x4
-#define MGA_UPLOAD_PIPE		0x8
-#define MGA_UPLOAD_TEX0IMAGE	0x10	/* handled client-side */
-#define MGA_UPLOAD_TEX1IMAGE	0x20	/* handled client-side */
-#define MGA_UPLOAD_2D		0x40
-#define MGA_WAIT_AGE		0x80	/* handled client-side */
-#define MGA_UPLOAD_CLIPRECTS	0x100	/* handled client-side */
-#if 0
-#define MGA_DMA_FLUSH		0x200	/* set when someone gets the lock
-					   quiescent */
-#endif
-
-/* 32 buffers of 64k each, total 2 meg.
- */
-#define MGA_BUFFER_SIZE		(1 << 16)
-#define MGA_NUM_BUFFERS		128
-
-/* Keep these small for testing.
- */
-#define MGA_NR_SAREA_CLIPRECTS	8
-
-/* 2 heaps (1 for card, 1 for agp), each divided into up to 128
- * regions, subject to a minimum region size of (1<<16) == 64k.
- *
- * Clients may subdivide regions internally, but when sharing between
- * clients, the region size is the minimum granularity.
- */
-
-#define MGA_CARD_HEAP			0
-#define MGA_AGP_HEAP			1
-#define MGA_NR_TEX_HEAPS		2
-#define MGA_NR_TEX_REGIONS		16
-#define MGA_LOG_MIN_TEX_REGION_SIZE	16
-
-#define  DRM_MGA_IDLE_RETRY          2048
-
-#endif				/* __MGA_SAREA_DEFINES__ */
-
-/* Setup registers for 3D context
- */
-typedef struct {
-	unsigned int dstorg;
-	unsigned int maccess;
-	unsigned int plnwt;
-	unsigned int dwgctl;
-	unsigned int alphactrl;
-	unsigned int fogcolor;
-	unsigned int wflag;
-	unsigned int tdualstage0;
-	unsigned int tdualstage1;
-	unsigned int fcol;
-	unsigned int stencil;
-	unsigned int stencilctl;
-} drm_mga_context_regs_t;
-
-/* Setup registers for 2D, X server
- */
-typedef struct {
-	unsigned int pitch;
-} drm_mga_server_regs_t;
-
-/* Setup registers for each texture unit
- */
-typedef struct {
-	unsigned int texctl;
-	unsigned int texctl2;
-	unsigned int texfilter;
-	unsigned int texbordercol;
-	unsigned int texorg;
-	unsigned int texwidth;
-	unsigned int texheight;
-	unsigned int texorg1;
-	unsigned int texorg2;
-	unsigned int texorg3;
-	unsigned int texorg4;
-} drm_mga_texture_regs_t;
-
-/* General aging mechanism
- */
-typedef struct {
-	unsigned int head;	/* Position of head pointer          */
-	unsigned int wrap;	/* Primary DMA wrap count            */
-} drm_mga_age_t;
-
-typedef struct _drm_mga_sarea {
-	/* The channel for communication of state information to the kernel
-	 * on firing a vertex dma buffer.
-	 */
-	drm_mga_context_regs_t context_state;
-	drm_mga_server_regs_t server_state;
-	drm_mga_texture_regs_t tex_state[2];
-	unsigned int warp_pipe;
-	unsigned int dirty;
-	unsigned int vertsize;
-
-	/* The current cliprects, or a subset thereof.
-	 */
-	struct drm_clip_rect boxes[MGA_NR_SAREA_CLIPRECTS];
-	unsigned int nbox;
-
-	/* Information about the most recently used 3d drawable.  The
-	 * client fills in the req_* fields, the server fills in the
-	 * exported_ fields and puts the cliprects into boxes, above.
-	 *
-	 * The client clears the exported_drawable field before
-	 * clobbering the boxes data.
-	 */
-	unsigned int req_drawable;	/* the X drawable id */
-	unsigned int req_draw_buffer;	/* MGA_FRONT or MGA_BACK */
-
-	unsigned int exported_drawable;
-	unsigned int exported_index;
-	unsigned int exported_stamp;
-	unsigned int exported_buffers;
-	unsigned int exported_nfront;
-	unsigned int exported_nback;
-	int exported_back_x, exported_front_x, exported_w;
-	int exported_back_y, exported_front_y, exported_h;
-	struct drm_clip_rect exported_boxes[MGA_NR_SAREA_CLIPRECTS];
-
-	/* Counters for aging textures and for client-side throttling.
-	 */
-	unsigned int status[4];
-	unsigned int last_wrap;
-
-	drm_mga_age_t last_frame;
-	unsigned int last_enqueue;	/* last time a buffer was enqueued */
-	unsigned int last_dispatch;	/* age of the most recently dispatched buffer */
-	unsigned int last_quiescent;	/*  */
-
-	/* LRU lists for texture memory in agp space and on the card.
-	 */
-	struct drm_tex_region texList[MGA_NR_TEX_HEAPS][MGA_NR_TEX_REGIONS + 1];
-	unsigned int texAge[MGA_NR_TEX_HEAPS];
-
-	/* Mechanism to validate card state.
-	 */
-	int ctxOwner;
-} drm_mga_sarea_t;
-
-/* MGA specific ioctls
- * The device specific ioctl range is 0x40 to 0x79.
- */
-#define DRM_MGA_INIT     0x00
-#define DRM_MGA_FLUSH    0x01
-#define DRM_MGA_RESET    0x02
-#define DRM_MGA_SWAP     0x03
-#define DRM_MGA_CLEAR    0x04
-#define DRM_MGA_VERTEX   0x05
-#define DRM_MGA_INDICES  0x06
-#define DRM_MGA_ILOAD    0x07
-#define DRM_MGA_BLIT     0x08
-#define DRM_MGA_GETPARAM 0x09
-
-/* 3.2:
- * ioctls for operating on fences.
- */
-#define DRM_MGA_SET_FENCE      0x0a
-#define DRM_MGA_WAIT_FENCE     0x0b
-#define DRM_MGA_DMA_BOOTSTRAP  0x0c
-
-#define DRM_IOCTL_MGA_INIT     DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_INIT, drm_mga_init_t)
-#define DRM_IOCTL_MGA_FLUSH    DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_FLUSH, struct drm_lock)
-#define DRM_IOCTL_MGA_RESET    DRM_IO(  DRM_COMMAND_BASE + DRM_MGA_RESET)
-#define DRM_IOCTL_MGA_SWAP     DRM_IO(  DRM_COMMAND_BASE + DRM_MGA_SWAP)
-#define DRM_IOCTL_MGA_CLEAR    DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_CLEAR, drm_mga_clear_t)
-#define DRM_IOCTL_MGA_VERTEX   DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_VERTEX, drm_mga_vertex_t)
-#define DRM_IOCTL_MGA_INDICES  DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_INDICES, drm_mga_indices_t)
-#define DRM_IOCTL_MGA_ILOAD    DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_ILOAD, drm_mga_iload_t)
-#define DRM_IOCTL_MGA_BLIT     DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_BLIT, drm_mga_blit_t)
-#define DRM_IOCTL_MGA_GETPARAM DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_GETPARAM, drm_mga_getparam_t)
-#define DRM_IOCTL_MGA_SET_FENCE     DRM_IOW( DRM_COMMAND_BASE + DRM_MGA_SET_FENCE, __u32)
-#define DRM_IOCTL_MGA_WAIT_FENCE    DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_WAIT_FENCE, __u32)
-#define DRM_IOCTL_MGA_DMA_BOOTSTRAP DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_DMA_BOOTSTRAP, drm_mga_dma_bootstrap_t)
-
-typedef struct _drm_mga_warp_index {
-	int installed;
-	unsigned long phys_addr;
-	int size;
-} drm_mga_warp_index_t;
-
-typedef struct drm_mga_init {
-	enum {
-		MGA_INIT_DMA = 0x01,
-		MGA_CLEANUP_DMA = 0x02
-	} func;
-
-	unsigned long sarea_priv_offset;
-
-	int chipset;
-	int sgram;
-
-	unsigned int maccess;
-
-	unsigned int fb_cpp;
-	unsigned int front_offset, front_pitch;
-	unsigned int back_offset, back_pitch;
-
-	unsigned int depth_cpp;
-	unsigned int depth_offset, depth_pitch;
-
-	unsigned int texture_offset[MGA_NR_TEX_HEAPS];
-	unsigned int texture_size[MGA_NR_TEX_HEAPS];
-
-	unsigned long fb_offset;
-	unsigned long mmio_offset;
-	unsigned long status_offset;
-	unsigned long warp_offset;
-	unsigned long primary_offset;
-	unsigned long buffers_offset;
-} drm_mga_init_t;
-
-typedef struct drm_mga_dma_bootstrap {
-	/**
-	 * \name AGP texture region
-	 *
-	 * On return from the DRM_MGA_DMA_BOOTSTRAP ioctl, these fields will
-	 * be filled in with the actual AGP texture settings.
-	 *
-	 * \warning
-	 * If these fields are non-zero, but dma_mga_dma_bootstrap::agp_mode
-	 * is zero, it means that PCI memory (most likely through the use of
-	 * an IOMMU) is being used for "AGP" textures.
-	 */
-	/*@{ */
-	unsigned long texture_handle; /**< Handle used to map AGP textures. */
-	__u32 texture_size;	      /**< Size of the AGP texture region. */
-	/*@} */
-
-	/**
-	 * Requested size of the primary DMA region.
-	 *
-	 * On return from the DRM_MGA_DMA_BOOTSTRAP ioctl, this field will be
-	 * filled in with the actual AGP mode.  If AGP was not available
-	 */
-	__u32 primary_size;
-
-	/**
-	 * Requested number of secondary DMA buffers.
-	 *
-	 * On return from the DRM_MGA_DMA_BOOTSTRAP ioctl, this field will be
-	 * filled in with the actual number of secondary DMA buffers
-	 * allocated.  Particularly when PCI DMA is used, this may be
-	 * (subtantially) less than the number requested.
-	 */
-	__u32 secondary_bin_count;
-
-	/**
-	 * Requested size of each secondary DMA buffer.
-	 *
-	 * While the kernel \b is free to reduce
-	 * dma_mga_dma_bootstrap::secondary_bin_count, it is \b not allowed
-	 * to reduce dma_mga_dma_bootstrap::secondary_bin_size.
-	 */
-	__u32 secondary_bin_size;
-
-	/**
-	 * Bit-wise mask of AGPSTAT2_* values.  Currently only \c AGPSTAT2_1X,
-	 * \c AGPSTAT2_2X, and \c AGPSTAT2_4X are supported.  If this value is
-	 * zero, it means that PCI DMA should be used, even if AGP is
-	 * possible.
-	 *
-	 * On return from the DRM_MGA_DMA_BOOTSTRAP ioctl, this field will be
-	 * filled in with the actual AGP mode.  If AGP was not available
-	 * (i.e., PCI DMA was used), this value will be zero.
-	 */
-	__u32 agp_mode;
-
-	/**
-	 * Desired AGP GART size, measured in megabytes.
-	 */
-	__u8 agp_size;
-} drm_mga_dma_bootstrap_t;
-
-typedef struct drm_mga_clear {
-	unsigned int flags;
-	unsigned int clear_color;
-	unsigned int clear_depth;
-	unsigned int color_mask;
-	unsigned int depth_mask;
-} drm_mga_clear_t;
-
-typedef struct drm_mga_vertex {
-	int idx;		/* buffer to queue */
-	int used;		/* bytes in use */
-	int discard;		/* client finished with buffer?  */
-} drm_mga_vertex_t;
-
-typedef struct drm_mga_indices {
-	int idx;		/* buffer to queue */
-	unsigned int start;
-	unsigned int end;
-	int discard;		/* client finished with buffer?  */
-} drm_mga_indices_t;
-
-typedef struct drm_mga_iload {
-	int idx;
-	unsigned int dstorg;
-	unsigned int length;
-} drm_mga_iload_t;
-
-typedef struct _drm_mga_blit {
-	unsigned int planemask;
-	unsigned int srcorg;
-	unsigned int dstorg;
-	int src_pitch, dst_pitch;
-	int delta_sx, delta_sy;
-	int delta_dx, delta_dy;
-	int height, ydir;	/* flip image vertically */
-	int source_pitch, dest_pitch;
-} drm_mga_blit_t;
-
-/* 3.1: An ioctl to get parameters that aren't available to the 3d
- * client any other way.
- */
-#define MGA_PARAM_IRQ_NR            1
-
-/* 3.2: Query the actual card type.  The DDX only distinguishes between
- * G200 chips and non-G200 chips, which it calls G400.  It turns out that
- * there are some very sublte differences between the G4x0 chips and the G550
- * chips.  Using this parameter query, a client-side driver can detect the
- * difference between a G4x0 and a G550.
- */
-#define MGA_PARAM_CARD_TYPE         2
-
-typedef struct drm_mga_getparam {
-	int param;
-	void *value;
-} drm_mga_getparam_t;
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif
diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
index 6c34272a13fd..d8a6b3472760 100644
--- a/include/drm-uapi/msm_drm.h
+++ b/include/drm-uapi/msm_drm.h
@@ -86,6 +86,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
+#define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -139,6 +140,8 @@ struct drm_msm_gem_new {
 #define MSM_INFO_GET_NAME	0x03   /* get debug name, returned by pointer */
 #define MSM_INFO_SET_IOVA	0x04   /* set the iova, passed by value */
 #define MSM_INFO_GET_FLAGS	0x05   /* get the MSM_BO_x flags */
+#define MSM_INFO_SET_METADATA	0x06   /* set userspace metadata */
+#define MSM_INFO_GET_METADATA	0x07   /* get userspace metadata */
 
 struct drm_msm_gem_info {
 	__u32 handle;         /* in */
diff --git a/include/drm-uapi/pvr_drm.h b/include/drm-uapi/pvr_drm.h
new file mode 100644
index 000000000000..ccf6c2112468
--- /dev/null
+++ b/include/drm-uapi/pvr_drm.h
@@ -0,0 +1,1295 @@
+/* SPDX-License-Identifier: (GPL-2.0-only WITH Linux-syscall-note) OR MIT */
+/* Copyright (c) 2023 Imagination Technologies Ltd. */
+
+#ifndef PVR_DRM_UAPI_H
+#define PVR_DRM_UAPI_H
+
+#include "drm.h"
+
+#include <linux/const.h>
+#include <linux/types.h>
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * DOC: PowerVR UAPI
+ *
+ * The PowerVR IOCTL argument structs have a few limitations in place, in
+ * addition to the standard kernel restrictions:
+ *
+ *  - All members must be type-aligned.
+ *  - The overall struct must be padded to 64-bit alignment.
+ *  - Explicit padding is almost always required. This takes the form of
+ *    ``_padding_[x]`` members of sufficient size to pad to the next power-of-two
+ *    alignment, where [x] is the offset into the struct in hexadecimal. Arrays
+ *    are never used for alignment. Padding fields must be zeroed; this is
+ *    always checked.
+ *  - Unions may only appear as the last member of a struct.
+ *  - Individual union members may grow in the future. The space between the
+ *    end of a union member and the end of its containing union is considered
+ *    "implicit padding" and must be zeroed. This is always checked.
+ *
+ * In addition to the IOCTL argument structs, the PowerVR UAPI makes use of
+ * DEV_QUERY argument structs. These are used to fetch information about the
+ * device and runtime. These structs are subject to the same rules set out
+ * above.
+ */
+
+/**
+ * struct drm_pvr_obj_array - Container used to pass arrays of objects
+ *
+ * It is not unusual to have to extend objects to pass new parameters, and the DRM
+ * ioctl infrastructure is supporting that by padding ioctl arguments with zeros
+ * when the data passed by userspace is smaller than the struct defined in the
+ * drm_ioctl_desc, thus keeping things backward compatible. This type is just
+ * applying the same concepts to indirect objects passed through arrays referenced
+ * from the main ioctl arguments structure: the stride basically defines the size
+ * of the object passed by userspace, which allows the kernel driver to pad with
+ * zeros when it's smaller than the size of the object it expects.
+ *
+ * Use ``DRM_PVR_OBJ_ARRAY()`` to fill object array fields, unless you
+ * have a very good reason not to.
+ */
+struct drm_pvr_obj_array {
+	/** @stride: Stride of object struct. Used for versioning. */
+	__u32 stride;
+
+	/** @count: Number of objects in the array. */
+	__u32 count;
+
+	/** @array: User pointer to an array of objects. */
+	__u64 array;
+};
+
+/**
+ * DRM_PVR_OBJ_ARRAY() - Helper macro for filling &struct drm_pvr_obj_array.
+ * @cnt: Number of elements pointed to py @ptr.
+ * @ptr: Pointer to start of a C array.
+ *
+ * Return: Literal of type &struct drm_pvr_obj_array.
+ */
+#define DRM_PVR_OBJ_ARRAY(cnt, ptr) \
+	{ .stride = sizeof((ptr)[0]), .count = (cnt), .array = (__u64)(uintptr_t)(ptr) }
+
+/**
+ * DOC: PowerVR IOCTL interface
+ */
+
+/**
+ * PVR_IOCTL() - Build a PowerVR IOCTL number
+ * @_ioctl: An incrementing id for this IOCTL. Added to %DRM_COMMAND_BASE.
+ * @_mode: Must be one of %DRM_IOR, %DRM_IOW or %DRM_IOWR.
+ * @_data: The type of the args struct passed by this IOCTL.
+ *
+ * The struct referred to by @_data must have a ``drm_pvr_ioctl_`` prefix and an
+ * ``_args suffix``. They are therefore omitted from @_data.
+ *
+ * This should only be used to build the constants described below; it should
+ * never be used to call an IOCTL directly.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define PVR_IOCTL(_ioctl, _mode, _data) \
+	_mode(DRM_COMMAND_BASE + (_ioctl), struct drm_pvr_ioctl_##_data##_args)
+
+#define DRM_IOCTL_PVR_DEV_QUERY PVR_IOCTL(0x00, DRM_IOWR, dev_query)
+#define DRM_IOCTL_PVR_CREATE_BO PVR_IOCTL(0x01, DRM_IOWR, create_bo)
+#define DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET PVR_IOCTL(0x02, DRM_IOWR, get_bo_mmap_offset)
+#define DRM_IOCTL_PVR_CREATE_VM_CONTEXT PVR_IOCTL(0x03, DRM_IOWR, create_vm_context)
+#define DRM_IOCTL_PVR_DESTROY_VM_CONTEXT PVR_IOCTL(0x04, DRM_IOW, destroy_vm_context)
+#define DRM_IOCTL_PVR_VM_MAP PVR_IOCTL(0x05, DRM_IOW, vm_map)
+#define DRM_IOCTL_PVR_VM_UNMAP PVR_IOCTL(0x06, DRM_IOW, vm_unmap)
+#define DRM_IOCTL_PVR_CREATE_CONTEXT PVR_IOCTL(0x07, DRM_IOWR, create_context)
+#define DRM_IOCTL_PVR_DESTROY_CONTEXT PVR_IOCTL(0x08, DRM_IOW, destroy_context)
+#define DRM_IOCTL_PVR_CREATE_FREE_LIST PVR_IOCTL(0x09, DRM_IOWR, create_free_list)
+#define DRM_IOCTL_PVR_DESTROY_FREE_LIST PVR_IOCTL(0x0a, DRM_IOW, destroy_free_list)
+#define DRM_IOCTL_PVR_CREATE_HWRT_DATASET PVR_IOCTL(0x0b, DRM_IOWR, create_hwrt_dataset)
+#define DRM_IOCTL_PVR_DESTROY_HWRT_DATASET PVR_IOCTL(0x0c, DRM_IOW, destroy_hwrt_dataset)
+#define DRM_IOCTL_PVR_SUBMIT_JOBS PVR_IOCTL(0x0d, DRM_IOW, submit_jobs)
+
+/**
+ * DOC: PowerVR IOCTL DEV_QUERY interface
+ */
+
+/**
+ * struct drm_pvr_dev_query_gpu_info - Container used to fetch information about
+ * the graphics processor.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_GPU_INFO_GET.
+ */
+struct drm_pvr_dev_query_gpu_info {
+	/**
+	 * @gpu_id: GPU identifier.
+	 *
+	 * For all currently supported GPUs this is the BVNC encoded as a 64-bit
+	 * value as follows:
+	 *
+	 *    +--------+--------+--------+-------+
+	 *    | 63..48 | 47..32 | 31..16 | 15..0 |
+	 *    +========+========+========+=======+
+	 *    | B      | V      | N      | C     |
+	 *    +--------+--------+--------+-------+
+	 */
+	__u64 gpu_id;
+
+	/**
+	 * @num_phantoms: Number of Phantoms present.
+	 */
+	__u32 num_phantoms;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * struct drm_pvr_dev_query_runtime_info - Container used to fetch information
+ * about the graphics runtime.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET.
+ */
+struct drm_pvr_dev_query_runtime_info {
+	/**
+	 * @free_list_min_pages: Minimum allowed free list size,
+	 * in PM physical pages.
+	 */
+	__u64 free_list_min_pages;
+
+	/**
+	 * @free_list_max_pages: Maximum allowed free list size,
+	 * in PM physical pages.
+	 */
+	__u64 free_list_max_pages;
+
+	/**
+	 * @common_store_alloc_region_size: Size of the Allocation
+	 * Region within the Common Store used for coefficient and shared
+	 * registers, in dwords.
+	 */
+	__u32 common_store_alloc_region_size;
+
+	/**
+	 * @common_store_partition_space_size: Size of the
+	 * Partition Space within the Common Store for output buffers, in
+	 * dwords.
+	 */
+	__u32 common_store_partition_space_size;
+
+	/**
+	 * @max_coeffs: Maximum coefficients, in dwords.
+	 */
+	__u32 max_coeffs;
+
+	/**
+	 * @cdm_max_local_mem_size_regs: Maximum amount of local
+	 * memory available to a compute kernel, in dwords.
+	 */
+	__u32 cdm_max_local_mem_size_regs;
+};
+
+/**
+ * struct drm_pvr_dev_query_quirks - Container used to fetch information about
+ * hardware fixes for which the device may require support in the user mode
+ * driver.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_QUIRKS_GET.
+ */
+struct drm_pvr_dev_query_quirks {
+	/**
+	 * @quirks: A userspace address for the hardware quirks __u32 array.
+	 *
+	 * The first @musthave_count items in the list are quirks that the
+	 * client must support for this device. If userspace does not support
+	 * all these quirks then functionality is not guaranteed and client
+	 * initialisation must fail.
+	 * The remaining quirks in the list affect userspace and the kernel or
+	 * firmware. They are disabled by default and require userspace to
+	 * opt-in. The opt-in mechanism depends on the quirk.
+	 */
+	__u64 quirks;
+
+	/** @count: Length of @quirks (number of __u32). */
+	__u16 count;
+
+	/**
+	 * @musthave_count: The number of entries in @quirks that are
+	 * mandatory, starting at index 0.
+	 */
+	__u16 musthave_count;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * struct drm_pvr_dev_query_enhancements - Container used to fetch information
+ * about optional enhancements supported by the device that require support in
+ * the user mode driver.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_ENHANCEMENTS_GET.
+ */
+struct drm_pvr_dev_query_enhancements {
+	/**
+	 * @enhancements: A userspace address for the hardware enhancements
+	 * __u32 array.
+	 *
+	 * These enhancements affect userspace and the kernel or firmware. They
+	 * are disabled by default and require userspace to opt-in. The opt-in
+	 * mechanism depends on the enhancement.
+	 */
+	__u64 enhancements;
+
+	/** @count: Length of @enhancements (number of __u32). */
+	__u16 count;
+
+	/** @_padding_a: Reserved. This field must be zeroed. */
+	__u16 _padding_a;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+};
+
+/**
+ * enum drm_pvr_heap_id - Array index for heap info data returned by
+ * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ *
+ * For compatibility reasons all indices will be present in the returned array,
+ * however some heaps may not be present. These are indicated where
+ * &struct drm_pvr_heap.size is set to zero.
+ */
+enum drm_pvr_heap_id {
+	/** @DRM_PVR_HEAP_GENERAL: General purpose heap. */
+	DRM_PVR_HEAP_GENERAL = 0,
+	/** @DRM_PVR_HEAP_PDS_CODE_DATA: PDS code and data heap. */
+	DRM_PVR_HEAP_PDS_CODE_DATA,
+	/** @DRM_PVR_HEAP_USC_CODE: USC code heap. */
+	DRM_PVR_HEAP_USC_CODE,
+	/** @DRM_PVR_HEAP_RGNHDR: Region header heap. Only used if GPU has BRN63142. */
+	DRM_PVR_HEAP_RGNHDR,
+	/** @DRM_PVR_HEAP_VIS_TEST: Visibility test heap. */
+	DRM_PVR_HEAP_VIS_TEST,
+	/** @DRM_PVR_HEAP_TRANSFER_FRAG: Transfer fragment heap. */
+	DRM_PVR_HEAP_TRANSFER_FRAG,
+
+	/**
+	 * @DRM_PVR_HEAP_COUNT: The number of heaps returned by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 *
+	 * More heaps may be added, so this also serves as the copy limit when
+	 * sent by the caller.
+	 */
+	DRM_PVR_HEAP_COUNT
+	/* Please only add additional heaps above DRM_PVR_HEAP_COUNT! */
+};
+
+/**
+ * struct drm_pvr_heap - Container holding information about a single heap.
+ *
+ * This will always be fetched as an array.
+ */
+struct drm_pvr_heap {
+	/** @base: Base address of heap. */
+	__u64 base;
+
+	/** @size: Size of heap, in bytes. Will be 0 if the heap is not present. */
+	__u64 size;
+
+	/** @flags: Flags for this heap. Currently always 0. */
+	__u32 flags;
+
+	/** @page_size_log2: Log2 of page size. */
+	__u32 page_size_log2;
+};
+
+/**
+ * struct drm_pvr_dev_query_heap_info - Container used to fetch information
+ * about heaps supported by the device driver.
+ *
+ * Please note all driver-supported heaps will be returned up to &heaps.count.
+ * Some heaps will not be present in all devices, which will be indicated by
+ * &struct drm_pvr_heap.size being set to zero.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ */
+struct drm_pvr_dev_query_heap_info {
+	/**
+	 * @heaps: Array of &struct drm_pvr_heap. If pointer is NULL, the count
+	 * and stride will be updated with those known to the driver version, to
+	 * facilitate allocation by the caller.
+	 */
+	struct drm_pvr_obj_array heaps;
+};
+
+/**
+ * enum drm_pvr_static_data_area_usage - Array index for static data area info
+ * returned by %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
+ *
+ * For compatibility reasons all indices will be present in the returned array,
+ * however some areas may not be present. These are indicated where
+ * &struct drm_pvr_static_data_area.size is set to zero.
+ */
+enum drm_pvr_static_data_area_usage {
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_EOT: End of Tile PDS program code segment.
+	 *
+	 * The End of Tile PDS task runs at completion of a tile during a fragment job, and is
+	 * responsible for emitting the tile to the Pixel Back End.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_EOT = 0,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_FENCE: MCU fence area, used during cache flush and
+	 * invalidation.
+	 *
+	 * This must point to valid physical memory but the contents otherwise are not used.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_FENCE,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_VDM_SYNC: VDM sync program.
+	 *
+	 * The VDM sync program is used to synchronise multiple areas of the GPU hardware.
+	 */
+	DRM_PVR_STATIC_DATA_AREA_VDM_SYNC,
+
+	/**
+	 * @DRM_PVR_STATIC_DATA_AREA_YUV_CSC: YUV coefficients.
+	 *
+	 * Area contains up to 16 slots with stride of 64 bytes. Each is a 3x4 matrix of u16 fixed
+	 * point numbers, with 1 sign bit, 2 integer bits and 13 fractional bits.
+	 *
+	 * The slots are :
+	 * 0 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY_KHR
+	 * 1 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR (full range)
+	 * 2 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_IDENTITY_KHR (conformant range)
+	 * 3 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (full range)
+	 * 4 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (conformant range)
+	 * 5 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (full range)
+	 * 6 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conformant range)
+	 * 7 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (full range)
+	 * 8 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (conformant range)
+	 * 9 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_601_KHR (conformant range, 10 bit)
+	 * 10 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_709_KHR (conformant range, 10 bit)
+	 * 11 = VK_SAMPLER_YCBCR_MODEL_CONVERSION_YCBCR_2020_KHR (conformant range, 10 bit)
+	 * 14 = Identity (biased)
+	 * 15 = Identity
+	 */
+	DRM_PVR_STATIC_DATA_AREA_YUV_CSC,
+};
+
+/**
+ * struct drm_pvr_static_data_area - Container holding information about a
+ * single static data area.
+ *
+ * This will always be fetched as an array.
+ */
+struct drm_pvr_static_data_area {
+	/**
+	 * @area_usage: Usage of static data area.
+	 * See &enum drm_pvr_static_data_area_usage.
+	 */
+	__u16 area_usage;
+
+	/**
+	 * @location_heap_id: Array index of heap where this of static data
+	 * area is located. This array is fetched using
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 */
+	__u16 location_heap_id;
+
+	/** @size: Size of static data area. Not present if set to zero. */
+	__u32 size;
+
+	/** @offset: Offset of static data area from start of heap. */
+	__u64 offset;
+};
+
+/**
+ * struct drm_pvr_dev_query_static_data_areas - Container used to fetch
+ * information about the static data areas in heaps supported by the device
+ * driver.
+ *
+ * Please note all driver-supported static data areas will be returned up to
+ * &static_data_areas.count. Some will not be present for all devices which,
+ * will be indicated by &struct drm_pvr_static_data_area.size being set to zero.
+ *
+ * Further, some heaps will not be present either. See &struct
+ * drm_pvr_dev_query_heap_info.
+ *
+ * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
+ * to %DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET.
+ */
+struct drm_pvr_dev_query_static_data_areas {
+	/**
+	 * @static_data_areas: Array of &struct drm_pvr_static_data_area. If
+	 * pointer is NULL, the count and stride will be updated with those
+	 * known to the driver version, to facilitate allocation by the caller.
+	 */
+	struct drm_pvr_obj_array static_data_areas;
+};
+
+/**
+ * enum drm_pvr_dev_query - For use with &drm_pvr_ioctl_dev_query_args.type to
+ * indicate the type of the receiving container.
+ *
+ * Append only. Do not reorder.
+ */
+enum drm_pvr_dev_query {
+	/**
+	 * @DRM_PVR_DEV_QUERY_GPU_INFO_GET: The dev query args contain a pointer
+	 * to &struct drm_pvr_dev_query_gpu_info.
+	 */
+	DRM_PVR_DEV_QUERY_GPU_INFO_GET = 0,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_runtime_info.
+	 */
+	DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_QUIRKS_GET: The dev query args contain a pointer
+	 * to &struct drm_pvr_dev_query_quirks.
+	 */
+	DRM_PVR_DEV_QUERY_QUIRKS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_enhancements.
+	 */
+	DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_HEAP_INFO_GET: The dev query args contain a
+	 * pointer to &struct drm_pvr_dev_query_heap_info.
+	 */
+	DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET: The dev query args contain
+	 * a pointer to &struct drm_pvr_dev_query_static_data_areas.
+	 */
+	DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+};
+
+/**
+ * struct drm_pvr_ioctl_dev_query_args - Arguments for %DRM_IOCTL_PVR_DEV_QUERY.
+ */
+struct drm_pvr_ioctl_dev_query_args {
+	/**
+	 * @type: Type of query and output struct. See &enum drm_pvr_dev_query.
+	 */
+	__u32 type;
+
+	/**
+	 * @size: Size of the receiving struct, see @type.
+	 *
+	 * After a successful call this will be updated to the written byte
+	 * length.
+	 * Can also be used to get the minimum byte length (see @pointer).
+	 * This allows additional fields to be appended to the structs in
+	 * future.
+	 */
+	__u32 size;
+
+	/**
+	 * @pointer: Pointer to struct @type.
+	 *
+	 * Must be large enough to contain @size bytes.
+	 * If pointer is NULL, the expected size will be returned in the @size
+	 * field, but no other data will be written.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_BO interface
+ */
+
+/**
+ * DOC: Flags for CREATE_BO
+ *
+ * We use "device" to refer to the GPU here because of the ambiguity between CPU and GPU in some
+ * fonts.
+ *
+ * Device mapping options
+ *    :DRM_PVR_BO_BYPASS_DEVICE_CACHE: Specify that device accesses to this memory will bypass the
+ *       cache. This is used for buffers that will either be regularly updated by the CPU (eg free
+ *       lists) or will be accessed only once and therefore isn't worth caching (eg partial render
+ *       buffers).
+ *       By default, the device flushes its memory caches after every job, so this is not normally
+ *       required for coherency.
+ *    :DRM_PVR_BO_PM_FW_PROTECT: Specify that only the Parameter Manager (PM) and/or firmware
+ *       processor should be allowed to access this memory when mapped to the device. It is not
+ *       valid to specify this flag with DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS.
+ *
+ * CPU mapping options
+ *    :DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS: Allow userspace to map and access the contents of this
+ *       memory. It is not valid to specify this flag with DRM_PVR_BO_PM_FW_PROTECT.
+ */
+#define DRM_PVR_BO_BYPASS_DEVICE_CACHE _BITULL(0)
+#define DRM_PVR_BO_PM_FW_PROTECT _BITULL(1)
+#define DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS _BITULL(2)
+/* Bits 3..63 are reserved. */
+
+#define DRM_PVR_BO_FLAGS_MASK (DRM_PVR_BO_BYPASS_DEVICE_CACHE | DRM_PVR_BO_PM_FW_PROTECT | \
+			       DRM_PVR_BO_ALLOW_CPU_USERSPACE_ACCESS)
+
+/**
+ * struct drm_pvr_ioctl_create_bo_args - Arguments for %DRM_IOCTL_PVR_CREATE_BO
+ */
+struct drm_pvr_ioctl_create_bo_args {
+	/**
+	 * @size: [IN] Size of buffer object to create. This must be page size
+	 * aligned.
+	 */
+	__u64 size;
+
+	/**
+	 * @handle: [OUT] GEM handle of the new buffer object for use in
+	 * userspace.
+	 */
+	__u32 handle;
+
+	/** @_padding_c: Reserved. This field must be zeroed. */
+	__u32 _padding_c;
+
+	/**
+	 * @flags: [IN] Options which will affect the behaviour of this
+	 * creation operation and future mapping operations on the created
+	 * object. This field must be a valid combination of ``DRM_PVR_BO_*``
+	 * values, with all bits marked as reserved set to zero.
+	 */
+	__u64 flags;
+};
+
+/**
+ * DOC: PowerVR IOCTL GET_BO_MMAP_OFFSET interface
+ */
+
+/**
+ * struct drm_pvr_ioctl_get_bo_mmap_offset_args - Arguments for
+ * %DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET
+ *
+ * Like other DRM drivers, the "mmap" IOCTL doesn't actually map any memory.
+ * Instead, it allocates a fake offset which refers to the specified buffer
+ * object. This offset can be used with a real mmap call on the DRM device
+ * itself.
+ */
+struct drm_pvr_ioctl_get_bo_mmap_offset_args {
+	/** @handle: [IN] GEM handle of the buffer object to be mapped. */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+
+	/** @offset: [OUT] Fake offset to use in the real mmap call. */
+	__u64 offset;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_VM_CONTEXT and DESTROY_VM_CONTEXT interfaces
+ */
+
+/**
+ * struct drm_pvr_ioctl_create_vm_context_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_VM_CONTEXT
+ */
+struct drm_pvr_ioctl_create_vm_context_args {
+	/** @handle: [OUT] Handle for new VM context. */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_vm_context_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_VM_CONTEXT
+ */
+struct drm_pvr_ioctl_destroy_vm_context_args {
+	/**
+	 * @handle: [IN] Handle for VM context to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL VM_MAP and VM_UNMAP interfaces
+ *
+ * The VM UAPI allows userspace to create buffer object mappings in GPU virtual address space.
+ *
+ * The client is responsible for managing GPU address space. It should allocate mappings within
+ * the heaps returned by %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+ *
+ * %DRM_IOCTL_PVR_VM_MAP creates a new mapping. The client provides the target virtual address for
+ * the mapping. Size and offset within the mapped buffer object can be specified, so the client can
+ * partially map a buffer.
+ *
+ * %DRM_IOCTL_PVR_VM_UNMAP removes a mapping. The entire mapping will be removed from GPU address
+ * space only if the size of the mapping matches that known to the driver.
+ */
+
+/**
+ * struct drm_pvr_ioctl_vm_map_args - Arguments for %DRM_IOCTL_PVR_VM_MAP.
+ */
+struct drm_pvr_ioctl_vm_map_args {
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context for this mapping to
+	 * exist in.
+	 */
+	__u32 vm_context_handle;
+
+	/** @flags: [IN] Flags which affect this mapping. Currently always 0. */
+	__u32 flags;
+
+	/**
+	 * @device_addr: [IN] Requested device-virtual address for the mapping.
+	 * This must be non-zero and aligned to the device page size for the
+	 * heap containing the requested address. It is an error to specify an
+	 * address which is not contained within one of the heaps returned by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
+	 */
+	__u64 device_addr;
+
+	/**
+	 * @handle: [IN] Handle of the target buffer object. This must be a
+	 * valid handle returned by %DRM_IOCTL_PVR_CREATE_BO.
+	 */
+	__u32 handle;
+
+	/** @_padding_14: Reserved. This field must be zeroed. */
+	__u32 _padding_14;
+
+	/**
+	 * @offset: [IN] Offset into the target bo from which to begin the
+	 * mapping.
+	 */
+	__u64 offset;
+
+	/**
+	 * @size: [IN] Size of the requested mapping. Must be aligned to
+	 * the device page size for the heap containing the requested address,
+	 * as well as the host page size. When added to @device_addr, the
+	 * result must not overflow the heap which contains @device_addr (i.e.
+	 * the range specified by @device_addr and @size must be completely
+	 * contained within a single heap specified by
+	 * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET).
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_pvr_ioctl_vm_unmap_args - Arguments for %DRM_IOCTL_PVR_VM_UNMAP.
+ */
+struct drm_pvr_ioctl_vm_unmap_args {
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that this mapping
+	 * exists in.
+	 */
+	__u32 vm_context_handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+
+	/**
+	 * @device_addr: [IN] Device-virtual address at the start of the target
+	 * mapping. This must be non-zero.
+	 */
+	__u64 device_addr;
+
+	/**
+	 * @size: Size in bytes of the target mapping. This must be non-zero.
+	 */
+	__u64 size;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_CONTEXT and DESTROY_CONTEXT interfaces
+ */
+
+/**
+ * enum drm_pvr_ctx_priority - Arguments for
+ * &drm_pvr_ioctl_create_context_args.priority
+ */
+enum drm_pvr_ctx_priority {
+	/** @DRM_PVR_CTX_PRIORITY_LOW: Priority below normal. */
+	DRM_PVR_CTX_PRIORITY_LOW = -512,
+
+	/** @DRM_PVR_CTX_PRIORITY_NORMAL: Normal priority. */
+	DRM_PVR_CTX_PRIORITY_NORMAL = 0,
+
+	/**
+	 * @DRM_PVR_CTX_PRIORITY_HIGH: Priority above normal.
+	 * Note this requires ``CAP_SYS_NICE`` or ``DRM_MASTER``.
+	 */
+	DRM_PVR_CTX_PRIORITY_HIGH = 512,
+};
+
+/**
+ * enum drm_pvr_ctx_type - Arguments for
+ * &struct drm_pvr_ioctl_create_context_args.type
+ */
+enum drm_pvr_ctx_type {
+	/**
+	 * @DRM_PVR_CTX_TYPE_RENDER: Render context.
+	 */
+	DRM_PVR_CTX_TYPE_RENDER = 0,
+
+	/**
+	 * @DRM_PVR_CTX_TYPE_COMPUTE: Compute context.
+	 */
+	DRM_PVR_CTX_TYPE_COMPUTE,
+
+	/**
+	 * @DRM_PVR_CTX_TYPE_TRANSFER_FRAG: Transfer context for fragment data
+	 * master.
+	 */
+	DRM_PVR_CTX_TYPE_TRANSFER_FRAG,
+};
+
+/**
+ * struct drm_pvr_ioctl_create_context_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_CONTEXT
+ */
+struct drm_pvr_ioctl_create_context_args {
+	/**
+	 * @type: [IN] Type of context to create.
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_ctx_type.
+	 */
+	__u32 type;
+
+	/** @flags: [IN] Flags for context. */
+	__u32 flags;
+
+	/**
+	 * @priority: [IN] Priority of new context.
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_ctx_priority.
+	 */
+	__s32 priority;
+
+	/** @handle: [OUT] Handle for new context. */
+	__u32 handle;
+
+	/**
+	 * @static_context_state: [IN] Pointer to static context state stream.
+	 */
+	__u64 static_context_state;
+
+	/**
+	 * @static_context_state_len: [IN] Length of static context state, in bytes.
+	 */
+	__u32 static_context_state_len;
+
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that this context is
+	 * associated with.
+	 */
+	__u32 vm_context_handle;
+
+	/**
+	 * @callstack_addr: [IN] Address for initial call stack pointer. Only valid
+	 * if @type is %DRM_PVR_CTX_TYPE_RENDER, otherwise must be 0.
+	 */
+	__u64 callstack_addr;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_context_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_CONTEXT
+ */
+struct drm_pvr_ioctl_destroy_context_args {
+	/**
+	 * @handle: [IN] Handle for context to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_FREE_LIST and DESTROY_FREE_LIST interfaces
+ */
+
+/**
+ * struct drm_pvr_ioctl_create_free_list_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_FREE_LIST
+ *
+ * Free list arguments have the following constraints :
+ *
+ * - @max_num_pages must be greater than zero.
+ * - @grow_threshold must be between 0 and 100.
+ * - @grow_num_pages must be less than or equal to &max_num_pages.
+ * - @initial_num_pages, @max_num_pages and @grow_num_pages must be multiples
+ *   of 4.
+ * - When &grow_num_pages is 0, @initial_num_pages must be equal to
+ *   @max_num_pages.
+ * - When &grow_num_pages is non-zero, @initial_num_pages must be less than
+ *   @max_num_pages.
+ */
+struct drm_pvr_ioctl_create_free_list_args {
+	/**
+	 * @free_list_gpu_addr: [IN] Address of GPU mapping of buffer object
+	 * containing memory to be used by free list.
+	 *
+	 * The mapped region of the buffer object must be at least
+	 * @max_num_pages * ``sizeof(__u32)``.
+	 *
+	 * The buffer object must have been created with
+	 * %DRM_PVR_BO_DEVICE_PM_FW_PROTECT set and
+	 * %DRM_PVR_BO_CPU_ALLOW_USERSPACE_ACCESS not set.
+	 */
+	__u64 free_list_gpu_addr;
+
+	/** @initial_num_pages: [IN] Pages initially allocated to free list. */
+	__u32 initial_num_pages;
+
+	/** @max_num_pages: [IN] Maximum number of pages in free list. */
+	__u32 max_num_pages;
+
+	/** @grow_num_pages: [IN] Pages to grow free list by per request. */
+	__u32 grow_num_pages;
+
+	/**
+	 * @grow_threshold: [IN] Percentage of FL memory used that should
+	 * trigger a new grow request.
+	 */
+	__u32 grow_threshold;
+
+	/**
+	 * @vm_context_handle: [IN] Handle for VM context that the free list buffer
+	 * object is mapped in.
+	 */
+	__u32 vm_context_handle;
+
+	/**
+	 * @handle: [OUT] Handle for created free list.
+	 */
+	__u32 handle;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_free_list_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_FREE_LIST
+ */
+struct drm_pvr_ioctl_destroy_free_list_args {
+	/**
+	 * @handle: [IN] Handle for free list to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL CREATE_HWRT_DATASET and DESTROY_HWRT_DATASET interfaces
+ */
+
+/**
+ * struct drm_pvr_create_hwrt_geom_data_args - Geometry data arguments used for
+ * &struct drm_pvr_ioctl_create_hwrt_dataset_args.geom_data_args.
+ */
+struct drm_pvr_create_hwrt_geom_data_args {
+	/** @tpc_dev_addr: [IN] Tail pointer cache GPU virtual address. */
+	__u64 tpc_dev_addr;
+
+	/** @tpc_size: [IN] Size of TPC, in bytes. */
+	__u32 tpc_size;
+
+	/** @tpc_stride: [IN] Stride between layers in TPC, in pages */
+	__u32 tpc_stride;
+
+	/** @vheap_table_dev_addr: [IN] VHEAP table GPU virtual address. */
+	__u64 vheap_table_dev_addr;
+
+	/** @rtc_dev_addr: [IN] Render Target Cache virtual address. */
+	__u64 rtc_dev_addr;
+};
+
+/**
+ * struct drm_pvr_create_hwrt_rt_data_args - Render target arguments used for
+ * &struct drm_pvr_ioctl_create_hwrt_dataset_args.rt_data_args.
+ */
+struct drm_pvr_create_hwrt_rt_data_args {
+	/** @pm_mlist_dev_addr: [IN] PM MLIST GPU virtual address. */
+	__u64 pm_mlist_dev_addr;
+
+	/** @macrotile_array_dev_addr: [IN] Macrotile array GPU virtual address. */
+	__u64 macrotile_array_dev_addr;
+
+	/** @region_header_dev_addr: [IN] Region header array GPU virtual address. */
+	__u64 region_header_dev_addr;
+};
+
+#define PVR_DRM_HWRT_FREE_LIST_LOCAL 0
+#define PVR_DRM_HWRT_FREE_LIST_GLOBAL 1U
+
+/**
+ * struct drm_pvr_ioctl_create_hwrt_dataset_args - Arguments for
+ * %DRM_IOCTL_PVR_CREATE_HWRT_DATASET
+ */
+struct drm_pvr_ioctl_create_hwrt_dataset_args {
+	/** @geom_data_args: [IN] Geometry data arguments. */
+	struct drm_pvr_create_hwrt_geom_data_args geom_data_args;
+
+	/**
+	 * @rt_data_args: [IN] Array of render target arguments.
+	 *
+	 * Each entry in this array represents a render target in a double buffered
+	 * setup.
+	 */
+	struct drm_pvr_create_hwrt_rt_data_args rt_data_args[2];
+
+	/**
+	 * @free_list_handles: [IN] Array of free list handles.
+	 *
+	 * free_list_handles[PVR_DRM_HWRT_FREE_LIST_LOCAL] must have initial
+	 * size of at least that reported by
+	 * &drm_pvr_dev_query_runtime_info.free_list_min_pages.
+	 */
+	__u32 free_list_handles[2];
+
+	/** @width: [IN] Width in pixels. */
+	__u32 width;
+
+	/** @height: [IN] Height in pixels. */
+	__u32 height;
+
+	/** @samples: [IN] Number of samples. */
+	__u32 samples;
+
+	/** @layers: [IN] Number of layers. */
+	__u32 layers;
+
+	/** @isp_merge_lower_x: [IN] Lower X coefficient for triangle merging. */
+	__u32 isp_merge_lower_x;
+
+	/** @isp_merge_lower_y: [IN] Lower Y coefficient for triangle merging. */
+	__u32 isp_merge_lower_y;
+
+	/** @isp_merge_scale_x: [IN] Scale X coefficient for triangle merging. */
+	__u32 isp_merge_scale_x;
+
+	/** @isp_merge_scale_y: [IN] Scale Y coefficient for triangle merging. */
+	__u32 isp_merge_scale_y;
+
+	/** @isp_merge_upper_x: [IN] Upper X coefficient for triangle merging. */
+	__u32 isp_merge_upper_x;
+
+	/** @isp_merge_upper_y: [IN] Upper Y coefficient for triangle merging. */
+	__u32 isp_merge_upper_y;
+
+	/**
+	 * @region_header_size: [IN] Size of region header array. This common field is used by
+	 * both render targets in this data set.
+	 *
+	 * The units for this field differ depending on what version of the simple internal
+	 * parameter format the device uses. If format 2 is in use then this is interpreted as the
+	 * number of region headers. For other formats it is interpreted as the size in dwords.
+	 */
+	__u32 region_header_size;
+
+	/**
+	 * @handle: [OUT] Handle for created HWRT dataset.
+	 */
+	__u32 handle;
+};
+
+/**
+ * struct drm_pvr_ioctl_destroy_hwrt_dataset_args - Arguments for
+ * %DRM_IOCTL_PVR_DESTROY_HWRT_DATASET
+ */
+struct drm_pvr_ioctl_destroy_hwrt_dataset_args {
+	/**
+	 * @handle: [IN] Handle for HWRT dataset to be destroyed.
+	 */
+	__u32 handle;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
+/**
+ * DOC: PowerVR IOCTL SUBMIT_JOBS interface
+ */
+
+/**
+ * DOC: Flags for the drm_pvr_sync_op object.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_HANDLE_TYPE_MASK
+ *
+ *    Handle type mask for the drm_pvr_sync_op::flags field.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ
+ *
+ *    Indicates the handle passed in drm_pvr_sync_op::handle is a syncobj handle.
+ *    This is the default type.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ
+ *
+ *    Indicates the handle passed in drm_pvr_sync_op::handle is a timeline syncobj handle.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_SIGNAL
+ *
+ *    Signal operation requested. The out-fence bound to the job will be attached to
+ *    the syncobj whose handle is passed in drm_pvr_sync_op::handle.
+ *
+ * .. c:macro:: DRM_PVR_SYNC_OP_FLAG_WAIT
+ *
+ *    Wait operation requested. The job will wait for this particular syncobj or syncobj
+ *    point to be signaled before being started.
+ *    This is the default operation.
+ */
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK 0xf
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_SYNCOBJ 0
+#define DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_TIMELINE_SYNCOBJ 1
+#define DRM_PVR_SYNC_OP_FLAG_SIGNAL _BITULL(31)
+#define DRM_PVR_SYNC_OP_FLAG_WAIT 0
+
+#define DRM_PVR_SYNC_OP_FLAGS_MASK (DRM_PVR_SYNC_OP_FLAG_HANDLE_TYPE_MASK | \
+				    DRM_PVR_SYNC_OP_FLAG_SIGNAL)
+
+/**
+ * struct drm_pvr_sync_op - Object describing a sync operation
+ */
+struct drm_pvr_sync_op {
+	/** @handle: Handle of sync object. */
+	__u32 handle;
+
+	/** @flags: Combination of ``DRM_PVR_SYNC_OP_FLAG_`` flags. */
+	__u32 flags;
+
+	/** @value: Timeline value for this drm_syncobj. MBZ for a binary syncobj. */
+	__u64 value;
+};
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl geometry command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST
+ *
+ *    Indicates if this the first command to be issued for a render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST
+ *
+ *    Indicates if this the last command to be issued for a render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE
+ *
+ *    Forces to use single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the geometry cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE _BITULL(2)
+#define DRM_PVR_SUBMIT_JOB_GEOM_CMD_FLAGS_MASK                                 \
+	(DRM_PVR_SUBMIT_JOB_GEOM_CMD_FIRST |                                   \
+	 DRM_PVR_SUBMIT_JOB_GEOM_CMD_LAST |                                    \
+	 DRM_PVR_SUBMIT_JOB_GEOM_CMD_SINGLE_CORE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl fragment command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE
+ *
+ *    Use single core in a multi core setup.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER
+ *
+ *    Indicates whether a depth buffer is present.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER
+ *
+ *    Indicates whether a stencil buffer is present.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP
+ *
+ *    Disallow compute overlapped with this render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS
+ *
+ *    Indicates whether this render produces visibility results.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER
+ *
+ *    Indicates whether partial renders write to a scratch buffer instead of
+ *    the final surface. It also forces the full screen copy expected to be
+ *    present on the last render after all partial renders have completed.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE
+ *
+ *    Disable pixel merging for this render.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the fragment cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER _BITULL(2)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP _BITULL(3)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER _BITULL(4)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS _BITULL(5)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER _BITULL(6)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE _BITULL(7)
+#define DRM_PVR_SUBMIT_JOB_FRAG_CMD_FLAGS_MASK                                 \
+	(DRM_PVR_SUBMIT_JOB_FRAG_CMD_SINGLE_CORE |                             \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_DEPTHBUFFER |                             \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_STENCILBUFFER |                           \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PREVENT_CDM_OVERLAP |                     \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_SCRATCHBUFFER |                           \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_GET_VIS_RESULTS |                         \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_PARTIAL_RENDER |                          \
+	 DRM_PVR_SUBMIT_JOB_FRAG_CMD_DISABLE_PIXELMERGE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl compute command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP
+ *
+ *    Disallow other jobs overlapped with this compute.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE
+ *
+ *    Forces to use single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the compute cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP _BITULL(0)
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE _BITULL(1)
+#define DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_FLAGS_MASK         \
+	(DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_PREVENT_ALL_OVERLAP | \
+	 DRM_PVR_SUBMIT_JOB_COMPUTE_CMD_SINGLE_CORE)
+
+/**
+ * DOC: Flags for SUBMIT_JOB ioctl transfer command.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
+ *
+ *    Forces job to use a single core in a multi core device.
+ *
+ * .. c:macro:: DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK
+ *
+ *    Logical OR of all the transfer cmd flags.
+ */
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE _BITULL(0)
+
+#define DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_FLAGS_MASK \
+	DRM_PVR_SUBMIT_JOB_TRANSFER_CMD_SINGLE_CORE
+
+/**
+ * enum drm_pvr_job_type - Arguments for &struct drm_pvr_job.job_type
+ */
+enum drm_pvr_job_type {
+	/** @DRM_PVR_JOB_TYPE_GEOMETRY: Job type is geometry. */
+	DRM_PVR_JOB_TYPE_GEOMETRY = 0,
+
+	/** @DRM_PVR_JOB_TYPE_FRAGMENT: Job type is fragment. */
+	DRM_PVR_JOB_TYPE_FRAGMENT,
+
+	/** @DRM_PVR_JOB_TYPE_COMPUTE: Job type is compute. */
+	DRM_PVR_JOB_TYPE_COMPUTE,
+
+	/** @DRM_PVR_JOB_TYPE_TRANSFER_FRAG: Job type is a fragment transfer. */
+	DRM_PVR_JOB_TYPE_TRANSFER_FRAG,
+};
+
+/**
+ * struct drm_pvr_hwrt_data_ref - Reference HWRT data
+ */
+struct drm_pvr_hwrt_data_ref {
+	/** @set_handle: HWRT data set handle. */
+	__u32 set_handle;
+
+	/** @data_index: Index of the HWRT data inside the data set. */
+	__u32 data_index;
+};
+
+/**
+ * struct drm_pvr_job - Job arguments passed to the %DRM_IOCTL_PVR_SUBMIT_JOBS ioctl
+ */
+struct drm_pvr_job {
+	/**
+	 * @type: [IN] Type of job being submitted
+	 *
+	 * This must be one of the values defined by &enum drm_pvr_job_type.
+	 */
+	__u32 type;
+
+	/**
+	 * @context_handle: [IN] Context handle.
+	 *
+	 * When @job_type is %DRM_PVR_JOB_TYPE_RENDER, %DRM_PVR_JOB_TYPE_COMPUTE or
+	 * %DRM_PVR_JOB_TYPE_TRANSFER_FRAG, this must be a valid handle returned by
+	 * %DRM_IOCTL_PVR_CREATE_CONTEXT. The type of context must be compatible
+	 * with the type of job being submitted.
+	 *
+	 * When @job_type is %DRM_PVR_JOB_TYPE_NULL, this must be zero.
+	 */
+	__u32 context_handle;
+
+	/**
+	 * @flags: [IN] Flags for command.
+	 *
+	 * Those are job-dependent. See all ``DRM_PVR_SUBMIT_JOB_*``.
+	 */
+	__u32 flags;
+
+	/**
+	 * @cmd_stream_len: [IN] Length of command stream, in bytes.
+	 */
+	__u32 cmd_stream_len;
+
+	/**
+	 * @cmd_stream: [IN] Pointer to command stream for command.
+	 *
+	 * The command stream must be u64-aligned.
+	 */
+	__u64 cmd_stream;
+
+	/** @sync_ops: [IN] Fragment sync operations. */
+	struct drm_pvr_obj_array sync_ops;
+
+	/**
+	 * @hwrt: [IN] HWRT data used by render jobs (geometry or fragment).
+	 *
+	 * Must be zero for non-render jobs.
+	 */
+	struct drm_pvr_hwrt_data_ref hwrt;
+};
+
+/**
+ * struct drm_pvr_ioctl_submit_jobs_args - Arguments for %DRM_IOCTL_PVR_SUBMIT_JOB
+ *
+ * If the syscall returns an error it is important to check the value of
+ * @jobs.count. This indicates the index into @jobs.array where the
+ * error occurred.
+ */
+struct drm_pvr_ioctl_submit_jobs_args {
+	/** @jobs: [IN] Array of jobs to submit. */
+	struct drm_pvr_obj_array jobs;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* PVR_DRM_UAPI_H */
diff --git a/include/drm-uapi/qaic_accel.h b/include/drm-uapi/qaic_accel.h
new file mode 100644
index 000000000000..9dab32316aee
--- /dev/null
+++ b/include/drm-uapi/qaic_accel.h
@@ -0,0 +1,410 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+ *
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef QAIC_ACCEL_H_
+#define QAIC_ACCEL_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/* The length(4K) includes len and count fields of qaic_manage_msg */
+#define QAIC_MANAGE_MAX_MSG_LENGTH SZ_4K
+
+/* semaphore flags */
+#define QAIC_SEM_INSYNCFENCE	2
+#define QAIC_SEM_OUTSYNCFENCE	1
+
+/* Semaphore commands */
+#define QAIC_SEM_NOP		0
+#define QAIC_SEM_INIT		1
+#define QAIC_SEM_INC		2
+#define QAIC_SEM_DEC		3
+#define QAIC_SEM_WAIT_EQUAL	4
+#define QAIC_SEM_WAIT_GT_EQ	5 /* Greater than or equal */
+#define QAIC_SEM_WAIT_GT_0	6 /* Greater than 0 */
+
+#define QAIC_TRANS_UNDEFINED			0
+#define QAIC_TRANS_PASSTHROUGH_FROM_USR		1
+#define QAIC_TRANS_PASSTHROUGH_TO_USR		2
+#define QAIC_TRANS_PASSTHROUGH_FROM_DEV		3
+#define QAIC_TRANS_PASSTHROUGH_TO_DEV		4
+#define QAIC_TRANS_DMA_XFER_FROM_USR		5
+#define QAIC_TRANS_DMA_XFER_TO_DEV		6
+#define QAIC_TRANS_ACTIVATE_FROM_USR		7
+#define QAIC_TRANS_ACTIVATE_FROM_DEV		8
+#define QAIC_TRANS_ACTIVATE_TO_DEV		9
+#define QAIC_TRANS_DEACTIVATE_FROM_USR		10
+#define QAIC_TRANS_DEACTIVATE_FROM_DEV		11
+#define QAIC_TRANS_STATUS_FROM_USR		12
+#define QAIC_TRANS_STATUS_TO_USR		13
+#define QAIC_TRANS_STATUS_FROM_DEV		14
+#define QAIC_TRANS_STATUS_TO_DEV		15
+#define QAIC_TRANS_TERMINATE_FROM_DEV		16
+#define QAIC_TRANS_TERMINATE_TO_DEV		17
+#define QAIC_TRANS_DMA_XFER_CONT		18
+#define QAIC_TRANS_VALIDATE_PARTITION_FROM_DEV	19
+#define QAIC_TRANS_VALIDATE_PARTITION_TO_DEV	20
+
+/**
+ * struct qaic_manage_trans_hdr - Header for a transaction in a manage message.
+ * @type: In. Identifies this transaction. See QAIC_TRANS_* defines.
+ * @len: In. Length of this transaction, including this header.
+ */
+struct qaic_manage_trans_hdr {
+	__u32 type;
+	__u32 len;
+};
+
+/**
+ * struct qaic_manage_trans_passthrough - Defines a passthrough transaction.
+ * @hdr: In. Header to identify this transaction.
+ * @data: In. Payload of this ransaction. Opaque to the driver. Userspace must
+ *	  encode in little endian and align/pad to 64-bit.
+ */
+struct qaic_manage_trans_passthrough {
+	struct qaic_manage_trans_hdr hdr;
+	__u8 data[];
+};
+
+/**
+ * struct qaic_manage_trans_dma_xfer - Defines a DMA transfer transaction.
+ * @hdr: In. Header to identify this transaction.
+ * @tag: In. Identified this transfer in other transactions. Opaque to the
+ *	 driver.
+ * @pad: Structure padding.
+ * @addr: In. Address of the data to DMA to the device.
+ * @size: In. Length of the data to DMA to the device.
+ */
+struct qaic_manage_trans_dma_xfer {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 tag;
+	__u32 pad;
+	__u64 addr;
+	__u64 size;
+};
+
+/**
+ * struct qaic_manage_trans_activate_to_dev - Defines an activate request.
+ * @hdr: In. Header to identify this transaction.
+ * @queue_size: In. Number of elements for DBC request and response queues.
+ * @eventfd: Unused.
+ * @options: In. Device specific options for this activate.
+ * @pad: Structure padding.  Must be 0.
+ */
+struct qaic_manage_trans_activate_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 queue_size;
+	__u32 eventfd;
+	__u32 options;
+	__u32 pad;
+};
+
+/**
+ * struct qaic_manage_trans_activate_from_dev - Defines an activate response.
+ * @hdr: Out. Header to identify this transaction.
+ * @status: Out. Return code of the request from the device.
+ * @dbc_id: Out. Id of the assigned DBC for successful request.
+ * @options: Out. Device specific options for this activate.
+ */
+struct qaic_manage_trans_activate_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 status;
+	__u32 dbc_id;
+	__u64 options;
+};
+
+/**
+ * struct qaic_manage_trans_deactivate - Defines a deactivate request.
+ * @hdr: In. Header to identify this transaction.
+ * @dbc_id: In. Id of assigned DBC.
+ * @pad: Structure padding.  Must be 0.
+ */
+struct qaic_manage_trans_deactivate {
+	struct qaic_manage_trans_hdr hdr;
+	__u32 dbc_id;
+	__u32 pad;
+};
+
+/**
+ * struct qaic_manage_trans_status_to_dev - Defines a status request.
+ * @hdr: In. Header to identify this transaction.
+ */
+struct qaic_manage_trans_status_to_dev {
+	struct qaic_manage_trans_hdr hdr;
+};
+
+/**
+ * struct qaic_manage_trans_status_from_dev - Defines a status response.
+ * @hdr: Out. Header to identify this transaction.
+ * @major: Out. NNC protocol version major number.
+ * @minor: Out. NNC protocol version minor number.
+ * @status: Out. Return code from device.
+ * @status_flags: Out. Flags from device.  Bit 0 indicates if CRCs are required.
+ */
+struct qaic_manage_trans_status_from_dev {
+	struct qaic_manage_trans_hdr hdr;
+	__u16 major;
+	__u16 minor;
+	__u32 status;
+	__u64 status_flags;
+};
+
+/**
+ * struct qaic_manage_msg - Defines a message to the device.
+ * @len: In. Length of all the transactions contained within this message.
+ * @count: In. Number of transactions in this message.
+ * @data: In. Address to an array where the transactions can be found.
+ */
+struct qaic_manage_msg {
+	__u32 len;
+	__u32 count;
+	__u64 data;
+};
+
+/**
+ * struct qaic_create_bo - Defines a request to create a buffer object.
+ * @size: In.  Size of the buffer in bytes.
+ * @handle: Out. GEM handle for the BO.
+ * @pad: Structure padding. Must be 0.
+ */
+struct qaic_create_bo {
+	__u64 size;
+	__u32 handle;
+	__u32 pad;
+};
+
+/**
+ * struct qaic_mmap_bo - Defines a request to prepare a BO for mmap().
+ * @handle: In.  Handle of the GEM BO to prepare for mmap().
+ * @pad: Structure padding. Must be 0.
+ * @offset: Out. Offset value to provide to mmap().
+ */
+struct qaic_mmap_bo {
+	__u32 handle;
+	__u32 pad;
+	__u64 offset;
+};
+
+/**
+ * struct qaic_sem - Defines a semaphore command for a BO slice.
+ * @val: In. Only lower 12 bits are valid.
+ * @index: In. Only lower 5 bits are valid.
+ * @presync: In. 1 if presync operation, 0 if postsync.
+ * @cmd: In. One of QAIC_SEM_*.
+ * @flags: In. Bitfield. See QAIC_SEM_INSYNCFENCE and QAIC_SEM_OUTSYNCFENCE
+ * @pad: Structure padding.  Must be 0.
+ */
+struct qaic_sem {
+	__u16 val;
+	__u8  index;
+	__u8  presync;
+	__u8  cmd;
+	__u8  flags;
+	__u16 pad;
+};
+
+/**
+ * struct qaic_attach_slice_entry - Defines a single BO slice.
+ * @size: In. Size of this slice in bytes.
+ * @sem0: In. Semaphore command 0. Must be 0 is not valid.
+ * @sem1: In. Semaphore command 1. Must be 0 is not valid.
+ * @sem2: In. Semaphore command 2. Must be 0 is not valid.
+ * @sem3: In. Semaphore command 3. Must be 0 is not valid.
+ * @dev_addr: In. Device address this slice pushes to or pulls from.
+ * @db_addr: In. Address of the doorbell to ring.
+ * @db_data: In. Data to write to the doorbell.
+ * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is for
+ *	    inactive doorbells.
+ * @offset: In. Start of this slice as an offset from the start of the BO.
+ */
+struct qaic_attach_slice_entry {
+	__u64 size;
+	struct qaic_sem	sem0;
+	struct qaic_sem	sem1;
+	struct qaic_sem	sem2;
+	struct qaic_sem	sem3;
+	__u64 dev_addr;
+	__u64 db_addr;
+	__u32 db_data;
+	__u32 db_len;
+	__u64 offset;
+};
+
+/**
+ * struct qaic_attach_slice_hdr - Defines metadata for a set of BO slices.
+ * @count: In. Number of slices for this BO.
+ * @dbc_id: In. Associate the sliced BO with this DBC.
+ * @handle: In. GEM handle of the BO to slice.
+ * @dir: In. Direction of data flow. 1 = DMA_TO_DEVICE, 2 = DMA_FROM_DEVICE
+ * @size: In. Total length of BO being used. This should not exceed base
+ *	  size of BO (struct drm_gem_object.base)
+ *	  For BOs being allocated using DRM_IOCTL_QAIC_CREATE_BO, size of
+ *	  BO requested is PAGE_SIZE aligned then allocated hence allocated
+ *	  BO size maybe bigger. This size should not exceed the new
+ *	  PAGE_SIZE aligned BO size.
+ * @dev_addr: In. Device address this slice pushes to or pulls from.
+ * @db_addr: In. Address of the doorbell to ring.
+ * @db_data: In. Data to write to the doorbell.
+ * @db_len: In. Size of the doorbell data in bits - 32, 16, or 8.  0 is for
+ *	    inactive doorbells.
+ * @offset: In. Start of this slice as an offset from the start of the BO.
+ */
+struct qaic_attach_slice_hdr {
+	__u32 count;
+	__u32 dbc_id;
+	__u32 handle;
+	__u32 dir;
+	__u64 size;
+};
+
+/**
+ * struct qaic_attach_slice - Defines a set of BO slices.
+ * @hdr: In. Metadata of the set of slices.
+ * @data: In. Pointer to an array containing the slice definitions.
+ */
+struct qaic_attach_slice {
+	struct qaic_attach_slice_hdr hdr;
+	__u64 data;
+};
+
+/**
+ * struct qaic_execute_entry - Defines a BO to submit to the device.
+ * @handle: In. GEM handle of the BO to commit to the device.
+ * @dir: In. Direction of data. 1 = to device, 2 = from device.
+ */
+struct qaic_execute_entry {
+	__u32 handle;
+	__u32 dir;
+};
+
+/**
+ * struct qaic_partial_execute_entry - Defines a BO to resize and submit.
+ * @handle: In. GEM handle of the BO to commit to the device.
+ * @dir: In. Direction of data. 1 = to device, 2 = from device.
+ * @resize: In. New size of the BO.  Must be <= the original BO size.
+ *	    @resize as 0 would be interpreted as no DMA transfer is
+ *	    involved.
+ */
+struct qaic_partial_execute_entry {
+	__u32 handle;
+	__u32 dir;
+	__u64 resize;
+};
+
+/**
+ * struct qaic_execute_hdr - Defines metadata for BO submission.
+ * @count: In. Number of BOs to submit.
+ * @dbc_id: In. DBC to submit the BOs on.
+ */
+struct qaic_execute_hdr {
+	__u32 count;
+	__u32 dbc_id;
+};
+
+/**
+ * struct qaic_execute - Defines a list of BOs to submit to the device.
+ * @hdr: In. BO list metadata.
+ * @data: In. Pointer to an array of BOs to submit.
+ */
+struct qaic_execute {
+	struct qaic_execute_hdr hdr;
+	__u64 data;
+};
+
+/**
+ * struct qaic_wait - Defines a blocking wait for BO execution.
+ * @handle: In. GEM handle of the BO to wait on.
+ * @timeout: In. Maximum time in ms to wait for the BO.
+ * @dbc_id: In. DBC the BO is submitted to.
+ * @pad: Structure padding. Must be 0.
+ */
+struct qaic_wait {
+	__u32 handle;
+	__u32 timeout;
+	__u32 dbc_id;
+	__u32 pad;
+};
+
+/**
+ * struct qaic_perf_stats_hdr - Defines metadata for getting BO perf info.
+ * @count: In. Number of BOs requested.
+ * @pad: Structure padding. Must be 0.
+ * @dbc_id: In. DBC the BO are associated with.
+ */
+struct qaic_perf_stats_hdr {
+	__u16 count;
+	__u16 pad;
+	__u32 dbc_id;
+};
+
+/**
+ * struct qaic_perf_stats - Defines a request for getting BO perf info.
+ * @hdr: In. Request metadata
+ * @data: In. Pointer to array of stats structures that will receive the data.
+ */
+struct qaic_perf_stats {
+	struct qaic_perf_stats_hdr hdr;
+	__u64 data;
+};
+
+/**
+ * struct qaic_perf_stats_entry - Defines a BO perf info.
+ * @handle: In. GEM handle of the BO to get perf stats for.
+ * @queue_level_before: Out. Number of elements in the queue before this BO
+ *			was submitted.
+ * @num_queue_element: Out. Number of elements added to the queue to submit
+ *		       this BO.
+ * @submit_latency_us: Out. Time taken by the driver to submit this BO.
+ * @device_latency_us: Out. Time taken by the device to execute this BO.
+ * @pad: Structure padding. Must be 0.
+ */
+struct qaic_perf_stats_entry {
+	__u32 handle;
+	__u32 queue_level_before;
+	__u32 num_queue_element;
+	__u32 submit_latency_us;
+	__u32 device_latency_us;
+	__u32 pad;
+};
+
+/**
+ * struct qaic_detach_slice - Detaches slicing configuration from BO.
+ * @handle: In. GEM handle of the BO to detach slicing configuration.
+ * @pad: Structure padding. Must be 0.
+ */
+struct qaic_detach_slice {
+	__u32 handle;
+	__u32 pad;
+};
+
+#define DRM_QAIC_MANAGE				0x00
+#define DRM_QAIC_CREATE_BO			0x01
+#define DRM_QAIC_MMAP_BO			0x02
+#define DRM_QAIC_ATTACH_SLICE_BO		0x03
+#define DRM_QAIC_EXECUTE_BO			0x04
+#define DRM_QAIC_PARTIAL_EXECUTE_BO		0x05
+#define DRM_QAIC_WAIT_BO			0x06
+#define DRM_QAIC_PERF_STATS_BO			0x07
+#define DRM_QAIC_DETACH_SLICE_BO		0x08
+
+#define DRM_IOCTL_QAIC_MANAGE			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_MANAGE, struct qaic_manage_msg)
+#define DRM_IOCTL_QAIC_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_CREATE_BO,	struct qaic_create_bo)
+#define DRM_IOCTL_QAIC_MMAP_BO			DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_MMAP_BO, struct qaic_mmap_bo)
+#define DRM_IOCTL_QAIC_ATTACH_SLICE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_ATTACH_SLICE_BO, struct qaic_attach_slice)
+#define DRM_IOCTL_QAIC_EXECUTE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_EXECUTE_BO,	struct qaic_execute)
+#define DRM_IOCTL_QAIC_PARTIAL_EXECUTE_BO	DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_PARTIAL_EXECUTE_BO,	struct qaic_execute)
+#define DRM_IOCTL_QAIC_WAIT_BO			DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_WAIT_BO, struct qaic_wait)
+#define DRM_IOCTL_QAIC_PERF_STATS_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_QAIC_PERF_STATS_BO, struct qaic_perf_stats)
+#define DRM_IOCTL_QAIC_DETACH_SLICE_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_QAIC_DETACH_SLICE_BO, struct qaic_detach_slice)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* QAIC_ACCEL_H_ */
diff --git a/include/drm-uapi/r128_drm.h b/include/drm-uapi/r128_drm.h
deleted file mode 100644
index bf431a02333d..000000000000
--- a/include/drm-uapi/r128_drm.h
+++ /dev/null
@@ -1,336 +0,0 @@
-/* r128_drm.h -- Public header for the r128 driver -*- linux-c -*-
- * Created: Wed Apr  5 19:24:19 2000 by kevin@precisioninsight.com
- */
-/*
- * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
- * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
- * All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
- * Authors:
- *    Gareth Hughes <gareth@valinux.com>
- *    Kevin E. Martin <martin@valinux.com>
- */
-
-#ifndef __R128_DRM_H__
-#define __R128_DRM_H__
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-/* WARNING: If you change any of these defines, make sure to change the
- * defines in the X server file (r128_sarea.h)
- */
-#ifndef __R128_SAREA_DEFINES__
-#define __R128_SAREA_DEFINES__
-
-/* What needs to be changed for the current vertex buffer?
- */
-#define R128_UPLOAD_CONTEXT		0x001
-#define R128_UPLOAD_SETUP		0x002
-#define R128_UPLOAD_TEX0		0x004
-#define R128_UPLOAD_TEX1		0x008
-#define R128_UPLOAD_TEX0IMAGES		0x010
-#define R128_UPLOAD_TEX1IMAGES		0x020
-#define R128_UPLOAD_CORE		0x040
-#define R128_UPLOAD_MASKS		0x080
-#define R128_UPLOAD_WINDOW		0x100
-#define R128_UPLOAD_CLIPRECTS		0x200	/* handled client-side */
-#define R128_REQUIRE_QUIESCENCE		0x400
-#define R128_UPLOAD_ALL			0x7ff
-
-#define R128_FRONT			0x1
-#define R128_BACK			0x2
-#define R128_DEPTH			0x4
-
-/* Primitive types
- */
-#define R128_POINTS			0x1
-#define R128_LINES			0x2
-#define R128_LINE_STRIP			0x3
-#define R128_TRIANGLES			0x4
-#define R128_TRIANGLE_FAN		0x5
-#define R128_TRIANGLE_STRIP		0x6
-
-/* Vertex/indirect buffer size
- */
-#define R128_BUFFER_SIZE		16384
-
-/* Byte offsets for indirect buffer data
- */
-#define R128_INDEX_PRIM_OFFSET		20
-#define R128_HOSTDATA_BLIT_OFFSET	32
-
-/* Keep these small for testing.
- */
-#define R128_NR_SAREA_CLIPRECTS		12
-
-/* There are 2 heaps (local/AGP).  Each region within a heap is a
- *  minimum of 64k, and there are at most 64 of them per heap.
- */
-#define R128_LOCAL_TEX_HEAP		0
-#define R128_AGP_TEX_HEAP		1
-#define R128_NR_TEX_HEAPS		2
-#define R128_NR_TEX_REGIONS		64
-#define R128_LOG_TEX_GRANULARITY	16
-
-#define R128_NR_CONTEXT_REGS		12
-
-#define R128_MAX_TEXTURE_LEVELS		11
-#define R128_MAX_TEXTURE_UNITS		2
-
-#endif				/* __R128_SAREA_DEFINES__ */
-
-typedef struct {
-	/* Context state - can be written in one large chunk */
-	unsigned int dst_pitch_offset_c;
-	unsigned int dp_gui_master_cntl_c;
-	unsigned int sc_top_left_c;
-	unsigned int sc_bottom_right_c;
-	unsigned int z_offset_c;
-	unsigned int z_pitch_c;
-	unsigned int z_sten_cntl_c;
-	unsigned int tex_cntl_c;
-	unsigned int misc_3d_state_cntl_reg;
-	unsigned int texture_clr_cmp_clr_c;
-	unsigned int texture_clr_cmp_msk_c;
-	unsigned int fog_color_c;
-
-	/* Texture state */
-	unsigned int tex_size_pitch_c;
-	unsigned int constant_color_c;
-
-	/* Setup state */
-	unsigned int pm4_vc_fpu_setup;
-	unsigned int setup_cntl;
-
-	/* Mask state */
-	unsigned int dp_write_mask;
-	unsigned int sten_ref_mask_c;
-	unsigned int plane_3d_mask_c;
-
-	/* Window state */
-	unsigned int window_xy_offset;
-
-	/* Core state */
-	unsigned int scale_3d_cntl;
-} drm_r128_context_regs_t;
-
-/* Setup registers for each texture unit
- */
-typedef struct {
-	unsigned int tex_cntl;
-	unsigned int tex_combine_cntl;
-	unsigned int tex_size_pitch;
-	unsigned int tex_offset[R128_MAX_TEXTURE_LEVELS];
-	unsigned int tex_border_color;
-} drm_r128_texture_regs_t;
-
-typedef struct drm_r128_sarea {
-	/* The channel for communication of state information to the kernel
-	 * on firing a vertex buffer.
-	 */
-	drm_r128_context_regs_t context_state;
-	drm_r128_texture_regs_t tex_state[R128_MAX_TEXTURE_UNITS];
-	unsigned int dirty;
-	unsigned int vertsize;
-	unsigned int vc_format;
-
-	/* The current cliprects, or a subset thereof.
-	 */
-	struct drm_clip_rect boxes[R128_NR_SAREA_CLIPRECTS];
-	unsigned int nbox;
-
-	/* Counters for client-side throttling of rendering clients.
-	 */
-	unsigned int last_frame;
-	unsigned int last_dispatch;
-
-	struct drm_tex_region tex_list[R128_NR_TEX_HEAPS][R128_NR_TEX_REGIONS + 1];
-	unsigned int tex_age[R128_NR_TEX_HEAPS];
-	int ctx_owner;
-	int pfAllowPageFlip;	/* number of 3d windows (0,1,2 or more) */
-	int pfCurrentPage;	/* which buffer is being displayed? */
-} drm_r128_sarea_t;
-
-/* WARNING: If you change any of these defines, make sure to change the
- * defines in the Xserver file (xf86drmR128.h)
- */
-
-/* Rage 128 specific ioctls
- * The device specific ioctl range is 0x40 to 0x79.
- */
-#define DRM_R128_INIT       0x00
-#define DRM_R128_CCE_START  0x01
-#define DRM_R128_CCE_STOP   0x02
-#define DRM_R128_CCE_RESET  0x03
-#define DRM_R128_CCE_IDLE   0x04
-/* 0x05 not used */
-#define DRM_R128_RESET      0x06
-#define DRM_R128_SWAP       0x07
-#define DRM_R128_CLEAR      0x08
-#define DRM_R128_VERTEX     0x09
-#define DRM_R128_INDICES    0x0a
-#define DRM_R128_BLIT       0x0b
-#define DRM_R128_DEPTH      0x0c
-#define DRM_R128_STIPPLE    0x0d
-/* 0x0e not used */
-#define DRM_R128_INDIRECT   0x0f
-#define DRM_R128_FULLSCREEN 0x10
-#define DRM_R128_CLEAR2     0x11
-#define DRM_R128_GETPARAM   0x12
-#define DRM_R128_FLIP       0x13
-
-#define DRM_IOCTL_R128_INIT       DRM_IOW( DRM_COMMAND_BASE + DRM_R128_INIT, drm_r128_init_t)
-#define DRM_IOCTL_R128_CCE_START  DRM_IO(  DRM_COMMAND_BASE + DRM_R128_CCE_START)
-#define DRM_IOCTL_R128_CCE_STOP   DRM_IOW( DRM_COMMAND_BASE + DRM_R128_CCE_STOP, drm_r128_cce_stop_t)
-#define DRM_IOCTL_R128_CCE_RESET  DRM_IO(  DRM_COMMAND_BASE + DRM_R128_CCE_RESET)
-#define DRM_IOCTL_R128_CCE_IDLE   DRM_IO(  DRM_COMMAND_BASE + DRM_R128_CCE_IDLE)
-/* 0x05 not used */
-#define DRM_IOCTL_R128_RESET      DRM_IO(  DRM_COMMAND_BASE + DRM_R128_RESET)
-#define DRM_IOCTL_R128_SWAP       DRM_IO(  DRM_COMMAND_BASE + DRM_R128_SWAP)
-#define DRM_IOCTL_R128_CLEAR      DRM_IOW( DRM_COMMAND_BASE + DRM_R128_CLEAR, drm_r128_clear_t)
-#define DRM_IOCTL_R128_VERTEX     DRM_IOW( DRM_COMMAND_BASE + DRM_R128_VERTEX, drm_r128_vertex_t)
-#define DRM_IOCTL_R128_INDICES    DRM_IOW( DRM_COMMAND_BASE + DRM_R128_INDICES, drm_r128_indices_t)
-#define DRM_IOCTL_R128_BLIT       DRM_IOW( DRM_COMMAND_BASE + DRM_R128_BLIT, drm_r128_blit_t)
-#define DRM_IOCTL_R128_DEPTH      DRM_IOW( DRM_COMMAND_BASE + DRM_R128_DEPTH, drm_r128_depth_t)
-#define DRM_IOCTL_R128_STIPPLE    DRM_IOW( DRM_COMMAND_BASE + DRM_R128_STIPPLE, drm_r128_stipple_t)
-/* 0x0e not used */
-#define DRM_IOCTL_R128_INDIRECT   DRM_IOWR(DRM_COMMAND_BASE + DRM_R128_INDIRECT, drm_r128_indirect_t)
-#define DRM_IOCTL_R128_FULLSCREEN DRM_IOW( DRM_COMMAND_BASE + DRM_R128_FULLSCREEN, drm_r128_fullscreen_t)
-#define DRM_IOCTL_R128_CLEAR2     DRM_IOW( DRM_COMMAND_BASE + DRM_R128_CLEAR2, drm_r128_clear2_t)
-#define DRM_IOCTL_R128_GETPARAM   DRM_IOWR( DRM_COMMAND_BASE + DRM_R128_GETPARAM, drm_r128_getparam_t)
-#define DRM_IOCTL_R128_FLIP       DRM_IO(  DRM_COMMAND_BASE + DRM_R128_FLIP)
-
-typedef struct drm_r128_init {
-	enum {
-		R128_INIT_CCE = 0x01,
-		R128_CLEANUP_CCE = 0x02
-	} func;
-	unsigned long sarea_priv_offset;
-	int is_pci;
-	int cce_mode;
-	int cce_secure;
-	int ring_size;
-	int usec_timeout;
-
-	unsigned int fb_bpp;
-	unsigned int front_offset, front_pitch;
-	unsigned int back_offset, back_pitch;
-	unsigned int depth_bpp;
-	unsigned int depth_offset, depth_pitch;
-	unsigned int span_offset;
-
-	unsigned long fb_offset;
-	unsigned long mmio_offset;
-	unsigned long ring_offset;
-	unsigned long ring_rptr_offset;
-	unsigned long buffers_offset;
-	unsigned long agp_textures_offset;
-} drm_r128_init_t;
-
-typedef struct drm_r128_cce_stop {
-	int flush;
-	int idle;
-} drm_r128_cce_stop_t;
-
-typedef struct drm_r128_clear {
-	unsigned int flags;
-	unsigned int clear_color;
-	unsigned int clear_depth;
-	unsigned int color_mask;
-	unsigned int depth_mask;
-} drm_r128_clear_t;
-
-typedef struct drm_r128_vertex {
-	int prim;
-	int idx;		/* Index of vertex buffer */
-	int count;		/* Number of vertices in buffer */
-	int discard;		/* Client finished with buffer? */
-} drm_r128_vertex_t;
-
-typedef struct drm_r128_indices {
-	int prim;
-	int idx;
-	int start;
-	int end;
-	int discard;		/* Client finished with buffer? */
-} drm_r128_indices_t;
-
-typedef struct drm_r128_blit {
-	int idx;
-	int pitch;
-	int offset;
-	int format;
-	unsigned short x, y;
-	unsigned short width, height;
-} drm_r128_blit_t;
-
-typedef struct drm_r128_depth {
-	enum {
-		R128_WRITE_SPAN = 0x01,
-		R128_WRITE_PIXELS = 0x02,
-		R128_READ_SPAN = 0x03,
-		R128_READ_PIXELS = 0x04
-	} func;
-	int n;
-	int *x;
-	int *y;
-	unsigned int *buffer;
-	unsigned char *mask;
-} drm_r128_depth_t;
-
-typedef struct drm_r128_stipple {
-	unsigned int *mask;
-} drm_r128_stipple_t;
-
-typedef struct drm_r128_indirect {
-	int idx;
-	int start;
-	int end;
-	int discard;
-} drm_r128_indirect_t;
-
-typedef struct drm_r128_fullscreen {
-	enum {
-		R128_INIT_FULLSCREEN = 0x01,
-		R128_CLEANUP_FULLSCREEN = 0x02
-	} func;
-} drm_r128_fullscreen_t;
-
-/* 2.3: An ioctl to get parameters that aren't available to the 3d
- * client any other way.
- */
-#define R128_PARAM_IRQ_NR            1
-
-typedef struct drm_r128_getparam {
-	int param;
-	void *value;
-} drm_r128_getparam_t;
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif
diff --git a/include/drm-uapi/savage_drm.h b/include/drm-uapi/savage_drm.h
deleted file mode 100644
index 1a91234e6751..000000000000
--- a/include/drm-uapi/savage_drm.h
+++ /dev/null
@@ -1,220 +0,0 @@
-/* savage_drm.h -- Public header for the savage driver
- *
- * Copyright 2004  Felix Kuehling
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NON-INFRINGEMENT. IN NO EVENT SHALL FELIX KUEHLING BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
- * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
- * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef __SAVAGE_DRM_H__
-#define __SAVAGE_DRM_H__
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-#ifndef __SAVAGE_SAREA_DEFINES__
-#define __SAVAGE_SAREA_DEFINES__
-
-/* 2 heaps (1 for card, 1 for agp), each divided into up to 128
- * regions, subject to a minimum region size of (1<<16) == 64k.
- *
- * Clients may subdivide regions internally, but when sharing between
- * clients, the region size is the minimum granularity.
- */
-
-#define SAVAGE_CARD_HEAP		0
-#define SAVAGE_AGP_HEAP			1
-#define SAVAGE_NR_TEX_HEAPS		2
-#define SAVAGE_NR_TEX_REGIONS		16
-#define SAVAGE_LOG_MIN_TEX_REGION_SIZE	16
-
-#endif				/* __SAVAGE_SAREA_DEFINES__ */
-
-typedef struct _drm_savage_sarea {
-	/* LRU lists for texture memory in agp space and on the card.
-	 */
-	struct drm_tex_region texList[SAVAGE_NR_TEX_HEAPS][SAVAGE_NR_TEX_REGIONS +
-						      1];
-	unsigned int texAge[SAVAGE_NR_TEX_HEAPS];
-
-	/* Mechanism to validate card state.
-	 */
-	int ctxOwner;
-} drm_savage_sarea_t, *drm_savage_sarea_ptr;
-
-/* Savage-specific ioctls
- */
-#define DRM_SAVAGE_BCI_INIT		0x00
-#define DRM_SAVAGE_BCI_CMDBUF           0x01
-#define DRM_SAVAGE_BCI_EVENT_EMIT	0x02
-#define DRM_SAVAGE_BCI_EVENT_WAIT	0x03
-
-#define DRM_IOCTL_SAVAGE_BCI_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_SAVAGE_BCI_INIT, drm_savage_init_t)
-#define DRM_IOCTL_SAVAGE_BCI_CMDBUF		DRM_IOW( DRM_COMMAND_BASE + DRM_SAVAGE_BCI_CMDBUF, drm_savage_cmdbuf_t)
-#define DRM_IOCTL_SAVAGE_BCI_EVENT_EMIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_SAVAGE_BCI_EVENT_EMIT, drm_savage_event_emit_t)
-#define DRM_IOCTL_SAVAGE_BCI_EVENT_WAIT	DRM_IOW( DRM_COMMAND_BASE + DRM_SAVAGE_BCI_EVENT_WAIT, drm_savage_event_wait_t)
-
-#define SAVAGE_DMA_PCI	1
-#define SAVAGE_DMA_AGP	3
-typedef struct drm_savage_init {
-	enum {
-		SAVAGE_INIT_BCI = 1,
-		SAVAGE_CLEANUP_BCI = 2
-	} func;
-	unsigned int sarea_priv_offset;
-
-	/* some parameters */
-	unsigned int cob_size;
-	unsigned int bci_threshold_lo, bci_threshold_hi;
-	unsigned int dma_type;
-
-	/* frame buffer layout */
-	unsigned int fb_bpp;
-	unsigned int front_offset, front_pitch;
-	unsigned int back_offset, back_pitch;
-	unsigned int depth_bpp;
-	unsigned int depth_offset, depth_pitch;
-
-	/* local textures */
-	unsigned int texture_offset;
-	unsigned int texture_size;
-
-	/* physical locations of non-permanent maps */
-	unsigned long status_offset;
-	unsigned long buffers_offset;
-	unsigned long agp_textures_offset;
-	unsigned long cmd_dma_offset;
-} drm_savage_init_t;
-
-typedef union drm_savage_cmd_header drm_savage_cmd_header_t;
-typedef struct drm_savage_cmdbuf {
-	/* command buffer in client's address space */
-	drm_savage_cmd_header_t *cmd_addr;
-	unsigned int size;	/* size of the command buffer in 64bit units */
-
-	unsigned int dma_idx;	/* DMA buffer index to use */
-	int discard;		/* discard DMA buffer when done */
-	/* vertex buffer in client's address space */
-	unsigned int *vb_addr;
-	unsigned int vb_size;	/* size of client vertex buffer in bytes */
-	unsigned int vb_stride;	/* stride of vertices in 32bit words */
-	/* boxes in client's address space */
-	struct drm_clip_rect *box_addr;
-	unsigned int nbox;	/* number of clipping boxes */
-} drm_savage_cmdbuf_t;
-
-#define SAVAGE_WAIT_2D  0x1	/* wait for 2D idle before updating event tag */
-#define SAVAGE_WAIT_3D  0x2	/* wait for 3D idle before updating event tag */
-#define SAVAGE_WAIT_IRQ 0x4	/* emit or wait for IRQ, not implemented yet */
-typedef struct drm_savage_event {
-	unsigned int count;
-	unsigned int flags;
-} drm_savage_event_emit_t, drm_savage_event_wait_t;
-
-/* Commands for the cmdbuf ioctl
- */
-#define SAVAGE_CMD_STATE	0	/* a range of state registers */
-#define SAVAGE_CMD_DMA_PRIM	1	/* vertices from DMA buffer */
-#define SAVAGE_CMD_VB_PRIM	2	/* vertices from client vertex buffer */
-#define SAVAGE_CMD_DMA_IDX	3	/* indexed vertices from DMA buffer */
-#define SAVAGE_CMD_VB_IDX	4	/* indexed vertices client vertex buffer */
-#define SAVAGE_CMD_CLEAR	5	/* clear buffers */
-#define SAVAGE_CMD_SWAP		6	/* swap buffers */
-
-/* Primitive types
-*/
-#define SAVAGE_PRIM_TRILIST	0	/* triangle list */
-#define SAVAGE_PRIM_TRISTRIP	1	/* triangle strip */
-#define SAVAGE_PRIM_TRIFAN	2	/* triangle fan */
-#define SAVAGE_PRIM_TRILIST_201	3	/* reorder verts for correct flat
-					 * shading on s3d */
-
-/* Skip flags (vertex format)
- */
-#define SAVAGE_SKIP_Z		0x01
-#define SAVAGE_SKIP_W		0x02
-#define SAVAGE_SKIP_C0		0x04
-#define SAVAGE_SKIP_C1		0x08
-#define SAVAGE_SKIP_S0		0x10
-#define SAVAGE_SKIP_T0		0x20
-#define SAVAGE_SKIP_ST0		0x30
-#define SAVAGE_SKIP_S1		0x40
-#define SAVAGE_SKIP_T1		0x80
-#define SAVAGE_SKIP_ST1		0xc0
-#define SAVAGE_SKIP_ALL_S3D	0x3f
-#define SAVAGE_SKIP_ALL_S4	0xff
-
-/* Buffer names for clear command
- */
-#define SAVAGE_FRONT		0x1
-#define SAVAGE_BACK		0x2
-#define SAVAGE_DEPTH		0x4
-
-/* 64-bit command header
- */
-union drm_savage_cmd_header {
-	struct {
-		unsigned char cmd;	/* command */
-		unsigned char pad0;
-		unsigned short pad1;
-		unsigned short pad2;
-		unsigned short pad3;
-	} cmd;			/* generic */
-	struct {
-		unsigned char cmd;
-		unsigned char global;	/* need idle engine? */
-		unsigned short count;	/* number of consecutive registers */
-		unsigned short start;	/* first register */
-		unsigned short pad3;
-	} state;		/* SAVAGE_CMD_STATE */
-	struct {
-		unsigned char cmd;
-		unsigned char prim;	/* primitive type */
-		unsigned short skip;	/* vertex format (skip flags) */
-		unsigned short count;	/* number of vertices */
-		unsigned short start;	/* first vertex in DMA/vertex buffer */
-	} prim;			/* SAVAGE_CMD_DMA_PRIM, SAVAGE_CMD_VB_PRIM */
-	struct {
-		unsigned char cmd;
-		unsigned char prim;
-		unsigned short skip;
-		unsigned short count;	/* number of indices that follow */
-		unsigned short pad3;
-	} idx;			/* SAVAGE_CMD_DMA_IDX, SAVAGE_CMD_VB_IDX */
-	struct {
-		unsigned char cmd;
-		unsigned char pad0;
-		unsigned short pad1;
-		unsigned int flags;
-	} clear0;		/* SAVAGE_CMD_CLEAR */
-	struct {
-		unsigned int mask;
-		unsigned int value;
-	} clear1;		/* SAVAGE_CMD_CLEAR data */
-};
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif
diff --git a/include/drm-uapi/sis_drm.h b/include/drm-uapi/sis_drm.h
deleted file mode 100644
index 3e3f7e989e0b..000000000000
--- a/include/drm-uapi/sis_drm.h
+++ /dev/null
@@ -1,77 +0,0 @@
-/* sis_drv.h -- Private header for sis driver -*- linux-c -*- */
-/*
- * Copyright 2005 Eric Anholt
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- */
-
-#ifndef __SIS_DRM_H__
-#define __SIS_DRM_H__
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-/* SiS specific ioctls */
-#define NOT_USED_0_3
-#define DRM_SIS_FB_ALLOC	0x04
-#define DRM_SIS_FB_FREE	        0x05
-#define NOT_USED_6_12
-#define DRM_SIS_AGP_INIT	0x13
-#define DRM_SIS_AGP_ALLOC	0x14
-#define DRM_SIS_AGP_FREE	0x15
-#define DRM_SIS_FB_INIT	        0x16
-
-#define DRM_IOCTL_SIS_FB_ALLOC		DRM_IOWR(DRM_COMMAND_BASE + DRM_SIS_FB_ALLOC, drm_sis_mem_t)
-#define DRM_IOCTL_SIS_FB_FREE		DRM_IOW( DRM_COMMAND_BASE + DRM_SIS_FB_FREE, drm_sis_mem_t)
-#define DRM_IOCTL_SIS_AGP_INIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_SIS_AGP_INIT, drm_sis_agp_t)
-#define DRM_IOCTL_SIS_AGP_ALLOC		DRM_IOWR(DRM_COMMAND_BASE + DRM_SIS_AGP_ALLOC, drm_sis_mem_t)
-#define DRM_IOCTL_SIS_AGP_FREE		DRM_IOW( DRM_COMMAND_BASE + DRM_SIS_AGP_FREE, drm_sis_mem_t)
-#define DRM_IOCTL_SIS_FB_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_SIS_FB_INIT, drm_sis_fb_t)
-/*
-#define DRM_IOCTL_SIS_FLIP		DRM_IOW( 0x48, drm_sis_flip_t)
-#define DRM_IOCTL_SIS_FLIP_INIT		DRM_IO(  0x49)
-#define DRM_IOCTL_SIS_FLIP_FINAL	DRM_IO(  0x50)
-*/
-
-typedef struct {
-	int context;
-	unsigned long offset;
-	unsigned long size;
-	unsigned long free;
-} drm_sis_mem_t;
-
-typedef struct {
-	unsigned long offset, size;
-} drm_sis_agp_t;
-
-typedef struct {
-	unsigned long offset, size;
-} drm_sis_fb_t;
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif				/* __SIS_DRM_H__ */
diff --git a/include/drm-uapi/v3d_drm.h b/include/drm-uapi/v3d_drm.h
index 3dfc0af8756a..dce1835eced4 100644
--- a/include/drm-uapi/v3d_drm.h
+++ b/include/drm-uapi/v3d_drm.h
@@ -41,6 +41,7 @@ extern "C" {
 #define DRM_V3D_PERFMON_CREATE                    0x08
 #define DRM_V3D_PERFMON_DESTROY                   0x09
 #define DRM_V3D_PERFMON_GET_VALUES                0x0a
+#define DRM_V3D_SUBMIT_CPU                        0x0b
 
 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -56,6 +57,7 @@ extern "C" {
 						   struct drm_v3d_perfmon_destroy)
 #define DRM_IOCTL_V3D_PERFMON_GET_VALUES  DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_VALUES, \
 						   struct drm_v3d_perfmon_get_values)
+#define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
 
 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION		  0x02
@@ -69,7 +71,13 @@ extern "C" {
 struct drm_v3d_extension {
 	__u64 next;
 	__u32 id;
-#define DRM_V3D_EXT_ID_MULTI_SYNC		0x01
+#define DRM_V3D_EXT_ID_MULTI_SYNC			0x01
+#define DRM_V3D_EXT_ID_CPU_INDIRECT_CSD		0x02
+#define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY		0x03
+#define DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY	0x04
+#define DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY	0x05
+#define DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY	0x06
+#define DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY	0x07
 	__u32 flags; /* mbz */
 };
 
@@ -93,6 +101,7 @@ enum v3d_queue {
 	V3D_TFU,
 	V3D_CSD,
 	V3D_CACHE_CLEAN,
+	V3D_CPU,
 };
 
 /**
@@ -276,6 +285,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH,
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
 	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
+	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
 };
 
 struct drm_v3d_get_param {
@@ -319,6 +329,11 @@ struct drm_v3d_submit_tfu {
 
 	/* Pointer to an array of ioctl extensions*/
 	__u64 extensions;
+
+	struct {
+		__u32 ioc;
+		__u32 pad;
+	} v71;
 };
 
 /* Submits a compute shader for dispatch.  This job will block on any
@@ -356,6 +371,234 @@ struct drm_v3d_submit_csd {
 	__u32 pad;
 };
 
+/**
+ * struct drm_v3d_indirect_csd - ioctl extension for the CPU job to create an
+ * indirect CSD
+ *
+ * When an extension of DRM_V3D_EXT_ID_CPU_INDIRECT_CSD id is defined, it
+ * points to this extension to define a indirect CSD submission. It creates a
+ * CPU job linked to a CSD job. The CPU job waits for the indirect CSD
+ * dependencies and, once they are signaled, it updates the CSD job config
+ * before allowing the CSD job execution.
+ */
+struct drm_v3d_indirect_csd {
+	struct drm_v3d_extension base;
+
+	/* Indirect CSD */
+	struct drm_v3d_submit_csd submit;
+
+	/* Handle of the indirect BO, that should be also attached to the
+	 * indirect CSD.
+	 */
+	__u32 indirect;
+
+	/* Offset within the BO where the workgroup counts are stored */
+	__u32 offset;
+
+	/* Workgroups size */
+	__u32 wg_size;
+
+	/* Indices of the uniforms with the workgroup dispatch counts
+	 * in the uniform stream. If the uniform rewrite is not needed,
+	 * the offset must be 0xffffffff.
+	 */
+	__u32 wg_uniform_offsets[3];
+};
+
+/**
+ * struct drm_v3d_timestamp_query - ioctl extension for the CPU job to calculate
+ * a timestamp query
+ *
+ * When an extension DRM_V3D_EXT_ID_TIMESTAMP_QUERY is defined, it points to
+ * this extension to define a timestamp query submission. This CPU job will
+ * calculate the timestamp query and update the query value within the
+ * timestamp BO. Moreover, it will signal the timestamp syncobj to indicate
+ * query availability.
+ */
+struct drm_v3d_timestamp_query {
+	struct drm_v3d_extension base;
+
+	/* Array of queries' offsets within the timestamp BO for their value */
+	__u64 offsets;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* mbz */
+	__u32 pad;
+};
+
+/**
+ * struct drm_v3d_reset_timestamp_query - ioctl extension for the CPU job to
+ * reset timestamp queries
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY is defined, it
+ * points to this extension to define a reset timestamp submission. This CPU
+ * job will reset the timestamp queries based on value offset of the first
+ * query. Moreover, it will reset the timestamp syncobj to reset query
+ * availability.
+ */
+struct drm_v3d_reset_timestamp_query {
+	struct drm_v3d_extension base;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Offset of the first query within the timestamp BO for its value */
+	__u32 offset;
+
+	/* Number of queries */
+	__u32 count;
+};
+
+/**
+ * struct drm_v3d_copy_timestamp_query - ioctl extension for the CPU job to copy
+ * query results to a buffer
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY is defined, it
+ * points to this extension to define a copy timestamp query submission. This
+ * CPU job will copy the timestamp queries results to a BO with the offset
+ * and stride defined in the extension.
+ */
+struct drm_v3d_copy_timestamp_query {
+	struct drm_v3d_extension base;
+
+	/* Define if should write to buffer using 64 or 32 bits */
+	__u8 do_64bit;
+
+	/* Define if it can write to buffer even if the query is not available */
+	__u8 do_partial;
+
+	/* Define if it should write availability bit to buffer */
+	__u8 availability_bit;
+
+	/* mbz */
+	__u8 pad;
+
+	/* Offset of the buffer in the BO */
+	__u32 offset;
+
+	/* Stride of the buffer in the BO */
+	__u32 stride;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* Array of queries' offsets within the timestamp BO for their value */
+	__u64 offsets;
+
+	/* Array of timestamp's syncobjs to indicate its availability */
+	__u64 syncs;
+};
+
+/**
+ * struct drm_v3d_reset_performance_query - ioctl extension for the CPU job to
+ * reset performance queries
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY is defined, it
+ * points to this extension to define a reset performance submission. This CPU
+ * job will reset the performance queries by resetting the values of the
+ * performance monitors. Moreover, it will reset the syncobj to reset query
+ * availability.
+ */
+struct drm_v3d_reset_performance_query {
+	struct drm_v3d_extension base;
+
+	/* Array of performance queries's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* Number of performance monitors */
+	__u32 nperfmons;
+
+	/* Array of u64 user-pointers that point to an array of kperfmon_ids */
+	__u64 kperfmon_ids;
+};
+
+/**
+ * struct drm_v3d_copy_performance_query - ioctl extension for the CPU job to copy
+ * performance query results to a buffer
+ *
+ * When an extension DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY is defined, it
+ * points to this extension to define a copy performance query submission. This
+ * CPU job will copy the performance queries results to a BO with the offset
+ * and stride defined in the extension.
+ */
+struct drm_v3d_copy_performance_query {
+	struct drm_v3d_extension base;
+
+	/* Define if should write to buffer using 64 or 32 bits */
+	__u8 do_64bit;
+
+	/* Define if it can write to buffer even if the query is not available */
+	__u8 do_partial;
+
+	/* Define if it should write availability bit to buffer */
+	__u8 availability_bit;
+
+	/* mbz */
+	__u8 pad;
+
+	/* Offset of the buffer in the BO */
+	__u32 offset;
+
+	/* Stride of the buffer in the BO */
+	__u32 stride;
+
+	/* Number of performance monitors */
+	__u32 nperfmons;
+
+	/* Number of performance counters related to this query pool */
+	__u32 ncounters;
+
+	/* Number of queries */
+	__u32 count;
+
+	/* Array of performance queries's syncobjs to indicate its availability */
+	__u64 syncs;
+
+	/* Array of u64 user-pointers that point to an array of kperfmon_ids */
+	__u64 kperfmon_ids;
+};
+
+struct drm_v3d_submit_cpu {
+	/* Pointer to a u32 array of the BOs that are referenced by the job.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_INDIRECT_CSD, it must contain only one BO,
+	 * that contains the workgroup counts.
+	 *
+	 * For DRM_V3D_EXT_ID_TIMESTAMP_QUERY, it must contain only one BO,
+	 * that will contain the timestamp.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY, it must contain only
+	 * one BO, that contains the timestamp.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY, it must contain two
+	 * BOs. The first is the BO where the timestamp queries will be written
+	 * to. The second is the BO that contains the timestamp.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY, it must contain no
+	 * BOs.
+	 *
+	 * For DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY, it must contain one
+	 * BO, where the performance queries will be written.
+	 */
+	__u64 bo_handles;
+
+	/* Number of BO handles passed in (size is that times 4). */
+	__u32 bo_handle_count;
+
+	__u32 flags;
+
+	/* Pointer to an array of ioctl extensions*/
+	__u64 extensions;
+};
+
 enum {
 	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
 	V3D_PERFCNT_FEP_VALID_PRIMS,
diff --git a/include/drm-uapi/via_drm.h b/include/drm-uapi/via_drm.h
deleted file mode 100644
index 4f68e9a323bf..000000000000
--- a/include/drm-uapi/via_drm.h
+++ /dev/null
@@ -1,282 +0,0 @@
-/*
- * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
- * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sub license,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-#ifndef _VIA_DRM_H_
-#define _VIA_DRM_H_
-
-#include "drm.h"
-
-#if defined(__cplusplus)
-extern "C" {
-#endif
-
-/* WARNING: These defines must be the same as what the Xserver uses.
- * if you change them, you must change the defines in the Xserver.
- */
-
-#ifndef _VIA_DEFINES_
-#define _VIA_DEFINES_
-
-
-#define VIA_NR_SAREA_CLIPRECTS		8
-#define VIA_NR_XVMC_PORTS               10
-#define VIA_NR_XVMC_LOCKS               5
-#define VIA_MAX_CACHELINE_SIZE          64
-#define XVMCLOCKPTR(saPriv,lockNo)					\
-	((__volatile__ struct drm_hw_lock *)(((((unsigned long) (saPriv)->XvMCLockArea) + \
-				      (VIA_MAX_CACHELINE_SIZE - 1)) &	\
-				     ~(VIA_MAX_CACHELINE_SIZE - 1)) +	\
-				    VIA_MAX_CACHELINE_SIZE*(lockNo)))
-
-/* Each region is a minimum of 64k, and there are at most 64 of them.
- */
-#define VIA_NR_TEX_REGIONS 64
-#define VIA_LOG_MIN_TEX_REGION_SIZE 16
-#endif
-
-#define VIA_UPLOAD_TEX0IMAGE  0x1	/* handled clientside */
-#define VIA_UPLOAD_TEX1IMAGE  0x2	/* handled clientside */
-#define VIA_UPLOAD_CTX        0x4
-#define VIA_UPLOAD_BUFFERS    0x8
-#define VIA_UPLOAD_TEX0       0x10
-#define VIA_UPLOAD_TEX1       0x20
-#define VIA_UPLOAD_CLIPRECTS  0x40
-#define VIA_UPLOAD_ALL        0xff
-
-/* VIA specific ioctls */
-#define DRM_VIA_ALLOCMEM	0x00
-#define DRM_VIA_FREEMEM	        0x01
-#define DRM_VIA_AGP_INIT	0x02
-#define DRM_VIA_FB_INIT	        0x03
-#define DRM_VIA_MAP_INIT	0x04
-#define DRM_VIA_DEC_FUTEX       0x05
-#define NOT_USED
-#define DRM_VIA_DMA_INIT	0x07
-#define DRM_VIA_CMDBUFFER	0x08
-#define DRM_VIA_FLUSH	        0x09
-#define DRM_VIA_PCICMD	        0x0a
-#define DRM_VIA_CMDBUF_SIZE	0x0b
-#define NOT_USED
-#define DRM_VIA_WAIT_IRQ        0x0d
-#define DRM_VIA_DMA_BLIT        0x0e
-#define DRM_VIA_BLIT_SYNC       0x0f
-
-#define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_ALLOCMEM, drm_via_mem_t)
-#define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_FREEMEM, drm_via_mem_t)
-#define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_AGP_INIT, drm_via_agp_t)
-#define DRM_IOCTL_VIA_FB_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_FB_INIT, drm_via_fb_t)
-#define DRM_IOCTL_VIA_MAP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_MAP_INIT, drm_via_init_t)
-#define DRM_IOCTL_VIA_DEC_FUTEX   DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_DEC_FUTEX, drm_via_futex_t)
-#define DRM_IOCTL_VIA_DMA_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_DMA_INIT, drm_via_dma_init_t)
-#define DRM_IOCTL_VIA_CMDBUFFER	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_CMDBUFFER, drm_via_cmdbuffer_t)
-#define DRM_IOCTL_VIA_FLUSH	  DRM_IO(  DRM_COMMAND_BASE + DRM_VIA_FLUSH)
-#define DRM_IOCTL_VIA_PCICMD	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_PCICMD, drm_via_cmdbuffer_t)
-#define DRM_IOCTL_VIA_CMDBUF_SIZE DRM_IOWR( DRM_COMMAND_BASE + DRM_VIA_CMDBUF_SIZE, \
-					    drm_via_cmdbuf_size_t)
-#define DRM_IOCTL_VIA_WAIT_IRQ    DRM_IOWR( DRM_COMMAND_BASE + DRM_VIA_WAIT_IRQ, drm_via_irqwait_t)
-#define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_DMA_BLIT, drm_via_dmablit_t)
-#define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_BLIT_SYNC, drm_via_blitsync_t)
-
-/* Indices into buf.Setup where various bits of state are mirrored per
- * context and per buffer.  These can be fired at the card as a unit,
- * or in a piecewise fashion as required.
- */
-
-#define VIA_TEX_SETUP_SIZE 8
-
-/* Flags for clear ioctl
- */
-#define VIA_FRONT   0x1
-#define VIA_BACK    0x2
-#define VIA_DEPTH   0x4
-#define VIA_STENCIL 0x8
-#define VIA_MEM_VIDEO   0	/* matches drm constant */
-#define VIA_MEM_AGP     1	/* matches drm constant */
-#define VIA_MEM_SYSTEM  2
-#define VIA_MEM_MIXED   3
-#define VIA_MEM_UNKNOWN 4
-
-typedef struct {
-	__u32 offset;
-	__u32 size;
-} drm_via_agp_t;
-
-typedef struct {
-	__u32 offset;
-	__u32 size;
-} drm_via_fb_t;
-
-typedef struct {
-	__u32 context;
-	__u32 type;
-	__u32 size;
-	unsigned long index;
-	unsigned long offset;
-} drm_via_mem_t;
-
-typedef struct _drm_via_init {
-	enum {
-		VIA_INIT_MAP = 0x01,
-		VIA_CLEANUP_MAP = 0x02
-	} func;
-
-	unsigned long sarea_priv_offset;
-	unsigned long fb_offset;
-	unsigned long mmio_offset;
-	unsigned long agpAddr;
-} drm_via_init_t;
-
-typedef struct _drm_via_futex {
-	enum {
-		VIA_FUTEX_WAIT = 0x00,
-		VIA_FUTEX_WAKE = 0X01
-	} func;
-	__u32 ms;
-	__u32 lock;
-	__u32 val;
-} drm_via_futex_t;
-
-typedef struct _drm_via_dma_init {
-	enum {
-		VIA_INIT_DMA = 0x01,
-		VIA_CLEANUP_DMA = 0x02,
-		VIA_DMA_INITIALIZED = 0x03
-	} func;
-
-	unsigned long offset;
-	unsigned long size;
-	unsigned long reg_pause_addr;
-} drm_via_dma_init_t;
-
-typedef struct _drm_via_cmdbuffer {
-	char *buf;
-	unsigned long size;
-} drm_via_cmdbuffer_t;
-
-/* Warning: If you change the SAREA structure you must change the Xserver
- * structure as well */
-
-typedef struct _drm_via_tex_region {
-	unsigned char next, prev;	/* indices to form a circular LRU  */
-	unsigned char inUse;	/* owned by a client, or free? */
-	int age;		/* tracked by clients to update local LRU's */
-} drm_via_tex_region_t;
-
-typedef struct _drm_via_sarea {
-	unsigned int dirty;
-	unsigned int nbox;
-	struct drm_clip_rect boxes[VIA_NR_SAREA_CLIPRECTS];
-	drm_via_tex_region_t texList[VIA_NR_TEX_REGIONS + 1];
-	int texAge;		/* last time texture was uploaded */
-	int ctxOwner;		/* last context to upload state */
-	int vertexPrim;
-
-	/*
-	 * Below is for XvMC.
-	 * We want the lock integers alone on, and aligned to, a cache line.
-	 * Therefore this somewhat strange construct.
-	 */
-
-	char XvMCLockArea[VIA_MAX_CACHELINE_SIZE * (VIA_NR_XVMC_LOCKS + 1)];
-
-	unsigned int XvMCDisplaying[VIA_NR_XVMC_PORTS];
-	unsigned int XvMCSubPicOn[VIA_NR_XVMC_PORTS];
-	unsigned int XvMCCtxNoGrabbed;	/* Last context to hold decoder */
-
-	/* Used by the 3d driver only at this point, for pageflipping:
-	 */
-	unsigned int pfCurrentOffset;
-} drm_via_sarea_t;
-
-typedef struct _drm_via_cmdbuf_size {
-	enum {
-		VIA_CMDBUF_SPACE = 0x01,
-		VIA_CMDBUF_LAG = 0x02
-	} func;
-	int wait;
-	__u32 size;
-} drm_via_cmdbuf_size_t;
-
-typedef enum {
-	VIA_IRQ_ABSOLUTE = 0x0,
-	VIA_IRQ_RELATIVE = 0x1,
-	VIA_IRQ_SIGNAL = 0x10000000,
-	VIA_IRQ_FORCE_SEQUENCE = 0x20000000
-} via_irq_seq_type_t;
-
-#define VIA_IRQ_FLAGS_MASK 0xF0000000
-
-enum drm_via_irqs {
-	drm_via_irq_hqv0 = 0,
-	drm_via_irq_hqv1,
-	drm_via_irq_dma0_dd,
-	drm_via_irq_dma0_td,
-	drm_via_irq_dma1_dd,
-	drm_via_irq_dma1_td,
-	drm_via_irq_num
-};
-
-struct drm_via_wait_irq_request {
-	unsigned irq;
-	via_irq_seq_type_t type;
-	__u32 sequence;
-	__u32 signal;
-};
-
-typedef union drm_via_irqwait {
-	struct drm_via_wait_irq_request request;
-	struct drm_wait_vblank_reply reply;
-} drm_via_irqwait_t;
-
-typedef struct drm_via_blitsync {
-	__u32 sync_handle;
-	unsigned engine;
-} drm_via_blitsync_t;
-
-/* - * Below,"flags" is currently unused but will be used for possible future
- * extensions like kernel space bounce buffers for bad alignments and
- * blit engine busy-wait polling for better latency in the absence of
- * interrupts.
- */
-
-typedef struct drm_via_dmablit {
-	__u32 num_lines;
-	__u32 line_length;
-
-	__u32 fb_addr;
-	__u32 fb_stride;
-
-	unsigned char *mem_addr;
-	__u32 mem_stride;
-
-	__u32 flags;
-	int to_fb;
-
-	drm_via_blitsync_t sync;
-} drm_via_dmablit_t;
-
-#if defined(__cplusplus)
-}
-#endif
-
-#endif				/* _VIA_DRM_H_ */
diff --git a/include/drm-uapi/virtgpu_drm.h b/include/drm-uapi/virtgpu_drm.h
index b1d0e56565bc..c2ce71987e9b 100644
--- a/include/drm-uapi/virtgpu_drm.h
+++ b/include/drm-uapi/virtgpu_drm.h
@@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
 #define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
 #define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME      0x0004
 struct drm_virtgpu_context_set_param {
 	__u64 param;
 	__u64 value;

-- 
2.43.0

