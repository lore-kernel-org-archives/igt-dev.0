Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485BEC3ABB6
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 11:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F238A10E73B;
	Wed, 30 Apr 2025 11:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4xSTxIV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAEF10E0E2;
 Wed, 30 Apr 2025 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746012688; x=1777548688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L1/3iUVs/uhTX09dhniy/4vfTFxS0QuO72AFJR9ffQY=;
 b=F4xSTxIVyKwcs0amWRebKX9v0Nn44yVWo2dEJSn8Q8RDElw/sUjjGM6j
 tDv/jrwUxfQXoHdfmPWV4rHm6115IllsieN6l5tym7GRl4TnIZuc5DGle
 6MYD/FvSsluW2Eyj4zvyqNdjKuX8wxRCEgYyAQXPnc9SuwhfP5ihEv+Jr
 ByC0e8nf4L3nbNZUjvfoee41WBQOWgJP7GplZBwmQ/9gsyPvj1C5jC/px
 nOcc66TkYHcqBt0M7/3h7fUh3G1t7h/GYwRUOx31m0e5AsnsdJFNE6p4X
 9yE6PD+jYm/zo4qdDlAiDdJJqACklMdcySia+b6d63ZKMlGrD/mAuzJPf g==;
X-CSE-ConnectionGUID: bldsHo6HRPOzPKgiHyaiVg==
X-CSE-MsgGUID: DoRRU+vIQtyqopOe6zxWJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46914341"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="46914341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 04:31:27 -0700
X-CSE-ConnectionGUID: bekT028ySjmZLmQcfvsXpg==
X-CSE-MsgGUID: nhov0f+vRjm7zqoXxEvUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="135037172"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:31:26 -0700
Date: Wed, 30 Apr 2025 13:31:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_pxp: Terminate PXP on exit (rev2)
Message-ID: <20250430113123.xnvuc4esoahgxz2m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250429234924.2049502-1-daniele.ceraolospurio@intel.com>
 <174599736370.28464.3618008308280823951@c664b1dc75d1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174599736370.28464.3618008308280823951@c664b1dc75d1>
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
On 2025-04-30 at 07:16:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pxp: Terminate PXP on exit (rev2)
> URL   : https://patchwork.freedesktop.org/series/147948/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8344_BAT -> XEIGTPW_13063_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13063_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13063_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_13063_BAT prevented too many machines from booting.
> 
>   Missing    (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 

Xe igt patch cannot block booting, unrelated.

Regards,
Kamil

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8344 -> IGTPW_13063
>   * Linux: xe-3009-f13165b51331915eb63fdb160331e035ecae35c7 -> xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34
> 
>   IGTPW_13063: 7adc0eec19dfa81d8ceb65feb462e03c673c33d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8344: 00f143c5f06f7d5936aacb70dad22be371570d38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3009-f13165b51331915eb63fdb160331e035ecae35c7: f13165b51331915eb63fdb160331e035ecae35c7
>   xe-3010-11bac2f4b353b42599a9b028f48261d32b94fe34: 11bac2f4b353b42599a9b028f48261d32b94fe34
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13063/index.html
