Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BCC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC6A10E1F4;
	Tue, 15 Jul 2025 10:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QK++t+cA";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92CB10E1BF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-456108bf94bso16481825e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575123; x=1753179923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B1lOOeG1PRrX2KN0spa9jViV/F/UARNtcUlRtcTXWhw=;
 b=QK++t+cAoD78E4W9tPTJ2IBQDdcg880JjgJz8lKFIp3CptIhcdq3UKtwTrTOWKdtvg
 Z5nANng1Xgt3R7UGwHvCe4iwDxN+laX5ww89O0j1tApz8WfBIoGMRJRLo4Fa7rV2Bs0m
 RZyIxPqqYyBN9Yzqn8wz7BpAbzAR+OcFNntpunN/MPiILm2PT8of/mouNec28a45b9CP
 BSU6sC4i9FqV1zbzr3y3nZiohE+C+cVkHJNp/ZsjuPwRBAfWT2ivzs3uQFfsjwG+tv4z
 TviKeVpcrTttugVuc+RlYeg/4V0RSmxcuAtDdpOsuEomAA8FdG2zN47Q/Oowy+yFjq0o
 okxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575123; x=1753179923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B1lOOeG1PRrX2KN0spa9jViV/F/UARNtcUlRtcTXWhw=;
 b=YZykA9m77uCBvJ6y44P8HQ1qJGgev9mygs9H7Ql2lH0yEQk1w5aHmecuL/1QDVdZS0
 Oo582g6Lh5hYU7tUR7ZDJKctAvMK3AubZ3BpIbx3BqkAGC8RRQCRr3fOaVZda7IWrnzC
 5bmD3DEMHCh/+/8H0g03rv58/uupRGgdpXTgdr8abBkhm3Ikg1JlYsXp4+4rhDC1ymJq
 tM/zk5/bJ4UIlrxEtafmy5LZd2GEMuXrB6KEAxfS/JvnX5kvPP2wnLZ4aHAIValw+UXk
 gTH7jr5qIfti+xpcXDU+2R51nlbjDAnT37KRRJmTV6GkvjSaCapgmc1FnHknfklUSy4E
 Lncw==
X-Gm-Message-State: AOJu0YyTFcvLmW0Rjfc81vkn2SOoZVZb5tJu+jjOmRxIsmrfhFermO6J
 uom2EBB+B3mldnWc89eKDY1ILQHwNeHtj+/EWSkhs3jverLJ0Chw79myIxDzZQ==
X-Gm-Gg: ASbGncsrNbwerSS/Kie6i6I0xtpaCUahj49py3SHGj5puxO4GTUFULN3bMgtRCeWNG+
 inslufKu67DHEhNB52YbqzZ9682H6ghHxdvvZkqHrHbdmIczszSpN+/gpaC8WjmE7LlZY54HtsD
 l9X4moLgNLhTquaA6LSpWrVqVay84MKcwsTob6pFE5bcs+zqvUrY2ypNJJQxTajEM8e3kCD45Ht
 Yy0UcWHnysAiro6nVL4V5rMwczOsQYGDCDUTQE7rxd3jIO6QY1taj9R4uQwmQRI72ZzMh/h788d
 xHOEuOsxWcTeNA/AbVYNEDrJcVeejp47/eGLiRc7+lvJM8jnPUc6UedWtgrFaIv5iLIl4C+9HlY
 BXXkp1nNT1Mr/FV5vEg==
X-Google-Smtp-Source: AGHT+IHt4wESdIdnQaWCl2/MEla6gN7yeajC0x8lSkmqvi7i8CSuSfweZlE52oimNNwBJrgoLkAdaA==
X-Received: by 2002:a05:600c:4f52:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-454ec14677bmr160582935e9.9.1752575122553; 
 Tue, 15 Jul 2025 03:25:22 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 00/41] VKMS configfs tests
Date: Tue, 15 Jul 2025 12:24:32 +0200
Message-ID: <20250715102513.5636-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi everyone,

This series add tests for the VKMS + configfs work Louis Chauvet and I are doing
in the kernel.

This new functionality allows to configure one or more VKMS instances without
having to reload the driver using configfs.

For more details, have a look to the kernel patchset and the documentation in
"vkms.rst" (not merged yet). [1]

There was a previous attempt to implement this tests [2] and I kept copyright
were required.

Massive thank you to Louis Chauvet who is doing a fenomenal work reviewing this
(very long) series of patches.

Best wishes,
José Expósito

[1] https://lore.kernel.org/dri-devel/20250507135431.53907-1-jose.exposito89@gmail.com/
[2] https://lists.freedesktop.org/archives/igt-dev/2023-September/060717.html

Changes in v3:

  - Rebased on the latest master branch
  - Link to v2: https://lore.kernel.org/igt-dev/20250313173318.5818-1-jose.exposito89@gmail.com/

Changes in v2:
  - Applied review comments by Louis Chauvet:
    - Added missing references to DRIVER_VKMS in drmtest.c
    - Loading vkms with drm_load_module(DRIVER_VKMS) in igt_fixture 
    - Documented igt_is_mountpoint()
    - Checked the return value of snprintf() and fprintf()
    - Removed unnecessary empty items ({ {} }) in items in igt_vkms_config_t
    - Added new tests testing the valid values for planes, CRTCs and connectors
    - Remove code duplication generating configfs paths by adding helpers
  - Using udev instead of drmGetDevices() to find VKMS devices in a new patch
    "lib/igt_device_scan: Allow to find device by name". This change is required
    to support the faux bus. See:
    https://lists.freedesktop.org/archives/igt-dev/2025-February/086510.html
  - Rebased on the latest "master"
  - Link to v1: https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html

José Expósito (41):
  lib/drmtest: Add VKMS as a known driver type
  lib/vkms: Add minimal VKMS library and test device default files
  lib/vkms: Allow to enable/disable VKMS devices
  tests/vkms_configfs: Test device invalid values
  lib/vkms: Test plane default files
  lib/vkms: Test plane default values
  lib/vkms: Test plane invalid values
  tests/vkms_configfs: Test plane valid values
  lib/vkms: Test CRTC default files
  lib/vkms: Test CRTC default values
  lib/vkms: Test CRTC invalid values
  tests/vkms_configfs: Test CRTC valid values
  lib/vkms: Test encoder default files
  lib/vkms: Test connector default files
  lib/vkms: Test connector default values
  lib/vkms: Test connector invalid values
  tests/vkms_configfs: Test connector valid values
  lib/vkms: Test attaching planes to CRTCs
  lib/vkms: Test attaching encoders to CRTCs
  lib/vkms: Test attaching connectors to encoders
  lib/igt_device_scan: Allow to find device by sysname
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
 lib/drmtest.c                    |   21 +
 lib/drmtest.h                    |    6 +-
 lib/igt_device_scan.c            |   22 +
 lib/igt_device_scan.h            |    2 +
 lib/igt_vkms.c                   | 1004 +++++++++++++++
 lib/igt_vkms.h                   |  132 ++
 lib/meson.build                  |    1 +
 meson.build                      |    8 +
 tests/meson.build                |    2 +
 tests/vkms/meson.build           |   13 +
 tests/vkms/vkms_configfs.c       | 1963 ++++++++++++++++++++++++++++++
 tests/vkms/vkms_test_config.json |   72 ++
 13 files changed, 3250 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/meson.build
 create mode 100644 tests/vkms/vkms_configfs.c
 create mode 100644 tests/vkms/vkms_test_config.json


base-commit: bdf12f964ada9bf06109285154345d12745c1c63
-- 
2.50.0

