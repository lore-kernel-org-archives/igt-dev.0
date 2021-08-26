Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE776E82C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 12:36:43 +0000 (UTC)
Date: Thu, 26 Aug 2021 08:36:35 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210826123635.7oue5lowthdkln5d@outlook.office365.com>
References: <20210825074707.145773-1-tianci.yin@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825074707.145773-1-tianci.yin@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic_interruptible: fix a warning
 message on AMD GPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tianci Yin <tianci.yin@amd.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>, Mark Yacoub <markyacoub@google.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Choi <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 08/25, Tianci Yin wrote:
> From: "Tianci.Yin" <tianci.yin@amd.com>
> 
> [why]
> For subtest legacy-setmode and atomic-setmode, fb buffer is
> unbinded from plane by block_plane(), then igt_display_commit2()
> will trigger a dmesg warning message in drm_atomic_helper_commit(),
> since for block commit, drm will wait fences that represents
> finishing fb writing, when it find this fence has no accompanying
> fb, it gives out a warning.
> 
> [how]
> Just remove igt_plane_set_fb() from block_plane() to retain
> the fb binding with plane.
> Verified on AMD Radeon Pro W5500 and Intel UHD Graphics 630
> (inside i7-9700K), both pass.
> 
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>  tests/kms_atomic_interruptible.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index 0a127921..03980d6e 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -49,7 +49,6 @@ static int block_plane(igt_display_t *display, igt_output_t *output, enum plane_
>  
>  		if (test_type == test_legacy_modeset || test_type == test_atomic_modeset) {
>  			igt_output_set_pipe(output, PIPE_NONE);
> -			igt_plane_set_fb(plane, NULL);
>  		}
>  		igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fence(timeline, 1));
>  
> -- 
> 2.25.1
>

Btw, did you submit a V2?

If so, it looks like that there is a merge problem in the new version, see:

https://patchwork.freedesktop.org/series/94006/#rev2 

Thanks

-- 
Rodrigo Siqueira
https://siqueira.tech
