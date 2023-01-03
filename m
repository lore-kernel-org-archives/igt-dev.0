Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D728410E3EA
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 14:31:41 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>, Maxime Ripard <maxime@cerno.tech>
Date: Tue,  3 Jan 2023 11:30:45 -0300
Message-Id: <20230103143047.926968-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Make sure v3d/vc4 support
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
using the get_param ioctl from both drivers.

The main difference between the first and the second version of this series is
the first patch, which reworks the igt_vc4_get_param() function to adopt
do_ioctl and return the value of the parameter.

Best Regards,
- Maíra Canal

Maíra Canal (3):
  lib/igt_vc4: Rework igt_vc4_get_param()
  tests/vc4_perfmon: Make sure vc4 supports perfmon
  tests/v3d_perfmon: Make sure v3d supports perfmon

 lib/igt_vc4.c                | 10 +++-------
 lib/igt_vc4.h                |  2 +-
 tests/v3d/v3d_perfmon.c      |  4 +++-
 tests/vc4/vc4_perfmon.c      |  1 +
 tests/vc4/vc4_purgeable_bo.c |  5 +----
 5 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.38.1
