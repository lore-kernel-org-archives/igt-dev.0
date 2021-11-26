Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Nov 2021 11:40:27 -0000
Message-ID: <163792682732.11078.13419519907812632762@emeril.freedesktop.org>
References: <20211124095002.130684-1-jouni.hogander@intel.com>
In-Reply-To: <20211124095002.130684-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_B?=
 =?utf-8?q?iplanar_testcases_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Biplanar testcases (rev3)
URL   : https://patchwork.freedesktop.org/series/97232/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/453923 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16177634):
  STEP 2: COPY installdir/opt/igt /opt/igt
  09b0f807bd2cbedbeaf6297444906b45c12f38346a5096b8b16b0f8f6c09e2de
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  d651e5de4f3fb6b511672e4b1e6f98d3ed3b3b3ae41d104b120f94c475fb7bd0
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  ef20f57b6698d11eb0ac46e7a4220b14883430bc4241ace4bc9a146ec3a2bca5
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  173bc8a0ad05c60b7be021e0e28e8ebea8fd927538eda6515793a2ae50426cb6
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  0d005921ba0a1a0669d1f3a487f1e17437c2678b755125c7adbd89172a6f0f30
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-00a908aee1be306dfdd2e50a545bf973a239e41d
  cd5c7d42847d53f8c5c4f8898f977e755b7bc39099868edb5dba552145916e13
  Getting image source signatures
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:254aaa2771b3ce5af7483641c61df3bdecce4d73804d6d97aacc61b08607c175
  Copying blob sha256:c88b53adbe74b22d40e684e11804794df73cd631bc7daccf1fd1dfdd233cbb3d
  section_end:1637926646:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/453923
