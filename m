Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9010E03D
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 16:01:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0CBB8A4C00C8
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 17:52:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55000)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1quakc-0007RQ-2b
 for igt-dev@lists.freedesktop.org; Sun, 22 Oct 2023 17:52:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 22 Oct 2023 17:52:19 +0200
Message-Id: <20231022155226.3484622-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/7] igt: Fix musl build
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

this is my first patch series I am sending so please be patient ;)

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

Regards, Bernd


Bernd Kuhls (1):
  build: check that outb is present in io.h

Stefano Ragni (5):
  Include limits.h to fix build with musl libc
  lib/igt_aux.h: Fix musl build
  lib/igt_x86.c: Fix musl/uclibc build
  lib/igt_halffloat.c: Fix musl/uclibc build
  benchmarks/gem_syslatency.c: Fix musl build

mhmdanas (1):
  benchmarks/gem_exec_tracer.c: Fix musl build

 benchmarks/gem_exec_tracer.c  | 4 ++++
 benchmarks/gem_syslatency.c   | 2 ++
 lib/amdgpu/amd_pci_unplug.c   | 1 +
 lib/igt_audio.c               | 1 +
 lib/igt_aux.c                 | 1 +
 lib/igt_aux.h                 | 2 +-
 lib/igt_device_scan.c         | 1 +
 lib/igt_eld.c                 | 1 +
 lib/igt_frame.c               | 1 +
 lib/igt_halffloat.c           | 2 +-
 lib/igt_hwmon.c               | 1 +
 lib/igt_x86.c                 | 2 +-
 meson.build                   | 2 +-
 runner/executor.c             | 1 +
 runner/runner_tests.c         | 1 +
 tests/device_reset.c          | 1 +
 tests/intel/i915_pm_rpm.c     | 1 +
 tests/kms_sysfs_edid_timing.c | 1 +
 tests/testdisplay.c           | 1 +
 tests/tools_test.c            | 1 +
 tools/igt_compliance_utils.c  | 1 +
 21 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.39.2
