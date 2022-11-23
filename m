Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Wed, 23 Nov 2022 18:52:25 -0000
Message-ID: <166922954530.15574.7855111866504403236@emeril.freedesktop.org>
References: <20221121191747.2817707-1-markyacoub@chromium.org>
In-Reply-To: <20221121191747.2817707-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_C?=
 =?utf-8?q?hamelium=3A_Simplify_the_chamelium_test_files=2E_=28rev2=29?=
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

Series: Chamelium: Simplify the chamelium test files. (rev2)
URL   : https://patchwork.freedesktop.org/series/111163/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/745976 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332152):
  ../lib/igt_eld.h:48:2: error: unknown type name ‘size_t’
    size_t sads_len;
    ^~~~~~
  ../lib/igt_eld.h:55:34: error: unknown type name ‘size_t’
   bool eld_is_igt(const char *eld, size_t eld_size);
                                    ^~~~~~
  ../lib/igt_eld.h:55:34: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  ../lib/igt_eld.h:34:1:
  +#include <stddef.h>
   
  ../lib/igt_eld.h:55:34:
   bool eld_is_igt(const char *eld, size_t eld_size);
                                    ^~~~~~
  ninja: build stopped: subcommand failed.
  section_end:1669229173:step_script
  section_start:1669229173:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229174:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332147):
        |                                             ^~~~~~
  ../lib/igt_edid.h:406:45: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  In file included from ../tests/chamelium/kms_chamelium.c:27:
  ../lib/igt_eld.h:48:2: error: unknown type name ‘size_t’
     48 |  size_t sads_len;
        |  ^~~~~~
  ../lib/igt_eld.h:55:34: error: unknown type name ‘size_t’
     55 | bool eld_is_igt(const char *eld, size_t eld_size);
        |                                  ^~~~~~
  ../lib/igt_eld.h:34:1: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
     33 | #include "igt_edid.h"
    +++ |+#include <stddef.h>
     34 | 
  ninja: build stopped: subcommand failed.
  section_end:1669229168:step_script
  section_start:1669229168:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229169:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332151):
  size_t edid_cea_data_block_set_speaker_alloc(struct edid_cea_data_block *block,
  ^
  ../lib/igt_edid.h:406:45: error: unknown type name 'size_t'
  void edid_ext_set_cea(struct edid_ext *ext, size_t data_blocks_size,
                                              ^
  In file included from ../tests/chamelium/kms_chamelium.c:27:
  ../lib/igt_eld.h:48:2: error: unknown type name 'size_t'
          size_t sads_len;
          ^
  ../lib/igt_eld.h:55:34: error: unknown type name 'size_t'
  bool eld_is_igt(const char *eld, size_t eld_size);
                                   ^
  15 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1669229240:step_script
  section_start:1669229240:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229241:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332150):
        |                                             ^~~~~~
  ../lib/igt_edid.h:406:45: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  In file included from ../tests/chamelium/kms_chamelium.c:27:
  ../lib/igt_eld.h:48:2: error: unknown type name ‘size_t’
     48 |  size_t sads_len;
        |  ^~~~~~
  ../lib/igt_eld.h:55:34: error: unknown type name ‘size_t’
     55 | bool eld_is_igt(const char *eld, size_t eld_size);
        |                                  ^~~~~~
  ../lib/igt_eld.h:34:1: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
     33 | #include "igt_edid.h"
    +++ |+#include <stddef.h>
     34 | 
  ninja: build stopped: subcommand failed.
  section_end:1669229164:step_script
  section_start:1669229164:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229166:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332148):
        |                                             ^~~~~~
  ../lib/igt_edid.h:406:45: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  In file included from ../tests/chamelium/kms_chamelium.c:27:
  ../lib/igt_eld.h:48:2: error: unknown type name ‘size_t’
     48 |  size_t sads_len;
        |  ^~~~~~
  ../lib/igt_eld.h:55:34: error: unknown type name ‘size_t’
     55 | bool eld_is_igt(const char *eld, size_t eld_size);
        |                                  ^~~~~~
  ../lib/igt_eld.h:34:1: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
     33 | #include "igt_edid.h"
    +++ |+#include <stddef.h>
     34 | 
  ninja: build stopped: subcommand failed.
  section_end:1669229166:step_script
  section_start:1669229166:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229167:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/32332149):
        |                                             ^~~~~~
  ../lib/igt_edid.h:406:45: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
  In file included from ../tests/chamelium/kms_chamelium.c:27:
  ../lib/igt_eld.h:48:2: error: unknown type name ‘size_t’
     48 |  size_t sads_len;
        |  ^~~~~~
  ../lib/igt_eld.h:55:34: error: unknown type name ‘size_t’
     55 | bool eld_is_igt(const char *eld, size_t eld_size);
        |                                  ^~~~~~
  ../lib/igt_eld.h:34:1: note: ‘size_t’ is defined in header ‘<stddef.h>’; did you forget to ‘#include <stddef.h>’?
     33 | #include "igt_edid.h"
    +++ |+#include <stddef.h>
     34 | 
  ninja: build stopped: subcommand failed.
  section_end:1669229171:step_script
  section_start:1669229171:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1669229172:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/745976
