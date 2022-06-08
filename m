Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Date: Wed, 08 Jun 2022 12:14:18 -0000
Message-ID: <165469045864.15583.17949912337968818520@emeril.freedesktop.org>
References: <20220608060737.3839351-1-arun.r.murthy@intel.com>
In-Reply-To: <20220608060737.3839351-1-arun.r.murthy@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fasync=5Fflips=3A_first_async_flip_discarded_on_i915_?=
 =?utf-8?b?KHJldjMp?=
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

Series: tests/kms_async_flips: first async flip discarded on i915 (rev3)
URL   : https://patchwork.freedesktop.org/series/104875/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/607408 for the overview.

containers:igt has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/23732302):
  ec512b0677af8babf0c3ca6db7bd7c84d7134058005f78d05a3de67fb4cb0af9
  STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
  bdb6892aef1dc0719277111711c05b56632e1d2e13c66715102c8aa8e4feda56
  STEP 7: CMD docker-help.sh
  STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-b9fbec4040014f8fb154e2abd1b9e276960d17c2
  83ab03688cdf4e2f2f085faadd9ecc8b11ac2934f8f26ec14f42f405550045c0
  Getting image source signatures
  Copying blob sha256:1660f04368ca052925a688801d695246acfe25aba8658f9cfdb98ea2ea1b95f2
  Copying blob sha256:1aeaa55c6f5c4bc94eb32ceff887852e303db981bcf35fd9ef081d8f1d062232
  Copying blob sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
  Copying config sha256:83ab03688cdf4e2f2f085faadd9ecc8b11ac2934f8f26ec14f42f405550045c0
  Writing manifest to image destination
  Storing signatures
  time="2022-06-08T12:04:59Z" level=fatal msg="Error initializing source docker://registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-b9fbec4040014f8fb154e2abd1b9e276960d17c2: unexpected http code: 504 (Gateway Timeout), URL: https://gitlab.freedesktop.org/jwt/auth?account=gitlab-ci-token&scope=repository%3Agfx-ci%2Figt-ci-tags%2Figt%3Apull&service=container_registry" 
  section_end:1654689899:step_script
  section_start:1654689899:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1654689900:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/607408
