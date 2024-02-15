Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF776C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160210E3C1;
	Thu, 15 Feb 2024 22:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dtPxcL9n";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF1710E3C1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:21:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1d8da50bffaso8418815ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035672; x=1708640472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NwsHbB0fgpRWLuK++1DxIkTO2IdLyZm3rW/pHIPvVo=;
 b=dtPxcL9n4Tlsl2oGr2sU4wrbWna/YYed+kLatCIwVn0eaJoGNb2nlJuXEHwsWSmn+5
 eaEp1pJzqkGhaGs4Xe74BPRjDSXTaQL8r5V1Ffms0n8Cw9Y4CczoRoi8oES/jQ9B/LnN
 S5wAZhMcyhX580dbcXprpQnYUXc1k744DXWTQD7F/WgLlQ6c5zrEN92XaVvc3Mk5K0W4
 f0iC7vgfaChk9Re1dHv1EcQLaklW54FSwXd8s4i06ZUaoKzTnbo0BjL2NPNf8adOWcWg
 cgvQoa+I1PYifJn9LUuIk0gLFOuBWPF+yaUQBKoFP53w0MHOxWzw+ePRmDkmSx0u+R41
 Kb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035672; x=1708640472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NwsHbB0fgpRWLuK++1DxIkTO2IdLyZm3rW/pHIPvVo=;
 b=eoxtyBTDacghfmRhRjgS+7nRCNKvFv5snLp+ryt/vFN1zToN8aiq59lEd3feh0ztvc
 GmgORzrBeJrBEJySMKnYQEZJwFI/SxtX1A7zCW7T32O/YmsHwXpTRZlaOGUCQMvQRxCd
 T2QmBlL4aGk1M9mw7Wa8U6gjncuKTy/U6K2hmCOXYJt6uoNkEhWh7USQhhHKOeUphnwV
 4N3wI8T540CwXqn93P4kfaJrLrCToZAshHPPyhYrJWc0YF1SAnJlrQrssiDbu3XlejXZ
 G0kV9BDxerlsnx6IWBgTntgqOPU0nILcv/m1DWucCdyzsNx264QUR5G7Il0F70AqA7oX
 B4xw==
X-Gm-Message-State: AOJu0YwBcD7ev8IJTcXczZPlKoxV/J2Tr801Hmw/82u4yxmFHGITEXeT
 gOAA01Mroh6fADyF+08kVy6cCvsSvVNd798ZP5QrOpY2YOYs2mywNddtWNfX
X-Google-Smtp-Source: AGHT+IEGi6Y8hF92O7p3K3vvOUXrVmeCm7T+oNuY2fTpFE5g1+FDCfoMo2pOilW/G97VDneDFHXUvA==
X-Received: by 2002:a17:903:2442:b0:1da:2a64:bbd3 with SMTP id
 l2-20020a170903244200b001da2a64bbd3mr3473377pls.12.1708035672383; 
 Thu, 15 Feb 2024 14:21:12 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170903014b00b001d9b749d281sm1745816plc.53.2024.02.15.14.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:21:11 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t 2/2] tests/kms_plane_scaling: msm get_num_scalars()
 support
Date: Thu, 15 Feb 2024 14:21:05 -0800
Message-ID: <20240215222105.327820-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215222105.327820-1-robdclark@gmail.com>
References: <20240215222105.327820-1-robdclark@gmail.com>
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
index 899b3a5001c4..04526b2a5313 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6365,6 +6365,25 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
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
2.43.0

