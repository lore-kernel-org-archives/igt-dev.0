Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14829D68BD5
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 21:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C959A10E8BA;
	Fri, 15 Nov 2024 21:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tS6f8GWQ";
	dkim-atps=neutral
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682D10E3D3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 21:19:13 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a9ed0ec0e92so9212766b.0
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731705552; x=1732310352; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uHmsnQijfluj+wb0yjjbokfY9uXEXR6u2XGVPhvhTzs=;
 b=tS6f8GWQYqwzjqROn1znPm4GImqfQp9cS3lBr+PYCUTj+qzwzybPXrk0uvPwNAW4d9
 2snfvvZvIHtWtfZ3I8JsECo7564aV0VSCzMU6FGoCFGdUrE2/tKHT0c28/OjD4S4aPUh
 LAQY8yzVEDUohyDnNs9232y5qXe+tYZNdnjDs8Lp/QgUHw8AaLxs//pjbg2jMGDj8r8D
 I9BEaZbtGxUMiNeFO+IoCroJPZtHYGIitFlp2ayDuoesqkug6asjIiEeRm7FlttDICze
 +nz85Tg2NHRREZdvwk0NtvFdU8kQS7qDc7rIFm+xzQ96Si1lAjKgQegwMerSmUbkbvX+
 GyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731705552; x=1732310352;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHmsnQijfluj+wb0yjjbokfY9uXEXR6u2XGVPhvhTzs=;
 b=MHgATn2hH0U808SNQ0TIuTxKQCBNdqeogtpO4cozUSYkRO0RpavzTX5fJNJLlGLdDh
 earJVI/nj9TBLy166j20Ftxde3pksoYVZ3gaoUZbNLGgD0O8Vbli/Na4VFMbhEUM1zdd
 Rp7cAxFTo8mLRCsDdXPH8ehBPa17wOaH8A54o1Qnfh7mSKqBhj1nJaAP3x+LDCMQYOsA
 qYbUD9wl80lJyPAoHbQoxJpcUyZWT6UdVDrty6FPr+K7jRyAiSgX32dvK/DBNXGzY8zu
 PMhanI5Vhf6NLcJE/EKJNEOySiYZ+6kwSnqasoqq5KuNI3XbvBr/Ds4GWe0VnY6bS4md
 yDyQ==
X-Gm-Message-State: AOJu0YyzCvUa4zJtQjvAreEAVK/9I1RfHL0Ac23PIMFAn6KL/23JQ+9J
 +1+5jyq/0A4KoYAgDaTBjP5WU+6y3T+ddB1xrehZj90iI/srfKxOnic40Lgn7eRwa1LgcWfHn7O
 0
X-Google-Smtp-Source: AGHT+IHYLcUGXcSvqgyeUv7abMtH5ih6oXt/7JEC0e516IjCmPig9Lz+OkLVfPXwA8kuPwlnCw8dXw==
X-Received: by 2002:a17:906:9c83:b0:a88:b90a:ff30 with SMTP id
 a640c23a62f3a-aa483552708mr360542466b.50.1731705551828; 
 Fri, 15 Nov 2024 13:19:11 -0800 (PST)
Received: from rohan.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08161csm215184266b.178.2024.11.15.13.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 13:19:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Nov 2024 23:18:58 +0200
Subject: [PATCH i-g-t RESEND v3 1/2] tests/kms_properties: drop
 immutability checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241115-rework-imm-check-v3-1-e4077cf16816@linaro.org>
References: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
In-Reply-To: <20241115-rework-imm-check-v3-0-e4077cf16816@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6BgmgdWBrGGdEdduY5+9gDdmxOSI57DDFtnoiSWRtH4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnN7rN/a4Q1RVhoRQMZLtxHz6TPqvfEqM7QS4Dj
 DhQIIZgshiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZze6zQAKCRCLPIo+Aiko
 1dr4B/sFudRh7xJiggGTBcmbaxmGyKuVo6J7n9/Jfuu5HDp4bFDy2ZJlL14vuaruFgsVneEq5VX
 X3C4bCT+rHJBY6K4qiOJcmXhi6f0OpcgcHZ9lNydcjtpEPEXjV+DJKKsS3UwPJ7/UpfM2pb7o/b
 fXUE0ZKekgA6ePDsctzDdxIJWY4kFb8O9eM02exDcea5byvBKl2Fd4EUMFRiV1UMFBHY3wCJd42
 6nsrTZVGTQNk2d5/K3yfTplzqGySZwZ+hOg8Pwsxp9Ak2iToFRqhX8nAKlScqW/ebr9mbqWczEu
 CiaA2XhNIotYVvJWfpogC9AGmVX1vUSS/af9eVGPCnVRTcGL
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

Drop the single-value-is-immutable tests.

Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 tests/kms_properties.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index a93c93cccf64..be62e522166f 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -421,11 +421,9 @@ static void validate_range_prop(const struct drm_mode_get_property *prop,
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
 	bool is_unsigned = prop->flags & DRM_MODE_PROP_RANGE;
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 
 	igt_assert_eq(prop->count_values, 2);
 	igt_assert_eq(prop->count_enum_blobs, 0);
-	igt_assert(values[0] != values[1] || immutable);
 
 	if (is_unsigned) {
 		igt_assert_lte_u64(values[0], values[1]);
@@ -461,12 +459,10 @@ static void validate_enum_prop(const struct drm_mode_get_property *prop,
 			       uint64_t value)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	int i;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
-	igt_assert(prop->count_values != 1 || immutable);
 
 	for (i = 0; i < prop->count_values; i++) {
 		if (value == values[i])
@@ -481,12 +477,10 @@ static void validate_bitmask_prop(const struct drm_mode_get_property *prop,
 				  uint64_t value)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	uint64_t mask = 0;
 
 	igt_assert_lte(1, prop->count_values);
 	igt_assert_eq(prop->count_enum_blobs, prop->count_values);
-	igt_assert(prop->count_values != 1 || immutable);
 
 	for (int i = 0; i < prop->count_values; i++) {
 		igt_assert_lte_u64(values[i], 63);
@@ -535,7 +529,6 @@ static void validate_object_prop(int fd,
 				 uint64_t value)
 {
 	const uint64_t *values = from_user_pointer(prop->values_ptr);
-	bool immutable = prop->flags & DRM_MODE_PROP_IMMUTABLE;
 	struct drm_mode_crtc crtc;
 	struct drm_mode_fb_cmd fb;
 
@@ -543,7 +536,6 @@ static void validate_object_prop(int fd,
 	igt_assert_eq(prop->count_enum_blobs, 0);
 
 	igt_assert_lte_u64(value, 0xffffffff);
-	igt_assert(!immutable || value != 0);
 
 	switch (values[0]) {
 	case DRM_MODE_OBJECT_CRTC:

-- 
2.45.2

