Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Mon, 03 Jul 2023 05:06:34 -0000
Message-ID: <168836079449.4276.549422221086149323@emeril.freedesktop.org>
References: <20230703043420.50705-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230703043420.50705-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5B1/6=5D_lib/amdgpu=3A_prepared_shared_par?=
 =?utf-8?q?t_of_multimedia_tests?=
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

Series: series starting with [1/6] lib/amdgpu: prepared shared part of multimedia tests
URL   : https://patchwork.freedesktop.org/series/120126/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/924952 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824709):
  Has header "linux/kd.h" : YES
  Has header "sys/kd.h" : YES
  Has header "libgen.h" : YES
  Has header "sys/io.h" : YES
  Checking if "cpuid.h" links: YES
  Header <unistd.h> has symbol "gettid" : NO
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR:  File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360492:step_script
  section_start:1688360492:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360493:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824712):
  Has header "linux/kd.h" : YES
  Has header "sys/kd.h" : YES
  Has header "libgen.h" : YES
  Has header "sys/io.h" : NO
  Checking if "cpuid.h" links: NO
  Header <unistd.h> has symbol "gettid" : NO
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR:  File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360494:step_script
  section_start:1688360494:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360494:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824711):
  Has header "linux/kd.h" : YES
  Has header "sys/kd.h" : YES
  Has header "libgen.h" : YES
  Has header "sys/io.h" : YES
  Checking if "cpuid.h" links: NO
  Header <unistd.h> has symbol "gettid" : NO
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR:  File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360494:step_script
  section_start:1688360494:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360495:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824713):
  Has header "linux/kd.h" : YES
  Has header "sys/kd.h" : YES
  Has header "libgen.h" : YES
  Has header "sys/io.h" : NO
  Checking if "cpuid.h" links: NO
  Header <unistd.h> has symbol "gettid" : NO
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR:  File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360495:step_script
  section_start:1688360495:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360497:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824704):
  Has header "linux/kd.h" : YES 
  Has header "sys/kd.h" : YES 
  Has header "libgen.h" : YES 
  Has header "sys/io.h" : YES 
  Checking if "cpuid.h" links: YES 
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR: File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360492:step_script
  section_start:1688360492:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360493:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824708):
  Has header "linux/kd.h" : YES 
  Has header "sys/kd.h" : YES 
  Has header "libgen.h" : YES 
  Has header "sys/io.h" : YES 
  Checking if "cpuid.h" links: YES 
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR: File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360496:step_script
  section_start:1688360496:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360498:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824705):
  Has header "linux/kd.h" : YES 
  Has header "sys/kd.h" : YES 
  Has header "libgen.h" : YES 
  Has header "sys/io.h" : YES 
  Checking if "cpuid.h" links: YES 
  Header <unistd.h> has symbol "gettid" : YES 
  Checking whether type "struct sysinfo" has member "totalram" : YES 
  Checking for function "memfd_create" : YES 
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR: File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360494:step_script
  section_start:1688360494:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360496:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/44824706):
  Has header "linux/kd.h": YES
  Has header "sys/kd.h": YES
  Has header "libgen.h": YES
  Has header "sys/io.h": YES
  Checking if "cpuid.h" links: YES
  Header <unistd.h> has symbol "gettid": YES
  Checking whether type "struct sysinfo" has member "totalram" : YES
  Checking for function "memfd_create" : YES
  Configuring config.h using configuration
  Program python3 found: YES (/usr/bin/python3)
  
  lib/meson.build:207:4: ERROR:  File amdgpu/amd_mmd_shared.c does not exist.
  
  A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
  section_end:1688360494:step_script
  section_start:1688360494:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1688360494:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/924952
