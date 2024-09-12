Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D06EEB569
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 08:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EBB10EB16;
	Thu, 12 Sep 2024 08:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uo1dtoz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1291110EB16
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726131485; x=1757667485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=no/z6sRy/Vr5xEy71yopR75ZtZhbHSUDG/TIV+gIhYA=;
 b=Uo1dtoz/mKXvf46+fnfzxf/9nZ50QaVmNcc3AcsaF2fbIndyhzkFLYhN
 xQcGzYYMZOF4xt2/vm+4KoNsu0zdt4fXVGZ9wZVfb2D0cYcXcByrgBfSx
 rLDYiqMJp9Qjr8bAxBxr8+X5BPmXbt22wA4Gs6Rr00S60LgutFlVLEW7j
 7saU915OVCY1SMU7Egh2ybrZqUT5ea23fANvJyLjkNXt+gitvzOQOsYvt
 w+wSagYX7CjDZVO3VxSh64z/5NSYBOlPXu4vw+GQLkTz3XaTIXk5NOTK1
 BZi1kNr07T/00neHwFSUH4YDHqeymyn9tc1vBN3qQA2c2YNyq471DEfd9 g==;
X-CSE-ConnectionGUID: uTe+4gJSQLerCJmriuc0jQ==
X-CSE-MsgGUID: enRGCkxJRrSip/TOwKJgVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42447083"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42447083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 01:58:02 -0700
X-CSE-ConnectionGUID: GUbMBUTeSUazK0Y601RyLA==
X-CSE-MsgGUID: RHYH6/10TGuSfdbsFxlfSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67259210"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 01:58:00 -0700
Date: Thu, 12 Sep 2024 10:57:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH] tests/intel/*_query: Add new hwconfig table entry
Message-ID: <20240912085741.lyy53vuj6mvhgyda@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20240910011238.254204-1-julia.filipchuk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910011238.254204-1-julia.filipchuk@intel.com>
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

Hi Julia,
On 2024-09-09 at 18:12:38 -0700, Julia Filipchuk wrote:
> Two new entries added to the hardware config table. Updated enum and
> tests accordingly.
> 
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Adding John and Ashutosh to Cc.
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Regards,
Kamil

> ---
>  lib/intel_hwconfig_types.h | 2 ++
>  tests/intel/i915_query.c   | 2 ++
>  tests/intel/xe_query.c     | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_hwconfig_types.h b/lib/intel_hwconfig_types.h
> index 0e6ce5b17..b5d9f1c9e 100644
> --- a/lib/intel_hwconfig_types.h
> +++ b/lib/intel_hwconfig_types.h
> @@ -97,6 +97,8 @@ enum intel_hwconfig {
>  	INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES,			/* 79 */
>  	INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES,			/* 80 */
>  	INTEL_HWCONFIG_MAX_GSC,					/* 81 */
> +	INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS,		/* 82 */
> +	INTEL_HWCONFIG_NUM_XECU,				/* 83 */
>  	__INTEL_HWCONFIG_KEY_LIMIT
>  };
>  
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index 54dbb193a..df7e46a63 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -1340,6 +1340,8 @@ static const char * const hwconfig_keys[] = {
>  	[INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES] = "Min Mesh URB Entries",
>  	[INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES] = "Max Mesh URB Entries",
>  	[INTEL_HWCONFIG_MAX_GSC] = "MaxGSC",
> +	[INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS] = "Sync Num RT Stacks Per DSS",
> +	[INTEL_HWCONFIG_NUM_XECU] = "Num of XeCU",
>  };
>  
>  static const char * const hwconfig_memtypes[] = {
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index ddb2e76e5..3a0a83135 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -50,7 +50,7 @@ void dump_hex_debug(void *buffer, int len)
>  /* Please reflect intel_hwconfig_types.h changes below
>   * static_asserti_value + get_hwconfig_name
>   *   Thanks :-) */
> -static_assert(INTEL_HWCONFIG_MAX_GSC + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
> +static_assert(INTEL_HWCONFIG_NUM_XECU + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
>  
>  #define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
>  const char* get_hwconfig_name(int param)
> @@ -137,6 +137,8 @@ const char* get_hwconfig_name(int param)
>  	CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
>  	CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
>  	CASE_STRINGIFY(MAX_GSC);
> +	CASE_STRINGIFY(SYNC_NUM_RT_STACKS_PER_DSS);
> +	CASE_STRINGIFY(NUM_XECU);
>  	}
>  	igt_assert_lt(param, __INTEL_HWCONFIG_KEY_LIMIT);
>  	igt_assert(!"Missing config table enum");
> -- 
> 2.45.2
> 
