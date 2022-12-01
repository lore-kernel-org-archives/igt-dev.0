Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Thu, 01 Dec 2022 13:08:58 -0000
Message-ID: <166990013846.14637.5634421676403713643@emeril.freedesktop.org>
References: <20221201124644.660870-1-vikas.srivastava@intel.com>
In-Reply-To: <20221201124644.660870-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/prime=5Fmmap=5Fcoherency=3A_Adding_blitter_copy_support_for_g?=
 =?utf-8?q?en12+_platforms?=
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

Series: tests/prime_mmap_coherency: Adding blitter copy support for gen12+ platforms
URL   : https://patchwork.freedesktop.org/series/111532/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
71bce31c26998d5d53cff3138049261fd6c4fbaf tests/v3d_perfmon: Create test for V3D's Perfmon IOCTLs

      |                                 ^~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/intel_bufops.h:7,
                 from ../../../usr/src/igt-gpu-tools/lib/igt_draw.h:28,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:33,
                 from ../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:33:
../../../usr/src/igt-gpu-tools/lib/intel_batchbuffer.h:311:28: note: expected ‘const intel_ctx_cfg_t *’ {aka ‘const struct intel_ctx_cfg *’} but argument is of type ‘int’
  311 |     const intel_ctx_cfg_t *cfg,
      |     ~~~~~~~~~~~~~~~~~~~~~~~^~~
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:39:6: error: too few arguments to function ‘igt_blitter_fast_copy__raw’
   39 |     (igt_blitter_fast_copy__raw(expr)) : \
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:255:2: note: in expansion of macro ‘blitter_copy’
  255 |  blitter_copy(local_fd, ahnd, 0, bo_1->handle, 0, width * 4,
      |  ^~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/intel_bufops.h:7,
                 from ../../../usr/src/igt-gpu-tools/lib/igt_draw.h:28,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:33,
                 from ../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:33:
../../../usr/src/igt-gpu-tools/lib/intel_batchbuffer.h:308:6: note: declared here
  308 | void igt_blitter_fast_copy__raw(int fd,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:255:38: warning: passing argument 4 of ‘igt_blitter_src_copy’ makes pointer from integer without a cast [-Wint-conversion]
  255 |  blitter_copy(local_fd, ahnd, 0, bo_1->handle, 0, width * 4,
      |                                  ~~~~^~~~~~~~
      |                                      |
      |                                      int
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:40:27: note: in definition of macro ‘blitter_copy’
   40 |     (igt_blitter_src_copy(expr)))
      |                           ^~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/intel_bufops.h:7,
                 from ../../../usr/src/igt-gpu-tools/lib/igt_draw.h:28,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:33,
                 from ../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:33:
../../../usr/src/igt-gpu-tools/lib/intel_batchbuffer.h:277:29: note: expected ‘const intel_ctx_cfg_t *’ {aka ‘const struct intel_ctx_cfg *’} but argument is of type ‘int’
  277 |      const intel_ctx_cfg_t *cfg,
      |      ~~~~~~~~~~~~~~~~~~~~~~~^~~
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:40:6: error: too few arguments to function ‘igt_blitter_src_copy’
   40 |     (igt_blitter_src_copy(expr)))
      |      ^~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:255:2: note: in expansion of macro ‘blitter_copy’
  255 |  blitter_copy(local_fd, ahnd, 0, bo_1->handle, 0, width * 4,
      |  ^~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/intel_bufops.h:7,
                 from ../../../usr/src/igt-gpu-tools/lib/igt_draw.h:28,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:33,
                 from ../../../usr/src/igt-gpu-tools/tests/prime_mmap_coherency.c:33:
../../../usr/src/igt-gpu-tools/lib/intel_batchbuffer.h:274:6: note: declared here
  274 | void igt_blitter_src_copy(int fd,
      |      ^~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

