Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B27A6E88A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 15:09:48 +0000 (UTC)
Date: Tue, 3 Aug 2021 11:09:44 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210803150944.fuzw3kkxf3kykndc@outlook.office365.com>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
 <20210726173759.pj5xsfdh5vhmtf57@outlook.office365.com>
 <20210730040720.GB4915@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210730040720.GB4915@zkempczy-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 00/50] Add allocator support in IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, nicholas.choi@amd.com
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 07/30, Zbigniew Kempczyński wrote:
> On Mon, Jul 26, 2021 at 01:37:59PM -0400, Rodrigo Siqueira wrote:
> > Hi Zbigniew,
> > 
> > Can we split this series into two parts? One dedicated to KMS and the
> > other dedicated to i915? As I commented in the V1, patch 44
> > (tests/kms_cursor_legacy) introduces a regression in AMD tests.
> 
> Hi Rodrigo.
> 
> Yes, we can split series to have kms_* tests outside of i915 changes.
> 
> Which tests you observe are failing now? 

Hi Zbigniew,

I did not test everything, just the cursor_legacy. When you have a new
version, we can try to run it our CI.

Nicholas,
When Zbigniew sends a new version, could you trigger a CI job to check
if everything is okay?

Thanks
Siqueira
 
> --
> Zbigniew
> 
> > 
> > Thanks
> > 
> > On 07/22, Zbigniew Kempczyński wrote:
> > > This is first batch which should decrease gap on platforms which 
> > > are switched to softpin mode only (RKL, ADL and newer).
> > > 
> > > Be aware current drm-tip contains core-for-CI patch which temporarily
> > > reenables relocations for ADL so CI run may be not expose bugs
> > > in the series code. I'm going to disable relocations for ADL 
> > > in separate patch for intel-gfx trybot to verify results.
> > > 
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > 
> > > Andrzej Turko (5):
> > >   tests/gem_exec_big: Require relocation support
> > >   tests/gem_exec_capture: Support gens without relocations
> > >   tests/gem_exec_gttfill: Require relocation support
> > >   tests/gem_exec_store: Support gens without relocations
> > >   tests/gem_softpin: Exercise eviction with softpinning
> > > 
> > > Bhanuprakash Modem (3):
> > >   lib/intel_batchbuffer: Add allocator support in blitter fast copy
> > >   tests/kms_flip: Adopt to use allocator
> > >   tests/kms_vblank: Adopt to use allocator
> > > 
> > > Ch Sai Gowtham (1):
> > >   tests/gem_mmap_gtt: Add allocator support
> > > 
> > > Sai Gowtham (4):
> > >   tests/gem_exec_params: Support gens without relocations
> > >   tests/gem_mmap: Add allocator support
> > >   tests/gem_mmap_offset: Add allocator support
> > >   tests/gem_request_retire: Add allocator support
> > > 
> > > Zbigniew Kempczyński (37):
> > >   lib/igt_dummyload: Add support of using allocator in igt spinner
> > >   lib/intel_allocator: Add few helper functions for common use
> > >   lib/igt_gt: Add passing ahnd as an argument to igt_hang
> > >   lib/intel_batchbuffer: Add allocator support in blitter src copy
> > >   lib/huc_copy: Extend huc copy prototype to pass allocator handle
> > >   tests/gem_bad_reloc: Skip on gens where relocations are not supported
> > >   tests/gem_busy: Adopt to use allocator
> > >   tests/gem_create: Adopt to use allocator
> > >   tests/gem_ctx_engines: Adopt to use allocator
> > >   tests/gem_ctx_exec: Adopt to use allocator
> > >   tests/gem_ctx_freq: Adopt to use allocator
> > >   tests/gem_ctx_isolation: Adopt to use allocator
> > >   tests/gem_ctx_param: Adopt to use allocator
> > >   tests/gem_eio: Adopt to use allocator
> > >   tests/gem_exec_async: Adopt to use allocator
> > >   tests/gem_exec_suspend: Adopt to use allocator
> > >   tests/gem_exec_parallel: Adopt to use alloctor
> > >   tests/gem_mmap_wc: Adopt to use allocator
> > >   tests/gem_ringfill: Adopt to use allocator
> > >   tests/gem_spin_batch: Adopt to use allocator
> > >   tests/gem_tiled_fence_blits: Adopt to use allocator
> > >   tests/gem_unfence_active_buffers: Adopt to use allocator
> > >   tests/gem_unref_active_buffers: Adopt to use allocator
> > >   tests/gem_wait: Adopt to use allocator
> > >   tests/gem_watchdog: Adopt to use no-reloc
> > >   tests/gem_workarounds: Adopt to use allocator
> > >   tests/i915_hangman: Adopt to use allocator
> > >   tests/i915_module_load: Adopt to use allocator
> > >   tests/i915_pm_rc6_residency: Adopt to use allocator
> > >   tests/i915_pm_rpm: Adopt to use no-reloc
> > >   tests/i915_pm_rps: Alter to use no-reloc
> > >   tests/kms_busy: Adopt to use allocator
> > >   tests/kms_cursor_legacy: Adopt to use allocator
> > >   tests/perf_pmu: Adopt to use allocator
> > >   tests/sysfs_heartbeat_interval: Adopt to use allocator
> > >   tests/sysfs_preempt_timeout: Adopt to use allocator
> > >   tests/sysfs_timeslice_duration: Adopt to use allocator
> > > 
> > >  lib/huc_copy.c                          |  16 +-
> > >  lib/huc_copy.h                          |   4 +-
> > >  lib/igt_dummyload.c                     |  74 ++++++--
> > >  lib/igt_dummyload.h                     |   3 +
> > >  lib/igt_fb.c                            |  22 ++-
> > >  lib/igt_gt.c                            |  21 ++-
> > >  lib/igt_gt.h                            |   4 +
> > >  lib/intel_allocator.h                   |  55 ++++++
> > >  lib/intel_batchbuffer.c                 |  70 ++++++--
> > >  lib/intel_batchbuffer.h                 |  18 +-
> > >  tests/i915/gem_bad_reloc.c              |   1 +
> > >  tests/i915/gem_busy.c                   |  35 +++-
> > >  tests/i915/gem_create.c                 |  11 +-
> > >  tests/i915/gem_ctx_engines.c            |  25 ++-
> > >  tests/i915/gem_ctx_exec.c               |  45 ++++-
> > >  tests/i915/gem_ctx_freq.c               |   4 +-
> > >  tests/i915/gem_ctx_isolation.c          |  97 ++++++++---
> > >  tests/i915/gem_ctx_param.c              |   7 +-
> > >  tests/i915/gem_eio.c                    |  60 +++++--
> > >  tests/i915/gem_exec_async.c             |  57 +++++--
> > >  tests/i915/gem_exec_big.c               |   1 +
> > >  tests/i915/gem_exec_capture.c           | 131 +++++++++++----
> > >  tests/i915/gem_exec_gttfill.c           |   1 +
> > >  tests/i915/gem_exec_parallel.c          |  33 +++-
> > >  tests/i915/gem_exec_params.c            |  74 +++++---
> > >  tests/i915/gem_exec_store.c             | 134 +++++++++++----
> > >  tests/i915/gem_exec_suspend.c           |  44 +++--
> > >  tests/i915/gem_huc_copy.c               |  12 +-
> > >  tests/i915/gem_mmap.c                   |   4 +-
> > >  tests/i915/gem_mmap_gtt.c               |  15 +-
> > >  tests/i915/gem_mmap_offset.c            |   4 +-
> > >  tests/i915/gem_mmap_wc.c                |   4 +-
> > >  tests/i915/gem_request_retire.c         |  14 +-
> > >  tests/i915/gem_ringfill.c               |  36 +++-
> > >  tests/i915/gem_softpin.c                | 213 +++++++++++++++++++++++-
> > >  tests/i915/gem_spin_batch.c             |  38 +++--
> > >  tests/i915/gem_tiled_fence_blits.c      |  65 ++++++--
> > >  tests/i915/gem_unfence_active_buffers.c |   5 +-
> > >  tests/i915/gem_unref_active_buffers.c   |   5 +-
> > >  tests/i915/gem_wait.c                   |   3 +
> > >  tests/i915/gem_watchdog.c               |  11 +-
> > >  tests/i915/gem_workarounds.c            |  17 +-
> > >  tests/i915/i915_hangman.c               |  15 +-
> > >  tests/i915/i915_module_load.c           |  23 ++-
> > >  tests/i915/i915_pm_rc6_residency.c      |   8 +-
> > >  tests/i915/i915_pm_rpm.c                |  27 ++-
> > >  tests/i915/i915_pm_rps.c                |  19 ++-
> > >  tests/i915/perf_pmu.c                   | 147 +++++++++++-----
> > >  tests/i915/sysfs_heartbeat_interval.c   |  24 ++-
> > >  tests/i915/sysfs_preempt_timeout.c      |  21 ++-
> > >  tests/i915/sysfs_timeslice_duration.c   |  21 ++-
> > >  tests/kms_busy.c                        |   9 +
> > >  tests/kms_cursor_legacy.c               |   6 +
> > >  tests/kms_flip.c                        |  14 +-
> > >  tests/kms_vblank.c                      |  11 +-
> > >  tests/prime_vgem.c                      | 120 +++++++++----
> > >  56 files changed, 1588 insertions(+), 370 deletions(-)
> > > 
> > > -- 
> > > 2.26.0
> > > 
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C213e28aae4244c775e6708d9530f8a8c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637632148482628190%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WKBxYwSoH%2BEv9b7yggDyxeDF7gmmimUMficsuG2oFDU%3D&amp;reserved=0
> > 
> > -- 
> > Rodrigo Siqueira
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsiqueira.tech%2F&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C213e28aae4244c775e6708d9530f8a8c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637632148482628190%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zWuQkcCA%2F0qDgaB18Er%2BWdNpdlm2cxjarzsVB9OiP1I%3D&amp;reserved=0

-- 
Rodrigo Siqueira
https://siqueira.tech
