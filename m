Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3410E3F5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 07:42:56 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y12so1693500edt.9
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Mar 2022 23:42:56 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed,  9 Mar 2022 08:42:31 +0100
Message-Id: <20220309074242.65066-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 00/11] Run CI on Qualcomm devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Run a bunch of KMS and GPU tests on Qualcomm devices. The pipeline will
fail if there is any regression.

With these changes, it should be fairly trivial to add testing on other
KMS and GPU drivers.

Regards,

Tomeu

Tomeu Vizoso (11):
  ci: Move containers from Buster to Bullseye
  ci: Move files to ci/ subdir
  ci: Add dependencies between jobs
  ci: Install ci-templates in Debian container
  ci: Install ci-templates in arm64 container
  ci: Install lavacli in Debian container
  ci: Add wget to Debian container
  ci: Setup JWT token to use with MinIO
  ci: Upload build tarball to MinIO
  ci: Add files from Mesa required to submit jobs to LAVA
  ci: Add job for testing changes to tests in Qualcomm devices

 .gitlab-ci.yml                                | 129 +++++-
 Dockerfile => ci/Dockerfile                   |   0
 .../Dockerfile.build-debian                   |  10 +-
 .../Dockerfile.build-debian-arm64             |   8 +-
 .../Dockerfile.build-debian-armhf             |   2 +-
 .../Dockerfile.build-debian-minimal           |   2 +-
 .../Dockerfile.build-debian-mips              |   4 +-
 .../Dockerfile.build-fedora                   |   0
 ci/ci-common/capture-devcoredump.sh           |  14 +
 ci/ci-common/generate-env.sh                  | 112 ++++++
 ci/ci-common/init-stage1.sh                   |  22 +
 ci/ci-common/init-stage2.sh                   |  78 ++++
 ci/lava/lava-submit.sh                        |  38 ++
 ci/lava/lava_job_submitter.py                 | 380 ++++++++++++++++++
 .../meson-cross-arm64.txt                     |   0
 .../meson-cross-armhf.txt                     |   0
 .../meson-cross-mips.txt                      |   0
 ci/msm_results.txt                            |  97 +++++
 ci/msm_tests.txt                              |  14 +
 ci/run_tests.sh                               |  87 ++++
 20 files changed, 980 insertions(+), 17 deletions(-)
 rename Dockerfile => ci/Dockerfile (100%)
 rename Dockerfile.build-debian => ci/Dockerfile.build-debian (60%)
 rename Dockerfile.build-debian-arm64 => ci/Dockerfile.build-debian-arm64 (79%)
 rename Dockerfile.build-debian-armhf => ci/Dockerfile.build-debian-armhf (97%)
 rename Dockerfile.build-debian-minimal => ci/Dockerfile.build-debian-minimal (94%)
 rename Dockerfile.build-debian-mips => ci/Dockerfile.build-debian-mips (86%)
 rename Dockerfile.build-fedora => ci/Dockerfile.build-fedora (100%)
 create mode 100755 ci/ci-common/capture-devcoredump.sh
 create mode 100755 ci/ci-common/generate-env.sh
 create mode 100755 ci/ci-common/init-stage1.sh
 create mode 100755 ci/ci-common/init-stage2.sh
 create mode 100755 ci/lava/lava-submit.sh
 create mode 100755 ci/lava/lava_job_submitter.py
 rename meson-cross-arm64.txt => ci/meson-cross-arm64.txt (100%)
 rename meson-cross-armhf.txt => ci/meson-cross-armhf.txt (100%)
 rename meson-cross-mips.txt => ci/meson-cross-mips.txt (100%)
 create mode 100644 ci/msm_results.txt
 create mode 100644 ci/msm_tests.txt
 create mode 100755 ci/run_tests.sh

-- 
2.31.1
