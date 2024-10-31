Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15891E67490
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 23:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BD510E948;
	Thu, 31 Oct 2024 23:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e4hhb1ZV";
	dkim-atps=neutral
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028B010E949
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 23:14:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so1916488e87.1
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416454; x=1731021254; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uHmsnQijfluj+wb0yjjbokfY9uXEXR6u2XGVPhvhTzs=;
 b=e4hhb1ZVOiwHUR22RhgjRmWMkaX9J5wwKkHav87cW/v7FRA0YRSZo45C2YX/4sQXtn
 TqnhZ5i9b2rTrSy582FpPcjYohpf3gTljAnm2hi/RMGBP5skmOcgW2jweTgBHnPL2xvv
 DVZaVOkjsa23UEPYa23dh1oL73TY0k2A3mELgK9DNlwJNkUGl0RJUhcU6iWMOvy1Qzs+
 jVHLSspVxQlBMOJFlHey2SbSfUO85zJXLSingzngddupU7wBmgqPwL9X0jjTlN4sOuXu
 L7F4c/76dLzURAcO3dQa/WxFUOJ84KGUB1kjDt3aISbGS3cM8XGKJ5gzhmE//ZXNkBoZ
 nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416454; x=1731021254;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHmsnQijfluj+wb0yjjbokfY9uXEXR6u2XGVPhvhTzs=;
 b=DaK75qJa3ejjPYu7E2lhfPxOtioEhaY7wuiKJb31ZqyQoyWSSNVERPpnh1WnnNYxYK
 pbxjuhKoF3AJNgjYhMkgbJzmSls6GAiY0nj9Nr7gDCsMT/nMhO37ONq5oYvDeUdgMNXD
 77W/7NWhZpohBGNDdvBc6JX7I53kCCzFwtXDtmXWsHhOCeY+dfYv8JuNKIrXB3KMhSg3
 XpcnLZyaz/myMuxa27ffDDnbutpMK5H9VR47OeiJAcLBsnPhJxOt5B7CmbADTlfRDoFa
 FdxFDxy6ak/lQrMNUlx446Z+e+gd7ev/+dWoGJE+++qmyuMAY98nDjUHf0yGtBh4Yjsk
 FG6Q==
X-Gm-Message-State: AOJu0YxlMxDzxtZE9NWAaVRIVv8TyIPJbHdnirRhG3AxMdTKfxKOcnX8
 WGXd/M+wwZZ38buga7HaJq0k1GWu9tQb9r20bg+ybSjvUmZ9KznO7LNl8c1iTUXtoYlX31FHer8
 I
X-Google-Smtp-Source: AGHT+IE2edZ1VQXwfAE7tmIX+OrXRd+Wnup1q56sMp7rnfnWSmatx7PdXkHwgu9w6hINhN8bFhP9qA==
X-Received: by 2002:a05:6512:3b27:b0:539:de9c:c890 with SMTP id
 2adb3069b0e04-53b34c5f9b5mr10404705e87.42.1730416453598; 
 Thu, 31 Oct 2024 16:14:13 -0700 (PDT)
Received: from rohan.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9580bsm358117e87.34.2024.10.31.16.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 01:14:05 +0200
Subject: [PATCH i-g-t v3 1/2] tests/kms_properties: drop immutability
 checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-rework-imm-check-v3-1-707c290572c6@linaro.org>
References: <20241101-rework-imm-check-v3-0-707c290572c6@linaro.org>
In-Reply-To: <20241101-rework-imm-check-v3-0-707c290572c6@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6BgmgdWBrGGdEdduY5+9gDdmxOSI57DDFtnoiSWRtH4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJA8/jthKv1SzDq8ti93c34/rik75Iu72dJcNC
 bvzkPyNcO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQPPwAKCRCLPIo+Aiko
 1Q8qB/9AXqll+2qxZuJ9KUdMRPLAqJWJtcTyYP5bni7Y4E08+GBZY21+fIQvrE4fNmSrecy+lxq
 BmKfey9k/v8u/LnEPDz3WG4B0Y4Z4xyxMjQl9jOd9e3rHILDLOlNuy6ciXPn/aziwqO1g5mqOtV
 7OvCzBv199QOfS9Nhv24nGKCgd/M1PqkGvUOwi517+AW1ZRnvCbiDjI4v4EWmqgYrjoCe3+AB9Q
 H8WGoN31o3EnS0/B7ZKwYHmb7Exad65iTqHm8X2taLIXlctRGhDjhQkNaKTITjmntQpvrR7f+Wc
 kW6n9CKyQt+Q7DrJNSgxF9OAf0PAmmSSVVRY3uOh2/afhzd+
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

