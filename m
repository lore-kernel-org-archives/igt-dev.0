Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86008C87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CAF10E0D6;
	Thu,  7 Aug 2025 07:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A64XnKIe";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4691A10E0D6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-459d7726ee6so3542375e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552764; x=1755157564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3sXWRl6GfaupJ/9NKCPupxkgBbHV8qh6POAWe0HLnJ0=;
 b=A64XnKIeLYrmEaqbjQ1DVR5M3QKMtNNBCljZaqG/uJOb1LDpdnKfoeZrx+tZ0za7Bx
 4rpMTdqSoqycB22E7Rh7qOTHDjKFItg0NLy3UaMHtI/FFsuBBOE+od8mY6rgjV+OuSQ3
 xfi3TQRQHtR8ggNG1fuyqzw5FPp+PkvILOyPNFa2iEttCWo/mZhh7DIEOa1dVAfFTXiR
 0sWOyDQr9mrVDI7r35ClsigYA78CiCD3uMbrejdkhxihGO+EYC+kjzi3s8nn3xgO1n65
 yc0LE7Hj/9lAj+LEaxyudY/R0R9LwjPdPwVDvwB977csjRVKnrG14DO3olIqs78NsQ3n
 uuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552764; x=1755157564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sXWRl6GfaupJ/9NKCPupxkgBbHV8qh6POAWe0HLnJ0=;
 b=BEWwYVi79hW846n9P2caG7f6NtjPuVP4AfReCrergsbXKY0G6s2VWT1lP1utloICGZ
 ZFApbynLd3s2IqMDYdNtliKtH4VtwR6Hla+NISNlsv/xU+S2DMWzXPv4WHu7DTCgzHYV
 RfmLCIbSHNbKbNtxsWWyuMY9b9Uc81UI2j39BfyYzHpJhKqp1ts2mcW2BJxKLAaYcJcX
 Uxfa64dIOmcKXmG9KsDb6Sx0YLFSJUWYnXKrXrgNWYxJeZ7ETiZEgLoSB18BjGPFS5BA
 46oF8z1lKeasNf03D07jd5BsMn1KmtADSxwoflat6PnDhSF+bnOqsvMli2DSaIZ+od36
 R57w==
X-Gm-Message-State: AOJu0Yzgq1aXlzH2vSvwBKw1f6jI/Xxlqb335K5YEeOpGuQAgHKzncPl
 qJ0NOdZ/ZkylD2rSMMNAGTAyE00zOIsY2yxYorcp7PXpQx0NS2/Km7K4krnJ4int
X-Gm-Gg: ASbGncuAOQUxwri2lFT/TaVLkCSL1XmLmLgDFd5np74prBXn+bZ2u17tljV6fL1ggYz
 +2HJ5YXG/4LvJNAtIJzju3S8Qj2pTL4hLeHGj9I3A1zD6AzEMHdcUnmwQ78LEWLnhheahXdFao2
 WWUEriYsxHW9E16BNpcpXt+YJ2u2dazOvIovh6INSBTd39PMuNFurbG7Xvt2BK0jgpPsw72PQoY
 A8++VLQhmP4MSvvxOsVkTgEX+f66OqH/kNnajoPCpBfztGYmu1cPlbfecNQQa3zfAKCCzkDtzDU
 PNieOxEMU0z94FsOV3qXvu7+K0simvFWZS+wEYQygXuzrAMCTFPu1FlTcCuVUBWteNI9CQE65qR
 PVXTdoL55yaJUv+LnkAM=
X-Google-Smtp-Source: AGHT+IGCG9Z2CzDvwokw47zWzNMveCSezQdkJ0oPY5rqCiAo1upVD9IK4z53WHpYo+A4Z1hY0YgYvw==
X-Received: by 2002:a05:6000:24c6:b0:3b8:d1a4:bab9 with SMTP id
 ffacd0b85a97d-3b8f41f3109mr4753329f8f.45.1754552764027; 
 Thu, 07 Aug 2025 00:46:04 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 00/41] VKMS configfs tests
Date: Thu,  7 Aug 2025 09:45:09 +0200
Message-ID: <20250807074550.6543-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Changes in v4:

  - Rebased on the latest master branch
  - Added reviewed-by tags (Louis)
  - Added missing "static" to some consts (Kamil)
  - Updated copyright year (Kamil)
  - Using #include <limits.h> instead of <linux/limits.h> (Kamil)
  - Sorted alphabetically includes (Kamil)
  - Dropped VKMS tests from the testplan (Kamil and Karthik)
  - Link to v3: https://lore.kernel.org/igt-dev/20250715102513.5636-1-jose.exposito89@gmail.com/

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

 lib/drmtest.c              |   21 +
 lib/drmtest.h              |    6 +-
 lib/igt_device_scan.c      |   22 +
 lib/igt_device_scan.h      |    2 +
 lib/igt_vkms.c             | 1003 ++++++++++++++++++
 lib/igt_vkms.h             |  132 +++
 lib/meson.build            |    1 +
 meson.build                |    8 +
 tests/meson.build          |    2 +
 tests/vkms/meson.build     |   13 +
 tests/vkms/vkms_configfs.c | 1962 ++++++++++++++++++++++++++++++++++++
 11 files changed, 3171 insertions(+), 1 deletion(-)
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/meson.build
 create mode 100644 tests/vkms/vkms_configfs.c


base-commit: dfce662f38d1e272363d37a9cfbcbfee379fa851
-- 
2.50.1

