Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE5A10E841
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 17:14:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B08CCA4C09B9
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 19:14:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58180)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw3wO-0002zh-2x
 for igt-dev@lists.freedesktop.org; Thu, 26 Oct 2023 19:14:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 19:14:34 +0200
Message-Id: <20231026171440.4046190-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/6] Fix musl/uclibc build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

this is v2 of my first patch series I am sending so please be patient ;)

Currently there are efforts underway to add a igt-gpu-tools package to
the buildroot project. Besides glibc buildroot also supports musl- and
uClibc-based toolchains. While testing the new package it turns out that
igt-gpu-tools does not build with other libc's out of the box, see
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

This patch series tries to solve the request from the bug tracker that
the void-linux patch is "splitted into some functional changes".

During build I added only those parts of the void-linux patch which were
needed to fix build errors, I quoted those errors in each patch message.
Besides that, due to my non-knowledge of C, I can not provide any more
information.

Notes added in v2:

Answering some reviews:
https://lists.freedesktop.org/archives/igt-dev/2023-October/063676.html
> Btw did you check against new igt sources, v1.28?

Yes, version 1.28 is used.

https://lists.freedesktop.org/archives/igt-dev/2023-October/063677.html
> While it fixes your build (?) it breaks igt build on current
> Ubuntu 22/x86_64, see:

I added a different fix hoping it does not break anything.

Changes:
- removed some includes from patch 0002 (Kamil)
- added a different fix in patch 0003 (Kamil)
- updated author of patch 0006
- added s-o-b of original author in all patches when needed

Regards, Bernd

Bernd Kuhls (2):
  build: check that outb is present in io.h
  lib/igt_aux.h: Fix musl build

Mohammed Anas (1):
  benchmarks/gem_exec_tracer.c: Fix musl build

Stefano Ragni (3):
  Include limits.h to fix build with musl libc
  lib/igt_x86.c: Fix musl/uclibc build
  lib/igt_halffloat.c: Fix musl/uclibc build

 benchmarks/gem_exec_tracer.c  | 4 ++++
 lib/igt_aux.c                 | 1 +
 lib/igt_aux.h                 | 5 ++++-
 lib/igt_eld.c                 | 1 +
 lib/igt_halffloat.c           | 2 +-
 lib/igt_hwmon.c               | 1 +
 lib/igt_x86.c                 | 2 +-
 meson.build                   | 2 +-
 tests/intel/kms_pm_rpm.c      | 1 +
 tests/kms_sysfs_edid_timing.c | 1 +
 10 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.39.2
