Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AED7C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E4C10E366;
	Mon, 19 Aug 2024 20:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZcMu8LCb";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04DA10E366
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:25:53 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2023dd9b86aso10938055ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724099153; x=1724703953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnCbDai47lL8Co9wXQmf8akv3y3DX4iye8KwOkBs8qs=;
 b=ZcMu8LCbWSuJP49gTl0uLk6vucuO4r2lR6G0xmQ+TcAYbhSZtH2chvB/q0JEj/zFF6
 vdtp2BHI28+7NEJLe1tdAU2ORESKVbbnImSTjq3j8FxWBq6JnjFRoOoUBuZmWY/pPMaT
 sqYtEcVTFljsqIVUVcPX5wTqNakUzYGMcbEBClKDOpxnhEHb80KEk2NyhmuhD6wwfvpc
 KwVhtGQBH1sogWTNmvqc/neNybZS+YLq9FWR4PJjcR7/8/JipnF8NGprXgoQeSWvCONc
 33AS2revd0j53cU4jHtun3yLUmSP0ySlK1QdjkXXNPE1zRk82ATSltNBoWnrYokMPzQH
 7IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724099153; x=1724703953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnCbDai47lL8Co9wXQmf8akv3y3DX4iye8KwOkBs8qs=;
 b=JLH+j/BwW3GWtzHxQPG6M/1AYdFPu6hg8bCOmT2ecAwPEtDEGtSHEWe36aN7CXnk2h
 8fvQviLdMCID4AW90nmCGruRiAyqZ2Q+VRPojkwW3begGN3guIJXGs43DzQdSEN25u4x
 ZkpDgNHowmAOtQ3xMk4kcyfzAfBug/vIcoQE4WB23WC9mlL7e6XPPdu7z3FNbjYAn1Gu
 Lvz/4H6EuX6Uu4RKCc84vH0NuTxCjgDmErhzQpnXqvMBw9MTh3uRJqlj9bb+oW1ejJ5/
 4zqIqt0lgqxzZ+QQrXfuJteGcl8W5ZEADRPLNnJQVrKzfX2xjAZgcIYXPkS1OVuz0gpH
 WGOw==
X-Gm-Message-State: AOJu0YzCU9mKtmOjX675d8rkuLxvVYbHBn5Q+wweklr3XkNliZgesmOr
 MltYVdnk05ckPms8fGdQPkar6RlaMUQhgqdDbCvVdfaRZuAfz4s76YLaZg==
X-Google-Smtp-Source: AGHT+IF04CoKPwH84EjO8apqxzD/7SHQLx2/v4Lx4Uoyqabzx8uqa2uNZ59dmIUD9RUAgCuL129KRw==
X-Received: by 2002:a17:90a:ca89:b0:2d3:b49f:acd0 with SMTP id
 98e67ed59e1d1-2d3dfd8d3e0mr10580514a91.20.1724099152344; 
 Mon, 19 Aug 2024 13:25:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e2b64e7bsm7712474a91.9.2024.08.19.13.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 13:25:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] tests/kms_plane_scaling: Improve msm support
Date: Mon, 19 Aug 2024 13:25:46 -0700
Message-ID: <20240819202546.111243-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819202546.111243-1-robdclark@gmail.com>
References: <20240819202546.111243-1-robdclark@gmail.com>
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

This may undercount number of scalars on hw with rgb pipes, but the
 scaling on yuv and rgb pipes is functionally equivalent, so for test
coverage this is a good enough approximation.

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

