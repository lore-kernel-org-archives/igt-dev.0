Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Tue, 27 Jun 2023 14:48:15 -0000
Message-ID: <168787729544.2459.8390492760417233694@emeril.freedesktop.org>
References: <20230627122030.675526-1-swati2.sharma@intel.com>
In-Reply-To: <20230627122030.675526-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_D?=
 =?utf-8?q?SC_Fractional_BPP_Val_Support_=28rev2=29?=
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

Series: DSC Fractional BPP Val Support (rev2)
URL   : https://patchwork.freedesktop.org/series/117493/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/920077 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44508810):
  0206735aec111e436dc521330289b7bdeecabd6c2ae60e8c070f4504bb56128d
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  e159d958b02c9c2f5c3d3f5154380baa08e21d745907e47a030134672a0c1912
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  fe2c5cf12dec333b4a81fe11b02cb307d14f6fbe59eab4b0472e6b2e970512f1
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  03fb162f57eed27133b27022f4ffe5ab79d8b90a943437bb397a99dcb9c2a5bb
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  a2729ed1214faa06e067b3b93aeead58c467af65c9910c9751c5926233ca5eea
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-f31528e7d69d6759f5e7c033cd06f3c93e7b918b
  36c0e14fbc185bd379e47965d1f93129fc3a3c153cf7b08628b73cc76a887e9f
  Getting image source signatures
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: failed to read from destination repository gfx-ci/igt-ci-tags/igt: 500 (Internal Server Error)
  section_end:1687877029:step_script
  section_start:1687877029:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1687877030:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/920077
