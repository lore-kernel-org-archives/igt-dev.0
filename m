Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14303C25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 12:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A083710F96C;
	Mon,  6 May 2024 12:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQ12QkMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C68810F901;
 Mon,  6 May 2024 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715000348; x=1746536348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W4p/ijK/Mj1qrMC1AsClFjdyXl1Oq4MVEfr+N4QKKN0=;
 b=CQ12QkMCvxmcRpNzoPT6Kj+KwY3yOl8iQyTMlQ8/zeAnaZnU/fJ+GN7T
 I17DwgXPK/jWyfEAk91XzwFySaQiUvr/pjxFvc3O3yRQNXto86oBWdtGt
 VczHxkNemtXysKrf3cAX/DogXV4GM99xc6IlwNId3V3q6lNyzawEgn2jJ
 H4FioiqL7e11H/6V87pOXaHcQQ0I6VRY27IblD1emXs1nBMyMjc54VLSI
 SNrOu84bKuzX/AzqBnMljwIHg/KjXaRYHvnQ8HyIzgVH555OqT3G3wcpc
 F5Gyi909TkP7ItfxWyNBcK10CUgbuzHOnVxzV+4vGFQtlkNVCqaLvwaP1 Q==;
X-CSE-ConnectionGUID: JJTckZ8BTKCD3Qd4Z1j3sQ==
X-CSE-MsgGUID: 8SRsdpirQuSKLWAgIWXBOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10584361"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10584361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 05:59:07 -0700
X-CSE-ConnectionGUID: 44WMDaU1Sqe/L5yWRJ7odQ==
X-CSE-MsgGUID: z/3L1zpFQVmcVLLJsRTvOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="59030420"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:59:06 -0700
Date: Mon, 6 May 2024 14:59:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vignesh Raman <vignesh.raman@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/meson.build: Generate test-list for cross build
Message-ID: <20240506125902.oiqvrq5treyusnrh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vignesh Raman <vignesh.raman@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240502064309.56280-1-vignesh.raman@collabora.com>
 <171464237097.1848758.2476185198450685685@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171464237097.1848758.2476185198450685685@8e613ede5ea5>
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
On 2024-05-02 at 09:32:50 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/meson.build: Generate test-list for cross build
> URL   : https://patchwork.freedesktop.org/series/133130/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7828_BAT -> XEIGTPW_11092_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11092_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11092_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11092_BAT prevented too many machines from booting.
> 
>   Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 
> 

It is likely not preventing machines from booting...
but please do not re-run this as it is only creating text file
with tests execs in it, no changes in any tests.

Regards,
Kamil
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
>   * IGT: IGT_7828 -> IGTPW_11092
>   * Linux: xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 -> xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025
> 
>   IGTPW_11092: 11092
>   IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1213-3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009: 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009
>   xe-1217-8f904f61a50ed9e9869bead4a4dd767fce79a025: 8f904f61a50ed9e9869bead4a4dd767fce79a025
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11092/index.html
