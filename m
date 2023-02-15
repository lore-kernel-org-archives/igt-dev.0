Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0C10E9FC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:48:35 +0000 (UTC)
Date: Tue, 14 Feb 2023 16:48:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <Y+wry8OhxkpCdEgL@orsosgc001.jf.intel.com>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 00/30] Enable OAM support in IGT and GPUvis
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Please ignore, fails to build, so posted rev2 of this series.

On Tue, Feb 14, 2023 at 12:59:37PM -0800, Umesh Nerlige Ramappa wrote:
>Add support for OAM in IGT and enable support for GPUvis to capture
>OA reports on the media GT using OAM unit.
>
>OAM test support
>----------------
>  i915/perf: Add support for 64-bit OA formats
>  i915/perf: Define a default engine for OA
>  i915/perf: Use default engine for sseu tests
>  i915/perf: Ensure rcs0 is present for gen12-mi-rpc
>  i915/perf: Use ARRAY_SIZE for buffer-fill test
>  i915/perf: Add class:instance support to OA tests
>  i915/perf: Enable tests to run on specific engines
>  i915/perf: Treat ticks as 64 bit
>  i915/perf: Treat timestamp as 64 bit value
>  i915/perf: Add OAM format type
>  i915/perf: Use a helper for OA format
>  i915/perf: Add support for oa perf groups
>  i915/perf: Test concurrent access to OA in different groups
>  i915/perf: Add OAM support
>
>OAM metrics support
>-------------------
>  lib/perf: Make chipsets aware of oa formats
>  i915/perf: Choose OAM format for media metrics
>  lib/perf" Set missing metric unit for some counters
>  lib/perf: Add MTL to supprted HW in oa guid registry
>  lib/perf: Add support for OAM format in codegen
>  lib/perf: Update MTL GT2 metrics for OAM
>  lib/perf: Update MTL GT3 metrics for OAM
>  i915/perf: Add support for engine specific metrics
>  i915/perf: Run non-zero-reason on media engines as well
>  i915/perf: Make sanity check failures descriptive
>
>GPUvis support
>--------------
>  lib/perf: Enable multi-tile support for perf library
>  lib/perf: Update MTL OA timestamp and EU thread config
>  lib/perf: Add support for MPEC format
>  lib/perf: Adjust the GPU timestamp for new OA formats
>  tools/perf: Choose the right card
>  lib/perf: Apply shift to raw timestamp as well
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Umesh Nerlige Ramappa (30):
>  i915/perf: Add support for 64-bit OA formats
>  i915/perf: Define a default engine for OA
>  i915/perf: Use default engine for sseu tests
>  i915/perf: Ensure rcs0 is present for gen12-mi-rpc
>  i915/perf: Use ARRAY_SIZE for buffer-fill test
>  i915/perf: Add class:instance support to OA tests
>  i915/perf: Enable tests to run on specific engines
>  i915/perf: Treat ticks as 64 bit
>  i915/perf: Treat timestamp as 64 bit value
>  i915/perf: Add OAM format type
>  i915/perf: Use a helper for OA format
>  i915/perf: Add support for oa perf groups
>  i915/perf: Test concurrent access to OA in different groups
>  i915/perf: Add OAM support
>  lib/perf: Make chipsets aware of oa formats
>  i915/perf: Choose OAM format for media metrics
>  lib/perf" Set missing metric unit for some counters
>  lib/perf: Add MTL to supprted HW in oa guid registry
>  lib/perf: Add support for OAM format in codegen
>  lib/perf: Update MTL GT2 metrics for OAM
>  lib/perf: Update MTL GT3 metrics for OAM
>  i915/perf: Add support for engine specific metrics
>  i915/perf: Run non-zero-reason on media engines as well
>  i915/perf: Make sanity check failures descriptive
>  lib/perf: Enable multi-tile support for perf library
>  lib/perf: Update MTL OA timestamp and EU thread config
>  lib/perf: Add support for MPEC format
>  lib/perf: Adjust the GPU timestamp for new OA formats
>  tools/perf: Choose the right card
>  lib/perf: Apply shift to raw timestamp as well
>
> include/drm-uapi/i915_drm.h                   |   24 +
> lib/i915/perf-configs/codegen.py              |    4 +
> lib/i915/perf-configs/guids.xml               |   36 +-
> lib/i915/perf-configs/mdapi-xml-convert.py    |  220 ++-
> lib/i915/perf-configs/oa-mtlgt2.xml           | 1014 +++++++++++--
> lib/i915/perf-configs/oa-mtlgt3.xml           | 1328 +++++++++++++---
> lib/i915/perf-configs/oa_guid_registry.py     |    3 +-
> .../perf-configs/perf-metricset-codegen.py    |   36 +-
> lib/i915/perf.c                               |   66 +-
> lib/i915/perf.h                               |    2 +-
> lib/i915/perf_data_reader.c                   |   20 +-
> lib/intel_chipset.h                           |    3 +
> lib/intel_device_info.c                       |    1 +
> tests/core_hotunplug.c                        |    2 +-
> tests/i915/perf.c                             | 1337 +++++++++++++----
> tools/i915-perf/i915_perf_configs.c           |    2 +-
> tools/i915-perf/i915_perf_recorder.c          |   90 +-
> 17 files changed, 3476 insertions(+), 712 deletions(-)
>
>-- 
>2.36.1
>
