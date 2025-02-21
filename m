Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05BC021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 17:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DAB10EAFF;
	Fri, 21 Feb 2025 17:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfG/kXhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343410EAFF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740157563; x=1771693563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l+0SPkIussgJdXdVaxz82KhbXRxJZ7egTXPbNZAYsQU=;
 b=XfG/kXhw71f6f7ABBahJgWCUMXuRJ8ozyT4GKq0UVL4QBFoCVlS2wnkt
 1Xvvm5Hz2fXhXg/morIFoV9RYdrikW3D0504ac0P0gODsWgl5QVbdhv0b
 odCkIUeVyK+hryF0mRKHw8hjsbgDRDafzb1blKxFsZgKehCSNUJOGVpJm
 gnytMwWVODRoDamte5vLB241M8tREP8eVQxZKbn9MXQvPWqB4fkaW1C5u
 ZBls4oVcWPTpZZtlzTrY0wpGn7wjzOMEbAdW5CR+mdBkwvVccdrRolZkM
 xkD9CZDg5H3C0k9fYwXKtBJp3QQv8FumsIBKbh094VClxzTT6XYMMuDSm w==;
X-CSE-ConnectionGUID: hbWCncuFTwyoHKUT24Im7A==
X-CSE-MsgGUID: GeJz7d6OSKKr+096gauauw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40175797"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40175797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 09:06:03 -0800
X-CSE-ConnectionGUID: m/wNp8e9QDyGWVH9vwFP4g==
X-CSE-MsgGUID: /YXhCzVsQRi4z/5ii6TdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115239932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 09:06:01 -0800
Date: Fri, 21 Feb 2025 18:05:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_oa: Skip when no OA units available
Message-ID: <20250221170558.t2r7a4ytkvadzwcn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-02-20 at 14:01:05 +0100, Marcin Bernatowicz wrote:
> Add a check to ensure at least one OA unit is available before
> proceeding with the tests. This prevents unnecessary failures on
> devices that do not support OA units.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_oa.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 0242fd594..6abf44128 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4852,6 +4852,7 @@ igt_main
>  
>  		/* See xe_query_oa_units_new() */
>  		igt_require(xe_dev->oa_units);
> +		igt_require(xe_dev->oa_units->num_oa_units);
>  		oau = nth_oa_unit(drm_fd, 0);
>  
>  		devid = intel_get_drm_devid(drm_fd);
> -- 
> 2.31.1
> 
