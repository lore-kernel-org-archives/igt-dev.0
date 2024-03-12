Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62796C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2E210E509;
	Tue, 12 Mar 2024 12:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1ITk3ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603F610E509
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710246166; x=1741782166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AmtZml9kkIm88StLHci55AffOkNB9JboEeldojan28w=;
 b=J1ITk3lld5XOKTTO3iAi/eMSnF9y0s35nQfH08Xza6izeEGps3uQtrAI
 TFYKyYk5SfnvgMmrT7D8634OSP7Vg7tzfNt66qZneXviRf5Nx57qIUjMC
 KFSZBfDFXX1wLQu0aAoiqZz5R4kah73Vtzqrf/nXLBMj98OjSEmmM8CVf
 SW7Ec5BOxSb0FnNVsOyGJJovH03exrTuaHiCe7HP2BMUwgWBB+TX1B2Vb
 sYSVCmARfU6WKdPy1FwSjuBGw9uxCwT2l3Llfx0dKLXJBilt43jzqsNeL
 kz6nl9SLD9GF35EjMgSQF0jC1rWkpEOQAjnUvHPD1Hb8ncW3/IrKAIKqt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16391797"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16391797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11985746"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.110])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:22:43 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Cc: kamil.konieczny@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are
 present
Date: Tue, 12 Mar 2024 13:22:39 +0100
Message-ID: <4191705.3T5rpR7ggn@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240312110059.18944-1-nirmoy.das@intel.com>
References: <20240312110059.18944-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 12 March 2024 12:00:59 CET Nirmoy Das wrote:
> The assert is unnecessary at this early while init phase
> of the test so skip the test instead when are no drm devices.
> 
> v2: fix a typo.
> v3:  s/igt_assert_fd/igt_require_fd(Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10087
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/device_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 817cbc285..9ec9a213e 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
>  	 * a device file descriptor open for exit handler use.
>  	 */
>  	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
> -	igt_assert_fd(dev->fds.dev);
> +	igt_require_fd(dev->fds.dev);
>  	if (is_i915_device(dev->fds.dev))
>  		igt_require_gem(dev->fds.dev);
>  
> 




