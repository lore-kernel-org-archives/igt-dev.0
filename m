Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7005FD68BD8
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 21:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1727210E8C3;
	Fri, 15 Nov 2024 21:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gr4+ZGC0";
	dkim-atps=neutral
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BA610E3D3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 21:19:14 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso326404666b.1
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731705553; x=1732310353; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WAwwb7Gb3h6JlEaTT2a8my+uL88NCuUO96uFRHZBUBg=;
 b=Gr4+ZGC0cXp1VOcZHgWyV963VutNgeakmpbTLLmjp/Cq/CSpKqHy/oZSjAtz+I1HtB
 1bb1k98/8SvttrBt1ihqjn+GkWvqx2YRtJt7IJt9qp8iekP2Tg3UrMg3SfQBX0TU5JmN
 GfhuM4gxMa2BEqjsfvLZNps7r2OZCAYyW4Tb8BpC84uuPRZ+r08w6puzfn6Mm/UoZF24
 pSgbS3GAbwo/X+ND8OuRmI6RBcGsps/iIISLuatH+FL6IzhvkUjE/D3LDl5qFphs8wMN
 lDzoQ12Eu9XDgxucuDvRhZHInadvvwVv8AfBQ1cnBhiU/ZSYIxl5d74OsGDynHTfuzje
 LT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731705553; x=1732310353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAwwb7Gb3h6JlEaTT2a8my+uL88NCuUO96uFRHZBUBg=;
 b=G3K54LP7SWu+32N4qK+aHwnC8+j5wOy0brNl+mQCyCetMO/3Izjka2O2RMzcdeaHTZ
 q+dkscb/fLTj0bw9kKvg1akPODKDIh3KTzfll2l9+LnJ49RLpzgS0Nty3REgJrpUYlYA
 Lma3/gIhGiAnchTjXlWyuxgvl3bF/isY4el0EU5IntnLdlF0iOgDzeFjW5dpR57dIocv
 KLys03RJGMJSoXwkImiYPiJya90dQthtBpYH9f0a8RjTntuOtpMJumrca+UFsMc4dG9t
 hnScuxkDpuAsrjl0CANfNycbKG1pKKd2TP8sXzyChgp9bOyv69fCqUk3xx6n8SxvxsC8
 lgBA==
X-Gm-Message-State: AOJu0YxEoHnh0kHXECBX9fMXXL5dbl1G+7H2DZZF46Hf2VZOr0xXJIV4
 lsO01aVf3Te3v21QuXhHzABOSmOA4aEzjeC6u8j3K19wM9HOEBIc6us4m6zAor6BpWnaw/6Et8q
 G
X-Google-Smtp-Source: AGHT+IHm2BLhTDZk8pS1ZXvXf4deSv7IxKvihgB+FblD+jzd2Zw/1Bf1zacHLmzQkgsGXMN3+7hNzA==
X-Received: by 2002:a17:907:36ca:b0:a91:1699:f8eb with SMTP id
 a640c23a62f3a-aa481a60008mr370762066b.28.1731705552694; 
 Fri, 15 Nov 2024 13:19:12 -0800 (PST)
Received: from rohan.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08161csm215184266b.178.2024.11.15.13.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:19:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:18:59 +0200
Subject: [PATCH i-g-t RESEND v3 2/2] tests/kms_properties: add sanity
 checks for properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-rework-imm-check-v3-2-e4077cf16816@linaro.org>
References: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
In-Reply-To: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8622;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=L5lfagmrtMS2hSNpGHCWJ7ONuUUlQ3y1M+0Jr0bmWZ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7rNUTguI4tQASsBSQZnTuRFxlcQ0E6uqFNgo
 SGyHlhMAtGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze6zQAKCRCLPIo+Aiko
 1bxQB/9566ybzafu6sdP/u/UDm7SZGmRklRzZjTy9tWCjCOLCbNcjre5DBlQV6S7cO7YUyT9j8h
 Fzlxax2BBg0r3PoRFHRy/WaiVfnSjH9V65GU4diOtFtnqgegXO1oTcxTKHd/SesMprrJGwdIb8z
 lXxJDVWcQzXkcTZ/HUW/YBZqqs1eAI843t8L78LEBiWPS4HrCNQxeetvQSRHAS6wT443CBOT54Q
 iQWh9cgkDoZabLeYJ6qiLmVgcN7gncytpNebuBNV4jnpGnQKSDizT0Y7XWrviCTHhch14cVcb2a
 yHfS3qXHZkNRDr2Vqm17LwlVqpEmTfSKZc6dRa7gF0GM9ff7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Provide a simple framework for running sanity checks on properties. As a
start, implement just immutability checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 tests/kms_properties.c | 102 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 15 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index be62e522166f..57f07e69909a 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -416,8 +416,72 @@ static void test_object_invalid_properties(igt_display_t *display,
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
@@ -425,6 +489,8 @@ static void validate_range_prop(const struct drm_mode_get_property *prop,
 	igt_assert_eq(prop->count_values, 2);
 	igt_assert_eq(prop->count_enum_blobs, 0);
 
+	validate_prop_immutable(prop, obj_type, values[0] == values[1]);
+
 	if (is_unsigned) {
 		igt_assert_lte_u64(values[0], values[1]);
 		igt_assert_lte_u64(values[0], value);
@@ -456,13 +522,14 @@ static void validate_enums(const struct drm_mode_get_property *prop)
 }
 
 static void validate_enum_prop(const struct drm_mode_get_property *prop,
-			       uint64_t value)
+			       uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
 	int i;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
+	validate_prop_immutable(prop, obj_type, prop->count_values == 1);
 
 	for (i = 0; i < prop->count_values; i++) {
 		if (value == values[i])
@@ -474,13 +541,14 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
 }
 
 static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
-				  uint64_t value)
+				  uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
 	uint64_t mask = 0;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
+	validate_prop_immutable(prop, obj_type, prop->count_values == 1);
 
 	for (int i = 0; i < prop->count_values; i++) {
 		igt_assert_lte_u64(values[i], 63);
@@ -495,7 +563,7 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
 
 static void validate_blob_prop(int fd,
 			       const struct drm_mode_get_property *prop,
-			       uint64_t value)
+			       uint64_t value, uint32_t obj_type)
 {
 	struct drm_mode_get_blob blob;
 
@@ -509,6 +577,8 @@ static void validate_blob_prop(int fd,
 
 	igt_assert_lte_u64(value, 0xffffffff);
 
+	validate_prop_immutable(prop, obj_type, false);
+
 	/*
 	 * Immutable blob properties can have value==0.
 	 * Happens for example with the "EDID" property
@@ -526,7 +596,7 @@ static void validate_blob_prop(int fd,
 
 static void validate_object_prop(int fd,
 				 const struct drm_mode_get_property *prop,
-				 uint64_t value)
+				 uint64_t value, uint32_t obj_type)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
 	struct drm_mode_crtc crtc;
@@ -536,6 +606,7 @@ static void validate_object_prop(int fd,
 	igt_assert_eq(prop->count_enum_blobs, 0);
 
 	igt_assert_lte_u64(value, 0xffffffff);
+	validate_prop_immutable(prop, obj_type, value == 0);
 
 	switch (values[0]) {
 	case DRM_MODE_OBJECT_CRTC:
@@ -560,7 +631,7 @@ static void validate_object_prop(int fd,
 
 static void validate_property(int fd,
 			      const struct drm_mode_get_property *prop,
-			      uint64_t value, bool atomic)
+			      uint64_t value, bool atomic, uint32_t obj_type)
 {
 	uint32_t flags = prop->flags;
 	uint32_t legacy_type = flags & DRM_MODE_PROP_LEGACY_TYPE;
@@ -581,16 +652,16 @@ static void validate_property(int fd,
 
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
@@ -598,17 +669,18 @@ static void validate_property(int fd,
 
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
@@ -641,7 +713,7 @@ static void validate_prop(int fd, uint32_t prop_id, uint64_t value, bool atomic)
 	for (int i = 0; i < prop.count_enum_blobs; i++)
 		igt_assert_neq_u64(enums[i].value, 0x5c5c5c5c5c5c5c5cULL);
 
-	validate_property(fd, &prop, value, atomic);
+	validate_property(fd, &prop, value, atomic, obj_type);
 
 	free(values);
 	free(enums);
@@ -679,7 +751,7 @@ static void validate_props(int fd, uint32_t obj_type, uint32_t obj_id, bool atom
 	igt_assert(properties.count_props == count);
 
 	for (int i = 0; i < count; i++)
-		validate_prop(fd, props[i], values[i], atomic);
+		validate_prop(fd, props[i], values[i], atomic, obj_type);
 
 	free(values);
 	free(props);

-- 
2.45.2

