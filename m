Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Nov 2021 17:51:40 -0000
Message-ID: <163794910016.11078.13337672720208822511@emeril.freedesktop.org>
References: <20211126151046.496270-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211126151046.496270-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/gem=5Fexec=5Fbalancer=3A_Make_sure_some_tests_are_run?=
 =?utf-8?q?_to_declare_success?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_balancer: Make sure some tests are run to declare success
URL   : https://patchwork.freedesktop.org/series/97330/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/454112 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16186557):
  STEP 2: COPY installdir/opt/igt /opt/igt
  d37c0d278cdcb7728aa07cc28b8bb4a7ec0d47397650ae81b45abc6dffe1809c
  STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
  473146768568573913e6ef5a65bdbaac8d4b56d695864fdeb5c74824b3b5c1d7
  STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
  a195dbdacb5b901a27b95f2acaadfba17b31a89393baf7b5716a9f6c6f97cc41
  STEP 5: ENV LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
  e0fd36ad337d6a8a84911c778fc2796ee899119c62031daedf8757dedac81a2b
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  c1374ed2f4c537384ee15d9500f8f258d5dcbe0dc60b7490212978a2c27c42a4
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-ea00870674675c88018e1e1a616993e5b19d88ee
  d856fcc61a217e3b48e241bb8f47c0fac7d057746335d35a5e40c016d3658d6c
  Getting image source signatures
  Copying blob sha256:d8a92e818d7367908d30060060d77dc7c0bb974eb569fc6e47fe82becc013f34
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying blob sha256:de714a99277aa41f69f6861148802331a164e5af8459c0c0dccc15e4aad08fca
  section_end:1637948949:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/454112
