Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18B8EED60E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C15A10EBAE;
	Thu, 12 Sep 2024 14:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGNUVhY+";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4D210EBAE
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:42:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-206aee4073cso11743575ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726152175; x=1726756975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TK+pJ0xYqG2Dd7Bva3XD6CBGQ7LutlP/WZrrtc6tPW0=;
 b=MGNUVhY+N6iymKxpdhUV1DJOneoEJOYsRXN4khC403zd4ZPAc5JAw9M6LwWmbEnXKd
 equfTGUkoZjjg9cGJawnzNpvc8dmD7q0CIsah/v5HqfjTyh4XkumJjUWGa5k5NKGNrm6
 LHwdIUl0dzSMbeFzqAYGILMFQ4hnJ5PR9V4uBtPpWkvoZhmju0x5HjhI/wWIBnEmQ9Xl
 tqiFFftTBO9veE2gFR0xSBlhEOLhMEg7zDwXe9T/wdR1rj0YGV8kynE+1AJRjf5XJJAF
 g57Lx/KX9Tp41n7RcCBsZj71wHqEGKa1Ny2ir49H3mIuy5wWncclB6GHJXrHfULcY+cg
 bneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726152175; x=1726756975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TK+pJ0xYqG2Dd7Bva3XD6CBGQ7LutlP/WZrrtc6tPW0=;
 b=qE5N4WFkW3dSIUcQB/R8HjE6s8qGf3vr7ilk2qZh4UK1Ds4WIdYdkLZyRdO0wmdlDY
 4G1ds6MpD6CSFF/rZASDR3cXW4lkFXlJDLZpA8R9rO+IawocMFOwVtEpgjtHKNsCJG1/
 D46BTR4GvNpvsslm2+7lJhoRmVdNXlTjeJH/YRExG6CZXTy6kVfkuxGI+WRkX4IYoyp1
 13HUQiaoE2bo/4zegn0a7pT5hnIR6uds3DTbcz1w6bd44mr8YgWf9uek1QCE7fTlva8d
 Z0t8Iw23VpozqHFFk1D1d7P6+N9qVRqv/OpPeLj9JKje0C1WFNa6XmP6aMXrOD08HHxX
 X82A==
X-Gm-Message-State: AOJu0Yz7M/JEIOaUMQNPPij2SGD/YnhETdmmoqcm4TU+edxoT2DdbOAB
 SDZD53/2KdCtnF46B4CFV+tZ0ei1MFM2pb9sw1cLcXqp7i3cz6Yrlxi7ODT2
X-Google-Smtp-Source: AGHT+IHPQxaR4A97+wOmG9pfwagi0KQ2KnfGl/nvP2UcmWcCPff5aFwAdLhgKpi5A9ZkBoCT7PoV/A==
X-Received: by 2002:a17:902:e810:b0:202:60e:7700 with SMTP id
 d9443c01a7336-2076e30a90fmr53939385ad.7.1726152174835; 
 Thu, 12 Sep 2024 07:42:54 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2077891afeesm9474195ad.141.2024.09.12.07.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 07:42:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/kms_rotation_crc: Intel Xe2 cannot do hflip with
 tile4
Date: Thu, 12 Sep 2024 17:46:45 +0300
Message-ID: <20240912144645.862462-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

On Intel Xe2 hw Tile4 no longer can be used with horizontal flip on display.
bspec 69853

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8d8c53b5f..3e9190590 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -639,6 +639,12 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			    !IS_CHERRYVIEW(data->devid) ||
 			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
 
+		/* Intel Xe2 onwards cannot do reflect tile4 */
+		igt_require(!is_intel_device(data->gfx_fd) ||
+			    intel_gen(data->devid) < 20 ||
+			    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
+			    data->rotation&IGT_REFLECT_X));
+
 		prepare_crtc(data, output, pipe, plane, true);
 
 		for (i = 0; i < num_rectangle_types; i++) {
-- 
2.45.2

