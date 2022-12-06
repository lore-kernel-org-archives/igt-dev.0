Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 06 Dec 2022 18:18:52 -0000
Message-ID: <167035073223.3372.8024098915110329036@emeril.freedesktop.org>
References: <20221206175222.63998-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221206175222.63998-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_E?=
 =?utf-8?q?xercise_evict-prime-*_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Exercise evict-prime-* (rev2)
URL   : https://patchwork.freedesktop.org/series/111684/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/756282 for the overview.

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/33054574):
  Initialized empty Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Created fresh repository.
  Checking out f6c2404e as intel/IGTPW_8206...
  
  Skipping Git submodules setup
  section_end:1670350542:get_sources
  section_start:1670350542:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-f6c2404e63d22b108bb6f36241c43c5ad1988462 with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...
  $ meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
  Only ninja backend is supported to rebuild tests before running them.
  Meson test encountered an error:
  
  Directory $'/builds/gfx-ci/igt-ci-tags/build' does not seem to be a Meson build directory.
  section_end:1670350543:step_script
  section_start:1670350543:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1670350544:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/756282
