Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29D0C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 16:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AB10F1BF;
	Wed, 29 May 2024 16:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4OMIOmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80910E7CC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717000671; x=1748536671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=apFhnWZjZV4pihJarkNQWSxBJT+ojHYZzu6MXPm6a3w=;
 b=J4OMIOmCqcSIsnWr0H7zCC0SddnEoqpLmt5Mh3f289uc61hJHW9Chx+U
 6Hqi/8++hmHqCQx5yAIzf2kpGhZAXm1I5KMzMx0MuPIKHOlMUShmGcSmo
 YUnlYJ2AXvVRHSfV4Z43nPhpdI00cQG8BfGpP/nXVslooekYV3ZIDRm+/
 FuqTcvdN6VfyvQD3VAaxV9j23m3jhmSQKj4MdOw3Q8da0u1ZG22O18mEW
 v5sT5/x9jm1ISb2nlmLu6b7bI+ra61bIkHwz3GmMVrbLVPmu4TEXleBfV
 XRvQx70T6kblHFihMusus2nFGDtfuJkZLoS+kBCAR11us6imCJEu/shw6 g==;
X-CSE-ConnectionGUID: x8fAyTCAQzi3qmqm+BVAeA==
X-CSE-MsgGUID: iaL+xVuKSOW8pjv6QRba1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17249994"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="17249994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:37:50 -0700
X-CSE-ConnectionGUID: 5PZgsjBES1S+sN1ZsN9ywA==
X-CSE-MsgGUID: 0YEkS3VPRRO2seXACy7NjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40009129"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 09:37:47 -0700
Date: Wed, 29 May 2024 18:37:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector()
 return in i915_pm_rpm
Message-ID: <20240529163744.3tkyh44fcgjsxxy4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-3-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528075855.463729-3-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-05-28 at 10:58:55 +0300, Luca Coelho wrote:

this subject imho is too long:

[PATCH i-g-t v2 2/2] tests/intel: check drmModeGetConnector() return in i915_pm_rpm

It should have test name at begin, not at end:

tests/intel/i915_pm_rpm: Fix bug in init_mode_set_data()

or

tests/intel/i915_pm_rpm: check drmModeGetConnector() before use

or find out something better.

> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in init_mode_set_data(), so fix that.

Please cite few lines from bug report:

Starting subtest: module-reload
Received signal SIGSEGV.
Stack trace: 
#0 [fatal_sig_handler+0x10f]
#1 [killpg+0x40]
#2 [setup_environment+0x33f]

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Add here also some KMS devs to Cc, I added Jani, Juha-Pekka and Bhanuprakash.

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  tests/intel/i915_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 0ea5fbd8afd9..3b4034f24a57 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
>  			data->connectors[i] =
>  				drmModeGetConnector(drm_fd,
>  						    data->res->connectors[i]);
> +			if (!data->connectors[i]) {

imho we should also check it later before using this or edids[]
so maybe this should really be a warn? Or even igt_assert? Or maybe
we should lower number of available connectors? Please ask KMS devs
for possible solution here.

Above code should work if you also fix fini_mode_set_data() below
and also at one more function:

grep -n count_connectors tests/intel/i915_pm_rpm.c

319:    for (int i = 0; i < data->res->count_connectors; i++) {
513:            igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
514:            for (int i = 0; i < data->res->count_connectors; i++) {
531:            for (int i = 0; i < data->res->count_connectors; i++) {
                        

Regards,
Kamil

> +				igt_debug("Could not read connector %u\n",
> +					  data->res->connectors[i]);
> +				continue;
> +			}
> +
>  			data->edids[i] = get_connector_edid(data->connectors[i], i);
>  		}
>  
> -- 
> 2.39.2
> 
