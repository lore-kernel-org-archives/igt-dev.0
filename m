Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9492C27C75
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBB710E29A;
	Wed, 12 Jun 2024 07:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NrICan1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B069210E29A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176047; x=1749712047;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ad8MC2s/r/R6jp04fhznu9zP5Tdn7DMpdPMGxNHGlVk=;
 b=NrICan1QktEBpgqmNCq0emWprkydEeyjHxCxFJxGGsj1sfh4amTms2xZ
 EPXc1lozoESGSP+dVKpkf4ROR+je4gISgxRW9/rB3WRxrgmx5SocFs8pK
 NOqn8HG8OtWV7jcyifWgT7QeG3ag+dk6i1XREw7du+LyfwX4W5FXGVjS9
 a6L5LppjareroqOMs4fa2IwD2o2Xu/DMCTX1JC+EIKpiAsCL6axB3Nznj
 jNK/GIuI10FvpJL1UFHSbuBpQ15RP0vyAO6tpkof7wjMveB+tSyT7T2oo
 4HUP99bEtdlOanAXkiHhwmbfXgHOvVLsXdCJaEgYKxZRtIVeydQyGykDi Q==;
X-CSE-ConnectionGUID: /ThS/waQT1GVa6KD+98XEw==
X-CSE-MsgGUID: 2dPTm/KmQI+7hWLSfFoF5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37446224"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="37446224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:07:26 -0700
X-CSE-ConnectionGUID: zUyBas7lTgOo2PTL2j2mrg==
X-CSE-MsgGUID: A+vCglvVSiGKuQIif9Di8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="77152246"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:07:26 -0700
Message-ID: <f93085fc-204c-4bcc-9f5e-0d18ab65d975@intel.com>
Date: Wed, 12 Jun 2024 09:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 5/7] tests/core_hotunplug: Open the same driver
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-6-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-6-kamil.konieczny@linux.intel.com>
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
> Make sure any later opens will use the same driver as the first
> one. Also while at this, print driver name before test starts.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   tests/core_hotunplug.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7ed9abd37..ddf11bb00 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -710,11 +710,16 @@ igt_main
>   
>   	igt_fixture {
>   		int fd_drm;
> +		char driver[32] = {};
>   
>   		fd_drm = __drm_open_driver(DRIVER_ANY);
>   		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
>   
>   		priv.chipset = drm_get_chipset(fd_drm);
> +		/* Make sure it opens the same driver */
> +		__get_drm_device_name(fd_drm, driver, sizeof(driver) - 1);
> +		__set_forced_driver(driver);
> +		igt_info("DRM driver: %s\n", driver);
>   
>   		if (is_i915_device(fd_drm)) {
>   			gem_quiescent_gpu(fd_drm);

