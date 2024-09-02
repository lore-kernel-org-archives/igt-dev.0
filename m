Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685D6CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 12:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2D110E2E1;
	Mon,  2 Sep 2024 12:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELccBPlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85C10E2E3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725281304; x=1756817304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hp76c8aY1toL0r6MJ2m8huerbeESKMyRKlwkYhuSbj0=;
 b=ELccBPlE6ees9fpGWBGLa4X3/w5W07263+92zUo761Ar4bLoVALdoPp7
 p1U3zde1RIX7N8rye61PqB2/W5JL9C6i5SS2Awnzj4qn7+W1Oi6uwKoyz
 qHtY0jzRXFXGeCh4/orxUTduNhbdtUuEQoJVqvRC8gVRFhRW0pvYWSJeX
 hNPT5C2Cm6KIawOexvAWeN5T1DK8m8BxEIX6+TXOh/Iju1MuU1Rqc+8UE
 3tJq9KWeUvce0HhAe6KsGg66JWKTf91d7AtsPEz8YDu5MYDyz2AqBcNp8
 KXMFZ24wt7XPiM16YqJepB2DgxhkdGqcNy3J599YPFzifHUlf2/4Gf7wR w==;
X-CSE-ConnectionGUID: X7Q/LpTxRcW2LvL8TRFXMw==
X-CSE-MsgGUID: iJ9Du3J+TGeTsWncKA4GZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35255591"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="35255591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 05:48:24 -0700
X-CSE-ConnectionGUID: 6khVnJ5WTmmxD6r1rFmOGQ==
X-CSE-MsgGUID: Xxu3jukOS+yf1gZp+FiSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="95313873"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.83.151])
 ([10.213.83.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 05:48:22 -0700
Message-ID: <c98ab43a-d327-4824-beab-ad834acfcb53@intel.com>
Date: Mon, 2 Sep 2024 18:18:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_cdclk: skip cdclk tests for bmg
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, matthew.d.roper@intel.com
References: <20240902083232.21871-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240902083232.21871-1-vinod.govindapillai@intel.com>
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com

On 02-Sep-24 2:02 PM, Vinod Govindapillai wrote:
> As there is only one cdclk option in BMG, these cdclk tests
> which look for change in cdclk frequency when changing
> between high and low resolution mode will fail. So skip
> these tests for bmg
> 
> v2: Add WA info as a comment (Matt Roper)
>      fix commit header description (Swati)
> 
> Acked-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 6fe6e6c3f..382b3e9d1 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -402,6 +402,9 @@ igt_main
>   			      "Hardware doesn't support crawling/squashing.\n");
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +
> +		/* Wa_15015413771: Only single possible cdclk value in XE2_HPD */
> +		igt_require(!IS_BATTLEMAGE(data.devid));
>   	}
>   
>   	igt_describe("Plane scaling test to validate cdclk frequency change.");
