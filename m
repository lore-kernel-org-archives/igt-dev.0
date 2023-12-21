Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423310E07C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 04:52:58 +0000 (UTC)
Message-ID: <d8d3c3b9-91c1-4d6b-8e4a-a1531de3b07d@intel.com>
Date: Thu, 21 Dec 2023 10:22:39 +0530
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fix the plane setup in
 extended-mode-basic
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231220154307.32424-1-ville.syrjala@linux.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231220154307.32424-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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


On 20-12-2023 09:13 pm, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The test forgets to set the output size of the planes. The
> default plane output size will be taken from the fb dimensions
> which means we end up upscaling the planes, which may not work
> on all hardware.
> 
> Set the planes' output size to match the input size to avoid this.
> The frambuffer was specifically created wide enough to cover both
> outputs with 1:1 scaling.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9841
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_display_modes.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 1f0f811c8367..f1d8ab03d501 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -180,10 +180,12 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_plane_set_fb(plane[0], &fb);
>   	igt_fb_set_position(&fb, plane[0], 0, 0);
>   	igt_fb_set_size(&fb, plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
> +	igt_plane_set_size(plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
>   
>   	igt_plane_set_fb(plane[1], &fb);
>   	igt_fb_set_position(&fb, plane[1], mode[0]->hdisplay, 0);
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
> +	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
