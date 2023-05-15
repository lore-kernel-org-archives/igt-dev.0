Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 15 May 2023 17:38:41 -0000
Message-ID: <168417232125.22016.11233618986027224686@emeril.freedesktop.org>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_D?=
 =?utf-8?q?ocument_KMS_tests_=28rev4=29?=
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

Series: Document KMS tests (rev4)
URL   : https://patchwork.freedesktop.org/series/117749/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881644 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41759739):
     chamelium_port_get_connector(data->chamelium, port, true);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_set_edid’:
  ../lib/igt_chamelium_helper.c:304:2: error: implicit declaration of function ‘chamelium_port_set_edid’; did you mean ‘chamelium_set_edid’? [-Werror=implicit-function-declaration]
    chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
    ^~~~~~~~~~~~~~~~~~~~~~~
    chamelium_set_edid
  ../lib/igt_chamelium_helper.c:304:2: warning: nested extern declaration of ‘chamelium_port_set_edid’ [-Wnested-externs]
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_check_analog_bridge’:
  ../lib/igt_chamelium_helper.c:319:3: warning: initialization of ‘drmModeConnector *’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
     chamelium_port_get_connector(data->chamelium, port, false);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1684172004:step_script
  section_start:1684172004:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684172005:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41759738):
     chamelium_port_get_connector(data->chamelium, port, true);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_set_edid’:
  ../lib/igt_chamelium_helper.c:304:2: error: implicit declaration of function ‘chamelium_port_set_edid’; did you mean ‘chamelium_set_edid’? [-Werror=implicit-function-declaration]
    chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
    ^~~~~~~~~~~~~~~~~~~~~~~
    chamelium_set_edid
  ../lib/igt_chamelium_helper.c:304:2: warning: nested extern declaration of ‘chamelium_port_set_edid’ [-Wnested-externs]
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_check_analog_bridge’:
  ../lib/igt_chamelium_helper.c:319:3: warning: initialization of ‘drmModeConnector *’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
     chamelium_port_get_connector(data->chamelium, port, false);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1684172003:step_script
  section_start:1684172003:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684172004:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41759740):
     chamelium_port_get_connector(data->chamelium, port, true);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_set_edid’:
  ../lib/igt_chamelium_helper.c:304:2: error: implicit declaration of function ‘chamelium_port_set_edid’; did you mean ‘chamelium_set_edid’? [-Werror=implicit-function-declaration]
    chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
    ^~~~~~~~~~~~~~~~~~~~~~~
    chamelium_set_edid
  ../lib/igt_chamelium_helper.c:304:2: warning: nested extern declaration of ‘chamelium_port_set_edid’ [-Wnested-externs]
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_check_analog_bridge’:
  ../lib/igt_chamelium_helper.c:319:3: warning: initialization of ‘drmModeConnector *’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
     chamelium_port_get_connector(data->chamelium, port, false);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1684172001:step_script
  section_start:1684172001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684172002:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41759737):
     chamelium_port_get_connector(data->chamelium, port, true);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_set_edid’:
  ../lib/igt_chamelium_helper.c:304:2: error: implicit declaration of function ‘chamelium_port_set_edid’; did you mean ‘chamelium_set_edid’? [-Werror=implicit-function-declaration]
    chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
    ^~~~~~~~~~~~~~~~~~~~~~~
    chamelium_set_edid
  ../lib/igt_chamelium_helper.c:304:2: warning: nested extern declaration of ‘chamelium_port_set_edid’ [-Wnested-externs]
  ../lib/igt_chamelium_helper.c: In function ‘chamelium_check_analog_bridge’:
  ../lib/igt_chamelium_helper.c:319:3: warning: initialization of ‘drmModeConnector *’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
     chamelium_port_get_connector(data->chamelium, port, false);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1684172001:step_script
  section_start:1684172001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684172003:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/41759733):
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Native dependency gtk-doc found: YES 1.29
  Program generate_description_xml.py found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py)
  Program generate_programs_xml.sh found: YES (/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_programs_xml.sh)
  Configuring version.xml using configuration
  Program sphinx-build skipped: feature sphinx disabled
  Program rst2html-3 found: NO
  Program rst2html found: YES (/usr/bin/rst2html)
  Program rst2pdf found: NO
  
  docs/testplan/meson.build:35:1: ERROR:  The += operator currently only works with arrays, strings or ints 
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1684172001:step_script
  section_start:1684172001:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684172002:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/881644
