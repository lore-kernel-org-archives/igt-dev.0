Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 10 Oct 2022 07:12:38 -0000
Message-ID: <166538595860.29671.17237869602960370779@emeril.freedesktop.org>
References: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_v?=
 =?utf-8?q?m=5Fbind=3A_Add_VM=5FBIND_validation_support_=28rev7=29?=
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

Series: vm_bind: Add VM_BIND validation support (rev7)
URL   : https://patchwork.freedesktop.org/series/105881/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/707550 for the overview.

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/29546658):
  ../tests/i915/i915_vm_bind_basic.c:407:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     src_va = (uint64_t)src_addr[0];
              ^
  ../tests/i915/i915_vm_bind_basic.c:408:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     dst_va = (uint64_t)dst_addr;
              ^
  ../tests/i915/i915_vm_bind_basic.c:435:40: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     SET_MAP(map[i][BATCH_MAP], batch[i], (uint64_t)batch_addr[i], 0, PAGE_SIZE, 0);
                                          ^
  ../tests/i915/i915_vm_bind_basic.c:70:13: note: in definition of macro ‘SET_MAP’
    (map).va = _va;            \
               ^~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1665385747:step_script
  section_start:1665385747:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1665385748:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/29546660):
  ../tests/i915/i915_vm_bind_basic.c:407:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     src_va = (uint64_t)src_addr[0];
              ^
  ../tests/i915/i915_vm_bind_basic.c:408:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     dst_va = (uint64_t)dst_addr;
              ^
  ../tests/i915/i915_vm_bind_basic.c:435:40: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     SET_MAP(map[i][BATCH_MAP], batch[i], (uint64_t)batch_addr[i], 0, PAGE_SIZE, 0);
                                          ^
  ../tests/i915/i915_vm_bind_basic.c:70:13: note: in definition of macro ‘SET_MAP’
    (map).va = _va;            \
               ^~~
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1665385773:step_script
  section_start:1665385773:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1665385774:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/707550
