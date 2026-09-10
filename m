Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDADDC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 10:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4956210E262;
	Thu, 10 Sep 2026 10:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBka4Yve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ED210E262
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789036067; x=1820572067;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q2kWMHT4TN2wq5g5TKH5nB/m+wK525+5rpV6g2BcMD0=;
 b=XBka4Yvef82vCMBvqNMfwA7CVlseAdCQJ7MUJ3VZWGe3yidFmL7oIYF/
 KB2j6tJMc3wVNUgV45065JJwAomkjyTT+wIU7thaX/4bkrwC8gFzw2QMV
 aTULLfyPCTFmK40ulnulKp0fTM4rZckd/BbQA22P/ozOHeHNZ6Z9GS0EG
 Y/FvoVC8U5up0RJuKJo8LRtdAJurq3I7hHMSzPJQaHLGxRyYplMysxjw8
 An5y2EAvzpAuha/frSWfbifQ+wh9kTH8bEjZ2LSTSVzA5/GkDUxtLCcxJ
 3WOJR1PPSopEGDhBnB2vBbCTq3sTMc1N2VDUJd4VnHMwZKPxNn5B+s40+ g==;
X-CSE-ConnectionGUID: UVTSMaPvQq6m/W6BQA4z+A==
X-CSE-MsgGUID: He1gvz/9SEinsM349cpAig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93173317"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93173317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:27:47 -0700
X-CSE-ConnectionGUID: HJAdSOE/RPiOu95dWFzCcw==
X-CSE-MsgGUID: vVLawlg5RDqcv/JJd9H4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275113674"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:27:45 -0700
Message-ID: <acb9c818-b147-48b8-aab2-19a277acf835@linux.intel.com>
Date: Thu, 10 Sep 2026 12:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] intel-ci: Block igt@xe_sriov_mmio_regs.*
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20260907124658.613244-1-lukasz.laguna@intel.com>
 <20260907124658.613244-4-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260907124658.613244-4-lukasz.laguna@intel.com>
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 9/7/2026 2:46 PM, Lukasz Laguna wrote:
> This test is dedicated for HW checkout and it's not suited for recurring
> CI runs.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index d0a2bf87d..116b0b93a 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -117,6 +117,7 @@ igt@sriov_basic@bind-unbind-vf$
>   # SR-IOV tests for HW checkout, not suited for recurring CI runs
>   ##################################################################
>   igt@xe_sriov_ggtt.*
> +igt@xe_sriov_mmio_regs.*
>   ##################################################################
>   # Chamelium V1 HDMI receiver supports a maximum resolution
>   # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
