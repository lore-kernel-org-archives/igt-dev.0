Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A88D1BDE5
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1529F10E3DA;
	Mon,  4 Nov 2024 19:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzhcyoIU";
	dkim-atps=neutral
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3408710E3DA
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:40:43 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-720d14c8dbfso3467000b3a.0
 for <igt-dev@lists.freedesktop.org>; Mon, 04 Nov 2024 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730749242; x=1731354042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8n19EYsOvzQo6z7qNdyf1KJqL5mD/i4Pc3KFbWDJuDg=;
 b=TzhcyoIUYWKvnSoFPi9Jb99+SaEJMmu5/+KwuZK2NHv0Ukn7Qj1sGMu99OORIZGnu7
 0xV9XJx4rka9UWioGVzqPtcH5zMGLdwg77zUn+3gsnKtSDJGovA4Sls3+8NBBTWV7czR
 OyIZpG9KgVxsTx1L5SB17qtF+v5yiBYei4McNeIliV9W3ILsvB69AUJqaIiSweQi14T+
 rPMEMSXtpDP2BaNeRseeTgDVVswTiR/XltPXhfEAjQMNVJMV4cxoT+Qqd8a28TCB7qY5
 ij+9kxAqWn1TPU3JwfPYkuzxPuXfjhRF2OvDop4/7a5kcetws8UT4PEFuzmqWNoXB1fJ
 2FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730749242; x=1731354042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8n19EYsOvzQo6z7qNdyf1KJqL5mD/i4Pc3KFbWDJuDg=;
 b=VAM7OuvS8EUW8QOstDPCQN7B7zIgpcmG+Hjo0RhjYjWGMAEpKvTPuWNinyViUmb8Q0
 NJQ38lk0UMNGmG/gMyPk3TA8HZtL70KL4Ip4Ilk+rA0jIyCVZ4c4oCgBGJbjGSMUiIw6
 QDky3easZNZMs1xkEg+TizGNed5iJeJqJuzDTrIG1RXTPBZ1BwsNA2NF6W44fm/Bt9xK
 uVQPSPLf/q7xUtE7EB/qiIpAu31oOs0scsYUQnEz0vvI6moyexQNjS44H6QyTuJaTXPx
 q50xbeu4oOkgtD+tXRyNESuVTuDvrcsETmVI6/nVf9+VlEa875ZHCeH9iEcv/NH5z5m0
 Exbg==
X-Gm-Message-State: AOJu0YxdBL5+jjF71IuHCxdCXcClbC2tplFpz8ZN3CkMlq+DALe1oLq7
 WmEoEZc8NXAR9GUhAAGiai+D7K9Ia8EuTPDa0Yl5bSnxyp67lmuGrITxEOg+ucg=
X-Google-Smtp-Source: AGHT+IHm6ijlXRKB7u0X4gR+Nhz7MW2PlmcR+NocxUF1NL12YvNKdAV9/s1T7uTOVUYZmKmhiMmUYA==
X-Received: by 2002:a05:6a20:748c:b0:1db:e4c3:99f0 with SMTP id
 adf61e73a8af0-1dbe4c39a83mr3029764637.32.1730749242401; 
 Mon, 04 Nov 2024 11:40:42 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-720bc2c58f7sm8169991b3a.140.2024.11.04.11.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 11:40:42 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_rotation_crc: Intel display version 20
 onwards doesn't do hflip with tile4
Date: Mon,  4 Nov 2024 21:44:15 +0200
Message-ID: <20241104194415.563277-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
References: <20241104194415.563277-1-juhapekka.heikkila@gmail.com>
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

On Intel display version 20 Tile4 no longer can be used with horizontal
flip.

Bspec: 69853

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_rotation_crc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index e8b6e4ff2..22fb5383b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -577,6 +577,13 @@ static bool plane_rotation_requirements(data_t *data, igt_plane_t *plane)
 	    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X)))
 		return false;
 
+	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
+	if (!(!is_intel_device(data->gfx_fd) ||
+	    intel_display_ver(data->devid) < 20 ||
+	    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
+	    data->rotation & IGT_REFLECT_X)))
+		return false;
+
 	return true;
 }
 
-- 
2.45.2

