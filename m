Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E130C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D7E10EC91;
	Fri,  7 Jun 2024 15:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avvI+TzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85010EC91
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773089; x=1749309089;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VuRBcbiFbZ111nPtzfLicSwjgTRUyAekAB6c+3IkdJQ=;
 b=avvI+TzE+AfyIpTKBsE/6HIvEL43p/32jSASVnyMD31KsC9Ga0jfDQ+G
 YiB0CJRwMQFV+lc5T0aEv0ex1qt5CUtImakcIwluJvdZhK9cQsCXO4tiR
 D6/iiKka6ZgvmD3WWuKJ1vywHdVuG4EBGU2vei09IaU/R7mkZPV/DO2m0
 1DMg5RkNoE2OXSbv1pDeLfOf75O/iBK8C/wQ/B728IwVPmUz/SbiUZw/u
 jvCEIaVnx9ElXXHUYYXDfQCtuIXD9Nr4dlkmkijQqs/JSps+M1MKOfJcW
 EZvn5FBfq5vtoqfqGtHDRyrpd6zxub2HBU1WLfxn4s42uZ6wilAYdOq0E A==;
X-CSE-ConnectionGUID: 3CutjeXJR4K4y0dAERBbCQ==
X-CSE-MsgGUID: VkZ3NeLPRX+fOVeBOhxg+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14303481"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14303481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:11:27 -0700
X-CSE-ConnectionGUID: SLN8mG2ySb2dAVyR/wE3Zw==
X-CSE-MsgGUID: IeWmu2llSQO3w34PjNFyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38279656"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 08:11:27 -0700
Date: Fri, 7 Jun 2024 17:11:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Message-ID: <20240607151123.4o66krb6y4kwyg5u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-3-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240530085908.564733-3-luciano.coelho@intel.com>
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
On 2024-05-30 at 11:59:08 +0300, Luca Coelho wrote:
> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in init_mode_set_data(), so fix that.
> 
> From the bug report:
> 
> Starting subtest: module-reload
> Received signal SIGSEGV.
> Stack trace:

Now I think that line 'Stack trace' is not needed, only those
two with subtest name and signal are enough.

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  tests/intel/i915_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 0ea5fbd8afd9..e0f395fa8a84 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
>  			data->connectors[i] =
>  				drmModeGetConnector(drm_fd,
>  						    data->res->connectors[i]);
> +			if (!data->connectors[i]) {
> +				igt_warn("Could not read connector %u\n",
----------------^^^^^^^^
igt_debug

> +					 data->res->connectors[i]);
> +				continue;
> +			}
> +

We generally do not warn and fail a test in case some prerequistics
are not present, that is why it is better to igt_debug here and make
checks in few other places, like:
			if (data->connectors[i]) {
                    // here we can safely use/free connector or edid
            }
or
			if (!data->connectors[i])
                continue;

grep -n connectors tests/intel/i915_pm_rpm.c
139:    drmModeConnectorPtr connectors[MAX_CONNECTORS];
151:    drmModeConnectorPtr connectors[MAX_CONNECTORS];
319:    for (int i = 0; i < data->res->count_connectors; i++) {
320:            drmModeConnectorPtr c = data->connectors[i];
513:            igt_assert(data->res->count_connectors <= MAX_CONNECTORS);
514:            for (int i = 0; i < data->res->count_connectors; i++) {
515:                    data->connectors[i] =
517:                                                data->res->connectors[i]);
518:                    data->edids[i] = get_connector_edid(data->connectors[i], i);
531:            for (int i = 0; i < data->res->count_connectors; i++) {
532:                    drmModeFreeConnector(data->connectors[i]);

so all you need is add checks in lines after 320 and 531.

Btw test is missing final fixture with i915 module load but that
should be fixed in separate patch.

Regards,
Kamil

>  			data->edids[i] = get_connector_edid(data->connectors[i], i);
>  		}
>  
> -- 
> 2.39.2
> 
