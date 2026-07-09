Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFB4C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 15:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2F10E074;
	Thu,  9 Jul 2026 15:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yrr0FHBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74B710E074
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783610314; x=1815146314;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E61tRE+lunJ697XNd9iSg9c8jGbcbJPeCT8L2Cs5gEE=;
 b=Yrr0FHBzqC6ue/I7FGL73FysBPzdSBtOM/s1l3dl6vq/zivMix90hQ5M
 hH0dxj0Udhoppacp78yrfqdHgdzN/ggaAmyV6x/BIHHa25zgPZXlywwNs
 lD/veUskAspIccC4tlQS7TkYBRDmTLqegm0BuxNRTI9+S+I/zy0uqBPii
 fRN6epF6lQ9wE0icdSWo9CLcDbdKdUiJm3m/7R3SRA3vI4AoONGMRhvu+
 nUl5lRuH0I6Al4BRMl38mg3egomkJOYOXh9NQQdqmNL9Vmb2rTjoSeJYm
 zoAid5VGcSyGtvUCJQO1ON8JD3A9Ah+bkkEm6kdZk/czHsG/pNnhmbIzK A==;
X-CSE-ConnectionGUID: APCGJuvsScmVrTNg/8HbvQ==
X-CSE-MsgGUID: ZjKYdJsqQCOlVGZDgr2zCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107092317"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107092317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 08:18:34 -0700
X-CSE-ConnectionGUID: +6a0pcQORuC/7vP65Y1eoA==
X-CSE-MsgGUID: ey7bEf8YTeuCiWjg1+2MaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253516503"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 08:18:34 -0700
Message-ID: <52adacee-898a-4a7a-b79a-c136f851604f@linux.intel.com>
Date: Thu, 9 Jul 2026 17:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Remove SR-IOV tests from NVL blocklist
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260525145339.74568-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260525145339.74568-1-jakub1.kolakowski@intel.com>
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


On 5/25/2026 4:53 PM, Jakub Kolakowski wrote:
> With NVL being marked as SR-IOV capable there's no need to block SR-IOV
> tests on this platform.
> Remove SR-IOV tests from NVL blocklist to enable testing SR-IOV within
> core runs.
>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index ea47d3b85..bd19dafe5 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -1,9 +1,4 @@
>   ##################################################################
> -# SR-IOV/IOV tests are not applicable for native
> -# configuration and will be run under its separate configuration
> -##################################################################
> -igt@.*iov.*
> -##################################################################
>   # All Display related tests are being run under
>   # separate display configurations
>   ##################################################################

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

