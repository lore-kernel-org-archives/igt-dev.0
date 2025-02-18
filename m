Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B357C021BB
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264D10E7CA;
	Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zszrkt0G";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1934A10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:17 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3231989f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897415; x=1740502215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMnEyXGGJ3hdF0LnT2TQ09SgsTKrvsYugzpdN+NvrWU=;
 b=Zszrkt0GEhlva/IVDPvVK6q7yJhTvQDCvuJxBlxNKkFyErrK7t1rr1pDThVUGwkqhE
 YuYsN1nuSkA/4WWJc0pnrVAwsDqmejmxD2IZlqqlgXQ9lJB9PUGhN7WYxRdS6gSOoyre
 dP221tsIkzUoHN01TawKeajcfrhiJSlQGq6LgTJdd7V/QvP9MzxnZaxr9tM/TMah1hK8
 kEWTAHVKncGK5Ia7pXn5hUSqiLBdtLhVjI26GkAcs/EPnQ0g6l80V9G6mma91uosQOXS
 7nB2X0UVXV9IVvik81bSp35DLXHVaJXJ0XxsXSihnaBuAmvJ82DpmMCizgqvnMLccO40
 R3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897415; x=1740502215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMnEyXGGJ3hdF0LnT2TQ09SgsTKrvsYugzpdN+NvrWU=;
 b=npfuQda/jGKBSLjBGlnpf3kqiRq45cqWlEiLfJyeik1DQBd4tCnbirnXeX6H9nF+yy
 KxDSM9VK4d67J9fNDN+vRWK6X7ezOOE/hMWbb78EHLoWAcSOn3/Cy3wxmJe+cIS48Op1
 lPPw/NIFXc73/uzEAUS0FmUZCtEVIn+wz7SdZSImm1/SkLt/1N3QdsWxpPvBiN7G73t7
 BgsrFf5/diVf+Ss9q9y31gXJl8j969uz2a4ITYF4k3ilLPeCiVmjkGSLyF61OcsJA+IW
 0z8X411h+nFi1WvrMoOxMLY/3uAN6Vb/jCliF47kNrnJ9r2nw6pNqfZqcWYYYvxYgGRm
 44GA==
X-Gm-Message-State: AOJu0Yy7dWooRjSqi93D2YUffZKwHdjUFaJaZq1SspNqBQKCwq80VQSx
 i9vS5qaJ1hDkbJ3AlUAj3FBzm/rSxkyf1YndDjF85NfxEcjPAQAoOHm8VEfF
X-Gm-Gg: ASbGncsnFf/CCiwmKxMe8H+Po0T8O+8PpTCtMuXthdNssKC6MEmtwOqX5fig+p8YcS1
 BCrn9ZncBEzJymY/+i8wSkBxiFrXt6W7Z2Al1U0U+Ww0dD4kkbriUf/2eXiUvdJLpsDV2R2lCAk
 CwHYBfgb6sCvUD859UrVFc4d1aYSijd2wDcYdS4lJpAUtPbDNWAdChxtP1G262lFQB0aFoIsGW8
 KL/FK/4XqhZBCX7u9IDewOV1BTgJbBc9IRMH2D4HPSSRSWkX2F+9OKeA7NGm/xwIrchvgkBTK1w
 Wnk6C0EV+2XEOQvlJg==
X-Google-Smtp-Source: AGHT+IFo3C3gzBcDjQu51T2fbVMqalONayMi8LFPRYBo3SHsX+Z5J68IlnECe7WGxqb+E9hKAHV/jw==
X-Received: by 2002:a5d:5f8d:0:b0:38f:4f25:1482 with SMTP id
 ffacd0b85a97d-38f587e4cd9mr137648f8f.42.1739897414843; 
 Tue, 18 Feb 2025 08:50:14 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 00/39] VKMS configfs tests
Date: Tue, 18 Feb 2025 17:49:32 +0100
Message-ID: <20250218165011.9123-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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

Hi everyone,

This series add tests for the VKMS + configfs work Louis Chauvet and I are doing
in the kernel.

This new functionality allows to configure one or more VKMS instances without
having to reload the driver using configfs.

For more details, have a look to the kernel patchset and the documentation in
"vkms.rst" (not merged yet).

There was a previous attempt to implement this tests [1] and I kept copyright
were required.

Best wishes,
José Expósito

[1] https://lists.freedesktop.org/archives/igt-dev/2023-September/060717.html

José Expósito (39):
  lib/drmtest: Add VKMS as a known driver type
  lib/igt_debugfs: Move is_mountpoint() to igt_aux
  lib/igt_configfs: Add helper to mount configfs
  lib/vkms: Add minimal VKMS library and test device default files
  lib/vkms: Allow to enable/disable VKMS devices
  tests/vkms_configfs: Test device invalid values
  lib/vkms: Test plane default files
  lib/vkms: Test plane default values
  lib/vkms: Test plane invalid values
  lib/vkms: Test CRTC default files
  lib/vkms: Test CRTC default values
  lib/vkms: Test CRTC invalid values
  lib/vkms: Test encoder default files
  lib/vkms: Test connector default files
  lib/vkms: Test connector default values
  lib/vkms: Test plane connector invalid values
  lib/vkms: Test attaching planes to CRTCs
  lib/vkms: Test attaching encoders to CRTCs
  lib/vkms: Test attaching connectors to encoders
  tests/vkms_configfs: Test enablement without pipeline items
  lib/vkms: Create VKMS device from static config
  tests/vkms_configfs: Test adding too many planes
  tests/vkms_configfs: Test not adding a primary plane
  tests/vkms_configfs: Test adding multiple primary planes
  tests/vkms_configfs: Test adding multiple cursor planes
  tests/vkms_configfs: Test adding a plane without possible CRTCs
  tests/vkms_configfs: Test enabling a device without CRTCs
  tests/vkms_configfs: Test enabling a device with too many CRTCs
  tests/vkms_configfs: Test enabling a device without encoders
  tests/vkms_configfs: Test enabling a device with too many encoders
  tests/vkms_configfs: Test adding an encoder without possible CRTCs
  tests/vkms_configfs: Test adding a CRTC without encoders
  tests/vkms_configfs: Test enabling a device without connectors
  tests/vkms_configfs: Test enabling a device with too many connectors
  lib/vkms: Test changing enabled device planes
  lib/vkms: Test changing enabled device CRTCs
  lib/vkms: Test changing enabled device encoders
  lib/vkms: Test changing enabled device connectors
  tests/vkms_configfs: Test connector hot-plug

 docs/testplan/meson.build        |    7 +-
 lib/drmtest.c                    |   18 +
 lib/drmtest.h                    |    8 +-
 lib/igt.h                        |    1 +
 lib/igt_aux.c                    |   25 +
 lib/igt_aux.h                    |    2 +
 lib/igt_configfs.c               |   57 +
 lib/igt_configfs.h               |   13 +
 lib/igt_debugfs.c                |   29 +-
 lib/igt_vkms.c                   |  794 +++++++++++++
 lib/igt_vkms.h                   |  109 ++
 lib/meson.build                  |    2 +
 meson.build                      |    8 +
 tests/meson.build                |    2 +
 tests/vkms/meson.build           |   13 +
 tests/vkms/vkms_configfs.c       | 1884 ++++++++++++++++++++++++++++++
 tests/vkms/vkms_test_config.json |   72 ++
 17 files changed, 3013 insertions(+), 31 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/meson.build
 create mode 100644 tests/vkms/vkms_configfs.c
 create mode 100644 tests/vkms/vkms_test_config.json

-- 
2.48.1

