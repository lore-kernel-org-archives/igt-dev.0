Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9880110E409
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 01:06:21 +0000 (UTC)
Date: Thu, 3 Mar 2022 17:07:07 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20220304010707.GA5029@labuser-Z97X-UD5H>
References: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
 <20220224051648.91470-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224051648.91470-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 2/5] lib/igt_edid: Helper to read monitor
 range from EDID
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

On Thu, Feb 24, 2022 at 10:46:45AM +0530, Bhanuprakash Modem wrote:
> Add a helper function to read Monitor's range capability
> from EDID.
> 
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_edid.c | 24 ++++++++++++++++++++++++
>  lib/igt_edid.h |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index df346c4c8c..bd677f49b8 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -160,6 +160,30 @@ void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
>  	       sizeof(monitor_range_padding));
>  }
>  
> +struct detailed_data_monitor_range
> +detailed_timing_get_monitor_range(const struct edid *edid)
> +{
> +	uint8_t i;
> +	struct detailed_data_monitor_range mr = {0, 0};
> +
> +	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
> +		struct detailed_non_pixel *other_data;
> +		struct detailed_timing timings = edid->detailed_timings[i];
> +
> +		if (timings.pixel_clock[0] != 0 &&
> +		    timings.pixel_clock[1] != 0)
> +			continue;

What is this check checking? 

> +
> +		other_data = &timings.data.other_data;
> +		if (other_data->type != EDID_DETAIL_MONITOR_RANGE)
> +			continue;
> +
> +		return other_data->data.range;

Did you  mean to assign this range to mr here as that is what we return

Manasi

> +	}
> +
> +	return mr;
> +}
> +
>  /**
>   * detailed_timing_set_string: set a detailed timing to be a string
>   */
> diff --git a/lib/igt_edid.h b/lib/igt_edid.h
> index aac2f4a208..e412479d84 100644
> --- a/lib/igt_edid.h
> +++ b/lib/igt_edid.h
> @@ -381,6 +381,8 @@ void detailed_timing_set_mode(struct detailed_timing *dt, drmModeModeInfo *mode,
>  			      int width_mm, int height_mm);
>  void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
>  					    drmModeModeInfo *mode);
> +struct detailed_data_monitor_range detailed_timing_get_monitor_range(
> +				const struct edid *edid);
>  void detailed_timing_set_string(struct detailed_timing *dt,
>  				enum detailed_non_pixel_type type,
>  				const char *str);
> -- 
> 2.35.0
> 
