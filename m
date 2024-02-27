Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5990C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 13:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4252210E265;
	Tue, 27 Feb 2024 13:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9esekM2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5A210E15C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709042073; x=1740578073;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=o3MBzshWgsCqa5PrvJa4OU/j24/CoQ0zM7QWzq0go6g=;
 b=i9esekM2zZz5U98chUzvIske3lnOJQQVT4+K+Ty0JzSw6TXk4zFlezas
 O2bVAF1YRmXvPRE9MpPIG8L6ilJw0DHl/ebXiLgYV/ejJH1NWQXVfHkhH
 hklL8WHn0zjGGr95MLCR3jo4YT1Sq6O+QSw4grnWu5rtuCFIqPbXyN17h
 FmM2K+CANtINGzCRe2kQQzVj6eKTjJpSY0WR0mAPIVWU7v6Od3NS819tG
 pT9wAXRWzHQKr6uQrNAru89jVDSRU6C2PTfe4yf7eaNSoQgiH7+ggp3RK
 lieAowq2AXdWX9xbKKATJgfRGlwzhVQTtYeed76DyI18EMsLwP9GwXTlD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14821021"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14821021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 05:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7017377"
Received: from rachupax-mobl.amr.corp.intel.com (HELO [10.213.71.201])
 ([10.213.71.201])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 05:54:17 -0800
Message-ID: <fda36966-c282-45f2-9cfc-722ed51eec0e@intel.com>
Date: Tue, 27 Feb 2024 19:24:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/2] tests/intel/kms_dirtyfb: Fix DRRS status check
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240221112341.2329405-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240221112341.2329405-2-bhanuprakash.modem@intel.com>
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


On 2/21/2024 4:53 PM, Bhanuprakash Modem wrote:
> Fix assertion check for DRRS status.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Both patch LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 26b82e50a..0e315bfb4 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -154,7 +154,7 @@ static void check_feature(data_t *data)
>   			     "PSR still disabled\n");
>   		break;
>   	case FEATURE_DRRS:
> -		igt_assert_f(intel_is_drrs_inactive(data->drm_fd, data->pipe),
> +		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
>   			     "DRRS INACTIVE\n");
>   		break;
>   	case FEATURE_DEFAULT:
