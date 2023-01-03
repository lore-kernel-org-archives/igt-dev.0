Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2892E10E24A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 10:59:31 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emma Anholt <emma@anholt.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Rob Clark <robdclark@chromium.org>
Date: Tue,  3 Jan 2023 07:58:30 -0300
Message-Id: <20230103105835.604394-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] V3D Job Submission Tests
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

Currently, the V3D tests don't cover the job submission feature of the driver.
Therefore, create tests for DRM_IOCTL_V3D_SUBMIT_CL, an ioctl for submitting
commands to the 3D engine. In order to develop the tests, it was necessary to
bring some Mesa structures to IGT. Those structures have the definitions needed
for the creation of an acceptable packet that can be sent to the GPU.

So, patches 1-3 add the Mesa structures needed for the tests and also create a
struct to manage a CL job, the struct v3d_cl_job. Patch 4 introduces a helper
function to submit a minimal job to the GPU, which will be useful for the tests.
The minimal job will use the Mesa structures to produce a minimal valid packet.
Finally, patches 5-6 include new tests in the V3D test suite for
DRM_IOCTL_V3D_WAIT_BO and DRM_IOCTL_V3D_SUBMIT_CL. The tests for the Wait BO
IOCTL depend on the submission of a job, so they are included in this series.

Best Regards,
- Maíra Canal

Maíra Canal (6):
  lib/v3d: Add V3D packet helpers
  lib/v3d: Add V3D packet description
  lib/v3d: Introduce the struct v3d_cl_job
  lib/v3d: Add a helper to create a noop job
  tests/v3d_wait_bo: Create test for V3D's Wait BO IOCTL
  tests/v3d_submit_cl: Create test for V3D's Submit CL IOCTL

 lib/bitpack_helpers.h        |   78 +
 lib/igt_v3d.c                |  182 ++
 lib/igt_v3d.h                |   18 +
 lib/v3d/v3d_cl.h             |  157 ++
 lib/v3d/v3d_packet.h         | 5164 ++++++++++++++++++++++++++++++++++
 lib/v3d/v3d_packet_helpers.h |  119 +
 tests/v3d/meson.build        |    2 +
 tests/v3d/v3d_submit_cl.c    |  352 +++
 tests/v3d/v3d_wait_bo.c      |  127 +
 tests/v3d_ci/v3d.testlist    |   27 +
 10 files changed, 6226 insertions(+)
 create mode 100644 lib/bitpack_helpers.h
 create mode 100644 lib/v3d/v3d_cl.h
 create mode 100644 lib/v3d/v3d_packet.h
 create mode 100644 lib/v3d/v3d_packet_helpers.h
 create mode 100644 tests/v3d/v3d_submit_cl.c
 create mode 100644 tests/v3d/v3d_wait_bo.c

-- 
2.38.1
