Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24642C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33F310EBE7;
	Tue,  1 Sep 2026 08:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEIaRS13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF6899D4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788250839; x=1819786839;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=b1tk9oZHmdy6R+mMOsAHRS6XITVgSwb3M4OHS/ostG0=;
 b=VEIaRS13FLnOU7DJkDgM7MrT1qEIIUFeTH9D1ldYacMz88zooJT6e4H1
 h5oUZmafTsTgvBLbtC2ouI5XScG3xCjUxbNiTsDHuSip3YP/vaOwovrz2
 9cD06Y8UHfSO+TMoJrFMKuyN+G4J3i/5yfOEiIUH9Lg5yXbHaidH0T278
 yf83oga5ibTYT5sSDqtrXBDCfzT+NBAveG97aXBvITHdPzgjGeu1tDZqn
 RairOxYDWUbP4jngSDADxu6cC+9QUyDKJqj7iH2ApoS2j/ZP9q2Ai2pXr
 YVBZGBHXpT1CUIPvvr0E4T3CSX4MZVLiGhvrucLJ16ynOMfCXcnABY5W2 w==;
X-CSE-ConnectionGUID: V7y+6XIfTUOiRuFkyZq7bw==
X-CSE-MsgGUID: OFAyutdXS42XquIVDMd3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99007126"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="99007126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:20:38 -0700
X-CSE-ConnectionGUID: 37g6JpuTRti2eliGpecQqA==
X-CSE-MsgGUID: ixdrbYy7RJ+0oD1BEMKtHw==
X-ExtLoop1: 1
Received: from unknown (HELO [10.66.117.203]) ([10.66.117.203])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:20:38 -0700
Message-ID: <c23bbebb-ee27-4fb1-af8b-cef1dbf220c8@Intel.com>
Date: Tue, 1 Sep 2026 13:50:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe: Use proper GT lookup in xe_gt_get_tile_id()
To: igt-dev@lists.freedesktop.org
References: <20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Organization: intel
In-Reply-To: <20260831-gtlookup_noncontig-v1-1-37f22a0cbb6b@intel.com>
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



On 01-Sep-26 1:53 AM, Matt Roper wrote:
> xe_gt_get_tile_id() should lookup the GT record associated with a GT ID
> via drm_xe_get_gt() rather than directly indexing into gt_list[].  The
> ID may not always match the array index on future platforms if we ever
> have cases where GT IDs are non-contiguous.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   lib/xe/xe_query.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 68e60ddc7..0b309be03 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -1070,14 +1070,16 @@ bool xe_is_main_gt(int fd, int gt)
>    */
>   uint16_t xe_gt_get_tile_id(int fd, int gt)
>   {
> +	const struct drm_xe_gt *gt_data;
>   	struct xe_device *xe_dev;
>   
>   	xe_dev = find_in_cache(fd);
> -
>   	igt_assert(xe_dev);
> -	igt_assert(gt < xe_number_gt(fd));
>   
> -	return xe_dev->gt_list->gt_list[gt].tile_id;
> +	gt_data = drm_xe_get_gt(xe_dev, gt);
> +	igt_assert(gt_data);
> +
> +	return gt_data->tile_id;
Hi Matt,

Could we use xe_get_tile() directly having assert on negative return?

Dnyaneshwar>   }
>   
>   /**
> 
> ---
> base-commit: d822caac6e3589c05fffb63fbfc89134b0f7ccb3
> change-id: 20260831-gtlookup_noncontig-13ef96a45b4f
> 
> Best regards,

