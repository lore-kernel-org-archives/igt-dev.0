Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D41C88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 17:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3947810F001;
	Thu, 17 Sep 2026 17:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6TR1+Ty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDF10ED6A;
 Thu, 17 Sep 2026 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789664411; x=1821200411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eYf6+2VDZy1UBqhMfZzM7r7gC0nfj3JPWNS+epSiDQ4=;
 b=B6TR1+TyFecqpSucDlF/IkhylT1U0sRjJBD1lIdVgHD6dZts87Cpqy9j
 56aZNuMjLewHMkWGwkzRXdorDo1Pl6FiNcvFyeKCcD8sNlnh5nQo0O83t
 FYgM8HocH8nBtrk6yp4KpNQ/DUqhXPIK28MhyN5HtPYiRpJbQ2l7ScYVe
 8gR5ZE224NDuWgKrlBjpgI3o4sBG2pgd0GrZkP0dsH83mOmGfH8MJ20V7
 hMygoKq34i4jS2+d6uDvcvMR8ebsbKt5HFzmHJ3ZBmpxymwQ0dNSjkYMu
 I2AEvCN5ZmlHsKIBj47zqLjl6JIvM0v6JpRz4McJQrq9gmU8KKT+Ac3pG w==;
X-CSE-ConnectionGUID: PlorEVhiRJWEsBhv/bPDwg==
X-CSE-MsgGUID: FWs8vLRiSmGJMbiqGXThfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89042339"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89042339"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 10:00:11 -0700
X-CSE-ConnectionGUID: RjFXroiqRp+KCQ9D5tP1LA==
X-CSE-MsgGUID: IrJc8oVvS3Wy4/iOKMOZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2132838"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 10:00:10 -0700
Date: Thu, 17 Sep 2026 19:00:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev3)
Message-ID: <20260917170007.wdwtjvfnzh4fobm2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260917145331.78274-1-kamil.konieczny@linux.intel.com>
 <178965897771.177999.1175361365832700958@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178965897771.177999.1175361365832700958@61270ab9df2a>
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

Hi igt-dev,
On 2026-09-17 at 15:29:37 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev3)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9099_BAT -> XEIGTPW_15858_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15858_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15858_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15858_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_3d@basic:
>     - bat-atsm-2:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-atsm-2/igt@kms_3d@basic.html

This is expected, please ignore.

> 
>   * igt@runner@aborted:
>     - bat-lnl-2:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-2/igt@runner@aborted.html
> 

Not related.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15858_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_3d@basic:
>     - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#6011])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-lnl-1/igt@kms_3d@basic.html
> 
>   * igt@xe_waitfence@reltime:
>     - bat-bmg-2:          [PASS][4] -> [FAIL][5] ([Intel XE#9115])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9099/bat-bmg-2/igt@xe_waitfence@reltime.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/bat-bmg-2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
>   [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9099 -> IGTPW_15858
>   * Linux: xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8 -> xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840
> 
>   IGTPW_15858: 15858
>   IGT_9099: 9099
>   xe-5755-0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8: 0fb8d1900f1a6b9d21aadbfa5f784979b950bcf8
>   xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840: d4289677143a2d09ce25eb883b0bf16fd7135840
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15858/index.html
