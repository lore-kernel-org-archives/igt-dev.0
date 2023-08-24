Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164D410E0B1
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 16:33:40 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Thu, 24 Aug 2023 15:33:02 -0100
Message-Id: <20230824163302.15121-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic: check zpos is mutable
 before test mutable zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

plane-primary-overlay-mutable-zpos only works if both plane types have
mutable zpos property. However, drivers usually set primary zpos as
immutable and the test case just fails. Create a helper to check if a
plane have mutable zpos and skip the test case if zpos changes are not
allowed.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

I don't know what drivers currently use this test case (imx?), but
besides this requirement check, the test case seems to use an uncommon
format for overlay plane (ARGB1555). From drm_info[1], I think a more
generic option would be ARGB8888 for alpha blending tests, but a primary
plane with mutable zpos doesn't seem a common case too.

Let me know your thoughts

[1] https://drmdb.emersion.fr/formats?plane=0

 lib/igt_kms.c      | 17 +++++++++++++++++
 lib/igt_kms.h      |  2 ++
 tests/kms_atomic.c |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e0959ccff..42dc66fcd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3827,6 +3827,23 @@ void igt_plane_set_prop_enum(igt_plane_t *plane,
 	igt_assert(igt_plane_try_prop_enum(plane, prop, val));
 }
 
+bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
+				     enum igt_atomic_plane_properties igt_prop)
+{
+	drmModePropertyPtr prop;
+	uint64_t value;
+	bool has_prop;
+
+	has_prop = kmstest_get_property(plane->pipe->display->drm_fd,
+					plane->drm_plane->plane_id,
+					DRM_MODE_OBJECT_PLANE,
+				        igt_plane_prop_names[igt_prop], NULL,
+					&value, &prop);
+	igt_assert(has_prop);
+
+	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
+}
+
 /**
  * igt_plane_replace_prop_blob:
  * @plane: plane to set property on.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 91355c910..4b4ec6c5a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -734,6 +734,8 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
 
+extern bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
+					    enum igt_atomic_plane_properties igt_prop);
 /**
  * igt_output_has_prop:
  * @output: Output to check.
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 3289219f9..22ddf5633 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1463,7 +1463,10 @@ igt_main
 		igt_require(overlay);
 
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
+		igt_require(igt_plane_check_prop_is_mutable(primary, IGT_PLANE_ZPOS));
+
 		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
+		igt_require(igt_plane_check_prop_is_mutable(overlay, IGT_PLANE_ZPOS));
 
 		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
 		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
-- 
2.40.1
