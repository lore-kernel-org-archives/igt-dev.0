Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42190D2FFF8
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 12:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D810E8F5;
	Fri, 18 Oct 2024 12:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rikMiZn1";
	dkim-atps=neutral
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A7310E8F5
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 12:01:08 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so21969301fa.3
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729252867; x=1729857667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JfvV03LLY+lprPREZImPax6p/hzrykz+y/ebF2vWy9k=;
 b=rikMiZn1YdLZK0u+LKq+d/5fDlqZrSUk10lO6KzNxQsKV/zI/U8MeemQ9DrfMPT02E
 UBpwxLTtj9ZWZUeDxymZPq1ZUxqWKDqo9wFsAMBmta/edwmCzYhqJcZyTW1I+GO+91Oz
 lcTMxq/qHg7A4EjBU5ez+edcJZBnwxqOQp06v9jh6knED6ZSzF0XfBtzEd3YDm/Usdif
 EIgmsX5VNxH63hhngvnlugVW0k15vqe8+zQpv+REJzpdE+UKWvOHanY6xAAh8iZD7aBU
 DbLTXjoap8Yu1XGBlaiHHVA4o6GvUDOMb6LzDQPP5nKNuUoUzZuQ6giy+6js/IOWfK1m
 O1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729252867; x=1729857667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JfvV03LLY+lprPREZImPax6p/hzrykz+y/ebF2vWy9k=;
 b=ti2wgYmNMZWU8/bUZjRzpN2zH5TMhx87Po4DEfIDwFveO3NocNhxPU/+hyNP/vSPZ6
 Q+caIxWd9Qz9iRiM6YbDv95pIsNHP9k9coZiWJ1DWV+zrYfb9GcHdI2mAxzutBX/9pDF
 /gn/AiQJwCucfFQCpXkQrKo+wejpH6tL3o/mS/SvoLn61f7DTvhSznTUF9u+HH2maxDZ
 2VqL/8cxHDFESE+uVYnR0Lwie0NcH6ogiyuyilTJD9jUn9IfNQcoAfOClg6ujXv1mbjS
 u7zCu/DwSLdqvuUcNpJupihfZgy706yacf6yudsTnKEqf2Gz/Dr8p/5xqp7yq07udImn
 mJHQ==
X-Gm-Message-State: AOJu0YzJeBG5S4OWlOqiW/6wR3j57iJBj5KB2o6xdkdU210xyonnBVoN
 d3d++mewmeB0pcXldnCJtTbxSvOQCaGsdk1bzj3npc/AFAg8mBvW3QJdmeEj3x+EJ3YNb6thIgK
 WvRA=
X-Google-Smtp-Source: AGHT+IFraAZFjbltUaHXrBAi9ladri0LpN9LPis1PrR9Zxe9AdpIhQX2t9h5bHC+qiuPHcDTJk1WCA==
X-Received: by 2002:a05:6512:1304:b0:539:fa43:fc36 with SMTP id
 2adb3069b0e04-53a1520b1d2mr1576760e87.12.1729252866397; 
 Fri, 18 Oct 2024 05:01:06 -0700 (PDT)
Received: from rohan.lan (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::4c9]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211e36sm201320e87.283.2024.10.18.05.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:01:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/kms_properties: rework immutability checks
Date: Fri, 18 Oct 2024 15:00:58 +0300
Message-ID: <20241018120058.42240-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Following the discussion on IRC, it is actually an error to require that
properties that can not be chaged are marked as immutable.

First of all, it creates inconsistent uAPI. Some drivers might have an
immutable property, while others will have it mutable. Yes, there are
known examples for such behaviour (e.g. zpos), but they are clearly
documented in this way.

Second, by the nature of the flag, the DRM_MODE_PROP_IMMUTABLE defines
more of the 'direction' of the property (whether it is set by the kernel
or it is expected to be set by the userspace) rather than simply states
that there is no way for the userspace to change the property.

Rework the immutability checks to verify that the properties defined as
immutable have this flag set. Keep the "immutable if single value"
property just for the "zpos" property.

Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---
Changes since v1:
 - Moved GAMMA_LUT_SIZE and DEGAMMA_LUT_SIZE to DRM_MODE_OBJECT_CRTC.
 - Added debug print to help debugging possible issues.
---
 tests/kms_properties.c | 110 ++++++++++++++++++++++++++++++++---------
 1 file changed, 87 insertions(+), 23 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index a93c93cccf64..57f07e69909a 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -416,16 +416,80 @@ static void test_object_invalid_properties(igt_display_t *display,
 		test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
+enum prop_imm_flags {
+	IMMUTABLE_REQ,
+	IMMUTABLE_IF_SINGLE_VALUE,
+};
+
+static const struct {
+	uint32_t obj_type;
+	const char *name;
+	enum prop_imm_flags flags;
+} prop_settings[] = {
+	/* generic */
+	{ DRM_MODE_OBJECT_CONNECTOR, "EDID", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "PATH", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "TILE", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "WRITEBACK_PIXEL_FORMATS", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "non-desktop", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "panel orientation" ,IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "privacy-screen hw-state", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "subconnector", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "suggested X", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "suggested Y", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CONNECTOR, "vrr_capable", IMMUTABLE_REQ },
+
+	{ DRM_MODE_OBJECT_CRTC, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_CRTC, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
+
+	{ DRM_MODE_OBJECT_PLANE, "IN_FORMATS", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_PLANE, "SIZE_HINTS", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_PLANE, "type", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_PLANE, "zpos", IMMUTABLE_IF_SINGLE_VALUE },
+
+	/* driver-specific */
+	{ DRM_MODE_OBJECT_CONNECTOR, "hotplug_mode_update", IMMUTABLE_REQ }, // qxl, vmwgfx
+	{ DRM_MODE_OBJECT_CONNECTOR, "implicit_placement", IMMUTABLE_REQ }, // vmwgfx
+	{ DRM_MODE_OBJECT_PLANE, "AMD_PLANE_BLEND_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
+	{ DRM_MODE_OBJECT_PLANE, "AMD_PLANE_DEGAMMA_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
+	{ DRM_MODE_OBJECT_PLANE, "AMD_PLANE_LUT3D_SIZE", IMMUTABLE_REQ }, // amdgpu
+	{ DRM_MODE_OBJECT_PLANE, "AMD_PLANE_SHAPER_LUT_SIZE", IMMUTABLE_REQ }, // amdgpu
+};
+
+static void validate_prop_immutable(const struct drm_mode_get_property *prop,
+				    uint32_t obj_type, bool single_value)
+{
+	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
+	int i;
+
+	igt_debug("Testing property \"%s\"\n", prop->name);
+
+	for (i = 0; i < ARRAY_SIZE(prop_settings); i++) {
+		if (prop_settings[i].obj_type == obj_type &&
+		    !strcmp(prop_settings[i].name, prop->name))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(prop_settings)) {
+		igt_assert(!immutable);
+		return;
+	}
+
+	igt_assert(immutable || prop_settings[i].flags != IMMUTABLE_REQ);
+	igt_assert(immutable || !single_value ||
+		   prop_settings[i].flags != IMMUTABLE_IF_SINGLE_VALUE);
+}
+
 static void validate_range_prop(const struct drm_mode_get_property *prop,
-				uint64_t value)
+				uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
 	bool is_unsigned = prop->flags & DRM_MODE_PROP_RANGE;
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 
 	igt_assert_eq(prop->count_values, 2);
 	igt_assert_eq(prop->count_enum_blobs, 0);
-	igt_assert(values[0] != values[1] || immutable);
+
+	validate_prop_immutable(prop, obj_type, values[0] == values[1]);
 
 	if (is_unsigned) {
 		igt_assert_lte_u64(values[0], values[1]);
@@ -458,15 +522,14 @@ static void validate_enums(const struct drm_mode_get_property *prop)
 }
 
 static void validate_enum_prop(const struct drm_mode_get_property *prop,
-			       uint64_t value)
+			       uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	int i;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
-	igt_assert(prop->count_values != 1 || immutable);
+	validate_prop_immutable(prop, obj_type, prop->count_values == 1);
 
 	for (i = 0; i < prop->count_values; i++) {
 		if (value == values[i])
@@ -478,15 +541,14 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
 }
 
 static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
-				  uint64_t value)
+				  uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	uint64_t mask = 0;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
-	igt_assert(prop->count_values != 1 || immutable);
+	validate_prop_immutable(prop, obj_type, prop->count_values == 1);
 
 	for (int i = 0; i < prop->count_values; i++) {
 		igt_assert_lte_u64(values[i], 63);
@@ -501,7 +563,7 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
 
 static void validate_blob_prop(int fd,
 			       const struct drm_mode_get_property *prop,
-			       uint64_t value)
+			       uint64_t value, uint32_t obj_type)
 {
 	struct drm_mode_get_blob blob;
 
@@ -515,6 +577,8 @@ static void validate_blob_prop(int fd,
 
 	igt_assert_lte_u64(value, 0xffffffff);
 
+	validate_prop_immutable(prop, obj_type, false);
+
 	/*
 	 * Immutable blob properties can have value==0.
 	 * Happens for example with the "EDID" property
@@ -532,10 +596,9 @@ static void validate_blob_prop(int fd,
 
 static void validate_object_prop(int fd,
 				 const struct drm_mode_get_property *prop,
-				 uint64_t value)
+				 uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	struct drm_mode_crtc crtc;
 	struct drm_mode_fb_cmd fb;
 
@@ -543,7 +606,7 @@ static void validate_object_prop(int fd,
 	igt_assert_eq(prop->count_enum_blobs, 0);
 
 	igt_assert_lte_u64(value, 0xffffffff);
-	igt_assert(!immutable || value != 0);
+	validate_prop_immutable(prop, obj_type, value == 0);
 
 	switch (values[0]) {
 	case DRM_MODE_OBJECT_CRTC:
@@ -568,7 +631,7 @@ static void validate_object_prop(int fd,
 
 static void validate_property(int fd,
 			      const struct drm_mode_get_property *prop,
-			      uint64_t value, bool atomic)
+			      uint64_t value, bool atomic, uint32_t obj_type)
 {
 	uint32_t flags = prop->flags;
 	uint32_t legacy_type = flags & DRM_MODE_PROP_LEGACY_TYPE;
@@ -589,16 +652,16 @@ static void validate_property(int fd,
 
 	switch (legacy_type) {
 	case DRM_MODE_PROP_RANGE:
-		validate_range_prop(prop, value);
+		validate_range_prop(prop, value, obj_type);
 		break;
 	case DRM_MODE_PROP_ENUM:
-		validate_enum_prop(prop, value);
+		validate_enum_prop(prop, value, obj_type);
 		break;
 	case DRM_MODE_PROP_BITMASK:
-		validate_bitmask_prop(prop, value);
+		validate_bitmask_prop(prop, value, obj_type);
 		break;
 	case DRM_MODE_PROP_BLOB:
-		validate_blob_prop(fd, prop, value);
+		validate_blob_prop(fd, prop, value, obj_type);
 		break;
 	default:
 		igt_assert_eq(legacy_type, 0);
@@ -606,17 +669,18 @@ static void validate_property(int fd,
 
 	switch (ext_type) {
 	case DRM_MODE_PROP_OBJECT:
-		validate_object_prop(fd, prop, value);
+		validate_object_prop(fd, prop, value, obj_type);
 		break;
 	case DRM_MODE_PROP_SIGNED_RANGE:
-		validate_range_prop(prop, value);
+		validate_range_prop(prop, value, obj_type);
 		break;
 	default:
 		igt_assert_eq(ext_type, 0);
 	}
 }
 
-static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
+static void validate_prop(int fd, uint32_t prop_id, uint64_t value,
+			  bool atomic, uint32_t obj_type)
 {
 	struct drm_mode_get_property prop;
 	struct drm_mode_property_enum *enums = NULL;
@@ -649,7 +713,7 @@ static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
 	for (int i = 0; i < prop.count_enum_blobs; i++)
 		igt_assert_neq_u64(enums[i].value, 0x5c5c5c5c5c5c5c5cULL);
 
-	validate_property(fd, &prop, value, atomic);
+	validate_property(fd, &prop, value, atomic, obj_type);
 
 	free(values);
 	free(enums);
@@ -687,7 +751,7 @@ static void validate_props(int fd, uint32_t obj_type, uint32_t obj_id, bool atom
 	igt_assert(properties.count_props == count);
 
 	for (int i = 0; i < count; i++)
-		validate_prop(fd, props[i], values[i], atomic);
+		validate_prop(fd, props[i], values[i], atomic, obj_type);
 
 	free(values);
 	free(props);
-- 
2.45.2

