Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C611CA0EF6
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 08:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923E10E982;
	Fri, 30 Aug 2024 08:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RijIBIhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF610E982
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725008232; x=1756544232;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s0nRWpk9U0U3Y8JBLQLdKqIxrPxXEQIbigyd5JYMmvs=;
 b=RijIBIhZUzdQBUCF9IT60GS2YAVWnw25jzlNrEiraWxqyV5jGm8qLd+4
 hpeD8zazcwPBdP+VXDEN0wp/OiTB+1v82Tykj9WPX6IIXOSySVEBF4i+l
 trXy1DycA2BNemIDZl2iqTZwhhfQWwgGZs+iA4fA+zls7yKAk2uez3vTg
 tKlFtOiBoRTYuolwuGj0bM/VG1cnBlO9uQeXUePQ01h0ocGNdNzJpy7DM
 o2tkHKdnur3gx1x4eGklDnaYgNlxkufsrS0xJnRLHJdv3sbbRSowXeO/0
 WFTxb9YyQryKoFg4pUZrLmr7Z7qEOGcSWY/CD0vRGKc5sRk89hg3nq68K w==;
X-CSE-ConnectionGUID: 3Xz4K1WKQnCEMTUf7WchSw==
X-CSE-MsgGUID: PULpS0krRZyhRGRlWQ6Kog==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34212221"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="34212221"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:57:11 -0700
X-CSE-ConnectionGUID: TLkPD+6SRsSB8ekVpUXxoA==
X-CSE-MsgGUID: wN7+N7MwR+2H6bPioYEVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68659597"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.215.119.92])
 ([10.215.119.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:57:08 -0700
Message-ID: <089b88c8-0d44-47c1-9898-df567a475389@intel.com>
Date: Fri, 30 Aug 2024 14:27:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms:cdclk: skip cdclk tests for bmg
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Cc: juha-pekka.heikkila@intel.com
References: <20240813110736.68690-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240813110736.68690-1-vinod.govindapillai@intel.com>
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

Hi Vinod,

Please fix the subject.
++Matt for his feedback

On 13-Aug-24 4:37 PM, Vinod Govindapillai wrote:
> As there is only one cdclk option in BMG, these cdclk tests
> which look for change in cdclk frequency when changing
> between high and low resolution mode will fail. So skip
> these tests for bmg
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 6fe6e6c3f..24a0c4547 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -402,6 +402,9 @@ igt_main
>   			      "Hardware doesn't support crawling/squashing.\n");
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +
> +		/* Only one cdclk option in bmg. Skip all these tests for BMG? */
> +		igt_require(!IS_BATTLEMAGE(data.devid));
>   	}
>   
>   	igt_describe("Plane scaling test to validate cdclk frequency change.");
