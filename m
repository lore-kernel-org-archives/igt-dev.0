Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7C6C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 08:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D1D10E7C9;
	Thu, 15 May 2025 08:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iV1ZopSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D5910E7C9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 08:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747299180; x=1778835180;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gHTkBmuReJ1pfQVURvHnDEM6jKzHgBIUCpZY35l/DCA=;
 b=iV1ZopSGx9Zq0x4+Mjf8rtpO+oYqMA+HWu6J3gQMvu5pcku98yfuHOcY
 cdGy4CokFsLjKcFDVmzBUYl2A0BKCOQnzi8BiGb5/+PpZ96TOI+OmO3F8
 xix9PbpibuugmeUUAP8tb2nJQ1LLcXWyji6TyvOKo1b1ADPRHvi0OuJXe
 r2FlLR5F6zuOXjQa9JhM01vMtC86eCQEfJwcJQIpPFeZAKsjybJNKu3FX
 TUUnmQyL0dRjskQbn+Am2/CZKIwxrLcRPyx7uB+rHQ20SZHPicgP01qK3
 KBYutdIm1Hhh+IDe2YtuxJcIG1EmKpb+z/gGRl09Nn7obRowhYDQIpwku w==;
X-CSE-ConnectionGUID: ImhMjgmORd+aK45TUwtqSA==
X-CSE-MsgGUID: mIholXcrRYOwzyb5cDJeKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49297379"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49297379"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:52:59 -0700
X-CSE-ConnectionGUID: IO9KUI6LRiS+ymMxf71CyA==
X-CSE-MsgGUID: mTiyuD+2Q/aWEyQvbSmPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="169377352"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.81.229])
 ([10.245.81.229])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:52:58 -0700
Message-ID: <b85fedaa-f818-42cb-8718-259b8816fe5f@linux.intel.com>
Date: Thu, 15 May 2025 10:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_scheduling: Close open handles
 before disabling VFs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250514142543.345665-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20250514142543.345665-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/14/2025 4:25 PM, Marcin Bernatowicz wrote:
> Prevent a potential hot-unplug scenario by explicitly closing all
> open handles before disabling VFs. Extract handle cleanup into a
> dedicated subm_set_close_handles() helper and invoke it before
> asserts.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 89cdd8750..2cd18c982 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -241,22 +241,41 @@ static void subm_set_init_sync_method(struct subm_set *set, enum subm_sync_metho
>   		pthread_barrier_init(&set->barrier, NULL, set->ndata);
>   }
>   
> -static void subm_set_fini(struct subm_set *set)
> +static void subm_set_close_handles(struct subm_set *set)
>   {
> +	struct subm *s;
>   	int i;
>   
>   	if (!set->ndata)
>   		return;
>   
>   	for (i = 0; i < set->ndata; ++i) {
> -		igt_stats_fini(&set->data[i].stats.samples);
> -		subm_fini(&set->data[i].subm);
> -		drm_close_driver(set->data[i].subm.fd);
> +		s = &set->data[i].subm;
> +
> +		if (s->fd != -1) {
> +			subm_fini(s);
> +			drm_close_driver(s->fd);
> +			s->fd = -1;
> +		}
>   	}
> -	subm_set_free_data(set);
> +}
> +
> +static void subm_set_fini(struct subm_set *set)
> +{
> +	int i;
> +
> +	if (!set->ndata)
> +		return;
>   
>   	if (set->sync_method == SYNC_BARRIER)
>   		pthread_barrier_destroy(&set->barrier);
> +
> +	subm_set_close_handles(set);
> +
> +	for (i = 0; i < set->ndata; ++i)
> +		igt_stats_fini(&set->data[i].stats.samples);
> +
> +	subm_set_free_data(set);
>   }
>   
>   struct init_vf_ids_opts {
> @@ -602,6 +621,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   
>   	/* dispatch spinners, wait for results */
>   	subm_set_dispatch_and_wait_threads(set);
> +	subm_set_close_handles(set);
>   
>   	/* verify results */
>   	compute_common_time_frame_stats(set);
> @@ -696,6 +716,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   
>   	/* dispatch spinners, wait for results */
>   	subm_set_dispatch_and_wait_threads(set);
> +	subm_set_close_handles(set);
>   

LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
>   	/* verify results */
>   	for (int n = 0; n < set->ndata; ++n) {
