Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B65C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 09:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721C210F11D;
	Fri, 21 Jun 2024 09:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPdJpArD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A95510F11D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718961457; x=1750497457;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H9Z0tfjwb07VKLHl/y7H89VKTNYYirRtPBFwcih26Ok=;
 b=RPdJpArDVVnE5JsvK3hRwnRZTKOhfwbPoBxuWEedlBuAJLRbLl/F3A1V
 SxngZdsdBxI2zQySYxdtZYI/zDY7lUKeAFF9vX2dUFVbTsIBW7nPO0NUP
 uIY6MPPNDEoCn6Bl8r8C1uZ1NffnBhvyuJ8h0Yugw3CUiJquAUj+Rzpi6
 HqRr3j1ZdvhOtcEl61gWzmGGSHIGGtURK4hASEK1kR8TLZ43Wu8D218Vo
 9x+gsXXD2vv7+QuVLbZHSefHCUN0Y8SkLCz+L45xe8CeSI0w7S9PzsZvK
 oKv2JAHx3LO/4nINSa1WeQI93tHptD6twxReIhH/rk1uzdZbNOlilfb8V Q==;
X-CSE-ConnectionGUID: tG5t761CTbmtdFZ1Xior/w==
X-CSE-MsgGUID: 9+QPTAC/SP63s8gUw2uFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27124026"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="27124026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:17:31 -0700
X-CSE-ConnectionGUID: fIHxFwrjT4WDalybpysEMA==
X-CSE-MsgGUID: y0vccHBKQL2pq8eeE4S2QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="43202152"
Received: from unknown (HELO [10.66.103.214]) ([10.66.103.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:17:29 -0700
Message-ID: <fe79a103-3bc2-4d73-96b6-726eafc5caa8@intel.com>
Date: Fri, 21 Jun 2024 14:47:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3, 5/7] tests/kms_psr2_sf: Use stored psr mode instead of
 PSR_MODE_2_SEL_FETCH
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com
References: <20240614053839.1822879-6-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240614053839.1822879-6-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 6/14/2024 11:08 AM, Jouni Högander wrote:
> We are already checking psr mode supported by system and storing it.
> Use stored value instead of PSR_MODE_2_SEL_FETCH when enabling psr mode.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
