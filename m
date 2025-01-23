Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0664AC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 08:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B654710E20D;
	Thu, 23 Jan 2025 08:22:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BBE10E20D;
 Thu, 23 Jan 2025 08:22:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_add_dsc-fallback_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:22:46 -0000
Message-ID: <173762056666.3456989.3963285053668410631@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123073701.3113428-1-kunal1.joshi@intel.com>
In-Reply-To: <20250123073701.3113428-1-kunal1.joshi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

== Series Details ==

Series: add dsc-fallback test
URL   : https://patchwork.freedesktop.org/series/143877/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1350699 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822699):
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  lib/meson.build:172: WARNING: libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR:  File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620016:step_script
  section_start:1737620016:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620017:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822702):
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  lib/meson.build:172: WARNING: libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR:  File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620016:step_script
  section_start:1737620016:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620016:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822701):
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  lib/meson.build:172: WARNING: libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR:  File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620033:step_script
  section_start:1737620033:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620034:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822703):
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  lib/meson.build:172: WARNING: libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR:  File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620040:step_script
  section_start:1737620040:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620040:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822694):
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR: File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620042:step_script
  section_start:1737620042:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620043:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822698):
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR: File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620013:step_script
  section_start:1737620013:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620014:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822697):
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR: File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620027:step_script
  section_start:1737620027:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620027:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822695):
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR: File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620036:step_script
  section_start:1737620036:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620036:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69822696):
  Header <unistd.h> has symbol "gettid": YES
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  Program igt_doc.py found: YES (/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py)
  Program gen_rst_index skipped: feature sphinx disabled
  Program generate_iga64_codes found: YES (/builds/gfx-ci/igt-ci-tags/scripts/generate_iga64_codes)
  Configuring i915-perf.pc using configuration
  Configuring xe-oa.pc using configuration
  
  tests/meson.build:426:1: ERROR:  File intel/kms_mst_helper.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1737620044:step_script
  section_start:1737620044:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1737620045:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1350699
