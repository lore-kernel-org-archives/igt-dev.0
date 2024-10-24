Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1544D0BB7F
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 09:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6C510E8EA;
	Thu, 24 Oct 2024 09:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE5ybZeu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27C10E8EC
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729762446; x=1761298446;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AtmGP62vHh+zXAiSiB/gn9tvWvrXVdjk1n7jkw5vkaY=;
 b=FE5ybZeutV8ouvBFyN9ddQGH+v9lSfHPSXRnGIg44tpEWqMIjxmYlX3E
 rbVTyk9EVgCNglFWUdcOuun+nlqmGk4RrJpnFAvtMjNqZtEiPX6fPNpGb
 fWm5N1CI5OLh8U2eRGFQY/LpdIsK/qJlErYFzosF9Yazn5gSIwsIqCfev
 VhkXn8n8OZGFaCoo29RR59jkb7NhA1twv880/pNheSXAObJl4DqmtvkSa
 PqrLjc/475bajoZ3D4gc4j9Sl8at+B3FmlExgbL+Z5rvs5OgulD3rV2aq
 /lv93msbfQYLvsrrU5Q60eenHRW9SwgPRs0B8s07mgZFMtJIvHcjQOEwr Q==;
X-CSE-ConnectionGUID: l9Gih9JyR0umlV4ossF8nA==
X-CSE-MsgGUID: Zhz+ILsbTMaX3jhyR+wRmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40753873"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="40753873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:34:06 -0700
X-CSE-ConnectionGUID: 5trH+BGfQ26l//1K1lRtxg==
X-CSE-MsgGUID: PrgCdhN5TQmbJ+rSXquyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85147651"
Received: from satyasix-mobl.gar.corp.intel.com (HELO [10.247.218.0])
 ([10.247.218.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:34:04 -0700
Message-ID: <f9922a40-9e50-48d1-aed2-5f0c5a60a24e@intel.com>
Date: Thu, 24 Oct 2024 15:04:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1] tests/kms_async_flips: Skip Async flips on joiner
 output
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
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

Hello Santhosh,

On 23-10-2024 08:46, Santhosh Reddy Guddati wrote:
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5dec71291..37075bb4a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -686,18 +686,32 @@ static data_t data;
>   igt_main
>   {
>   	int i;
> +	int max_dotclock = 0;
> +	drmModeModeInfo mode;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> +		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
>   			      "Async Flip is not supported\n");
>   
>   		if (is_intel_device(data.drm_fd))
>   			data.bops = buf_ops_create(data.drm_fd);
> +		for_each_connected_output(&data.display, data.output) {
> +			drmModeConnector *connector = data.output->config.connector;
> +
> +			igt_skip_on_f(
> +			    bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode) ||
> +			    ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode) ||
> +			    igt_has_force_joiner_debugfs(data.drm_fd, data.output->name),
> +			    "Skipping test on output %s as async flip disallowed with joiner mode\n",
> +			    data.output->name
> +			);
> +		}
Please have this check at test level and only exclude big joiner outputs,
Test should run on non bigjoiner outputs.
>   	}
>   
>   	igt_describe("Verify the async flip functionality and the fps during async flips");
