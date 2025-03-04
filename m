Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6D8C282D0
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 11:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBB510E59D;
	Tue,  4 Mar 2025 11:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+C9VZ22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C815810E59D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741088273; x=1772624273;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WnFEGjAwZx9BGmNiZFIValk/vV19FfdFCYrU6kqC1JA=;
 b=I+C9VZ22l1g5NbgK87tPwdhl0HtCSdDEfMOCWqiLQjJT4+e/VZ/1ITIC
 AFLD92109AZ2JLa0sJ/c0lqo/Ush92U37st41QTQNTy1TSrinJVsQopGl
 NRKjEvk4m3AbN5zNg6UzLsNN1pxKRsf53Pw4xvgdnp3gc78Vy1+5aoLCh
 terYEKh4wNZahrTc4gW4mC1OeD4bTLZz5ygJ0OnVT9NfSu3ig98GinYBh
 iIAxlNje7oAKu50LDC3nUSxrmaZZtjTJm5qfR4oXnO4VCeatzWkav2yjs
 mEMPI11Z8Ganm8pDfRF71rwF16lETbB/OkHNbsZxFxqNbWpV7Ih2PH5eF w==;
X-CSE-ConnectionGUID: J0N+f0hlRj22I78UL6003g==
X-CSE-MsgGUID: g3DoEub9SCy5RqKnDTSR4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42029448"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="42029448"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:37:53 -0800
X-CSE-ConnectionGUID: 52oUIqCRSBGxYdsZsuM4Gw==
X-CSE-MsgGUID: Ngv6TFlZTdGhplW9tIEijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="149138370"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.218])
 ([10.245.246.218])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:37:52 -0800
Message-ID: <5b656ee8-d8c1-4a02-9365-356de01c79ac@intel.com>
Date: Tue, 4 Mar 2025 12:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/xe_eudebug_online: Set VRT
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250226104436.257298-1-dominik.grzegorzek@intel.com>
 <20250226104436.257298-2-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250226104436.257298-2-dominik.grzegorzek@intel.com>
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

Hi Dominik,

On 26.02.2025 11:44, Dominik Grzegorzek wrote:
> Limit number of GRFs used by single thread to utilize all
> possible threads per EU.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   tests/intel/xe_eudebug_online.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 472013fe1..7f36faee1 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -158,6 +158,9 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
>   
>   	shader = gpgpu_shader_create(fd);
>   
> +	if (shader->gen_ver == 3000)
> +		gpgpu_shader_set_vrt(shader, VRT_96);
> +
>   	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>   	if (flags & SHADER_BREAKPOINT) {
>   		gpgpu_shader__nop(shader);
