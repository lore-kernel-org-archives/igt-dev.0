Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29190C3DA45
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 15:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBBC10E94B;
	Thu, 11 Jul 2024 15:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikdtOIJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C4210E94B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720712056; x=1752248056;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to:content-transfer-encoding;
 bh=NP9NVbDh74fj14w7oTvf7CMDiL7vmdbHJIWm9F7V4zk=;
 b=ikdtOIJaIppj2dkT9dURm7tWl0mWA2dwKQ1AP0ax0Gu7WzmXCwFtKMFc
 rfOP+LMwdsgtC5SVYXESEQbwvMaYP+DWnd3v+eUrMUhsCKwlVLk5XoJxX
 ETVzkwgizlcIumFT5QQGpHBRr/8am3VAGOvb7b2tiZSasC/uLo0Dx9mFe
 G36kOfnLn3fDb9D5wTd8j5mZBnN86Lh2GU32pZHU04Auj8Vu0t4/wlbYj
 9R+hHTAg6vCP2EYG9dR7kv9OFRGO/U+so0furViadfIKi82CNNIUkNB4m
 +/AQnajbNeXUuDFHp++9zO0zIJSgyO1ZdBQhr6WyRzVeWIe0EpVlmL4IL A==;
X-CSE-ConnectionGUID: 3TcmTwxOTvCa6QrvuY0Bxw==
X-CSE-MsgGUID: AQigftRcTwemasdDpIggdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17974827"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17974827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 08:34:16 -0700
X-CSE-ConnectionGUID: YFYom05VQ8yCthonnXJ3+g==
X-CSE-MsgGUID: AsL9YxMeS7inWAuN15NlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="52977100"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 08:34:15 -0700
Message-ID: <1026c4a9-a19a-496a-af5a-4cb376fa7d25@linux.intel.com>
Date: Thu, 11 Jul 2024 17:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel-ci/?=
 =?UTF-8?Q?xe-fast-feedback=3A_Add_SR-IOV_tests?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240705184030.633153-1-jakub1.kolakowski@intel.com>
 <172020524278.31461.4388149393447782909@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <172020524278.31461.4388149393447782909@2413ebb6fbb6>
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

Hi,


Following tests:

igt@sriov_basic@enable-vfs-autoprobe-on
igt@sriov_basic@enable-vfs-autoprobe-off

are expected to SKIP on platforms other than atsm / adlp

Regards,
marcin

On 7/5/2024 8:47 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe-fast-feedback: Add SR-IOV tests
> *URL:*	https://patchwork.freedesktop.org/series/135803/ 
> <https://patchwork.freedesktop.org/series/135803/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7917_BAT -> XEIGTPW_11377_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11377_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11377_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (5 -> 5)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11377_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html> +1 other test skip
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11377_BAT that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o bat-pvc-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1932 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932>) +1 other test skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html> (Intel XE#1932 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932>) +1 other test skip
>   *
> 
>     igt@xe_gt_freq@freq_basic_api:
> 
>       o bat-adlp-7: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7917/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11377/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html> (Intel XE#2196 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7917 -> IGTPW_11377
> 
> IGTPW_11377: 11377
> IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: 
> cdd1a80a2d16d5213af20a29eb7570a7651db7dc
> 
