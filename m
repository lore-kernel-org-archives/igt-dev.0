Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD77BC4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 05:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5E510E0B7;
	Thu, 18 Jan 2024 05:12:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B875410E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 05:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705554774; x=1737090774;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uu7aLPtgaw6IEalamqXhN5BFK6kOa+FJXN03pB/1j+E=;
 b=YtmC3beKrsUvkeIjMA4jkj3RlgWDk1Ej9XiHwzpG4d+p5kiFLw5So9QV
 caQGpSTpDW6N1+oniAFyl43jjP/m7e0MD3dPXb08VFE+v9npS/S7qww8A
 wkegasDey365j8Po9iQcGos9fS3lKhSotUQ3xpmPXyh1ajx3hCDME/jV2
 gAobwN9z9DSfHpu25bMnSjXlOU/3PrLyqSe9x610xQp1LzoBTFWaiP0bv
 z6TOZ/u4s0yLroefUa2YFvOsXeoucNYM4r9HUiIXrInOL2EdBc/i1szrI
 kcc74HkjLb1nGRCi6OnL1PQdLfCoQwcKKy86+6Gb1EjmVW787IBqYw9Rj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="486501997"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="486501997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 21:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="874980218"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="874980218"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.81.131])
 ([10.213.81.131])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 21:12:49 -0800
Message-ID: <51ab10a6-c2dd-4a94-a67a-ce8d2803c5a5@intel.com>
Date: Thu, 18 Jan 2024 10:42:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [i-g-t] lib/kms_psr: Honour PSR OS capability alongside
 Sink capability
Content-Language: en-US
To: soumya prabhu nidoni <soumya.prabhu.nidoni@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240117094907.401866-1-soumya.prabhu.nidoni@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240117094907.401866-1-soumya.prabhu.nidoni@intel.com>
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

Hi Soumya,

On 17-Jan-24 3:19 PM, soumya prabhu nidoni wrote:
> Currently IGT code is checking only the Sink Support it's not verifying
> OS capability.So this patch is verifying OS PSR capability.
> 
> Signed-off-by: soumya prabhu nidoni <soumya.prabhu.nidoni@intel.com>
> ---
>   lib/igt_psr.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 663bac163..f43d46dfb 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -208,7 +208,8 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   {
>   	char *line;
>   	char debugfs_file[128] = {0};
> -	char buf[PSR_STATUS_MAX_LEN];
> +	char debugfs_file1[128] = {0};
> +	char buf[PSR_STATUS_MAX_LEN], buf1[5000];
>   	int ret;
>   
>   	if (output)
> @@ -216,10 +217,16 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   	else
>   		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
>   
> +	sprintf(debugfs_file1, "%s", "i915_capabilities");

i915_capabilities is specific to i915 driver. However for xe and i915 we 
have i915_display_capabilities where you can parse has_psr: yes to know 
h/w capability.

So, this change of yours won't work with xe driver and we need to make 
generic change supporting both drivers.

> +
>   	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
>   				      sizeof(buf));
>   	if (ret < 1)
>   		return false;
> +	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file1, buf1,
> +				      sizeof(buf1));
> +	if (ret < 1)
> +		return false;
>   
>   	line = strstr(buf, "Sink support: ");
>   	if (!line)
> @@ -227,9 +234,10 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   
>   	switch (mode) {
>   	case PSR_MODE_1:
> -		return strstr(line, "PSR = yes") ||
> +		return ((strstr(line, "PSR = yes") ||
>   		       strstr(buf, "Sink_Support: yes\n") ||
> -		       strstr(buf, "Sink support: yes");
> +		       strstr(buf, "Sink support: yes")) &&
> +		       strstr(buf1, "i915.enable_psr=1"));
>   	case PSR_MODE_2:
>   	case PSR_MODE_2_SEL_FETCH:
>   		/*
> @@ -240,10 +248,11 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
>   		 * Region Early Transport to support PSR2 (eDP 1.5)
>   		 */
> -		return strstr(buf, "Sink support: yes [0x03]") ||
> +		return ((strstr(buf, "Sink support: yes [0x03]") ||
>   		       strstr(buf, "Sink support: yes [0x04]") ||
>   		       (strstr(line, "PSR = yes") &&
> -		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
> +		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")))) &&
> +			strstr(buf1, "i915.enable_psr=2"));
>   	case PR_MODE:
>   		return strstr(line, "Panel Replay = yes");
>   	default:
