Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEDBCA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 10:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86FF10E95F;
	Thu, 28 Aug 2025 10:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmNq/hDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1E210E95F;
 Thu, 28 Aug 2025 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376563; x=1787912563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v9qxeT37yJ0ExyPLvy0tWW6tmNmlpgqtST115vSO7O8=;
 b=mmNq/hDzm2NY6t+RY0OEeyHaOBAMIcSRfI4C7JFwuNf1NX07gIBy9afT
 ESbv1Vf1i/A1AYgeDThDCP4F/lC3PguJ/InyESqU022d0Ner5S7OmXlIQ
 hGjYvE+173GVcHnjFg1EDmQfd7nf5zbW3L1bAZNPSs8odNYvWj7lyirzr
 BGOkFO9G66T9PVu7uk9fTCIlfgCO/3debxCt7xk6uS02kE584mqMQd4OG
 kwDOs64migVWthoi1Za9Tghsli9ycukCpjVZzXAA1GBq6owgqXHCOhdJ+
 PIxrnU6e9KWOCTyVUyUL+KhUVckXr0WSL/cM5tIUT/3hnk+07btVUp4cd g==;
X-CSE-ConnectionGUID: 6QoeOlGMT9yjWsJu9oPPow==
X-CSE-MsgGUID: tbMIRVxlTBy52l8or8clfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57666738"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57666738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:22:43 -0700
X-CSE-ConnectionGUID: fW5+zRsKTsSahCR7KWs+Lg==
X-CSE-MsgGUID: lGT66j5cSGicRk1OUxU3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170471574"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 03:22:42 -0700
Date: Thu, 28 Aug 2025 12:22:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 runner/executor: Abort if dmesg is flooded (rev5)
Message-ID: <20250828102239.kn2m2ear5yyjtagw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250826125329.109160-1-kamil.konieczny@linux.intel.com>
 <175625961162.272713.9088176635672758250@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175625961162.272713.9088176635672758250@1538d3639d33>
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
On 2025-08-27 at 01:53:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded (rev5)
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8511_FULL -> XEIGTPW_13641_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13641_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13641_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13641_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13641/shard-lnl-3/igt@xe_configfs@survivability-mode.html
> 

Unrelated to runner change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13641_FULL that come from known issues:
> 

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8511 -> IGTPW_13641
>   * Linux: xe-3620-03ce398526a784c3afb2f18cb7d04b80f1a90ecf -> xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907
> 
>   IGTPW_13641: 13641
>   IGT_8511: 8511
>   xe-3620-03ce398526a784c3afb2f18cb7d04b80f1a90ecf: 03ce398526a784c3afb2f18cb7d04b80f1a90ecf
>   xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907: 4b94f8fef771cb0b1d0131675e2d794ef6464907
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13641/index.html
