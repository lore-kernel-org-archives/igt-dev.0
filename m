Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E9F10E318
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 07:48:37 +0000 (UTC)
Date: Tue, 17 May 2022 10:48:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Message-ID: <YoNTStoMBn3nRWO0@intel.com>
References: <20220516035255.28288-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516035255.28288-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_invalid_mode: Skip
 clock-too-high subtest on DSC panel
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

On Mon, May 16, 2022 at 09:22:55AM +0530, Karthik B S wrote:
> Max clock limit calculation isn't valid with DSC.

What does it have to do with DSC?

> Skip the test on DSC panels.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4402
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_invalid_mode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index bb92a94e..cf011a17 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -73,6 +73,8 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>  	int max_dotclock = data->max_dotclock;
>  
>  	igt_require(max_dotclock != 0);
> +	igt_require(!igt_is_dsc_supported(data->drm_fd,
> +					  data->output->config.connector));
>  
>  	/*
>  	 * FIXME When we have a fixed mode, the kernel will ignore
> -- 
> 2.22.0

-- 
Ville Syrjälä
Intel
