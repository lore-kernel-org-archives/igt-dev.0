Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEAAC04FF0
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A28A10EB2D;
	Thu, 11 Apr 2024 14:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0Jcuhv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB410EB2D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712847337; x=1744383337;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Neac59q6417cDuen18ww6Sp8k0kqo25Z2H36/HUmgP4=;
 b=K0Jcuhv4U8B+fH11jllw80Ws66+dJUH315ZUaE+jDHsXwJm6iOGMxUM9
 WedwoQ6S6qDyZheURaRHgoawEugOsTVmic1K7nNgjfgYzwAQKDJ0ditjk
 nqcXwAy40MsxM/4TmCThUR+oFDYQdGv2sJVl1NsnhSOGVGptJFu+Wc25R
 25mJvstEf3X4NemOQg58ZIKYElaJCeMraMwu9ZX8jlNFt9pNFUsGWsxOP
 BeLO99kO5Fwz8XCGn68wMkf3IXaNusyOySs4p8fQv6CeCrieqEwg8LqHh
 ScqzWcEg7ZWGmUSVAmlW7VG6olVUEIIOoxUwQ1glhNT9KRgmbIuR8lhfu g==;
X-CSE-ConnectionGUID: 5n1M0Vs8TYG815n/84I9Uw==
X-CSE-MsgGUID: LLpje8S0TdG11R17p1a3yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8366366"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8366366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:55:36 -0700
X-CSE-ConnectionGUID: WUxOlbLIQWC0jJA49ohgwA==
X-CSE-MsgGUID: 6dkq6wLtQ6yNwMAVN4aAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21424218"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:55:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
In-Reply-To: <75oqxqfgpu2gop5zq37hctzul7ztx2r2gwigxvl2trmwomn2lz@zqcsidtq627p>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <87le5k7028.fsf@intel.com>
 <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
 <87cyqw58x0.fsf@intel.com>
 <75oqxqfgpu2gop5zq37hctzul7ztx2r2gwigxvl2trmwomn2lz@zqcsidtq627p>
Date: Thu, 11 Apr 2024 17:55:30 +0300
Message-ID: <87a5m054pp.fsf@intel.com>
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

On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I don't think we will be able to invest time to manually update them.

Agreed.

> I have a dream of being able to partially generate the regs/*.h file
> in xe. Maybe if we ever achieve that we can think of using the same
> source for igt.

Agreed.

> But as I said, I think we are far far away from that. What do you think
> should be done in the short/mid term?
>
> a) this patch as is
> b) keep the warning for verbosity > 0 as sugggested by others

Either as the first step is fine by me.

> c) just remove tools/registers to simplify the code. To be added back if
>     we ever figure how to autogenerate them with the same source that
>     autogenerates the kernel

I think they're still useful for deciding the contents of intel_reg
dump, for the platforms defined anyway. I wouldn't throw them away.

> d) something else?

I wouldn't object to incorporating the information in the tool at build
time. But if nobody has the time to do that, just let it be until we
have figured out a way to generate the info, if ever.

Since the decoding info is starting to be out of date, especially the
builtin stuff, maybe it should be made optional via a --decode parameter
similar to --binary, and default to off?

BR,
Jani.

-- 
Jani Nikula, Intel
