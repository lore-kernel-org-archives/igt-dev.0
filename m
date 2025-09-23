Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFDACAC5B1
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 08:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB3610E590;
	Tue, 23 Sep 2025 08:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezkLCV+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C40310E590
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758615269; x=1790151269;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wEguYrksVkwioP2U089ogmcSZWYr3B4yHvnIUu9pBt0=;
 b=ezkLCV+nqKZcrImlfz+UDNkCpDe1acXLipXmaMV9cwzp6ycohSs9MNzR
 +t8jmSgOFWBYHLkbqIDPSqIOictfqzb6gUodXI9MQcZXP4XCy7kPe4fwX
 1uBVoxCG+99OSi9UdXyzpYNgkv8lUb1JJunmjQNVMyL1bOV0pb1FtExE0
 zLDIgp1SzSwXp2jSAnmxq6/Ds4DT0kezFE1K/FWoTwx4sBYmjVlfxWOxJ
 rMe5c4uI3T+LuK+Di3tUlbJbNT2B7Aldkf98c5WEwoAoe5b3UOiLHw3l4
 kDioVM5uY6MxpadUsiWRnb0c8HMWPzaLahUL081G8a53nneuGLok6jEjE w==;
X-CSE-ConnectionGUID: EJMlpZqyQZit0ij8awigVA==
X-CSE-MsgGUID: SiMqkUcgR7i21wyD3zv56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86323772"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="86323772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:14:18 -0700
X-CSE-ConnectionGUID: 3SMtoUmVTbu9AExU63HqCQ==
X-CSE-MsgGUID: Qcfl4fWzQqmrdxejf2jh/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="181092522"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.190])
 ([172.28.180.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 01:14:17 -0700
Message-ID: <0a1dc4a1-a910-43c5-b078-4e9cf3cc3f91@intel.com>
Date: Tue, 23 Sep 2025 10:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_list: igt_list_empty() Detect uninitialized
 list
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250922162340.20034-1-peter.senna@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250922162340.20034-1-peter.senna@linux.intel.com>
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

Hi Peter,

On 22.09.2025 18:23, Peter Senna Tschudin wrote:
> Add a check to igt_list_empty() to return true if the list head pointer
> or its next/prev pointers are NULL, preventing segfaults when operating
> on uninitialized or potentially broken lists.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>   lib/igt_list.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_list.c b/lib/igt_list.c
> index 37ae139c4..f77aef7dd 100644
> --- a/lib/igt_list.c
> +++ b/lib/igt_list.c
> @@ -79,5 +79,9 @@ int igt_list_length(const struct igt_list_head *head)
>   
>   bool igt_list_empty(const struct igt_list_head *head)
>   {
> +	/* Detect uninitialized / potentially broken list */
> +	if (!head || !head->next || !head->prev)
> +		return true;
> +

Without this change:
1. Passing an uninitialized list is a bug
2. The function doesn't check any condition and returns 'normally' 
regardless

With this change:
1. Passing an uninitialized list is a bug (still)
2. The function *may* detect an uninitialized list which is a bug but 
returns 'normally' regardless

If we are adding a check that catches some invalid/buggy condition the 
reasonable thing to do would be to assert/abort.

Regards,
Christoph


>   	return head->next == head;
>   }

