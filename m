Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8817C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 11:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4827410E039;
	Thu,  9 May 2024 11:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC16P45g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FAE10E039
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715255816; x=1746791816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CsK66BlVwJB/bPyGau0Cb+5AwyCf1WdVKY/7LouXIOY=;
 b=NC16P45gNs3X5sG/5bfaoxrrZGH2R/rTFyrcszUKnrL20gKKmF9w9t6b
 Xj2PH9z2E4toMYfQygnunFOeWvwc1zK7ala+g4ewOJGErzi3cAtrDA2cO
 rudaUuXBV1Mv2D9Uoh9MjO8JFKn6yNd2cmCjnip/LAt3e8QBh78A0lNp8
 USoZIz6jgVuZyq5hSfYCC/K1BVG6sA2H8tym9isWu3cMoMMcmytm7v6xu
 w5tVlg27Tqbu9b8ryYvaXAy22zG9aMb7/oVltT5R/2n3DMBSES25ZFT9r
 seJQT5p/P5JagVI13DvmbgyG5VHLMtME0110VwTLjb0CnMO7AgUuZ9xzt A==;
X-CSE-ConnectionGUID: h/PfPpwXQuGjS/JKETJURA==
X-CSE-MsgGUID: 9ceJXzT5Qv23C9qS4xNT/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36550926"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="36550926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:56:55 -0700
X-CSE-ConnectionGUID: Yl4TNJBiTRmuKxp7d6CkNQ==
X-CSE-MsgGUID: EPCfHa1NQEauQpXN9LSiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="60395374"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 04:56:55 -0700
Received: from [10.245.96.165] (unknown [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1231E28789;
 Thu,  9 May 2024 12:56:52 +0100 (IST)
Message-ID: <9e997027-8539-4303-8b2b-6451bb801c94@intel.com>
Date: Thu, 9 May 2024 13:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/sriov_basic: Skip tests if sriov_totalvfs is
 zero
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
References: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 08.05.2024 21:32, Marcin Bernatowicz wrote:
> There is no point to run the tests if no VFs can be enabled.
> Additionally, the `for_random_sriov_num_vfs` macro will lead
> to undefined behavior if `sriov_totalvfs` is zero.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/sriov_basic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index f58b3b7ba..1bc082d76 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -120,7 +120,7 @@ igt_main
>  
>  	igt_fixture {
>  		pf_fd = drm_open_driver(DRIVER_ANY);
> -		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_vfs_supported(pf_fd));

shouldn't the check for supported_vfs > 0 be a part of is_pf ?

IMO if a driver can't support any VF it's hard to name it a PF

>  		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>  	}
