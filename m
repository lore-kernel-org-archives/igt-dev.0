Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FD9C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E061010FAD4;
	Tue, 30 Apr 2024 16:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nIsmQAkE";
	dkim-atps=neutral
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9C110FAD4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:45 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so26297541fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494583; x=1715099383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+09KMq5kfOsqxxq6c6meQp1CWpiCfDpdshZyKsH+MJo=;
 b=nIsmQAkEK9v8X2wLrw3HknNYkHLMyawZfBVEZMauXaXTyuUUOQGoiP5b37PuGtggWx
 gJg1UCk/3Qtgn5JZYpz93OPAzYBoHd8ZB0PmW0PGFBVaRQpB1LKjux1NTT4jA4vyHd2m
 Zx3Io1hGNLRLx6YXvtRoTEGa7ZpdtpxaK3OtF5y25g84jSXeccpcrghZUkwHcxJS5ghB
 oLqFVfXtSn1vJP8KFyeTSH3XH4dSgYYG2RkoYzjI3LnrsBrIpSSl48DB6K1hDf0FvJgr
 AMEwa80+YrIEFc73NNnV5SBJND7BE3Tf9Ij7fONHAKSaxZLq43rVEMBaX6loF2TALQ9L
 B69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494583; x=1715099383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+09KMq5kfOsqxxq6c6meQp1CWpiCfDpdshZyKsH+MJo=;
 b=wQKijs9b9z/LlQWfiesNeYCnpPMKkSrv2iY0+HDquxpfoZafpN/RLaBIIlU+xSId59
 R3kIDeNMKZsh/C6DN3RI/iQHIp27eWOS/QMbrqXMnOIcT8zem96y82NMXenTyX3CqV8y
 JiY5A6gOS3zn+xJJFSdtKHtsUmf3WxY6+YBBoiQtBpy59WQ1kBIej9F5sV69CFki2ENw
 4xBFeVtmUznGqVpnn25wjrx6E1mg89dR42Teo/aetbgmsC+eGAysvqfoZfOmG3xOwkD/
 HX4xNM2JFsxUkvTmR8S7hArwQbP+KV5cVUKODZ/wVd1fSrUfztgqM3DgHEGh1xjg1S1Z
 qwHQ==
X-Gm-Message-State: AOJu0YxCWPG9SPqtvpbGG9zptcjg1TdHoSbGCQjD/ScgDzKqx9inoPBz
 cTAyJ9vdsEtseKFfXWyaAuUPWTC6Q5wgntV7/grw9hXy+yXKZKC574/DtI9vYbU=
X-Google-Smtp-Source: AGHT+IFR73RtmnDFpludyp0wx1Tgwptgos7MTS+9SqFuLtYd1BxpKab+MVrzW4+ddVfAXnLWSeFITw==
X-Received: by 2002:a05:651c:4cd:b0:2dc:e3da:8025 with SMTP id
 e13-20020a05651c04cd00b002dce3da8025mr173285lji.36.1714494582577; 
 Tue, 30 Apr 2024 09:29:42 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:41 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 0/6] Intel blitter framebuffer copying sanitizing
Date: Tue, 30 Apr 2024 19:29:33 +0300
Message-Id: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
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

As is framebuffer blitter copying look messy, here tried to sort out that
mess a bit. On the same go try to fix mc ccs on xe for dg2 and and x-tile
for legacy blitter on xe.

Juha-Pekka Heikkila (6):
  lib/igt_fb: fix intel modifiers for fb copying on xe driver
  lib/igt_fb: make blt_compression_format function more readable
  lib/igt_fb: Sanitize blt_fb_init
  lib/igt_fb: separate intel blitter context setup from blitter function
  lib/igt_fb: put intel blt cleanup into its own function
  lib/igt_fb: unify intel blitter fb block copies between xe and i915

 lib/igt_fb.c | 372 +++++++++++++++++++++++++++++----------------------
 1 file changed, 210 insertions(+), 162 deletions(-)

-- 
2.25.1

