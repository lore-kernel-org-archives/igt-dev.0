Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F9C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 09:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37E310E68B;
	Wed, 26 Mar 2025 09:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeoCC4il";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E7B10E68B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742981174; x=1774517174;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=En7ycjSWjBH+idx/WXMlKi0nuTEAyRm5ZAkgos+pggk=;
 b=ZeoCC4il6AwjTun0UotvqR/iH0QZfxuaRnYzYxmfLmHphJ4k1PytyW62
 Km5JozWAhBlZ1RJac3aBc9vzeC6U8N8Li3f2yP/zCTslg9z06/7MCAH1z
 i73bQzFxF3U2JI5O1fktQjSQYCAelAv9D8dK5eHKdvGHWXIKX1hU1yAe7
 uMEyaFlhaZcHC2NZNsT34wz96/WPK3qAnA9IGqXmyBfaMXaM9HnXHUWx7
 /Zn0IVmMVfoSLfIXNZXBTStSFbLYR3wXAhLH3nxtGuPhQVWqsXICmPlUT
 AwiPvhpOf2uXm8jedQK/sIoVPgzp1qLwc0ZtYiWdDsL/ridgkcWBzm5xD A==;
X-CSE-ConnectionGUID: yOh5EtfuRke2yrAKC6jqkg==
X-CSE-MsgGUID: 81wgSMVESOSA/rA4XljyoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48134812"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="48134812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:26:14 -0700
X-CSE-ConnectionGUID: XRh/IwEoRd6W45I8F+s2Rg==
X-CSE-MsgGUID: LLkamQI0QqWyNjBeh2SSAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="161904985"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:26:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: Re: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
In-Reply-To: <48a20710-a884-45f1-8485-ed1f17450741@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250325130842.1821042-1-jani.nikula@intel.com>
 <48a20710-a884-45f1-8485-ed1f17450741@intel.com>
Date: Wed, 26 Mar 2025 11:26:10 +0200
Message-ID: <878qos87nx.fsf@intel.com>
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

On Wed, 26 Mar 2025, "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
> Hi Jani,
>
> Have few queries:
> 1. Are we going to remove i915_display_capabilities ?

Yes, hence the patch at hand. Can't remove it before merging this.

intel_display_caps already has more information than
i915_display_capabilities, and I intend to add more.

> 2. Since this new debugfs intel_display_caps, has prefix "intel" whereas 
> all other debugfs still has "i915"
> Are we going to make this change to other display related debugfs too?

Eventually, yes. The xe driver having debugfs files with i915 prefix is
quite confusing.

I think new debugfs files should be prefixed intel_ while any rename
will need more careful consideration. It's quite the flag day change.

This one's easier as i915_display_capabilities and intel_display_caps
already coexist.

BR,
Jani.


>
> On 25-03-2025 06:38 pm, Jani Nikula wrote:
>> Turns out we've added two similar files in kernel. Consolidate on
>> intel_display_caps as the more driver independent name.
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   lib/igt_dsc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
>> index 8d259b7344a6..4caad39db7a9 100644
>> --- a/lib/igt_dsc.c
>> +++ b/lib/igt_dsc.c
>> @@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
>>   	dir = igt_debugfs_dir(drmfd);
>>   	igt_assert(dir >= 0);
>>   
>> -	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
>> +	res = igt_debugfs_simple_read(dir, "intel_display_caps",
>>   				      buf, sizeof(buf));
>>   	close(dir);
>>   
>

-- 
Jani Nikula, Intel
