Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEA3C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 09:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F69891B4;
	Wed, 14 Aug 2024 09:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSq8IAkP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73128891B4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723628817; x=1755164817;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LlUZvQoXVLcOpstt576K/7JBuAmBsXMvuHbW8dK/+Uc=;
 b=bSq8IAkPIkqmvPEZBZovHbfWai+FADQyHaIspb8YpLga6mmBy5SsyXe3
 0hxRBUsFWtwqGDBwfUd5IZAzQI8ScGweWNEWHxAYYamSIbAtdMmm5/NQV
 Ru1V9Ev4bvcCAo3RwaL/TJO9YNsgb2gu7IV+gyGXpb97lWRARe1933y+3
 3Xp97BfJEjzCWCVuyRmE9Xtn38bx+ih/Bu6Im1xpDFxje2TB9kq2bj2kC
 DiyAI9XQ3gGso51GVY4ggKC097YrSMIShJ7TknZVcQ6f8SmAINIFpR/IE
 zQ8iAyv0KXdWtGBozYjAfir6/fzU6Y9Wrn2PwOI7sRT1iAxd/5XP2lsQ6 g==;
X-CSE-ConnectionGUID: wE2+i5tOStGnn203UrTWFw==
X-CSE-MsgGUID: M2KnexwAQlayEoZAQ3v6dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32509331"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32509331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:46:57 -0700
X-CSE-ConnectionGUID: p7XRqQriQoK+TEUEcju9hg==
X-CSE-MsgGUID: aBJCXRxaRnei82Fwpw5dfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="63622350"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.246.16.183])
 ([10.246.16.183])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:46:55 -0700
Message-ID: <04aae6bc-3b9a-4cfc-bbdf-f2ce9a7f311d@linux.intel.com>
Date: Wed, 14 Aug 2024 11:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_huc_copy: Enhance HuC status check
 for VF mode
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
References: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12.08.2024 20:08, Marcin Bernatowicz wrote:
> Extend the is_huc_running function to check for both 'RUNNING' and
> 'PRELOADED' statuses. This adjustment ensures that firmware loading
> by the PF driver is accurately recognized when operating in Virtual
> Function (VF) mode.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2466
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_huc_copy.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> index 6d8ca0776..c8b5efc7b 100644
> --- a/tests/intel/xe_huc_copy.c
> +++ b/tests/intel/xe_huc_copy.c
> @@ -177,7 +177,6 @@ static bool
>   is_huc_running(int fd)
>   {
>   	char buf[4096];
> -	char *s;
>   	int gt;
>   
>   	xe_for_each_gt(fd, gt) {
> @@ -185,9 +184,8 @@ is_huc_running(int fd)
>   
>   		sprintf(name, "gt%d/uc/huc_info", gt);
>   		igt_debugfs_read(fd, name, buf);
> -		s = strstr(buf, "RUNNING");
>   
> -		if (s)
> +		if (strstr(buf, "RUNNING") || strstr(buf, "PRELOADED"))
>   			return true;

LGTM,
Acked-by: Adam Miszczak <adam.miszczak@linux.intel.com>

>   	}
>   	return false;
