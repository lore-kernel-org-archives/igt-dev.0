Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE79CC5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 05:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8703710E0B9;
	Wed, 19 Aug 2026 05:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGcu8U/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4804110E0B9
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 05:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787117135; x=1818653135;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x+tc5DprKEVSJGefOd7U7K0MIMs40S/q7OyBg36C5K0=;
 b=JGcu8U/oWxujM8zPAyRIw0K5OfjQomEBklaPQYo78y4QuZJJ5tU0Wln7
 Eo5I7oCbgcQ7RVKOxRzz6fAvOC1R7IT69BFGney1jhn5SYOnmzcrJo9po
 K9DVUfHtPbxQQbC68RWLMZyK5jUVVI8GLLmZpntN0FY4iKHFQp44SpNK/
 mMJoQxpWwtRAtFIxuHT9VKwI/8XoxrdnBiQAqYljzKGiBrvYpMrpHVgvB
 Rxfuf2S0HNifFhknVrDg1IXSdJEkoLoiZn5eylNRzeAQvxPLSdUpaGZfa
 ja7sQ1Iy/le6kPJE7TQyNyxioykVZ573ck96SO0Etbfo04IA3qdT5gQCq Q==;
X-CSE-ConnectionGUID: yPe+l7l/QCStFX+NGCwcfQ==
X-CSE-MsgGUID: tmJUg6JWQIynUDAlvecHVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98979689"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98979689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:25:35 -0700
X-CSE-ConnectionGUID: 7PdR6rSDSrScDwdYHm6AyQ==
X-CSE-MsgGUID: uFpS/U08T7GVR+TlvOodOA==
X-ExtLoop1: 1
Received: from rbalaar-mobl1.gar.corp.intel.com (HELO [10.247.151.71])
 ([10.247.151.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 22:25:33 -0700
Message-ID: <9b944fa5-e3d4-4b58-959d-e1f8e53b4f13@intel.com>
Date: Wed, 19 Aug 2026 10:55:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 3/4] tests/intel/kms_dp_linktrain_fallback: Add
 UHBR-to-HBR fallback subtest
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
 <20260817082612.1101382-4-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260817082612.1101382-4-sowmiya.s@intel.com>
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
> Add 'uhbr-to-hbr-fallback' to verify the 128b/132b->8b/10b encoding
> transition on UHBR-capable DP connectors by pinning the link at the
> highest sustainable UHBR rate, forcing LT_FAILURE_REDUCED_CAPS failures
> and asserting the rate drops below UHBR10. Supports SST and MST.
>
> v2: resets MST traversal state per test run (Kunal)
> v3: - use i915_dp_is_uhbr_rate()/i915_dp_get_next_lower_rate()
>        from lib
>      - single UHBR capability gate using max_link_rate after reset
>      - add igt_reset_connectors() on pin-loop early-return
>      - hard-assert for 'fallback not reached'
>      - remove dead run_dsc reset; merge run_* funcs
>      - fix link rate log units (10 kbit/s).
>      - Extend run_lt_fallback_test() with a force_uhbr parameter
>      - and remove the duplicate run_uhbr_to_hbr_fallback_test()
>        (Kunal)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Fold patch 4 here with that
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
