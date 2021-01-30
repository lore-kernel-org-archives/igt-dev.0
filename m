Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 Jan 2021 13:05:14 -0000
Message-ID: <161201191465.13912.17970307210771347398@emeril.freedesktop.org>
References: <20210130064421.30389-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210130064421.30389-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?eson=3A_Turn_on_-Werror_=28rev4=29?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Turn on -Werror (rev4)
URL   : https://patchwork.freedesktop.org/series/86465/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263968 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/6996101):
  ../assembler/gen4asm.h:63:21: note: passing argument to parameter 'msg' here
  void yyerror (char *msg);
                      ^
  assembler/1ca89e8@@intel-gen4asm@exe/gram.c:5776:16: error: passing 'const char [17]' to parameter of type 'char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    yyerror (YY_("memory exhausted"));
                 ^~~~~~~~~~~~~~~~~~
  assembler/1ca89e8@@intel-gen4asm@exe/gram.c:914:22: note: expanded from macro 'YY_'
  #  define YY_(Msgid) Msgid
                       ^~~~~
  ../assembler/gen4asm.h:63:21: note: passing argument to parameter 'msg' here
  void yyerror (char *msg);
                      ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1612011154:step_script
  section_start:1612011154:cleanup_file_variables
  Cleaning up file based variables
  section_end:1612011155:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263968
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
