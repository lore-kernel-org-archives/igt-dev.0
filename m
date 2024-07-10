Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7053BC38150
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 07:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3EC10E22C;
	Wed, 10 Jul 2024 07:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmZ1Cpvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9132A10E22C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720598293; x=1752134293;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LffRUycAxQNoGBsKzehXVcJ7HFegxAL9YIL8GDMr+Pc=;
 b=kmZ1Cpvk4lFGnltoxPx5l5ho8Whptlb4cB6u1TFRtxPtOn5zLaTGOt2m
 yPLtpdudBNYjYhbW1E/xvqGbL9T/eL09R4I4Z6DvMlyNZv5fo4iJWfOo6
 mPaJaXbKvz/rO9lHfbM2XCOYJSqUStoWkUWJN+7ljWVZQP+Y+K17TnL62
 wKHeEDEAXVmP7D7uaFOkRmIB1CiNEgBkDITxc52NEyHLE7HUFpn9X7zIu
 oIuFkZSi53E894r6llQoVvKGAa6XjXWBRLnnHm9PKaR4XH2hkLtCMVlO8
 6nzJiHGy/z/2JnmE+jSJpapkSY4BdkwZyEj2yHGWZvObHXuG6xGLq91Gs w==;
X-CSE-ConnectionGUID: 0g3JMrUHRW+pDtkz6Ap5/g==
X-CSE-MsgGUID: tZ+ynvo7ROCzYhcwWWOl8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29298202"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="29298202"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 00:58:13 -0700
X-CSE-ConnectionGUID: Vs/pD2l8RS27nkL3OMLfjA==
X-CSE-MsgGUID: zCnPTwsjRg2Rag0MvgzWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48104318"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 00:58:12 -0700
Message-ID: <c691f029-f56d-4e26-b1fb-06c23c267506@linux.intel.com>
Date: Wed, 10 Jul 2024 09:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: Add SR-IOV tests
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
References: <20240705184030.633153-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240705184030.633153-1-jakub1.kolakowski@intel.com>
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



On 7/5/2024 8:40 PM, Jakub Kolakowski wrote:
> Add SR-IOV tests to xe-fast-feedback testlist so that they will be
> executed in BAT runs. Added tests will exercise:
> - enabling maximum number of VFs without autoprobe
> - enabling one VF with autoprobe
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> 
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index aa98b37e6..01b01dcf9 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
>   igt@kms_psr@psr-primary-page-flip
>   igt@kms_psr@psr-cursor-plane-move
>   igt@kms_psr@psr-sprite-plane-onoff
> +igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
> +igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
>   igt@xe_compute@compute-square
>   igt@xe_create@create-execqueues-noleak
>   igt@xe_create@create-execqueues-leak
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
