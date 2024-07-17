Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FEFC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54D810E170;
	Wed, 17 Jul 2024 14:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pc5fstGj";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291BF10E170
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:40:06 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so94112621fa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721227204; x=1721832004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=csaJTB+KgYrJFY9tryCzMEfNbdkd9RlV7Kw272S9qao=;
 b=Pc5fstGj861zicsX0qXBBRim+s+5y12F98Ji/JtRc+QLwRJV6OtF99xahFkrxGTXVv
 WKrDrjtZct4qItsfttDx1nOwTbII2n8Ee6sYwAYIglyo12g0FcPoyjfqZCfwM361Pj4t
 WzjRJ/ovZgSPc9c4MU3x7rc6jAK0GrBeQMvpxMloIXhwOCbxWtsTFibAeAsfwUd9OXp8
 lEuGAuZ+eW6r6MeaxXDG4iySH9ogL9DMPTN9BalUK+mho5Y4EZ6owm4u5WwkJyya77FF
 qY7IlMcqmQEtwo57VRg1RutEJwRVR1ZThP+ivRGnxDS6yNjQbIlRq3d/0Bl1Q3Xulu5w
 O9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721227204; x=1721832004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=csaJTB+KgYrJFY9tryCzMEfNbdkd9RlV7Kw272S9qao=;
 b=IkRAjO2GrwsgfXNkUQG6l3nwVjz3F+S+A9t010k26zJsS8AZjNpeIulgbVyhu0MYI9
 eIAySIpa9BOvWw5IGDKMeLo/LfM0DT983tSVBGBuLoosplwTJHsosvhA1mUs4LjNMLhL
 Ol5NDk6QnGY0QpBxMjuJOwJ56XbKUPbz8Lw/VWCvdiAKVGQfx6ib45VDCKQ71eK0zND/
 VybCAyHj4lXAv74/05Wuar2NZ8D2anmuQjmKw+yp5dMWIZGcXv+Qg2+OjJVzrCe/I5EP
 dkLVuGxp96pH/00EYLe5zJvog07HCOiKAacVHFRbP57v643LJZMJarofKgMABQq63jAH
 Qrnw==
X-Gm-Message-State: AOJu0YyNCzwjc6f/mj2TdzpSPVZcbbNvSehDAOpGI5cIR6AYk+eJgxKk
 LLatAQIbPGwVN9MbfcejnrSoWZn5afJpA37ZFziAKGUcY5kRmDZTwjIfoqbGC+iGNJu9A6RjEBn
 Z
X-Google-Smtp-Source: AGHT+IEt76JHGmUBKQfO+K9z4NO5uWjfNyAgT5DfCps1WW0SftQgZXxWfNMNtZnTeSJYNE6sVjWCKQ==
X-Received: by 2002:a2e:9bd0:0:b0:2ec:558d:4e0a with SMTP id
 38308e7fff4ca-2eefd0b4575mr17167511fa.19.1721227203829; 
 Wed, 17 Jul 2024 07:40:03 -0700 (PDT)
Received: from rohan.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eee18bebc5sm14857491fa.66.2024.07.17.07.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 07:40:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_properties: drop immutability checks
Date: Wed, 17 Jul 2024 17:39:47 +0300
Message-ID: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Drop the single-value-is-immutable tests.

Fixes: 29ae12bd764e ("tests/kms_properties: Validate properties harder")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 tests/kms_properties.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index c0e5be1c90a8..c41b88bef76f 100644
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
2.43.0

