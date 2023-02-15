Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0210E259
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 14:28:02 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Iago Toral Quiroga <itoral@igalia.com>
Date: Wed, 15 Feb 2023 11:27:35 -0300
Message-Id: <20230215142738.1121229-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] V3D Mixed Job Submission Tests
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

Currently, the V3D tests only support CL job submissions, while V3D has also
capabilities for CSD and TFU jobs. Therefore, create tests for
DRM_IOCTL_V3D_SUBMIT_CSD, an ioctl for dispatching compute shader jobs to the
GPU. In order to create a simple CSD job, I hard-coded the pipeline assembly
shader of an empty shader in order to reproduce a shader and be able to create
an acceptable packet that can be sent to the GPU.

So, patch 1 introduces a helper function to submit a minimal CSD job to the GPU,
which will be useful for the tests. The minimal job will use the pipeline
assembly shader of an empty shader. Patches 2-3 will include new tests in the
V3D test suite for DRM_IOCTL_V3D_SUBMIT_CSD and create tests that mix different
types of jobs, in order to evaluate the synchronization between the two types of
jobs. 

v1 -> v2:

- Add a progress bar to the "threaded-job-submission" sub-test (Melissa Wen).
- Fix checkpatch issues.

v2 -> v3:

- Add descriptions to all the public functions added (Kamil Konieczny).

v3 -> v4:

- s/igt_subtests/subtests/ (Kamil Konieczny).
- Add a global description to the tests (Kamil Konieczny).
- Make the meaning of CL and CSD explicit (Kamil Konieczny).

Best Regards,
- Maíra Canal

Maíra Canal (3):
  lib/v3d: Add a helper to create a empty shader
  tests/v3d_submit_csd: Create test for V3D's Submit CSD IOCTL
  tests/v3d_job_submission: Create tests to mix CL and CSD jobs

 lib/igt_v3d.c                  |  76 +++++++
 lib/igt_v3d.h                  |  20 ++
 tests/v3d/meson.build          |   2 +
 tests/v3d/v3d_job_submission.c | 223 ++++++++++++++++++++
 tests/v3d/v3d_submit_csd.c     | 364 +++++++++++++++++++++++++++++++++
 tests/v3d_ci/v3d.testlist      |  21 ++
 6 files changed, 706 insertions(+)
 create mode 100644 tests/v3d/v3d_job_submission.c
 create mode 100644 tests/v3d/v3d_submit_csd.c

-- 
2.39.1
