Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A780C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAA410E8FD;
	Thu, 13 Mar 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V7cDUkOz";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6238C10E257
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso11572205e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887204; x=1742492004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U4VcOhAh6Xgw6FxvVUfGYbGsUc0O9IdkJSNTyDhxLq0=;
 b=V7cDUkOzAuycpRSX/SLOyQ3FBdbbwwHlX3kGIjdnE/kBcRrHUgJ3PVebBOciJiAmPd
 PpMWPgs9c7J/hK9cOb7CPVDlUOW7pDEG4++y3rqTJgbeXnvEiccqKu7uqgCEHbHRY1VH
 WwweuDTYm47/R4OvET0BHK1k2JLeNU/v/EggOlM484+2SMZ8B4jF90mK+jvh3lC8DBUZ
 PD8CUAg4vpVjPmXbzbMcsw6GW7fam6QDskpbKy95ZEoUUuvNVYf9oe7gKm89hBZh8Idl
 KwNLABrEgCiU929FEIC9EnCrR0ubZuAqizo8yiZEp+NG4jqG+6lzt22DKm5fEuEJhsNV
 nV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887204; x=1742492004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4VcOhAh6Xgw6FxvVUfGYbGsUc0O9IdkJSNTyDhxLq0=;
 b=E6Ja38P9lBnvp1qfbxCYrN53OKpiq6E4oNVkMad6tQ8iZymy8jaCoW9Tz7Z/TbpDZV
 W1V7aEoM+NN7pFZoB1q1473yGA5ueTUN7yjHnb4dECsaKC0eCB5tb6z6j7CHklIqDU9X
 ZmL364laga7G2HRK5NB/irEn2Mce6ZER2KpZSpZ//+Mh9yg5Jv0nKRcTBAok29fT0QFa
 qm90smxXfDPQeWCPHuYaCGorJt5870gFfnEF+cp7KxEyeEwoZBW5D36RH9L+rMw4M4Lr
 YPVpAobvNUgyPmnVqH5G0yDczAeMiSh50UlwIf/l3bEdB5jnxefwyjLtLrd4BX87JTqv
 olZg==
X-Gm-Message-State: AOJu0YwK//ScsCQukjMGlGHVOhXwxmp+U92+uA2VEOCWvcjTdXx71bub
 W+sRhnCVuj81URqpQIe1lQkRdojjEOyYa9H2Qlym2PrBNfCHdrezuUUFkNBi
X-Gm-Gg: ASbGncv33DOkn0bjRTIPTZsKnk1hKKZKnLNLr9X/Mu51Ho9rMXB3/wj0IWoMOd5IM5k
 fQZiodg9tynmxQWEKNd3GrNS/2okMp9ycJ/MpMafp2FpCICnlsox6jn2145GbnIAhiV2MvUX7zR
 UfHM19Wp7r2Epm9kQhWy+V4v1IiXnoy4F1v3SwZg6Jghla43KFRRR+8y3zsHsxVjKTSBFB12w59
 6aYwc7NJoFCurd3RsiIDefov0GvK5+nYQIQJyibl2ebWxSwaZ+5zeFT1ewjbnYK76IcrPrcv1Lh
 kuOTl5P/Eny+Fk0le8puuXb/7QfLeFhn4P9zMcjv2k0U
X-Google-Smtp-Source: AGHT+IGqvS18SRgxQF6s7qU+5JIytzXARuyiG4HcTNZxsSVFUQPwJtquTsc1en5EDBkO8vadW24QsQ==
X-Received: by 2002:a05:600c:4e8f:b0:43d:83a:417d with SMTP id
 5b1f17b1804b1-43d1d8c191dmr5422805e9.12.1741887203762; 
 Thu, 13 Mar 2025 10:33:23 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:23 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 00/43] VKMS configfs tests
Date: Thu, 13 Mar 2025 18:32:35 +0100
Message-ID: <20250313173318.5818-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
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

[1] https://lore.kernel.org/dri-devel/20250307163353.5896-1-jose.exposito89@gmail.com/T/
[2] https://lists.freedesktop.org/archives/igt-dev/2023-September/060717.html

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

José Expósito (43):
  lib/drmtest: Add VKMS as a known driver type
  lib/igt_debugfs: Move is_mountpoint() to igt_aux
  lib/igt_configfs: Add helper to mount configfs
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
 lib/igt.h                        |    1 +
 lib/igt_aux.c                    |   31 +
 lib/igt_aux.h                    |    2 +
 lib/igt_configfs.c               |   57 +
 lib/igt_configfs.h               |   13 +
 lib/igt_debugfs.c                |   29 +-
 lib/igt_device_scan.c            |   22 +
 lib/igt_device_scan.h            |    2 +
 lib/igt_vkms.c                   | 1004 +++++++++++++++
 lib/igt_vkms.h                   |  132 ++
 lib/meson.build                  |    2 +
 meson.build                      |    8 +
 tests/meson.build                |    2 +
 tests/vkms/meson.build           |   13 +
 tests/vkms/vkms_configfs.c       | 1963 ++++++++++++++++++++++++++++++
 tests/vkms/vkms_test_config.json |   72 ++
 19 files changed, 3357 insertions(+), 30 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/meson.build
 create mode 100644 tests/vkms/vkms_configfs.c
 create mode 100644 tests/vkms/vkms_test_config.json

-- 
2.48.1

