Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4751FEDEBE3
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 18:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332810E057;
	Tue,  3 Mar 2026 18:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brTbB1Sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26810E057
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 18:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561819; x=1804097819;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z+OXIDaoE6OoYHHw0cOWNiOo+Y0hQmi5CErBeQbOMs0=;
 b=brTbB1Sa0oHd+xw0g0mY1XuwV4jtXrYGrFIQ3rDiynkuEeewEshjGWvh
 DxQ5tLYpdr/qpXDKsHJ8NeZ6TBsGUAxdwSRgOLGstS+EERo0sW1NCdekt
 ZTQGUqHMzxff+xUC8NWLN6e/nssgMxoKnZdo8vh7l51UiRqwHXd9bYKzR
 gu2ddJbXR1x9iSZRRinauQsZcK53dKvD3RyO8g3wGOMQ8Yh3FPQOOeb3+
 XC06aUQ48yR7UZEAKVqzGVGcsZyoynz9N7+RgmXI4xKIqSB0/WMHpCppb
 NOQQnkuHaCOtxPNC2oA5bR2Tc2kGFmWatTEXO2Am+IpEd+LGf2C3TLq0x A==;
X-CSE-ConnectionGUID: osBm808ZQdG6Z3Q2YUh5oA==
X-CSE-MsgGUID: BEXQ+ArnSHSiQUfiftga4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99087019"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99087019"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:16:58 -0800
X-CSE-ConnectionGUID: Kb+WNWu6TNqGpX+SYlAMaA==
X-CSE-MsgGUID: /6ScuI5+QUazRGRJYCIvBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="223078239"
Received: from prakharp-mobl2.gar.corp.intel.com (HELO [10.247.190.213])
 ([10.247.190.213])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:16:55 -0800
Message-ID: <af094f53-97fe-475a-9d08-3332a4daa7dd@intel.com>
Date: Tue, 3 Mar 2026 23:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v7,26/48] lib/unigraf: Add plug/unplug helpers
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com,
 kory.maincent@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-26-73dc9143c8c1@bootlin.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260223-unigraf-integration-v7-26-73dc9143c8c1@bootlin.com>
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

Hello Louis,

On 23-02-2026 17:39, Louis Chauvet wrote:
> The unigraf can emulate a full cable plug/unplug, so add helper to emulate
> this.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/unigraf/unigraf.c | 28 +++++++++++++++++++++++++++-
>   lib/unigraf/unigraf.h |  4 ++++
>   2 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> index 5812f46fe6ae..f148d4fc099f 100644
> --- a/lib/unigraf/unigraf.c
> +++ b/lib/unigraf/unigraf.c
> @@ -307,7 +307,9 @@ void unigraf_require_device(int drm_fd)
>    * and link parameters to default values.
>    */
>   void unigraf_reset(void)
> -{}
> +{
> +	unigraf_plug();
> +}
>   
>   /**
>    * unigraf_hpd_assert() - Assert Hot Plug Detect signal
> @@ -345,3 +347,27 @@ void unigraf_hpd_deassert(void)
>   {
>   	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
>   }
> +
> +/**
> + * unigraf_plug() - Emulate a cable unplug
> + *
> + * This function will emulate a full cable unplug (not a simple HPD line change)
> + */
> +void unigraf_unplug(void)
> +{
> +	int d = 2 << 2;
Let's avoid magic numbers
> +
> +	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
> +}
> +
> +/**
> + * unigraf_plug() - Emulate a cable plug
> + *
> + * This function will emulate a full cable plug (not a simple HPD line change)
> + */
> +void unigraf_plug(void)
> +{
> +	int d = 3 << 2;
Same here

Thanks and Regards
Kunal Joshi
> +
> +	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
> +}
> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> index 77fba4e53912..ae1f0d8955ab 100644
> --- a/lib/unigraf/unigraf.h
> +++ b/lib/unigraf/unigraf.h
> @@ -48,4 +48,8 @@ void unigraf_hpd_pulse(int duration);
>   
>   void unigraf_hpd_assert(void);
>   
> +void unigraf_plug(void);
> +
> +void unigraf_unplug(void);
> +
>   #endif // UNIGRAF_H
