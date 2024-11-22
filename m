Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D8E65D0C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 06:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48E210E082;
	Fri, 22 Nov 2024 06:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXTlo9KE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35AF10E082;
 Fri, 22 Nov 2024 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732257402; x=1763793402;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xGL1xim+IS3zy06G6o2RhTcXvcZKTWMyehK90CwQpys=;
 b=OXTlo9KEk87c9+XjUaf1eu8mxctTAioWND6Lf00fk8KDRVvdU79ETpAv
 j3TB4UY0jmI3s2krLoSevgnmdIIYQjIR5tNzQPg9RsAqTNf/pwxTqw1sE
 IYJQ7dKFp76+dQlvx7v+sLgNiUqBPiXNtG5FLfkRblCPVs+Urhl2xn+zu
 y0KBhIj0CLAzWfFxqNqfA3FRmPS6BFkIkTJjgribQvnuxDLoQRj/aXpzT
 ruRYnUwN+E1b/KaJWjkQUYDKMcjtHDqG9xwMRkgysMK+gOI5Gp18UgeZ5
 YRvnnvrThMI1bxd3Aw+I0KeBxZfSL+hROpIsK2n0w3uqKQzv2HB2wdU7O A==;
X-CSE-ConnectionGUID: r+fyAAWRRJK65A/EwGE1fw==
X-CSE-MsgGUID: BujiDeF1SlacaDn2Fg26CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31791636"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="31791636"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 22:36:42 -0800
X-CSE-ConnectionGUID: v7Sipb53RROH6kKMl6bxeg==
X-CSE-MsgGUID: n38KwMnKTh60aWhLRIEi2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95282172"
Received: from nadesanm-mobl.ger.corp.intel.com (HELO [10.213.197.183])
 ([10.213.197.183])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 22:36:41 -0800
Message-ID: <267a718c-1d29-4e3e-824f-09d707a6c396@linux.intel.com>
Date: Fri, 22 Nov 2024 07:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_igt-runner?=
 =?UTF-8?Q?_fact_checking_=28rev8=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173222262236.1312350.79223373296069783@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173222262236.1312350.79223373296069783@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 21.11.2024 21:57, Patchwork wrote:

> == Series Details ==
> 
> Series: igt-runner fact checking (rev8)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8121 -> IGTPW_12163
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12163 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12163, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/index.html
> 
> Participating hosts (45 -> 44)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12163:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-2:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-arlh-2/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/bat-arlh-2/igt@i915_selftest@live.html
>     - bat-adlp-6:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8121/bat-adlp-6/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/bat-adlp-6/igt@i915_selftest@live.html

These are not related to my change. Can you please fix and rerun?

[...]
