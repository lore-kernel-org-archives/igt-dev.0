Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D210E448
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 09:45:55 +0000 (UTC)
Date: Mon, 24 Apr 2023 11:45:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230424094551.ae7f5aif533najq4@kamilkon-desk1>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230421164347.lkxhv3mmu7hbxtt3@kamilkon-desk1>
 <ebb89173-c2a0-d06b-0cbb-63e649343a9f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ebb89173-c2a0-d06b-0cbb-63e649343a9f@intel.com>
Subject: Re: [igt-dev] [i-g-t 00/45] Add IGT display support for XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-04-24 at 10:51:46 +0530, Modem, Bhanuprakash wrote:
> Hi Kamil,
> 
> On Fri-21-04-2023 10:13 pm, Kamil Konieczny wrote:
> > Hi Bhanuprakash,
> > 
> > On 2023-04-18 at 22:14:16 +0530, Bhanuprakash Modem wrote:
> > > Add IGT support to work kms tests on XE driver.
> > > 
> > > TODO: Spin, BUSY & HANG related tests.
> > > 
> > > Bhanuprakash Modem (35):
> > >    lib: Use i915 namespace for XE debugfs
> > >    lib/igt_fb: Add copy engine support for XE
> > >    lib/igt_draw: Add gpu draw routine support for XE
> > >    tests/i915/kms_big_fb: Add XE support
> > >    tests/i915/kms_big_joiner: Add XE support

[...]

> > >   lib/xe/xe_query.c                           |   45 +
> > >   lib/xe/xe_query.h                           |    3 +-
> > >   tests/chamelium/kms_chamelium_color.c       |    2 +-
> > >   tests/i915/gem_caching.c                    |    4 +-
> > >   tests/i915/gem_pxp.c                        |    2 +-
> > >   tests/intel-ci/xe-fast-feedback.testlist    |   50 +
> > >   tests/{i915 => intel}/kms_big_fb.c          |   75 +-
> > >   tests/{i915 => intel}/kms_big_joiner.c      |    2 +-
> > >   tests/{i915 => intel}/kms_cdclk.c           |    5 +-
> > >   tests/{i915 => intel}/kms_draw_crc.c        |   24 +-
> > >   tests/{i915 => intel}/kms_dsc.c             |    2 +-
> > >   tests/{i915 => intel}/kms_dsc_helper.c      |    0
> > >   tests/{i915 => intel}/kms_dsc_helper.h      |    0
> > >   tests/{i915 => intel}/kms_flip_scaled_crc.c |    8 +-
> > >   tests/{i915 => intel}/kms_flip_tiling.c     |    8 +-
> > >   tests/{i915 => intel}/kms_mmap_write_crc.c  |    4 +-
> > >   tests/{i915 => intel}/kms_psr.c             |   40 +-
> > >   tests/{i915 => intel}/kms_psr2_sf.c         |    2 +-
> > >   tests/{i915 => intel}/kms_psr2_su.c         |    2 +-
> > >   tests/{i915 => intel}/kms_psr_stress_test.c |    2 +-
> > --------- ^^^^^^^^^^^^^
> > Do we really need to move them ? If yes, I would prefer
> > to see that in separate patch with cc to CI.
> 
> Yes, I would prefer to move these tests to new dir because these kms tests
> supports both i915 & XE. Currently, dir tests/i915/ contains only i915
> specific tests, similarly tests/xe/ contains XE specific.

Ok. The only thing to avoid would be moving them back and forth
between folders xe/ and i915/
My main point is to do this movement in separate patchset.

> 
> Else we can have a new dir structure as below:
> tests/intel/i915/*.c: i915 specific tests.
> tests/intel/xe/*.c: XE specific tests.
> tests/intel/*.c: Tests supports both i915 & XE.

Looks bad, too many folders.

> 
> Also, why do we need to include CI folks? We are just moving tests to
> different dir, and binaries location is still unchanged (<build
> dir>/tests/).
> 
> - Bhanu

You are right, I forgot we put all execs in build/tests/

Regards,
Kamil

> 
> > 
> > Regards,
> > Kamil
> > 
> > >   tests/kms_3d.c                              |    8 +
> > >   tests/kms_async_flips.c                     |    8 +-
> > >   tests/kms_atomic_transition.c               |    8 +-
> > >   tests/kms_color.c                           |   10 +-
> > >   tests/kms_color_helper.c                    |    2 +-
> > >   tests/kms_concurrent.c                      |    4 +-
> > >   tests/kms_content_protection.c              |   12 +-
> > >   tests/kms_cursor_crc.c                      |    4 +-
> > >   tests/kms_cursor_legacy.c                   |    4 +-
> > >   tests/kms_flip.c                            |   32 +-
> > >   tests/kms_flip_event_leak.c                 |    5 +
> > >   tests/kms_getfb.c                           |   22 +-
> > >   tests/kms_hdmi_inject.c                     |   10 +-
> > >   tests/kms_hdr.c                             |    8 +-
> > >   tests/kms_panel_fitting.c                   |   12 +-
> > >   tests/kms_plane.c                           |   19 +-
> > >   tests/kms_plane_lowres.c                    |    9 +-
> > >   tests/kms_plane_scaling.c                   |   41 +-
> > >   tests/kms_prime.c                           |  241 +++-
> > >   tests/kms_rotation_crc.c                    |   25 +-
> > >   tests/kms_setmode.c                         |    7 +
> > >   tests/kms_universal_plane.c                 |   15 +-
> > >   tests/meson.build                           |   39 +-
> > >   tests/xe/xe_gpgpu_fill.c                    |  133 +++
> > >   tests/xe/xe_intel_bb.c                      | 1181 +++++++++++++++++++
> > >   60 files changed, 2513 insertions(+), 352 deletions(-)
> > >   rename tests/{i915 => intel}/kms_big_fb.c (92%)
> > >   rename tests/{i915 => intel}/kms_big_joiner.c (99%)
> > >   rename tests/{i915 => intel}/kms_cdclk.c (98%)
> > >   rename tests/{i915 => intel}/kms_draw_crc.c (92%)
> > >   rename tests/{i915 => intel}/kms_dsc.c (99%)
> > >   rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
> > >   rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
> > >   rename tests/{i915 => intel}/kms_flip_scaled_crc.c (98%)
> > >   rename tests/{i915 => intel}/kms_flip_tiling.c (96%)
> > >   rename tests/{i915 => intel}/kms_mmap_write_crc.c (98%)
> > >   rename tests/{i915 => intel}/kms_psr.c (93%)
> > >   rename tests/{i915 => intel}/kms_psr2_sf.c (99%)
> > >   rename tests/{i915 => intel}/kms_psr2_su.c (99%)
> > >   rename tests/{i915 => intel}/kms_psr_stress_test.c (99%)
> > >   create mode 100644 tests/xe/xe_gpgpu_fill.c
> > >   create mode 100644 tests/xe/xe_intel_bb.c
> > > 
> > > --
> > > 2.40.0
> > > 
