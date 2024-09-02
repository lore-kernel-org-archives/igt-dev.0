Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313C4CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 21:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F1110E3B6;
	Mon,  2 Sep 2024 21:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mYeRE0ZL";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0510E3B6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 21:07:59 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53349ee42a9so6198855e87.3
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Sep 2024 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725311277; x=1725916077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TnS96V9pWKLOiWVMuneBAUEZqkn38ERV3zG3czzc52g=;
 b=mYeRE0ZLzTeGPDwDoDneMtFnj6vp47d/M4aLcKzVw8aq5A3GJ0vRI1Ohj9qukRMSH4
 hDEKmT9aUQ2QRKdzkRrPXb2vWiPh/HnOxTZB6yycPgy0OZNezNp3nUE6Wzc2GtXN1qAw
 OQ/EraHy8J3JXBKgl1CeprUG73yzmt8s9C2x5hSLulXRtMQWal1vsTcc0pgGOP9z0Tur
 yenhO+M6m+3GSN/RuL8jZUCl8At9aY4znoI9t0IfrxJIKOBlRQ2Wzq0OpJnwod4gglqD
 yA2c6oE1aPae2A7v7FRrjGZXU0Cua3gPyi7/J5fRKMFMC8r2E4QbZ1/N1uDrRbHTw2M0
 B+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725311277; x=1725916077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TnS96V9pWKLOiWVMuneBAUEZqkn38ERV3zG3czzc52g=;
 b=mb597udj2ou8VwA9lkmyh1r4MLdHrAPui+oQYBWGW52BbUYHSBYr04rChVCkBPEpix
 VfCoRWf4glMbNvWKEVj9yh1o1gmtq+VZT+zsaEKPJ5xIQ26gwABM1nm0GAuExiQVC7h1
 N9UZKsfJkcyLzEaHwp7UTPGjhpFvpE53YDUC3GEo48BBw86t1zlAqhaT67qCnJ6i5FWV
 N37St+RnPSsbOM9tGtIdr084credNKBt6/tnTWZDv8goCUqvyfPzlEpeam8GGI8UhrBh
 iMITvi2YvER/bJO2BiK4R0AQPrRHjbUEpXIPX2H0dcrg8Cbif43DEWavtDGCo1aEhFFl
 Bofg==
X-Gm-Message-State: AOJu0YzJfLUxLsJRKVz5MiPZz6arsQ95hbRPFWAhQCjzSKbN1wNsSeoG
 SvSlSdmQe7YEZDzeiA1amy0Xz8PJ/xlPPxgHV+I9QYrlhWVYFnJx9xRoxuAzsrL3vmtE9Lmo//T
 4
X-Google-Smtp-Source: AGHT+IGnnOaD3aoekuASirvNb7wVhi8k9Pq8fy8WVOa/IRjH3MZGgyTKRNj4N6kiwaFAumL2JjA0MQ==
X-Received: by 2002:a05:6512:138e:b0:52e:9b15:1c60 with SMTP id
 2adb3069b0e04-53546ba9d09mr7009373e87.48.1725311276461; 
 Mon, 02 Sep 2024 14:07:56 -0700 (PDT)
Received: from rohan.lan (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::4c9]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b76asm1766838e87.43.2024.09.02.14.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 14:07:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, emersion <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, victoria@system76.com,
 xaver.hugl@kde.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_properties: rework immutability checks
Date: Tue,  3 Sep 2024 00:07:55 +0300
Message-ID: <20240902210755.480638-1-dmitry.baryshkov@linaro.org>
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
 tests/kms_properties.c | 106 ++++++++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 23 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index a93c93cccf64..f507cd50ea0d 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -416,16 +416,76 @@ static void test_object_invalid_properties(igt_display_t *display,
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
+	{ DRM_MODE_OBJECT_PLANE, "DEGAMMA_LUT_SIZE", IMMUTABLE_REQ },
+	{ DRM_MODE_OBJECT_PLANE, "GAMMA_LUT_SIZE", IMMUTABLE_REQ },
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
@@ -458,15 +518,14 @@ static void validate_enums(const struct drm_mode_get_property *prop)
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
@@ -478,15 +537,14 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
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
@@ -501,7 +559,7 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
 
 static void validate_blob_prop(int fd,
 			       const struct drm_mode_get_property *prop,
-			       uint64_t value)
+			       uint64_t value, uint32_t obj_type)
 {
 	struct drm_mode_get_blob blob;
 
@@ -515,6 +573,8 @@ static void validate_blob_prop(int fd,
 
 	igt_assert_lte_u64(value, 0xffffffff);
 
+	validate_prop_immutable(prop, obj_type, false);
+
 	/*
 	 * Immutable blob properties can have value==0.
 	 * Happens for example with the "EDID" property
@@ -532,10 +592,9 @@ static void validate_blob_prop(int fd,
 
 static void validate_object_prop(int fd,
 				 const struct drm_mode_get_property *prop,
-				 uint64_t value)
+				 uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	struct drm_mode_crtc crtc;
 	struct drm_mode_fb_cmd fb;
 
@@ -543,7 +602,7 @@ static void validate_object_prop(int fd,
 	igt_assert_eq(prop->count_enum_blobs, 0);
 
 	igt_assert_lte_u64(value, 0xffffffff);
-	igt_assert(!immutable || value != 0);
+	validate_prop_immutable(prop, obj_type, value == 0);
 
 	switch (values[0]) {
 	case DRM_MODE_OBJECT_CRTC:
@@ -568,7 +627,7 @@ static void validate_object_prop(int fd,
 
 static void validate_property(int fd,
 			      const struct drm_mode_get_property *prop,
-			      uint64_t value, bool atomic)
+			      uint64_t value, bool atomic, uint32_t obj_type)
 {
 	uint32_t flags = prop->flags;
 	uint32_t legacy_type = flags & DRM_MODE_PROP_LEGACY_TYPE;
@@ -589,16 +648,16 @@ static void validate_property(int fd,
 
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
@@ -606,17 +665,18 @@ static void validate_property(int fd,
 
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
@@ -649,7 +709,7 @@ static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
 	for (int i = 0; i < prop.count_enum_blobs; i++)
 		igt_assert_neq_u64(enums[i].value, 0x5c5c5c5c5c5c5c5cULL);
 
-	validate_property(fd, &prop, value, atomic);
+	validate_property(fd, &prop, value, atomic, obj_type);
 
 	free(values);
 	free(enums);
@@ -687,7 +747,7 @@ static void validate_props(int fd, uint32_t obj_type, uint32_t obj_id, bool atom
 	igt_assert(properties.count_props == count);
 
 	for (int i = 0; i < count; i++)
-		validate_prop(fd, props[i], values[i], atomic);
+		validate_prop(fd, props[i], values[i], atomic, obj_type);
 
 	free(values);
 	free(props);
-- 
2.45.2

