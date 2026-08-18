Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED94C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 13:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EDB10E053;
	Tue, 18 Aug 2026 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEzC3mZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F81310EB81
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787060755; x=1818596755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sn1YquNknzavSqNKhN3EblV2cw4jXo/zhCx+xhsLQjs=;
 b=oEzC3mZjlpxsmE0RQykupunVa00Uk1byDT9zKC2wzqynhsquq5cAR1xL
 lIMKeLMSBX+IxCi37VLnUhMjUudE/b+ZHoihzSu/ekC2C0pqGS0477h17
 gVaoLmWFbLtxJnn1syWF2y/1DNEQZzHH816GTRt3fxHAEnKXXefJqzZE5
 Z6jV18WCI9W1ms2l4vTDQ73YXCqaba4mGuUt3mkD1fkSddajSWjlU3mYD
 XOPnbF9TnPAf9aBAK+O1GSBf4tLAXEcWvtGrVlaSVCqIUZGRpsTbyAjnb
 WqtdRngibpZpENZETuVKkiBUagBiAry+akMeeKD6EBKfgGoI9aDhCgHPX w==;
X-CSE-ConnectionGUID: sCM+0JF4TAGPg904Ym4EKA==
X-CSE-MsgGUID: MRwH92PvTxCBZNo5wKHR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105086981"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105086981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:54 -0700
X-CSE-ConnectionGUID: REkyAt/9QUWC+2gV54C0RQ==
X-CSE-MsgGUID: TiDuVG2LRquzo+1jlLnF0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262602111"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.106])
 ([172.28.182.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:53 -0700
Message-ID: <dc2dcca4-b1d3-4367-a543-d69e066b7ede@linux.intel.com>
Date: Tue, 18 Aug 2026 15:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] intel-ci: Block igt@xe_sriov_ggtt.*
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20260804072407.1090889-1-lukasz.laguna@intel.com>
 <20260804072407.1090889-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260804072407.1090889-3-lukasz.laguna@intel.com>
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


On 8/4/2026 9:24 AM, Lukasz Laguna wrote:
> This test is dedicated for HW checkout and it's not suited for recurring
> CI runs.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 410f43b17..d0a2bf87d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -114,6 +114,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
>   igt@sriov_basic@enable-vfs-bind-unbind-each$
>   igt@sriov_basic@bind-unbind-vf$
>   ##################################################################
> +# SR-IOV tests for HW checkout, not suited for recurring CI runs
> +##################################################################
> +igt@xe_sriov_ggtt.*
> +##################################################################
>   # Chamelium V1 HDMI receiver supports a maximum resolution
>   # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
>   # which exceeds the capabilities of V1 hardware and results

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

