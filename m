Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C25C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 18:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4BA10E0CE;
	Mon, 29 Jun 2026 18:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jo2c1KLk";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC4010E0CE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 18:00:29 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2c9e8a1d256so14893855ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782756029; x=1783360829; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zjrwFDzPBYkOX/sXhZPxsoWBKqYGq9guak0KvHYtr0s=;
 b=Jo2c1KLktJTgLa1BX/5MvZaYdgRBUXYmuAm7wvaVqFTQ+eA4lMWNAafrfIeCge3Q6Z
 8yeMUAVPRVx17kUBDS3xlxPwZv3A+5x+YhzB3+gGNxu4rv3tBTRXATfK5CCbHlIdxPcL
 dZI9n3DInzZ8k5400l81Y/7FfSAAgXlVU6r0+/vuxPecKRkgoo+E28jIGeH1qmdusSyE
 fMpfEPzQU/JEfXUM32xkRRvDD74jp1dNoWy2n3V/ioxH778GkkFLDWdTnbKw2XVUeetM
 yXwSlQR4FClJjMxBdOnNUoiSoBkU+v/+UAapd7KBAu7C44PBYHVcVp+j0U8i2JtfgLN2
 1Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782756029; x=1783360829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjrwFDzPBYkOX/sXhZPxsoWBKqYGq9guak0KvHYtr0s=;
 b=Qncpd+QAshjHCPpUsHMzb/7OWaWqJQlSPMVIliHQ+lNu4z9XN7KJiMt7tXISIN00lm
 uiOcu1/h+Bq9oAhsrEOVwVTiJQ+pyfxFzhY4eVPbVHuV83zPYtFV9/+UoxJmoD292E1P
 PTUckmxCcmNk9BbURzCYqubd+iQ0dWIAuk1FjdBysLHRw31F6MVgDp2mNn78IyfqVBG7
 qw17JAcRX4rs6H2XyzfRfNaJB7GyRb0PEQjzQgcKhLHrOwglHig1nnUWfQoaZOmp0Pfo
 GxSX/b9lCYIZ5NrbJMR0x/HjFpaIfAE9ednTQ6boUZXVhuemWXKXeU8sbqj+df3LgK+/
 Ggkg==
X-Gm-Message-State: AOJu0YyWjGQosUzbdhDNX1jg14KyS9TR7B5tHjEKSfkPpu9PMHj2P8zb
 Em6akQ7TSEtyJaFpv7YZ8YyWxEJrYVya5rx+4hVuHbiXWUfBF5t7uAfjtqcVIww2Gvo=
X-Gm-Gg: AfdE7cm2yT8luOA7C/bznu4Nh6G01MSWSRVXaEQbMxmQpcB4jDYYG/BYKakBPCgxB7G
 HKFEfurgidadq4KXXYmwNUQk9rSxL+5lN+s5y0V77fo4+aDn+KBDZwOH1b57chVFznBZIbL594K
 AThVzj/UAPkZM1ji19dDD49mzEJw7GgIidO5OoTU23Xb26PEU8eolON74m0PTk3atVT4e2VKUTZ
 W2vP1IUuoQ9Ki8Su/dr6Ei1LQNmAvE7hfK+8jcsv6MHE2KskLFajF9WEzRyonC/Mth6mS4P9au8
 mrb8FlXKGvapixsk15n5+aUV+n/UJYjjkNwI+xrWJTkwdj3ozHRnAyUaeZFrd3uzoaZw4iDusSl
 BaI0fOGtuQjrsaH8zlp/1wbZbfAp6O3XTPuMDH/JhTHRAjjQB6VvPZfgX2z8FmXkNToRCRV74T2
 n0jHsFwQYfJdmzpTT29+Tz7wB6Ksma+olW7Hn0yQ6Na7wevKZxELoFpiz4hyAPjw==
X-Received: by 2002:a17:903:15cf:b0:2ba:924b:3948 with SMTP id
 d9443c01a7336-2ca2d56494cmr3097665ad.15.1782756029218; 
 Mon, 29 Jun 2026 11:00:29 -0700 (PDT)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c9b43af119sm49682655ad.48.2026.06.29.11.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 11:00:28 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/4] Add maximum downscaling test on kms_plane_scaling
Date: Mon, 29 Jun 2026 20:59:59 +0300
Message-ID: <20260629180003.3215052-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These patches add maximum downscaling test to kms_plane_scaling. Idea
with these tests is to find maximum available downscaling via binary search
on given configuration. Once maximum usable downscaling ratio is known screen
correctness is verifiead using crc.

These patches add a lot of (dynamic) subtests due to testing against
horizontal/vertical/modifier/pixelformat. Have to see if pixelformats
should be inside same subtest.

This set still leave same binary search not done for upscaling tests which will
need to be added at a later time.

Also still missing from this set is special conditions like odd coordinates
for planar surfaces.

/Juha-Pekka

Juha-Pekka Heikkila (4):
  lib/igt_fb: add igt_format_get_subsampling() function
  tests/kms_plane_scaling: add search for scaling limit
  tests/kms_plane_scaling: add plane-downscale-max-crc subtest
  tests/kms_plane_scaling: change plane-downscale-max-crc to do
    variations

 lib/igt_fb.c              |  22 +++
 lib/igt_fb.h              |   1 +
 tests/kms_plane_scaling.c | 337 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 360 insertions(+)

-- 
2.43.0

