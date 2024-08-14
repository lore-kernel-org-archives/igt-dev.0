Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE29C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 18:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1285110E519;
	Wed, 14 Aug 2024 18:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dM364rdW";
	dkim-atps=neutral
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BD10E519
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 18:53:57 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7c1f480593bso207622a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723661636; x=1724266436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAchDQhJNE6ZycJRGPI+WkavjvqpcSl5FVRhlm6e93c=;
 b=dM364rdWeYouxMrWh0ENLh/FNLQ/Ec4KIR4Ha6n/slXboXV+FzmB1XnaFyn0gJEbAT
 gMpw53C9DpN/IP4UbufsO/nf2vbJRsJBxaw0N+tvaV5VCUHSDe9Rhp15H8A7WBKwSWry
 O5x99NhHTl65kmb+4b8qD1giAenBQcIUU4heZCG3S9z9qyCR1tuuAym1o0fijyXrGOND
 mC47Zx80EKkMHv6RNswBSIVSvFBUrrRy1r96EBs7730DDngsSefUiqZIkkffaSdNb0ne
 rSmVnBgOWegQeuPVXye/NCk4eGd6gAlR+D7d6SG3TNScHlvL6nO7T28BjVv6xWhwc/JK
 IbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723661636; x=1724266436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAchDQhJNE6ZycJRGPI+WkavjvqpcSl5FVRhlm6e93c=;
 b=KvHNfwCD6HqigA4+pbjCErxD2QMfZXmfSYsKBWdgTDEsyzCwrXG+VvhaUMLLb4oRld
 Exl0Y8jcohElA9R+XQaEeCKF7o9322Y+VpMMAxFl5OzmcWL1j6VnXnJdRvWCR8e1c9SA
 dYSkBwJjkaUv+1FW/rLbFEWnNRvZsl0tLIcTENk2GwwNWo5KMLlM56FrRTa2xuzmstNN
 KhQoBOfCH+XScPBrVyA5Td48Sx6JX4Td0mJ5QKecwe/nvh6+t3/Tuwv19crzaFoU/aTB
 Oc3J2Dvlbk5iyZIhSPkw/9BblgOt39/H9chMswmlEjxyAf1AFmoNkRqmR6jgHx69+/Rt
 hwqg==
X-Gm-Message-State: AOJu0Yw5+kUo1cp7vwQW226nb0+lEoyAr3WxvVBz958bb0LvuOeZU9bz
 7rEye0wVVwn4AyO/WzYvyioH52C90a2GQnmW9tTwlisCVZIVy4/T/mr4yg==
X-Google-Smtp-Source: AGHT+IFpohztLtzYOCXM56SCMtGe9pej5dKo8eX0Mtot/xx62iBeft+g+f/hNQWFtVOIFtIX7rT+Wg==
X-Received: by 2002:a17:90b:4a47:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2d3aab606acmr4209901a91.34.1723661636343; 
 Wed, 14 Aug 2024 11:53:56 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3c3cdbabasm192396a91.46.2024.08.14.11.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:53:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] tests/kms_plane_scaling: msm get_num_scalars() support
Date: Wed, 14 Aug 2024 11:53:39 -0700
Message-ID: <20240814185339.70097-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814185339.70097-1-robdclark@gmail.com>
References: <20240814185339.70097-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

This may undercount # of scalars on hw with rgb pipes, but the scaling
on yuv and rgb pipes is functionally equivalent, so for test coverage
this is a good enough approximation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99cdeeb76033..dd530dbabf89 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6682,6 +6682,25 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
 			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
 		}
+	} else if (is_msm_device(drm_fd)) {
+		igt_plane_t *plane;
+
+		/*
+		 * msm devices have dma pipes (no csc, no scaling), rgb
+		 * pipes (no csc, has scaling), and vid pipes (has csc,
+		 * has scaling), but not all devices have rgb pipes.
+		 * We can use the # of pipes that support YUV formats
+		 * as a rough approximation of the # of scalars.. it may
+		 * undercount on some hw, but it will not overcount
+		 */
+		for_each_plane_on_pipe(display, pipe, plane) {
+			for (unsigned i = 0; i < plane->format_mod_count; i++) {
+				if (igt_format_is_yuv(plane->formats[i])) {
+					num_scalers++;
+					break;
+				}
+			}
+		}
 	}
 
 	return num_scalers;
-- 
2.46.0

