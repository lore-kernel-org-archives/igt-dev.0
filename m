Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 Jan 2021 04:31:55 -0000
Message-ID: <161198111581.13907.13518361156911738587@emeril.freedesktop.org>
References: <20210130041704.19527-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210130041704.19527-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBtZXNv?=
 =?utf-8?q?n=3A_Turn_on_-Werror?=
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Turn on -Werror
URL   : https://patchwork.freedesktop.org/series/86465/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
fdc23507d022b68443121ec2c1a951af27c87240 i915/sysfs_clients: Check that client ids are cyclic

[245/370] Linking target tests/gem_tiled_fence_blits.
[246/370] Linking target tests/gem_tiled_pread_basic.
[247/370] Linking target tests/gem_tiled_partial_pwrite_pread.
[248/370] Linking target tests/gem_tiled_pread_pwrite.
[249/370] Linking target tests/gem_tiled_swapping.
[250/370] Linking target tests/gem_tiled_wc.
[251/370] Linking target tests/gem_tiled_wb.
[252/370] Linking target tests/gem_tiling_max_stride.
[253/370] Linking target tests/gem_unfence_active_buffers.
[254/370] Compiling C object 'tests/tests@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o'.
FAILED: tests/tests@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o 
ccache cc -Itests/tests@@gem_userptr_blits@exe -Itests -I../tests -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -I/usr/include/libdrm/nouveau -I/home/cidrm/kernel_headers/include -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wimplicit-fallthrough=0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-mi
 ssing-field-initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Waddress -Warray-bounds -Wimplicit -Winit-self -Wint-to-pointer-cast -Wmain -Wmissing-braces -Wnonnull -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wtrigraphs -Wwrite-strings -Werror -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/tests@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o' -MF 'tests/tests@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o.d' -o 'tests/tests@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o' -c ../tests/i915/gem_userptr_blits.c
In file included from ../tests/i915/gem_userptr_blits.c:58:
/home/cidrm/kernel_headers/include/linux/memfd.h:8: error: "MFD_CLOEXEC" redefined [-Werror]
 #define MFD_CLOEXEC  0x0001U
 
In file included from /usr/include/x86_64-linux-gnu/bits/mman-linux.h:115,
                 from /usr/include/x86_64-linux-gnu/bits/mman.h:45,
                 from /usr/include/x86_64-linux-gnu/sys/mman.h:41,
                 from ../lib/stubs/syscalls/sys/mman.h:5,
                 from ../tests/i915/gem_userptr_blits.c:49:
/usr/include/x86_64-linux-gnu/bits/mman-shared.h:26: note: this is the location of the previous definition
 #  define MFD_CLOEXEC 1U
 
In file included from ../tests/i915/gem_userptr_blits.c:58:
/home/cidrm/kernel_headers/include/linux/memfd.h:9: error: "MFD_ALLOW_SEALING" redefined [-Werror]
 #define MFD_ALLOW_SEALING 0x0002U
 
In file included from /usr/include/x86_64-linux-gnu/bits/mman-linux.h:115,
                 from /usr/include/x86_64-linux-gnu/bits/mman.h:45,
                 from /usr/include/x86_64-linux-gnu/sys/mman.h:41,
                 from ../lib/stubs/syscalls/sys/mman.h:5,
                 from ../tests/i915/gem_userptr_blits.c:49:
/usr/include/x86_64-linux-gnu/bits/mman-shared.h:27: note: this is the location of the previous definition
 #  define MFD_ALLOW_SEALING 2U
 
In file included from ../tests/i915/gem_userptr_blits.c:58:
/home/cidrm/kernel_headers/include/linux/memfd.h:10: error: "MFD_HUGETLB" redefined [-Werror]
 #define MFD_HUGETLB  0x0004U
 
In file included from /usr/include/x86_64-linux-gnu/bits/mman-linux.h:115,
                 from /usr/include/x86_64-linux-gnu/bits/mman.h:45,
                 from /usr/include/x86_64-linux-gnu/sys/mman.h:41,
                 from ../lib/stubs/syscalls/sys/mman.h:5,
                 from ../tests/i915/gem_userptr_blits.c:49:
/usr/include/x86_64-linux-gnu/bits/mman-shared.h:28: note: this is the location of the previous definition
 #  define MFD_HUGETLB 4U
 
cc1: all warnings being treated as errors
ninja: build stopped: subcommand failed.


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
