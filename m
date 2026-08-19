Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DADC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 05:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532C310E0B8;
	Wed, 19 Aug 2026 05:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvHKcTWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDCC10E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 05:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787117053; x=1818653053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LMbmTtXlzuMoMZF6CfOWdDPygD4yl75sZ0t659G5MAQ=;
 b=fvHKcTWyR9PiD43eBT6ZsTa6AA5DFJ9roe3DymtzrjcAoeRlgnYVoG+O
 638Fi2XvdzCAIwDsdR+E29aDlGt2TyHiJGTKvbfGPn1IJTiPWqOlLnT6e
 WKXuJ022uiVmZ6zIwYEkaBx7AHJiQ1nlscaC0bgYkCJ8qwX3gt889ptjW
 3a2ajWMW2gIJqN4fEi52H4JpfgFsmzezt37Ib8fFp18PwHRS6sDuXGYOq
 obvpvyfaCNtGM+1U19qATWohcvdElli1sKMMOuc/Dbnpukg3l/ztAVBg1
 KDA1R21PApa/DIPQ/PgqFFbOczz1pxrakKLAgyNuaxQBxE6laYGz3wNjx g==;
X-CSE-ConnectionGUID: H7WZRqPfRWO0fC9XM90ujg==
X-CSE-MsgGUID: 824tnGnKQv2fcGFaepc4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97956906"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="97956906"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:24:13 -0700
X-CSE-ConnectionGUID: pjBk1cy+RhO1yEyEBrwemA==
X-CSE-MsgGUID: XmiMXzjGTcKSpMDu8IdBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="303647756"
Received: from rbalaar-mobl1.gar.corp.intel.com (HELO [10.247.151.71])
 ([10.247.151.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:24:12 -0700
Message-ID: <9d84c53c-1de2-432c-a20a-328f6626a20e@intel.com>
Date: Wed, 19 Aug 2026 10:54:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/4] lib/i915/i915_dp: Add UHBR helpers and
 const-correct set_link_params
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <20260817082612.1101382-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260817082612.1101382-2-sowmiya.s@intel.com>
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


On 17-08-2026 13:56, Sowmiya S wrote:
> Add i915_dp_is_uhbr_rate() and i915_dp_get_next_lower_rate(), prep for
> the UHBR-to-HBR fallback subtest later in this series; no caller yet.
>
> i915_dp_get_next_lower_rate() parses intel_dp_allowed_link_configs
> (source & sink & current limits) rather than i915_dp_force_link_rate,
> since the latter is source-only and lets the kernel silently clamp a
> rate the sink never advertised.
>
> Also take link_rate/lane_count as const char * in
> i915_dp_set_link_params() so callers can pass string literals.
>
> v4: - name the UHBR10 threshold and make i915_dp_is_uhbr_rate() a
>        static inline in the header to avoid a cross-TU call (Kunal)
>      - parse intel_dp_allowed_link_configs instead of the source-only
>        i915_dp_force_link_rate list in i915_dp_get_next_lower_rate()
>        (Kunal)
>      - avoid the implicit long to int narrowing on the return value
>        (Kunal)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
