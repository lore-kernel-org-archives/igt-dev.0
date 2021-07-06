Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 06 Jul 2021 21:45:18 -0000
Message-ID: <162560791891.25117.4645646559315348372@emeril.freedesktop.org>
References: <20210706212749.27996-1-swati2.sharma@intel.com>
In-Reply-To: <20210706212749.27996-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fcdclk=3A_Minor_fix?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cdclk: Minor fix
URL   : https://patchwork.freedesktop.org/series/92252/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/354479 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/11565350):
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  ac47bd03fd79eb904987f55182951446b94a04962351f227af0abac8b441fd34
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  424cd0580fe7e7dc774230ce84d08ace5d1b063598e9f67d1f7c16b65c39060f
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  d3065d0796781a186ea3b1332b46e12356a08e20b6d4a83577ef12988d073d38
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-575bb72aab640364e06c9b438fde1353e7313c10
  d61b7a2fa3b38758e61decbe787d3a863af4112235eb0b4ad2326457bb8ddc5f
  Getting image source signatures
  Copying blob sha256:b8ff56153000c463ead35feae95e14444f4ed4ee51c863125550d0e500e91c18
  Copying blob sha256:17d8edeb87407da3fdf866ff431f19edd723a72d6f478c66be76e70dd620b8dd
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Error: Error copying image to the remote destination: Error writing blob: Error determining upload URL: http: no Location header in response
  section_end:1625607754:step_script
  section_start:1625607754:cleanup_file_variables
  Cleaning up file based variables
  section_end:1625607755:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/354479
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
