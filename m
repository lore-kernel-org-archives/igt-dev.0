Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5776E7F1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 19:32:56 +0000 (UTC)
References: <20210818222419.210879-1-jose.souza@intel.com>
 <20210818222419.210879-2-jose.souza@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Message-ID: <57932115-f086-d45d-9126-f581b5ca4b08@intel.com>
Date: Thu, 2 Sep 2021 22:32:44 +0300
In-Reply-To: <20210818222419.210879-2-jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] tests/kms_psr2_su: Set the
 damaged clip in page flips
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Looks good to me.
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 8/19/21 1:24 AM, José Roberto de Souza wrote:
> Without this i915 will not know what was updated in the screen and
> update the whole plane causing mismatch between the read SU blocks and
> the expected value when PSR2 selective fetch is enabled.
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   tests/kms_psr2_su.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> index a232b3bb4..318deefdf 100644
> --- a/tests/kms_psr2_su.c
> +++ b/tests/kms_psr2_su.c
> @@ -149,11 +149,17 @@ static bool update_screen_and_test(data_t *data)
>   
>   	switch (data->op) {
>   	case PAGE_FLIP: {
> +		struct drm_mode_rect clip;
>   		igt_plane_t *primary;
>   
> +		clip.x1 = clip.y1 = 0;
> +		clip.x2 = clip.y2 = SQUARE_SIZE;
> +
>   		primary = igt_output_get_plane_type(data->output,
>   						    DRM_PLANE_TYPE_PRIMARY);
>   
> +		igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
> +					    &clip, sizeof(clip));
>   		igt_plane_set_fb(primary, &data->fb[data->screen_changes & 1]);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   		break;
> 
