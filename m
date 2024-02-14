Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74DFC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 13:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BF910E126;
	Wed, 14 Feb 2024 13:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsX+1YBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F6210E126
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707916060; x=1739452060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4pjlJBsZCgTr5FquAYfqZOc9QNI1RIUEO5lH79a+0c8=;
 b=KsX+1YBC42S4uU+UXl00jD8R6cB3rxQ66RzpmCcoyXD6B9Va7AznnAO+
 vT9IFXNrHMPQyQOHNnqhcywPEJpBUEa2d5rA0McGYE+Km5x7jEeJ52v6e
 Qg+XeW/frhDLKDzTV1Juqqv4GjOhDtcpHPYhkK7u8P+qIKDTTc/tyCE25
 efltOgIdSUUO/R9Nqixz4n2d+kHrTL/e8r3bp2zU/7u2isr4aE+IPGCXK
 NpOWA/SqdhFW74hquW4iXrLWdd8qg5gsZgZcD/1fukuBu3wfBEdLu+K1F
 N7wCZgGN0EtNiqs5WtIItX+CjE1+gKnMxCbh2Q1TCBoW3XsONqYpC/hkQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1866619"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1866619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7854834"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:07:37 -0800
Date: Wed, 14 Feb 2024 14:07:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Samala, Pranay" <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, Samala@freedesktop.org
Subject: Re: [PATCH v2 1/1] tests/kms_plane: Restricting number of pixel
 formats for simulation
Message-ID: <20240214130718.tbdg3ssc5eovij7a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Samala, Pranay" <pranay.samala@intel.com>, karthik.b.s@intel.com,
 jeevan.b@intel.com, Samala@freedesktop.org
References: <20240214085328.2024-1-pranay.samala@intel.com>
 <20240214085328.2024-2-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214085328.2024-2-pranay.samala@intel.com>
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

Hi Samala,,
On 2024-02-14 at 14:23:28 +0530, Samala, Pranay wrote:
> The pixel-format subtest runs on all pixel formats, reducing it to single
> format to reduce execution time on simulation.
> 
> Cc: B S, Karthik <karthik.b.s@intel.com>
----- ^^^^
Should be:
Cc: Karthik B S <karthik.b.s@intel.com>

> Cc: B, Jeevan <jeevan.b@intel.com>
----- ^^^^
Same here:
Cc: Jeevan B <jeevan.b@intel.com>

> 
> Signed-off-by: Samala, Pranay <pranay.samala@intel.com>

Please correct this in your git config, this should be:

Signed-off-by: Pranay Samala <pranay.samala@intel.com>

This can be corrected at merge,

Regards,
Kamil

> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 406aecc04..fbffc3cb0 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1081,6 +1081,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>  		    f.modifier == ref.modifier)
>  			continue;
>  
> +		if (f.format != DRM_FORMAT_XRGB8888 && igt_run_in_simulation())
> +			continue;
> +
>  		/* test each format "class" only once in non-extended tests */
>  		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
>  			struct format_mod rf = {
> -- 
> 2.34.1
> 
