Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89110E39A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 10:50:26 +0000 (UTC)
Date: Mon, 28 Feb 2022 12:49:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <YhyoxLE3nAHFCwju@platvala-desk.ger.corp.intel.com>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227163057.28703-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v8 0/8] Addition of new plane scaling test cases
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

On Sun, Feb 27, 2022 at 10:00:49PM +0530, Swati Sharma wrote:
> In this series, combination of downscaling and upscaling
> testcases are added. Also, code refactoring is done for
> existing code.
> 
>     v2:-minor fixes, to prevent CI crashes
>     v3:-added subtests for testing upscaling/downscaling for
>         each plane individually (Ville)
>        -modified existing subtests for each N plane scaling
>         combo (Ville)
>     v4:-removal of i915sm (Ville)
>        -code reusablity (Ville)
>     v5:-use enum (Viile)
>        -limit while loop (Ville)
>        -add assert for fail/pass (Ville)
>        -added primary plane for testing (Ville)
>     v6:-after rebase, made changes accordingly to make
>         test cases consistent and for better coverage (Petri)
>     v7:-renaming of existing tests
>        -added 0.75 scaling factor downscaling tests (Petrii)
>     v8:-code cleanup
> 
> Swati Sharma (8):
>   tests/kms_plane_scaling: Removal of plane-scaling subtest
>   tests/kms_plane_scaling: Cleanup
>   tests/kms_plane_scaling: Minor changes with existing tests
>   tests/kms_plane_scaling: Addition of 0.75 scaling factor downscaling
>     tests
>   tests/kms_plane_scaling: Upscaling on 2 planes
>   tests/kms_plane_scaling: Downscaling on 2 planes
>   tests/kms_plane_scaling: Upscaling and downscaling scenario
>   tests/kms_plane_scaling: Add negative test to check num of scalers
> 
>  tests/kms_plane_scaling.c | 866 ++++++++++++++++++++------------------
>  1 file changed, 468 insertions(+), 398 deletions(-)

One comment on patch 8, with that addressed the series is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
