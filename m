Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFC2CAC5AC
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 15:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0831B10E1C9;
	Tue, 23 Sep 2025 15:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAR16bSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C0B10E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758639772; x=1790175772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lkr0ShengUzqWSOwDdAH3IYRbP/jrXajFoMn2FDSBqs=;
 b=OAR16bSUx7q/umsVdphc2C8tmT5K3z0c0kaRd5qSts5TEsUJ64JJSIMK
 qTsY3cce1eheZT/+XP9Y9l1ba5G6acC642BCepB9pUO9T0eTXvVUckTiV
 9Svk3Kp2kJQ7B/28EcNcSCSHn9UHXqzuDRGR4vNz+O8X6vBgwOaWdxH06
 bToeoJAfZyHTCXcxuRxqALK/tth+Bpktim+ZA1alVYK/cb+ApEJ4yb59/
 qh5zL7r/LV1h8xHMh/m/H5tNWd2ALJl7cPq65CjKypFxcbREjXrcdq9rV
 yfqfMSRRGB6jmp2ivhsRpIba/SXP+jD7q45kLc/2w4eR5c2jQzqZ5pBHA g==;
X-CSE-ConnectionGUID: zTpFXKfiQXKRlwoi0U9VvA==
X-CSE-MsgGUID: t8lIV8kxR6WV5WZ2JPVmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72347211"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="72347211"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:02:51 -0700
X-CSE-ConnectionGUID: yzrPLAKbRSyr+dH0QO5xoA==
X-CSE-MsgGUID: Zx5IR/XLQzGWySNFix9PFg==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:02:50 -0700
Message-ID: <47c2801b-8d12-4784-ac43-05042b96d9c2@intel.com>
Date: Tue, 23 Sep 2025 17:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 3/6] tests/xe_eudebug_online: Allow dead client
 in set-breakpoint-sigint-debugger
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-4-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250923131002.24708-4-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,

On 23.09.2025 15:09, Dominik Karol Piątkowski wrote:
> There is a chance that the client will become dead during
> set-breakpoint-sigint-debugger test - avoid tripping over the assert by
> allowing this situation during this test.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   tests/intel/xe_eudebug_online.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 535f00818..aa58e5f99 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1569,6 +1569,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>   
>   		data = online_debug_data_create(hwe);
>   		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> +		s->client->allow_dead_client = true;
>   		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
>   						open_trigger);
>   		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,

