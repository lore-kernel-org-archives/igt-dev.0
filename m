Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C006E96E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 06:53:45 +0000 (UTC)
Message-ID: <42b511ae-8563-c4e8-19ab-86baee94612e@intel.com>
Date: Mon, 18 Oct 2021 12:23:34 +0530
Content-Language: en-US
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-3-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20211013221727.6392-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests/kms_plane: Use
 IGT_MODIFIER_{FMT, ARGS}
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/14/2021 3:47 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Use IGT_MODIFIER_{FMT,ARGS} to print a human readable name for
> the modifier.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index effc54cecbf7..405d4c2180a6 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -768,8 +768,8 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
>   				  igt_crc_t ref_crc[],
>   				  struct igt_fb *fb)
>   {
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
> -		 IGT_FORMAT_ARGS(format), modifier,
> +	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
>   		 kmstest_pipe_name(pipe), plane->index);
>   
>   	return test_format_plane_colors(data, pipe, plane,
> @@ -806,8 +806,8 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
>   						     igt_color_range_to_str(r)))
>   				continue;
>   
> -			igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " (%s, %s) on %s.%u\n",
> -				 IGT_FORMAT_ARGS(format), modifier,
> +			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
> +				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
>   				 igt_color_encoding_to_str(e),
>   				 igt_color_range_to_str(r),
>   				 kmstest_pipe_name(pipe), plane->index);
> @@ -886,8 +886,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   
>   	igt_pipe_crc_start(data->pipe_crc);
>   
> -	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
> -		 IGT_FORMAT_ARGS(ref.format), ref.modifier,
> +	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
>   		 kmstest_pipe_name(pipe), plane->index);
>   
>   	if (data->display.is_atomic) {
> @@ -948,8 +948,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   			};
>   
>   			if (igt_vec_index(&tested_formats, &rf) >= 0) {
> -				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
> -					 IGT_FORMAT_ARGS(f.format), f.modifier,
> +				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
> +					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
>   					 kmstest_pipe_name(pipe), plane->index);
>   				continue;
>   			}

