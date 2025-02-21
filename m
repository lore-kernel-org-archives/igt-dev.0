Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208ECC021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 19:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D442B10E23A;
	Fri, 21 Feb 2025 19:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdtH1jzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFC310E23A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740166575; x=1771702575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XgzmDi9DUUvoxHcSrpLZgTtA0inHP+xwRjgSuFr9Z+U=;
 b=XdtH1jzdfrDRZhci6FK/tuPr0pH7nY1F6/HqLMaY+yPeEFX9IGEhyYJm
 JvVGwPrq8qm/jSBQjeFWHSCKKQK182KjS+jv7xzsTBaVQuBRy9km2Vi3q
 o5mHFpttcWhhz6UQVlBEE+hShPtFF8bqAJFI3qhW/Uj7/t42YCCdgPiMG
 XXQDHfdbCCW2qZP8uKXMK5lKAqtmVvbJsBm29/8eMF7M3q/2Rc82dFHjg
 dmKQwsoZ2bExqoUXyJLuzIYutJMiFnra50aB2L/0s4J6IkL9yc7Pnn2KL
 l5OHpu0xg/zNvoFxJqGR6ZIFW16GSIXtwGnBs6aT32eGPZ8MGzYFJaSR4 w==;
X-CSE-ConnectionGUID: l0R7RipmQ/KgSj7IL070wA==
X-CSE-MsgGUID: HaEhkIHBTTqoHtJqlFnsqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66363181"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="66363181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:36:14 -0800
X-CSE-ConnectionGUID: BXuTfZ4IRaOi+Zkj9Ccklw==
X-CSE-MsgGUID: Ffw8Q7FbTRe1QiBmyfVXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115175455"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.17.221])
 ([10.246.17.221])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:36:13 -0800
Message-ID: <6547ce4c-8924-437d-b713-19992dd6b4f4@linux.intel.com>
Date: Fri, 21 Feb 2025 20:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_oa: Skip when no OA units available
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
 <85ldtzns3h.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <85ldtzns3h.wl-ashutosh.dixit@intel.com>
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



On 2/21/2025 6:08 PM, Dixit, Ashutosh wrote:
> On Thu, 20 Feb 2025 05:01:05 -0800, Marcin Bernatowicz wrote:
>>
>> Add a check to ensure at least one OA unit is available before
>> proceeding with the tests. This prevents unnecessary failures on
>> devices that do not support OA units.
> 
> Are we seeing this anywhere?

Yes, we hit this in VM runs (with passed VF device).

> 
> In any case:
> 
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   tests/intel/xe_oa.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 0242fd594..6abf44128 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4852,6 +4852,7 @@ igt_main
>>
>> 		/* See xe_query_oa_units_new() */
>> 		igt_require(xe_dev->oa_units);
>> +		igt_require(xe_dev->oa_units->num_oa_units);
>> 		oau = nth_oa_unit(drm_fd, 0);
>>
>> 		devid = intel_get_drm_devid(drm_fd);
>> --
>> 2.31.1
>>

