Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B34C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 16:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D410E919;
	Thu, 27 Mar 2025 16:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXQHOrL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0561910E919;
 Thu, 27 Mar 2025 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743091670; x=1774627670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nHijbcmBW8hnnkbzyLXxEcCdtpHWxa/0TmJdLlhtu5o=;
 b=kXQHOrL4bTmFgQF0d3Rb4EfzciJ/yM7BZyH77k27u6kfYaR+Fj/a33d4
 QguAZa25buarNvZV2hclNq0ATo2eBEOUGNJafYVIqOAsyiGgmf+QDvYes
 HGppBQCEXgal2O7cjnetWibSN1Pvpo4cUBE1/UHUGRq72gSsI/gtKpUZj
 /HaUZQeoa7PNApp9Zv7UCogu9/gvTfSWWbDzHOwrEPX8KdE+8zUb0KP4Y
 7zbG4hJfnA36qzm2qN1udGITgPI6pKpu2Vp1kWsoCehXyFx7bHWlePoLb
 fqTFuLOxMPcjFTTVvqEp0EQdW1PM1TUnIi/D1PtNEHvpCvzfMuwMMB7l8 g==;
X-CSE-ConnectionGUID: HtHSSn//Ry2XOusE/xh7Ig==
X-CSE-MsgGUID: aIWQPrr3Q1CtDhKAfnLi2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44594510"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44594510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:07:46 -0700
X-CSE-ConnectionGUID: 8YavxEr8R12naLJn2OIIjA==
X-CSE-MsgGUID: +R3OHYMGQEevWwC9Uo1AAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162416153"
Received: from kbrylows-mobl6.ger.corp.intel.com (HELO [10.245.96.173])
 ([10.245.96.173])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:07:45 -0700
Message-ID: <a7300812-236d-4a2c-8e2d-63f6ebe9cc59@linux.intel.com>
Date: Thu, 27 Mar 2025 17:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIG1hbi9sc2dwdTog?=
 =?UTF-8?Q?Add_man_page_for_lsgpu?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250327110616.59257-1-peter.senna@linux.intel.com>
 <174308728012.11772.2010392660673419561@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174308728012.11772.2010392660673419561@e6b6f09ec485>
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

On 3/27/2025 3:54 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: man/lsgpu: Add man page for lsgpu
> URL   : https://patchwork.freedesktop.org/series/146860/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8289_BAT -> XEIGTPW_12857_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12857_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12857_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12857_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-adlp-vf:        [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8289/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12857/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
> 
These are unrelated to my change. Thank you,
Peter
