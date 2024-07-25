Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B78FC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 18:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93C010E8B6;
	Thu, 25 Jul 2024 18:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="filuXC01";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FBC10E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 18:13:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fd640a6454so11976855ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721931192; x=1722535992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SN3qkQrzEE17+7Qww+ZMif0+Jh2O/Hxm6mNn/pxzolg=;
 b=filuXC01jaK+p4ALdU9tPrnZDl9KUi+ZTgSnzTF0xTtBa4PMR88mH0Tcgs+MuTkrpe
 IqCQpFKNDnQa2hJX+lt3tb+3UJpXZOjFIxLkXa/JrLyNJUAf0sMc1xndxpixUIL4K9jQ
 bI2A8mCKg3+72JR6oZwddCPS/r98G+y+vAGgW+P/MHwHeRNwaZbFrnhgkDSXmUNWlDOJ
 ONl+f1SWQUs+6Sh6KkANsHBseJLCI3CLCqkMWJ2dlsPqCVpNBuf0F9iQu4jvl28xc3cg
 YyokNgfOXxxR0RZATPsvfhh1m9YpR3r+ajPopSKZN5q7nvaQAeUniOiN20SWuJrc7I32
 wPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721931192; x=1722535992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SN3qkQrzEE17+7Qww+ZMif0+Jh2O/Hxm6mNn/pxzolg=;
 b=X48AWEFm25eMrsMSBCpBvXC8dPxwfotFcGkKUdAn2D9U6uNMq0j85cy4MpnBuB5g/r
 izCeUlabmpG3uzchGwkkyW13B52TiAgKoMny8Bh5IVQfHxekhGIkQ37RbavxCHTl31qS
 1QmIIyJyUfmnQhFFrFKiH+TwJRqyxeRaAiU7XZNRwyKOETUm2gtASxoR18ZfwZcfbU1w
 pYbPhUe21hWulE61L4926pRXqwxhJEaWf+luBfHRXSNFpK9Hv5zzfU3IdRNXF3jFr/LW
 KeLwIKiZVaHVdqwfGaLQ+xnaFgbzcafLb+7axBhxS8fbj7M61XqPCaw7u0zpp1QePzra
 f3Tg==
X-Gm-Message-State: AOJu0YyEUjqu51yKU7nDw3B+BiJQEGy6URWROnscjNtzvN1LWjrQ8PYe
 Rw7ZVFJNqzFrc03vb2RDpjCJtxE2jWiw0KewiG7loUhuAd5bqeTmi4PN2Bac
X-Google-Smtp-Source: AGHT+IGV4u6N53FWHhEmb2J7vE+HuL366XqIcLr6H1y3Twmk8phBN/CEkGmdsVZBIfLKeUCC8Q1H+Q==
X-Received: by 2002:a17:902:ec83:b0:1fb:3b61:45aa with SMTP id
 d9443c01a7336-1fed3adf430mr46307115ad.40.1721931192329; 
 Thu, 25 Jul 2024 11:13:12 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7c88a44sm17284265ad.17.2024.07.25.11.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:13:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] Add I915_FORMAT_MOD_4_TILED_XE2_CCS modifier for
 Intel hw
Date: Thu, 25 Jul 2024 21:16:19 +0300
Message-ID: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
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

Here is added support for I915_FORMAT_MOD_4_TILED_XE2_CCS framebuffer modifier

Juha-Pekka Heikkila (3):
  Ignore. This patch need to be recreated later on
  lib/igt_fb: add I915_FORMAT_MOD_4_TILED_XE2_CCS modifier support
  tests/intel/kms_ccs: Add testing for I915_FORMAT_MOD_4_TILED_XE2_CCS

 include/drm-uapi/drm_fourcc.h | 44 ++++++++++++++++++++++++++++++-----
 lib/igt_fb.c                  | 11 +++++++--
 tests/intel/kms_ccs.c         |  8 +++----
 3 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.43.2

