Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 15 Oct 2021 20:39:35 -0000
Message-ID: <163433037592.29319.6963292730344662952@emeril.freedesktop.org>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
In-Reply-To: <20211015203238.133163-1-casey.g.bowman@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hanges_for_typical_arm64_cross-compile?=
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
To: Casey Bowman <casey.g.bowman@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Changes for typical arm64 cross-compile
URL   : https://patchwork.freedesktop.org/series/95892/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/424827 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/14798877):
  Compiler for C supports arguments -Werror=missing-braces: YES
  Compiler for C supports arguments -Werror=nonnull: YES
  Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
  Compiler for C supports arguments -Werror=return-type: YES
  Compiler for C supports arguments -Werror=sequence-point: YES
  Compiler for C supports arguments -Werror=trigraphs: YES
  Compiler for C supports arguments -Werror=write-strings: YES
  Compiler for C supports arguments -fno-builtin-malloc: YES
  Compiler for C supports arguments -fno-builtin-calloc: YES
  Compiler for C supports arguments -fcommon: YES
  Cross dependency libdrm found: NO (tried pkgconfig)
  
  meson.build:103:0: ERROR:  Dependency "libdrm" not found, tried pkgconfig
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1634330159:step_script
  section_start:1634330159:cleanup_file_variables
  Cleaning up file based variables
  section_end:1634330162:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/424827
