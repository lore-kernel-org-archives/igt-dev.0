Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 15 Sep 2023 06:23:02 -0000
Message-ID: <169475898202.32040.4334245078076929336@emeril.freedesktop.org>
References: <20230915051832.9400-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230915051832.9400-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/intel/xe=5Fexec=5Fstore=3A_Add_cachelines_and_page-sized_s?=
 =?utf-8?q?ubtests=2E?=
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

Series: tests/intel/xe_exec_store: Add cachelines and page-sized subtests.
URL   : https://patchwork.freedesktop.org/series/123748/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/986439 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/49030431):
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  38d200ccf5edb5f30335e9c659143c85fe0c0960dd96a09afaa92b1586e12ab6
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  a6fcf62d5369e93a151028eb7ebc91f3e2a17dcfd692852264ac04919a34baa9
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  662d2be1400b02f45e70fe90f2794e51ac4be983e4eb2195f1309850dceedb3a
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-14a30379d89c6aee1505c4a399309c5a90740bb5
  4bee96f54806a6f9d4c876628ef407d0e9aaa0996bb462164141af31d1045233
  Getting image source signatures
  Copying blob sha256:1ff3c37c880c0442408c580a7b22df4d43085c60816e15689e41217d4f40bcb1
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:780ba3ad3e8124610553b0e0408e819a570f97ad0e75fdd6069372b39a660652
  Error: Error copying image to the remote destination: Error writing blob: Error determining upload URL: http: no Location header in response
  section_end:1694758701:step_script
  section_start:1694758701:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1694758702:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/986439
