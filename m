Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29314C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 12:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80510E048;
	Thu, 29 Feb 2024 12:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+dcigZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D03610E048
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709211517; x=1740747517;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=keAG/3R0MX0an96DvOo3zol4zL/QgGDLctDUS+k0tNQ=;
 b=K+dcigZs8Obnh7Ef9e6/QiJQeoFDQ8+yOQZzkF9+iulLUYdmMMlhL9dR
 3jeGo7uvdnVUVfQFcMO/7cV13t4yufMTOKlXRWLQDKZWaRlsGzgwZzaL9
 v8www1zTk00ikUWpVZUDQDwW8HVbjE1FcMkZUnvcgOHr0kcs0Zb7fUq69
 wlkQag+6RVFFlJl4N3BTurwUMh9qIEl59LUCchlsUS8824pCz8vQnEKLq
 v1aZ+flxDhKTx+FUa+dD+KY5JtyPa93jjNTHe/pZ2iA2TmTm59uV+QJYi
 UcJhWOxZCPx+k36o83vDBs5DeDCS+21/pr89MKI9nTIICTSKax9B7LN44 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6624953"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="6624953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7693637"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:58:34 -0800
Date: Thu, 29 Feb 2024 13:58:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t 2/3] benchmarks/kms_fb_stress: Add command line
 options to change the planes and writeback formats
Message-ID: <20240229125831.fg6wnkxfzdnd6xam@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
 <20240226-kms_fb_stress-dev-v1-2-1c14942b1244@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240226-kms_fb_stress-dev-v1-2-1c14942b1244@riseup.net>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Arthur,
On 2024-02-26 at 16:42:18 -0300, Arthur Grillo wrote:
> Currently, the plane formats are hard-coded, with no possibility of
> changing them when running the benchmark. Change that by adding command
> line options to change the planes and writeback formats.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 50 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 8fea10ef069f..073104b8e4f8 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -125,7 +125,7 @@ static void set_crtc_size(struct data_t *data)
>  	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
>  }
>  
> -static struct kms_t default_kms = {
> +static const struct kms_t default_kms = {
>  	.crtc = {
>  		.width = 4096, .height = 2160,
>  	},
> @@ -159,14 +159,56 @@ static struct kms_t default_kms = {
>  	},
>  };
>  
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	struct data_t *data = _data;
> +	struct kms_t *kms =  &data->kms;
> +
> +	*kms = default_kms;
> +
> +	switch (opt) {
> +	case 'p':
> +		kms->primary.format = igt_drm_format_str_to_format(optarg);
> +		break;
> +	case 'a':
> +		kms->overlay_a.format = igt_drm_format_str_to_format(optarg);
> +		break;
> +	case 'b':
> +		kms->overlay_b.format = igt_drm_format_str_to_format(optarg);
> +		break;
> +	case 'w':
> +		kms->writeback.format = igt_drm_format_str_to_format(optarg);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char *help_str =
> +	"  --primary-format\t\tSelect the primary plane format (default: XRGB8888)\n"
> +	"  --overlay-a-format\t\tSelect the overlay A plane format (default: XRGB16161616)\n"
> +	"  --overlay-b-format\t\tSelect the overlay B plane format (default: ARGB8888)\n"
> +	"  --writeback-format\t\tSelect the writeback format (default: XRGB8888)\n";
> +
> +static const struct option long_options[] = {
> +	{ .name = "primary-format", .has_arg = true, .val = 'p'},
> +	{ .name = "overlay-a-format", .has_arg = true, .val = 'a'},
> +	{ .name = "overlay-b-format", .has_arg = true, .val = 'b'},
> +	{ .name = "writeback-format", .has_arg = true, .val = 'w'},
> +	{}
> +};
> +
> +static struct data_t data = {
> +	.kms = default_kms,

As you can see on fedora-clang:

../benchmarks/kms_fb_stress.c:207:9: error: initializer element is not a compile-time constant
          .kms = default_kms,

So imho make this in main body below.

> +};
>  
> -igt_simple_main
> +igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
>  {
> -	struct data_t data = {0};
>  	struct timespec then, now;
>  	double elapsed;
>  
> -	data.kms = default_kms;

Do not delete this from here.

Regards,
Kamil

>  
>  	data.fd = drm_open_driver_master(DRIVER_ANY);
>  
> 
> -- 
> 2.43.0
> 
