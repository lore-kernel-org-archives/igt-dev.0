Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B257606A320
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXVmasg+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DE210FC11;
	Wed, 18 Nov 2026 13:03:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D465810EC1C;
 Wed, 18 Nov 2026 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795006921; x=1826542921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qs5dfbl2s9APL1UyHVnTtkrBtjTL5C6vybQzeRX/XGI=;
 b=FXVmasg+V7SYNIMajXFxq5CwbrXjV5ZXsGuN9qfockRiHjbXjD5pstlq
 lHV/mCkCrkVT+NPUJGUdSCLWFzX0WjD7KjH95qYlRCdS63KS/nQplcdT4
 FylRI+ufSV82PdkTYiC1J/DwCwU5IoDzHkjcveDDm4rKwSBSwSN+fHR23
 lCMD1cKLe23xKHquj3smlD0PMlCnfrpleZ0nStzqkD01P3KpGgF7yZETE
 DtntUGpnp7HkyQeE1AWjx1ZL5541gJtUMKL07q8fhL646um2cSumZNkYJ
 PfdltLpSrO8B6i9fFm2hxcYONdfV0HzUGRV9u8QUCssDwJyJvZfh9vgJb A==;
X-CSE-ConnectionGUID: tr3/bj3lS62/d1d66pKa7g==
X-CSE-MsgGUID: vzkjioMlTgWf8dlpKhlSHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3805623"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3805623"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:02:00 -0800
X-CSE-ConnectionGUID: xmACvnEGQu2eT+gVuPGDyA==
X-CSE-MsgGUID: OHCB/9KlTF6ls/WBUSwFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10502275"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 05:01:58 -0800
Date: Wed, 18 Nov 2026 14:01:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 tests/core_sysfs: Create listing while reading
Message-ID: <fzcg3ysi24nequc7hs4qur53qonim322q6uwyq3om6qenb7fii@vvrwgdgmigch>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org, 
 Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>
References: <20261117194250.72855-1-kamil.konieczny@linux.intel.com>
 <179494675783.39806.6843256983173737497@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179494675783.39806.6843256983173737497@9ac1b63fe3ea>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-11-17 at 20:19:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_sysfs: Create listing while reading
> URL   : https://patchwork.freedesktop.org/series/178819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9196_BAT -> XEIGTPW_16167_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_16167_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16167_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 14)
> ------------------------------
> 
>   Missing    (1): bat-bmg-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_16167_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_sysfs@read-all-entries:
>     - bat-ptl-1:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-1/igt@core_sysfs@read-all-entries.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-1/igt@core_sysfs@read-all-entries.html
>     - bat-lnl-1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-1/igt@core_sysfs@read-all-entries.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-1/igt@core_sysfs@read-all-entries.html
>     - bat-bmg-2:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-2/igt@core_sysfs@read-all-entries.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-2/igt@core_sysfs@read-all-entries.html
>     - bat-adlp-7:         [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-adlp-7/igt@core_sysfs@read-all-entries.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-adlp-7/igt@core_sysfs@read-all-entries.html
>     - bat-bmg-1:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-bmg-1/igt@core_sysfs@read-all-entries.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-bmg-1/igt@core_sysfs@read-all-entries.html
>     - bat-lnl-2:          [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-lnl-2/igt@core_sysfs@read-all-entries.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-lnl-2/igt@core_sysfs@read-all-entries.html
>     - bat-atsm-2:         [PASS][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-atsm-2/igt@core_sysfs@read-all-entries.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-atsm-2/igt@core_sysfs@read-all-entries.html
>     - bat-ptl-vm:         [PASS][15] -> [FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-vm/igt@core_sysfs@read-all-entries.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-vm/igt@core_sysfs@read-all-entries.html
>     - bat-wcl-2:          [PASS][17] -> [FAIL][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-2/igt@core_sysfs@read-all-entries.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-2/igt@core_sysfs@read-all-entries.html
>     - bat-nvls-1:         [PASS][19] -> [FAIL][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-1/igt@core_sysfs@read-all-entries.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-1/igt@core_sysfs@read-all-entries.html
>     - bat-nvls-2:         [PASS][21] -> [FAIL][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-nvls-2/igt@core_sysfs@read-all-entries.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-nvls-2/igt@core_sysfs@read-all-entries.html
>     - bat-ptl-2:          [PASS][23] -> [FAIL][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-ptl-2/igt@core_sysfs@read-all-entries.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-ptl-2/igt@core_sysfs@read-all-entries.html
>     - bat-wcl-1:          [PASS][25] -> [FAIL][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9196/bat-wcl-1/igt@core_sysfs@read-all-entries.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/bat-wcl-1/igt@core_sysfs@read-all-entries.html
> 
>   

These are tests bugs, please do not file a GitLab work-item.

Regards,
Kamil

> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9196 -> IGTPW_16167
>   * Linux: xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda -> xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0
> 
>   IGTPW_16167: 16167
>   IGT_9196: 9196
>   xe-6155-ccb10a534282f16c6d068bc06e5c722680045dda: ccb10a534282f16c6d068bc06e5c722680045dda
>   xe-6163-79504010d899136eff374b34e1fedcb8e5d57fe0: 79504010d899136eff374b34e1fedcb8e5d57fe0
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16167/index.html
