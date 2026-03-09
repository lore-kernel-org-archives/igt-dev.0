Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6BBFCA19D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 22:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BC910E5A8;
	Mon,  9 Mar 2026 22:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="MNBqIzmY";
	dkim-atps=neutral
Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com
 [209.85.219.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0203510E5A8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 22:38:33 +0000 (UTC)
Received: by mail-qv1-f99.google.com with SMTP id
 6a1803df08f44-899fbf92bdbso117506526d6.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Mar 2026 15:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773095913; x=1773700713;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:dkim-signature:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=geq5JxL9ilwsdB4dsE0t9icAPlIeHVaBAUJjYiG+tps=;
 b=cERLmmxFDuuELPxPQJcPbL8pH/0JHoMXDV5ikDGWcRjQG7Wp5igVtB3Hckow9k0R1I
 pL/LEjiI7xb6ol5q6kuDWU6w5xRld5ppWCSk+nWU3OOA+w2RVscH3245fiHU8oICRn1G
 AHN5xqm2jfzUhfiAYWbAjkYphFb7qT6Z47RwlaPnF1ne4zYYP0EISB+u3eN7yIni9g9m
 eLl4s0Te5ngnmjvA99dedU0GN8EpotzOcR2RuiKgzR5LUxh/cfMTP1z7hL3o8dvefrJl
 YVc7NaSrhgukesSNiQZDnL0oQUk6XdA8Bq/mw7raFbE+00NH3q0GjR8iirzYqOA/X3VY
 cccQ==
X-Gm-Message-State: AOJu0YwFfTDBr+11IyRtlBxW+l6BZHkg3gozQ5PS1vVpcrDyNGpUP2C1
 9YcAD79uqBOmS9PWcnJFxYOJI+PrYbiBCMiFkeNpdxuSP1ckOFH+lfRsTHaOckg5klqBQWdnT0Y
 0EnS/kmZiUaf6uyuoY3/GY92kSX94f8oaO/25MOc4ieAW4BuZWQKxn6pkoP2GAG7ihsnEKWrn6r
 xwg8cHZL2TmoNFheLO7GOH3mZfJrXBZy6jGlDE6zlHrHz4aBdYeE1fst90w3ACDG9I/0h/qmEMY
 0519UxdRvnPv/Ac8RSGcHmXmA==
X-Gm-Gg: ATEYQzxg035fkdeMmieGGsdA8dHkY0mSPXwhnAf90oJpsaeGBjk8jPQvCnQOLqq5MDr
 3+EaB2AUCiXivBCkuBxyOlECYZHD/RfsTodprjNkNNqXYhi3rtrFFnTSjyMY541Le9qLoLE/66a
 7M0IZIbeNRqN6Hqi6wN5ZxRvLB4JrTAZRdHz6uLuhP81U0hXvp84Cw7xeMN3bfc8T0jAkUnT7eo
 i2WIm6DeDNtJ00CAhQ7yCyRAoRX7LGv93QEql0r4K7DdUS/lnc1WGOvZmZYo91YVCvoVZo/gq3a
 5IohFva5iGYKj7ZZ+d3u/evZU6zrh+GM57gihC8kRT8IzP03xVxIghbJBk4Z/C695Ro/mY+Gf2Q
 yWT0EmHjea3R82eY/4WK58r2A93T/VQ4fSueSp9yRxyzORcdcT3MwHBWhFv48JjWMef4/BMEvp0
 NaCZOVHzTFvZ6mlnMEm0fep6tL+L8AhSS+WNqSErG3NG3YQLZHA4b0dcds59pYXg==
X-Received: by 2002:ad4:5ba8:0:b0:89a:110f:894e with SMTP id
 6a1803df08f44-89a30a20fcbmr196471986d6.5.1773095912586; 
 Mon, 09 Mar 2026 15:38:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-89a57a15027sm1101626d6.11.2026.03.09.15.38.32
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Mar 2026 15:38:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-128d0a51897so69999049c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Mar 2026 15:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1773095911; x=1773700711;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=geq5JxL9ilwsdB4dsE0t9icAPlIeHVaBAUJjYiG+tps=;
 b=MNBqIzmYONOhj1l3fFz32XElUP9/z4HYxX7XEpCAgudbuxEv+viA7ji3j9lvkqbkJh
 qSR47MbPPpZXa1SbJrj3SS9VaMB++gN64Za4HxKD3IkPlA+yDMBIo+sYuOtvnlnPzGr5
 eX5iTu2m9Pj4N+gSYq9MinL7blFbuhevBefBw=
X-Received: by 2002:a05:7022:60aa:b0:128:d20a:2f3d with SMTP id
 a92af1059eb24-128d20a3b2amr3421981c88.4.1773095910764; 
 Mon, 09 Mar 2026 15:38:30 -0700 (PDT)
X-Received: by 2002:a05:7022:60aa:b0:128:d20a:2f3d with SMTP id
 a92af1059eb24-128d20a3b2amr3421973c88.4.1773095910029; 
 Mon, 09 Mar 2026 15:38:30 -0700 (PDT)
Received: from mombasawalam-Precision-5820-Tower.cap.broadcom.net
 ([192.19.50.250]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128dd22196fsm2449907c88.15.2026.03.09.15.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 15:38:29 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, zack.rusin@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH] lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create.
Date: Mon,  9 Mar 2026 15:39:37 -0700
Message-ID: <20260309223937.1581808-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

vmw_ioctl_buffer_create() may be called with a null mob, and this
causes a null dereference when trying to get the buffer handle.
In the case of a null mob, pass an invalid buffer handle instead,
and the kernel will create a backing mob for the surface object
when we call surface create ioctl.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 lib/igt_vmwgfx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index 94d255655..6d021045a 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -415,9 +415,10 @@ struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
 					    uint32_t size, struct vmw_mob *mob)
 {
 	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
+	const uint32_t buffer_handle = mob ? mob->handle : SVGA3D_INVALID_ID;
 
 	return vmw_create_surface_simple(fd, flags, SVGA3D_BUFFER, surface_size,
-					 mob->handle);
+					 buffer_handle);
 }
 
 /**
-- 
2.53.0

