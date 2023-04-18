Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E04710E0DA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:58:11 +0000 (UTC)
Date: Tue, 18 Apr 2023 19:58:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <ZD7MIIwPHu+eM8ZR@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 00/45] Add IGT display support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 10:14:16PM +0530, Bhanuprakash Modem wrote:
> Add IGT support to work kms tests on XE driver.
> 
> TODO: Spin, BUSY & HANG related tests.
> 
> Bhanuprakash Modem (35):
>   lib: Use i915 namespace for XE debugfs
>   lib/igt_fb: Add copy engine support for XE
>   lib/igt_draw: Add gpu draw routine support for XE
>   tests/i915/kms_big_fb: Add XE support
>   tests/i915/kms_big_joiner: Add XE support
>   tests/i915/kms_cdclk: Add XE support
>   tests/i915/kms_draw_crc: Add XE support
>   tests/i915/kms_dsc: Add XE support
>   tests/i915/kms_flip_scaled_crc: Add XE support
>   tests/i915/kms_flip_tiling: Add XE support
>   tests/i915/kms_mmap_write_crc: Add XE support
>   tests/i915/kms_psr*: Add XE support
>   tests/kms_3d: Add XE support
>   tests/kms_async_flips: No XE support
>   tests/kms_atomic_transition: Add XE support
>   tests/color: Add XE support
>   tests/kms_concurrent: Add XE support
>   tests/kms_content_protection: Add XE support
>   tests/kms_cursor_crc: Add XE support
>   tests/kms_cursor_legacy: Add XE support
>   tests/kms_flip: Add XE support
>   tests/kms_flip_event_leak: Add XE support
>   tests/kms_getfb: Add XE support
>   tests/kms_hdmi_inject: Add XE support
>   tests/kms_hdr: Add XE support
>   tests/kms_panel_fitting: Add XE support
>   tests/kms_plane: Add XE support
>   tests/kms_plane_lowers: Add XE support
>   tests/kms_plane_scaling: Add XE support
>   tests/kms_prime: Add XE support
>   tests/kms_rotation_crc: Add XE support
>   tests/kms_setmode: Add XE support
>   tests/kms_universal_plane: Add XE support
>   tests/kms: Move intel specific kms tests to new dir

Feels like the whole xe lib/ stuff is basically
a failure if we need to touch that many things

>   xe-fast-feedback: Add kms tests to XE BAT
> 
> Zbigniew Kempczyński (10):
>   lib/xe_ioctl: Add missing header for direct resolving
>   lib/xe_query: Add region helpers and missing doc
>   lib/xe_query: Remove commented out function prototype
>   lib/intel_allocator: Add allocator support for Xe
>   lib/intel_bufops: Add Xe support in bufops
>   lib/intel_batchbuffer: Add Xe support in intel-bb
>   tests/xe_intel_bb: Check if intel-bb Xe support correctness
>   tests/xe-fast-feedback: Add xe_intel_bb test to BAT
>   lib/gpgpu_fill: Use RENDER engine flag to work on Xe
>   tests/xe_gpgpu_fill: Exercise gpgpu fill on Xe
> 
>  lib/gpgpu_fill.c                            |    4 +-
>  lib/gpu_cmds.c                              |    2 +-
>  lib/igt_draw.c                              |   82 +-
>  lib/igt_draw.h                              |    2 +
>  lib/igt_fb.c                                |   30 +-
>  lib/igt_fb.h                                |    2 +
>  lib/igt_kms.c                               |    4 +-
>  lib/igt_psr.c                               |    4 +-
>  lib/intel_allocator.c                       |   49 +-
>  lib/intel_aux_pgtable.c                     |    2 +-
>  lib/intel_batchbuffer.c                     |  430 +++++--
>  lib/intel_batchbuffer.h                     |   28 +-
>  lib/intel_bufops.c                          |   73 +-
>  lib/intel_bufops.h                          |   13 +-
>  lib/xe/xe_ioctl.h                           |    1 +
>  lib/xe/xe_query.c                           |   45 +
>  lib/xe/xe_query.h                           |    3 +-
>  tests/chamelium/kms_chamelium_color.c       |    2 +-
>  tests/i915/gem_caching.c                    |    4 +-
>  tests/i915/gem_pxp.c                        |    2 +-
>  tests/intel-ci/xe-fast-feedback.testlist    |   50 +
>  tests/{i915 => intel}/kms_big_fb.c          |   75 +-
>  tests/{i915 => intel}/kms_big_joiner.c      |    2 +-
>  tests/{i915 => intel}/kms_cdclk.c           |    5 +-
>  tests/{i915 => intel}/kms_draw_crc.c        |   24 +-
>  tests/{i915 => intel}/kms_dsc.c             |    2 +-
>  tests/{i915 => intel}/kms_dsc_helper.c      |    0
>  tests/{i915 => intel}/kms_dsc_helper.h      |    0
>  tests/{i915 => intel}/kms_flip_scaled_crc.c |    8 +-
>  tests/{i915 => intel}/kms_flip_tiling.c     |    8 +-
>  tests/{i915 => intel}/kms_mmap_write_crc.c  |    4 +-
>  tests/{i915 => intel}/kms_psr.c             |   40 +-
>  tests/{i915 => intel}/kms_psr2_sf.c         |    2 +-
>  tests/{i915 => intel}/kms_psr2_su.c         |    2 +-
>  tests/{i915 => intel}/kms_psr_stress_test.c |    2 +-
>  tests/kms_3d.c                              |    8 +
>  tests/kms_async_flips.c                     |    8 +-
>  tests/kms_atomic_transition.c               |    8 +-
>  tests/kms_color.c                           |   10 +-
>  tests/kms_color_helper.c                    |    2 +-
>  tests/kms_concurrent.c                      |    4 +-
>  tests/kms_content_protection.c              |   12 +-
>  tests/kms_cursor_crc.c                      |    4 +-
>  tests/kms_cursor_legacy.c                   |    4 +-
>  tests/kms_flip.c                            |   32 +-
>  tests/kms_flip_event_leak.c                 |    5 +
>  tests/kms_getfb.c                           |   22 +-
>  tests/kms_hdmi_inject.c                     |   10 +-
>  tests/kms_hdr.c                             |    8 +-
>  tests/kms_panel_fitting.c                   |   12 +-
>  tests/kms_plane.c                           |   19 +-
>  tests/kms_plane_lowres.c                    |    9 +-
>  tests/kms_plane_scaling.c                   |   41 +-
>  tests/kms_prime.c                           |  241 +++-
>  tests/kms_rotation_crc.c                    |   25 +-
>  tests/kms_setmode.c                         |    7 +
>  tests/kms_universal_plane.c                 |   15 +-
>  tests/meson.build                           |   39 +-
>  tests/xe/xe_gpgpu_fill.c                    |  133 +++
>  tests/xe/xe_intel_bb.c                      | 1181 +++++++++++++++++++
>  60 files changed, 2513 insertions(+), 352 deletions(-)
>  rename tests/{i915 => intel}/kms_big_fb.c (92%)
>  rename tests/{i915 => intel}/kms_big_joiner.c (99%)
>  rename tests/{i915 => intel}/kms_cdclk.c (98%)
>  rename tests/{i915 => intel}/kms_draw_crc.c (92%)
>  rename tests/{i915 => intel}/kms_dsc.c (99%)
>  rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
>  rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
>  rename tests/{i915 => intel}/kms_flip_scaled_crc.c (98%)
>  rename tests/{i915 => intel}/kms_flip_tiling.c (96%)
>  rename tests/{i915 => intel}/kms_mmap_write_crc.c (98%)
>  rename tests/{i915 => intel}/kms_psr.c (93%)
>  rename tests/{i915 => intel}/kms_psr2_sf.c (99%)
>  rename tests/{i915 => intel}/kms_psr2_su.c (99%)
>  rename tests/{i915 => intel}/kms_psr_stress_test.c (99%)
>  create mode 100644 tests/xe/xe_gpgpu_fill.c
>  create mode 100644 tests/xe/xe_intel_bb.c
> 
> --
> 2.40.0

-- 
Ville Syrjälä
Intel
