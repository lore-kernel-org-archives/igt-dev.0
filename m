Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jake Freeland" <jake@technologyfriends.net>
Date: Tue, 16 Aug 2022 16:16:53 -0000
Message-ID: <166066661374.9028.17028127557408410967@emeril.freedesktop.org>
References: <20220816015413.1187415-1-jfree@freebsd.org>
In-Reply-To: <20220816015413.1187415-1-jfree@freebsd.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_r?=
 =?utf-8?q?eplaced_/bin/bash_shebangs_with_/bin/sh_for_BSD_compatibility?=
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

Series: replaced /bin/bash shebangs with /bin/sh for BSD compatibility
URL   : https://patchwork.freedesktop.org/series/107314/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/666005 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/26889091):
      assert(f.readline() == "END TESTLIST\n")
  AssertionError
  [26/36] Generating igt_test_programs_drm_description.xml with a custom command.
  FAILED: docs/reference/igt-gpu-tools/igt_test_programs_drm_description.xml 
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py docs/reference/igt-gpu-tools/igt_test_programs_drm_description.xml drm tests/test-list.txt
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 114, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 83, in main
      tests = get_testlist(testlist_file)
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 20, in get_testlist
      assert(f.readline() == "END TESTLIST\n")
  AssertionError
  ninja: build stopped: subcommand failed.
  section_end:1660666525:step_script
  section_start:1660666525:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1660666525:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/26889093):
      assert(f.readline() == "END TESTLIST\n")
  AssertionError
  [26/36] Generating igt_test_programs_meta_description.xml with a custom command.
  FAILED: docs/reference/igt-gpu-tools/igt_test_programs_meta_description.xml 
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py docs/reference/igt-gpu-tools/igt_test_programs_meta_description.xml meta tests/test-list.txt
  Traceback (most recent call last):
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 114, in <module>
      main()
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 83, in main
      tests = get_testlist(testlist_file)
    File "/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/generate_description_xml.py", line 20, in get_testlist
      assert(f.readline() == "END TESTLIST\n")
  AssertionError
  ninja: build stopped: subcommand failed.
  section_end:1660666505:step_script
  section_start:1660666505:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1660666506:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/666005
