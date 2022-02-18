Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0410F093
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 10:46:45 +0000 (UTC)
Date: Fri, 18 Feb 2022 12:45:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yg943YCHxhRmFP67@platvala-desk.ger.corp.intel.com>
References: <20220216122217.16507-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216122217.16507-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v5 0/9] Addition of new plane scaling test cases
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

On Wed, Feb 16, 2022 at 05:52:08PM +0530, Swati Sharma wrote:
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
> 
> Swati Sharma (9):
>   tests/kms_plane_scaling: Removal of plane-scaling subtest
>   tests/kms_plane_scaling: Add output name in dynamic subtests
>   tests/kms_plane_scaling: Upscaling each plane
>   tests/kms_plane_scaling: Downscaling each plane
>   tests/kms_plane_scaling: Upscaling on 2 planes
>   tests/kms_plane_scaling: Downscaling on 2 planes
>   tests/kms_plane_scaling: Upscaling and downscaling scenario
>   tests/kms_plane_scaling: Add negative test to check num of scalers
>   tests/kms_plane_scaling: Refactor clipping-clamping subtest
> 
>  tests/kms_plane_scaling.c | 720 +++++++++++++++++++++++---------------
>  1 file changed, 445 insertions(+), 275 deletions(-)
> 
> -- 
> 2.25.1
> 


Recapping some offline discussions for the mailing list:

Patches 3+4 in this series ({Upscaling,Downscaling} each plane) can be
dropped, Jessica will send a patch series getting that functionality
covered.

With that drop done this series is green for proceeding.


-- 
Petri Latvala
