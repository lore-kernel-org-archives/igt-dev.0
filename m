Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 23 May 2023 07:08:50 -0000
Message-ID: <168482573064.14422.5927843960277340620@emeril.freedesktop.org>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_D?=
 =?utf-8?q?ocument_KMS_tests_=28rev10=29?=
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

Series: Document KMS tests (rev10)
URL   : https://patchwork.freedesktop.org/series/117749/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/888013 for the overview.

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42247278):
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
  section_end:1684825269:step_script
  section_start:1684825269:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684825270:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42247277):
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
  section_end:1684825270:step_script
  section_start:1684825270:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684825271:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42247279):
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
  section_end:1684825284:step_script
  section_start:1684825284:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684825285:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/42247276):
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
  section_end:1684825279:step_script
  section_start:1684825279:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1684825280:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/888013
