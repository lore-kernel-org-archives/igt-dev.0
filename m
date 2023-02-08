Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 08 Feb 2023 09:36:32 -0000
Message-ID: <167584899208.387.2272266993899239962@emeril.freedesktop.org>
References: <20230208091508.1488751-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230208091508.1488751-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fatomic=5Ftransition=3A_Reduce_the_execution_time_on_?=
 =?utf-8?q?simulation?=
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

Series: tests/kms_atomic_transition: Reduce the execution time on simulation
URL   : https://patchwork.freedesktop.org/series/113773/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/803210 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/36052408):
  6dd4ae01a866b948563f3017cff41c3a33eb395f790297bbd7561c28adcf43fb
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  ec27c7af89238a22f14b0e73d11a56bf02771c3824016aa76df95ea798b73681
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  2561a8ab02532346d9c3de82bef4ad3d6494cf7c54fd876ac5ff5aa1a188e5e5
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  bb6d72bad943f2237dddf0bdc03661475ac4b058a6fd734b56bd4d290f9b109b
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  6e116a0ddc2e0c1f5493cb2f39814242a7f848e32cd2d864e8129f86bac11d54
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-c6c6cf2cef8faf85f6ac106eb99bcc6a5693ccf9
  7ec0f9479c44c94241e7828b6cc0d0c47bfbc595e48e72161a6f0ce093c2deeb
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1675848939:step_script
  section_start:1675848939:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1675848940:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/803210
