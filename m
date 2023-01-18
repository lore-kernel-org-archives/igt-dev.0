Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77C210E218
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 18:49:43 +0000 (UTC)
Date: Wed, 18 Jan 2023 19:49:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: xorg-announce@lists.x.org
Message-ID: <20230118184921.ry3ycz7j4ubpfndt@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [ANNOUNCE] igt-gpu-tools 1.27.1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, xorg@lists.x.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

A new igt-gpu-tools release is available with the following changes:

- - Removed gcc option -fcommon from meson.build and fix broken
  build on Linux RedHat platform. (Zbigniew Kempczyński)

- - Updated CONTRIBUTING guidelines for interface deprecation. (Petri Latvala)

- - Fixed one additional test bug (Zbigniew Kempczyński)


Full changelog:

Kamil Konieczny (1):
      Update NEWS, bump version to 1.27.1

Petri Latvala (1):
      CONTRIBUTING: Document guidelines for interface deprecation

Zbigniew Kempczyński (3):
      lib/igt_crc: Remove crc32 table from common section
      meson.build: Remove -fcommon flag
      i915/gem_ccs: Remove race in creating batch buffers

git tag: v1.27.1

https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.27.1.tar.xz
MD5:  62135c26178dc8121e619c4c19d7edcb  igt-gpu-tools-1.27.1.tar.xz
SHA1: 63f2cd3f1f17df4cdb838032e6394a79e8e63b87  igt-gpu-tools-1.27.1.tar.xz
SHA256: 93b9a4816ed22b5145bb61024314c8a65caeea991ce93027643f1d40723bf417  igt-gpu-tools-1.27.1.tar.xz
SHA512: 20923505e9afe6e5064bf8f4056e027ff0321cd29d8982157a608369aea6fbef24c93756de96ef6296e09d539957fc6cdad4097cbab5af33f8828f762da0d8c0  igt-gpu-tools-1.27.1.tar.xz
PGP:  https://xorg.freedesktop.org/archive/individual/app/igt-gpu-tools-1.27.1.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEeEfyoniRn8//js0joApYnAVKh50FAmPIO+oACgkQoApYnAVK
h52RsAwAjvTumkRK9Mbtr/18WSPxvO4SaGiUZEMM0cwInH26AEQOKBpv079U6uaj
PYZkHFxGgwh6kxgfPKalwZAiej3Xey1i1v4+ikRzyVwNI97tfxwJfEmwMQDf8E63
4vP/Lc5J6FCPMccU2oGaRCGe1yd1RW1pT3zXv2BXBYbATNN5xyj+yGTGXAr5kcvj
/RnCoM/b9/bNt2yQfq1TtSD1U+N95UXr0eH8FczE11vO21ilOgflU2z4d8bA453K
fIiXyzDSK5S99leOzuz7Waxlcu/aSMeonnUaaI0jkV6s/jp1TkFSnzaI9hjAsSr0
IJgXLCM3Qrfo+ZiX3ApFTAwOcP5vQXkFGunBpu1PHfBuFfeY5Ovzy1TF4Upbd46I
fTjquCdqTaxiSQ/ArmnpSUq1DVvcvoBpUZhwjrksEHvqrK/9BdiMWsIRBhIVXTPZ
R1xNfr+L+76RQucs1Z1DaSQxiRUGfeUoMhBQTzeyhvWCOAw/f9QNMHASo1y70Z8P
lZiZrq6R
=W8V7
-----END PGP SIGNATURE-----
