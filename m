Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D0010E33D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 19:39:07 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Thu, 12 Jan 2023 16:37:38 -0300
Message-Id: <20230112193741.55630-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/4] Make sure v3d/vc4 support
 performance monitors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, v3d and vc4 don't check if the driver supports the performance
monitor feature, which means that the tests are allowed to run even if the
driver doesn't support the tested feature. Therefore, this series adds checks
using the GET_PARAM ioctl from both drivers.

The main difference of this series is the introduction of the patches
"lib/igt_v3d: Rework igt_v3d_get_param()" and "lib/igt_vc4: Rework 
igt_vc4_get_param()", which will allow the tests to skip
instead of fail.

Best Regards,
- Maíra Canal

---

v1 -> v2:
- Add "lib/igt_vc4: Rework igt_vc4_get_param()" patch (Melissa Wen).

v2 -> v3:
- s/the return of/the error code of/ (Kamil Konieczny).
- Add igt_vc4_get_param() description (Kamil Konieczny).

v3 -> v4:
- Make sure that the test will skip instead of fail.
- Add "lib/igt_v3d: Rework igt_v3d_get_param()".

v4 -> v5:
- Reintroduce "lib/igt_vc4: Rework igt_vc4_get_param()" (Melissa Wen).
- Add a description to the function igt_v3d_get_param().

---

Maíra Canal (4):
  lib/igt_vc4: Rework igt_vc4_get_param()
  tests/vc4_perfmon: Make sure vc4 supports perfmon
  lib/igt_v3d: Rework igt_v3d_get_param()
  tests/v3d_perfmon: Make sure v3d supports perfmon

 lib/igt_v3d.c                | 15 ++++++++++++++-
 lib/igt_vc4.c                | 17 +++++++++++++----
 lib/igt_vc4.h                |  2 +-
 tests/v3d/v3d_perfmon.c      |  4 +++-
 tests/vc4/vc4_perfmon.c      |  1 +
 tests/vc4/vc4_purgeable_bo.c |  5 +----
 6 files changed, 33 insertions(+), 11 deletions(-)

-- 
2.39.0
