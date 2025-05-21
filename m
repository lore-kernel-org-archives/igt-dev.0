Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C27BC3ABC9
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA411B64C;
	Wed, 21 May 2025 12:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftXFR4jy";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49E311B604
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:17:12 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-233b1e4376fso10580935ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747829832; x=1748434632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fBP1yiSXof3Oik6w/2FkBPIDx5Pf+JpPwaJo8Mq2JeY=;
 b=ftXFR4jycN7YvLi+9KYuWl0LAd/Sp2zIAtx3mlpGjP//pbLGTzgtO703HsZ7YqRyGH
 LkltgqbKSsEAXLKmxVPeoo2+dNbcwquSLLVayRKQ7P+kfQdfQjoMoZPv2Nr9j26Ka0hd
 D2mwG8UWDKQF0ICn2F0blN5eJtZDE/BBf1uMx9478z59x6actCTShjn5emImW1Ub1FmD
 nB33rIPR2LGEk9ymO3922BLDs8jmlxd8leUyEktsDzXhPbC4/6GxIy6XTr7tTE5SscpK
 QUyqoObdMBzT/DfEwqzesHftGZK/YmWfBw/lHfabTXBEGrCj0cj70di4PJhSQeZtyrJz
 jr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747829832; x=1748434632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fBP1yiSXof3Oik6w/2FkBPIDx5Pf+JpPwaJo8Mq2JeY=;
 b=ft9fOUWbQ46wrBv2iiY87zN/8Hu9iRN3wJb01/bVlDXuGkIdkodVsmHYCjoBTqqIbf
 zCc40bkS7KBC1aE9eJbezyPGyrNFU7vj7izFoLhT+v1fSChv43himOkPduHP35ES6HG/
 vnoBx9AFHyYfL8qS6IJ5juYrFuI7ZnMYQ3dBdxsY9HEk4m0YG7Nb4hqbO5UskPTo63AB
 L9tgukyZDfOyEZ9XrRBZAqISXHBkAsx6BDjQ+sUXljuCrESRqcsEuWvIyvZdq7ksiYFk
 C5Nx6F6se0P7owZCoRHFXJdJmbeol1UuWBTwPH3n+jiGZH+t3cPA/pU8aVbZu6Imoh6m
 V1pA==
X-Gm-Message-State: AOJu0Yw9S8B3KEZ5B/v2n2V5DmXuW8hnz2wrS0OVldvLElFIbyi1bRPv
 Dcm7Brd37w0IyuyJ1RNxnlVib8zhu7lfBdMokpdruE5k0t6qVAkBe8fzUITAL0lGGxA=
X-Gm-Gg: ASbGncvy9rSse4hg9VJQVVcnmldqJGbK0gZIE6zQhNubZXb3I0qc7RjmJXXoLjMDk8F
 CmJFjJJj3JXTB3Ovb68AzoUYy5pT1VWGh3/FJvTeTL2Q+LzyzLzvz3Wc1BhF/YDlt1bW/zsDa6i
 ggn9qRrvJNi012hK0AmrnjLCkvJmO77rIPu/TSsOkSMmE19MpCVuH/toaZA8asNoX5JeLFR87Yx
 0ceLqgNN+/AAGvnmnt5OjfUWWqvldL1i9CeRa0v3pZkO4+oTqcWvRj03si9UKSNjhoR1tJriDyT
 /9Vtvv+AAcKlBfw3uccuPYq+oUrxudXocI/w2B1GYmv0z53yuPg1sw0Czsk=
X-Google-Smtp-Source: AGHT+IE693i1pGnCwAx5IvZ3UacvvyTbJRYhHCZtSYOaKDBNavsLSkWS2fXae6+lyvYLDnpgWWtorg==
X-Received: by 2002:a17:903:2345:b0:22e:1a41:a6de with SMTP id
 d9443c01a7336-231d452d109mr311238135ad.32.1747829831663; 
 Wed, 21 May 2025 05:17:11 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231daf86774sm90338565ad.103.2025.05.21.05.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:17:11 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/2] tests/kms_plane: Print out tested formats
Date: Wed, 21 May 2025 15:16:40 +0300
Message-ID: <20250521121641.32384-1-juhapekka.heikkila@gmail.com>
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

Earlier tested pixel formats were moved from igt_info to igt_debug,
let's put igt_info back in place so it's easier for debug time to see
what's going on.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d08ec81e4..2831b2d18 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -887,9 +887,9 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-		  kmstest_pipe_name(pipe), plane->index);
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		 kmstest_pipe_name(pipe), plane->index);
 
 	return test_format_plane_colors(data, pipe, plane,
 					format, modifier,
@@ -925,13 +925,13 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
-				" (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
-				IGT_MODIFIER_ARGS(modifier),
-				igt_color_encoding_to_str(e),
-				igt_color_range_to_str(r),
-				kmstest_pipe_name(pipe),
-				plane->index);
+			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
+				 " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
+				 IGT_MODIFIER_ARGS(modifier),
+				 igt_color_encoding_to_str(e),
+				 igt_color_range_to_str(r),
+				 kmstest_pipe_name(pipe),
+				 plane->index);
 
 			result &= test_format_plane_colors(data, pipe, plane,
 							   format, modifier,
@@ -1073,9 +1073,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		  IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
-		  kmstest_pipe_name(pipe), plane->index);
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+		 kmstest_pipe_name(pipe), plane->index);
 
 	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
 
@@ -1107,12 +1107,12 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			continue;
 
 		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
-			igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
-				  IGT_MODIFIER_FMT " on %s.%u\n",
-				  IGT_FORMAT_ARGS(f.format),
-				  IGT_MODIFIER_ARGS(f.modifier),
-				  kmstest_pipe_name(pipe),
-				  plane->index);
+			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier "
+				 IGT_MODIFIER_FMT " on %s.%u\n",
+				 IGT_FORMAT_ARGS(f.format),
+				 IGT_MODIFIER_ARGS(f.modifier),
+				 kmstest_pipe_name(pipe),
+				 plane->index);
 			continue;
 		}
 
-- 
2.45.2

