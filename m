Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A98610E1AF
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:43:45 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:42:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yhjq7LxkgDBP7zb+@platvala-desk.ger.corp.intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v7 0/8] Addition of new plane scaling test cases
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

On Fri, Feb 25, 2022 at 08:14:28PM +0530, Swati Sharma wrote:
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
>        -added 0.75 scaling factor downscaling tests (Petri)
> 
> Swati Sharma (8):
>   tests/kms_plane_scaling: Removal of plane-scaling subtest
>   tests/kms_plane_scaling: Minor changes with existing tests
>   tests/kms_plane_scaling: Upscaling on 2 planes
>   tests/kms_plane_scaling: Downscaling on 2 planes
>   tests/kms_plane_scaling: Upscaling and downscaling scenario
>   tests/kms_plane_scaling: Add negative test to check num of scalers
>   tests/kms_plane_scaling: Refactor clipping-clamping subtest
>   tests/kms_plane_scaling: Cleanup
> 
>  tests/kms_plane_scaling.c | 790 ++++++++++++++++++++++----------------
>  1 file changed, 463 insertions(+), 327 deletions(-)
> 
> -- 
> 2.25.1
> 


One comment made on one patch, with that addressed the series is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

as long as CI doesn't choke on this.
