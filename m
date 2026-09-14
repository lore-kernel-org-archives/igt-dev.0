Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB4AC88E50
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 08:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7907510EBFA;
	Mon, 14 Sep 2026 08:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtIRcVj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D5F10EBF7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789373617; x=1820909617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=m8JA4YmowQ5tzDMIQTHepkVFkRW+L1gybqsjDrBaZCw=;
 b=PtIRcVj5RsSDp1neEODypAsIqlCqAvXYZ/xSDDH2yyz1E4SY2ZffvMFw
 WTxM3zroNvlAdLWbh1pxeV28D/uUK0nZQ6QeLzs5aQgq73shm7kg5tJF3
 Pd3jlI/CAShXVaiFvrgrErTGbLg+aUU9MJ+UUd1Xj5XSuB4UINAHVBywP
 DH9C85OJdNcrZmgVl7My0kFdOKkCQjuYOYQ4m/7wZRQQmVkU9mV6rHxdN
 9olWt1ocshZMiAk4biqUT95jQf+H+0DfTAOf7ZS5AH2gEG19d/GrfBb0Q
 T27ar1CxWpc5bSzigP8YSVvETXOvSQNZmfCRT270P7e0TUyrp16zUUmBO Q==;
X-CSE-ConnectionGUID: rVfnq42uQESPXAHg7OCXpA==
X-CSE-MsgGUID: HY5OOGRuTMylIR1DxE6sVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="232828"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="232828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:06:30 -0700
X-CSE-ConnectionGUID: arpIJlSuRHuSyadEBKeeVw==
X-CSE-MsgGUID: vO/WvcDqTXmguoEgB9s4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="277837275"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 01:06:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 1/4] tests/kms_chamelium_color_pipeline: prefer
 igt_crtc_name() over kmstest_pipe_name()
In-Reply-To: <20260902143415.zgtnwjl5fg37co7u@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1788252273.git.jani.nikula@intel.com>
 <939f7c55bbae51a09e8f0e5001682abf4e7c5450.1788252273.git.jani.nikula@intel.com>
 <20260902143415.zgtnwjl5fg37co7u@kamilkon-DESK.igk.intel.com>
Date: Mon, 14 Sep 2026 11:06:26 +0300
Message-ID: <d7db1c124f95fc39d68b0b192b1e23104ef278f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 02 Sep 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2026-09-01 at 11:46:37 +0300, Jani Nikula wrote:
>> Reduce the direct pipe usage.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks for the reviews, pushed the lot to master.

BR,
Jani.

>
> Regards,
> Kamil
>
>> ---
>>  tests/chamelium/kms_chamelium_color_pipeline.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
>> index db6107221d51..ee096f711a88 100644
>> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
>> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
>> @@ -188,7 +188,7 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
>>  		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
>>  			continue;
>>  
>> -		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
>> +		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
>>  			_test_plane_colorops(data, plane, fb_colors,
>>  					     exp_colors, colorops,
>>  					     data->ports[port_idx]);
>> -- 
>> 2.47.3
>> 

-- 
Jani Nikula, Intel
