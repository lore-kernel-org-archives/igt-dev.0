Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D52C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516710E7A4;
	Wed, 12 Jun 2024 07:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGS250Ue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073AA10E7A4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718175786; x=1749711786;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=reRk3oRfD8qdaTXr3YDG3vrxD8myGc3u07auO38qjpQ=;
 b=BGS250Ueba1ygYP5A+oghYbkdWimN47W/FGjtv2GfS35Yl9FnlBoqkHM
 LoIbm6jdBBjtpHIwv7zg0/CeZ03iYhWsUn3vGFmYoE2bhhNYJ6H9vEhL2
 3Aqa2xuM9PNQwFb0cGE+Hdc9cDDp3azcBBPaJZx4y6tPhZ01Dyy64Rt6M
 IAu6Rc2vcF2orX3oEiXAuY4DsjGyKVl6CQVoJ12VbQLGppxNFrovyTVVt
 1vQzJi8HzljcgyYqsScpKJIc0VnK0rT4ZjzifuPzYHKFigbyDcJcqVXDW
 8guMmy4NJtDO1WoRXtmB2Ok2PCtkTA+T3IKGCYacAMA8KVI9hYw2ZlwVQ g==;
X-CSE-ConnectionGUID: 9/LySMztTNi4oBLNlIXsGA==
X-CSE-MsgGUID: i/klw/UVQv66wSrj8HCB8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25550770"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="25550770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:03:05 -0700
X-CSE-ConnectionGUID: yMtrUm5sQGusl0r90pxjEQ==
X-CSE-MsgGUID: uaGaQ4MqTQ2i0eozKLWCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39619110"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:03:05 -0700
Message-ID: <1a5726bb-7a1b-42a4-8d9e-c137fb54a97e@intel.com>
Date: Wed, 12 Jun 2024 09:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/7] tests/core_hotunplug: set known chipset
 before tests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-3-kamil.konieczny@linux.intel.com>
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> Set chipset for all known drivers, not only for i915.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   tests/core_hotunplug.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index db7a5c5e8..3971b94ff 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -685,9 +685,9 @@ igt_main
>   		fd_drm = __drm_open_driver(DRIVER_ANY);
>   		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>   
> -		if (is_i915_device(fd_drm)) {
> -			priv.chipset = DRIVER_INTEL;
> +		priv.chipset = drm_get_chipset(fd_drm);
>   
> +		if (is_i915_device(fd_drm)) {
>   			gem_quiescent_gpu(fd_drm);
>   			igt_require_gem(fd_drm);
>   

