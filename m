Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679F6C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DD810E559;
	Wed, 28 Aug 2024 14:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuKbpiS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DB810E559
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856747; x=1756392747;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wEwONrI8sG4Mo1SVyJNBWAVQyotjB3lW+06jer++NG0=;
 b=LuKbpiS70zh+GFPsgFZbEHF9ZTkdFrsgFjezJ7VG7mlKkizmINEOXswn
 I/8dmTwKq94FC0lCU6iYbbGmjS551Xj+Kk18CQ2J9kwyW3hmG7uH6RXvP
 owUkB999QOCe6nUzxpPTz86nEPThV2okgnS0CpVoCbb8ErQE+qX4qB+Lq
 rHh4Mgutk62rUT/W5cGEBr6CYg1R5oei7pZ+lRQF5qLqwX3iOMOmpslP4
 qj9e6fPgHPsv7xxjyqoF+4sk9OiD0WPL8MdpDwU67EYBj6LFQ0NRD31Cq
 Hhwca/SoFdOj1dirj0cmf9t+0P6nK9WV8/u2gYbuhh6s9FoUbvPCmhWUO g==;
X-CSE-ConnectionGUID: hLQAJDkoRueJXyxGR+YtTg==
X-CSE-MsgGUID: uyQFe9vISMuJxIloDNz+Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34770904"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34770904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:52:27 -0700
X-CSE-ConnectionGUID: xtq6O5jmREOHWUI9VKHuzg==
X-CSE-MsgGUID: ljim/UnAQ3SLxpmVxmkJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63955260"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:52:26 -0700
Message-ID: <6b46bed5-28a1-4022-b50a-21a7bd7906b5@linux.intel.com>
Date: Wed, 28 Aug 2024 16:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 07/10] tests/intel/xe_drm_fdinfo: Half the
 execution time
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-8-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-8-lucas.demarchi@intel.com>
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
> No need to do 500 msec per subtest. As we add more tests, the total
> execution time of ~ 2.5 sec per subtest make it take too long. Sleep
> half the time to lower the execution time.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 9fb739fba..46c96dbe0 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -73,7 +73,7 @@ struct pceu_cycles {
>   	uint64_t total_cycles;
>   };
>   
> -const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
> +const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
>   
>   static const char *engine_map[] = {
>   	"rcs",
