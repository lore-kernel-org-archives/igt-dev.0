Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BB6C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7DD10E556;
	Wed, 28 Aug 2024 14:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnbBOysy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A185910E556
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856504; x=1756392504;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PtIcupozrhF3ph6lyEsgI1EgVwcaJqek+wgGxgu+8fE=;
 b=ZnbBOysyrdO7PASaIln9eeom7EKzTm/kylO3lUErzinGbst6L0gUqUKB
 j6PqBBSKflBQCxIMNZtDBpMiLAIHeNLm2GL/bvbEeHJMO8rs7ExhJV1iU
 xhvsDninX+I+o8fG/LDFs+Eg2ZiNEXlSDO4khF18MrWUhdCsfigfXDDS8
 pQRwJb1sJbi65FG2MrNgjQEiWpqGf1R+Esorh2LBVq1F02xUpY3Fixg5A
 rUQgLjUTVj0KKngFh3XqTyFVVdTXQIjdIGpDYFKdAG6FyWISw6oIIX5hW
 vre9qC5Hwcn4cx/KVVgnOAckKEMkYh34UhWxjFB4e6Ff19f+6+07KY4ZN g==;
X-CSE-ConnectionGUID: ztVSonbgRNeUoqm6HkqNCQ==
X-CSE-MsgGUID: acRhHGz0Q3ilMM8UTKHjfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23554273"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23554273"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:48:23 -0700
X-CSE-ConnectionGUID: flkzsQtUQdeFrd+xAy9qpg==
X-CSE-MsgGUID: TwfxRnn2T1eUV9Y3x6//wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67609977"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:48:22 -0700
Message-ID: <b260f239-1cf6-4c97-96df-13d0b9c604ea@linux.intel.com>
Date: Wed, 28 Aug 2024 16:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/10] tests/intel/xe_drm_fdinfo: Use
 igt_assert_lt_double()
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-5-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-5-lucas.demarchi@intel.com>
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> This also shows the value that is failing, which helps debugging.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 074a89711..1b5980752 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -485,10 +485,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>   
>   	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>   
> -	if (flags & TEST_BUSY)
> -		igt_assert(percent >= 95 && percent <= 105);
> -	else
> +	if (flags & TEST_BUSY) {
> +		igt_assert_lt_double(95.0, percent);
> +		igt_assert_lt_double(percent, 105.0);
> +	} else {
>   		igt_assert(!percent);
> +	}
>   }
>   
>   static void
