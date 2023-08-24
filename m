Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 24 Aug 2023 06:03:23 -0000
Message-ID: <169285700336.13342.495789588399416017@emeril.freedesktop.org>
References: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230824054123.820518-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_tiling_support_for_display_tests?=
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

Series: Add tiling support for display tests
URL   : https://patchwork.freedesktop.org/series/122822/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/969270 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47956627):
  17d063f830c2d2b4eb76f3cea3e8bbf662792c19c044f512c79736327d4a1c45
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  cdc08b5751bc7b91598e8238c1cd37462328e3aee6c04cdbb73abfebbb2b74b5
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  599c3baf1d7882ef1b6050f3743a680c8b355e47828ffec02f2cd5893f70d5b8
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  53f724065228079fc8e95b20812a9e02813a9fa150da72e099732a5c076f83a9
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-32d9efd0741f42b395885aadaa213e8a9127a565
  580f87c02348e52b26af3ac512531e9b2c2b85870a912ab747587d763a3b17a3
  Getting image source signatures
  Copying blob sha256:c8d8d092bb1a4bc1049bbeb98845cc6dfbcdcb9ba4683a396407e78972af6dca
  Copying blob sha256:9821ca7cfcf7c2c0ebdb1f3c8b2516d2954750f2b87faaf88eb25bf87ec70ea8
  Error: Error copying image to the remote destination: Error trying to reuse blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079 at destination: Get https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Figt%3Apull%2Cpush&service=container_registry: dial tcp 147.75.198.156:443: i/o timeout
  section_end:1692856872:step_script
  section_start:1692856872:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1692856873:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/969270
