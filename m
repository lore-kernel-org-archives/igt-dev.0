Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41128C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 18:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC33A10E315;
	Thu,  5 Jun 2025 18:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uzdsc4Tp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0110E2E4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 18:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749148671; x=1780684671;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=zduO+qCCoBK8or7xxYJguEPzY73KZg/jXktms1srCxw=;
 b=Uzdsc4TpJurOi8DqpQRdeYeWNjRxhK7u+SkeNP/uDChcUjQ7JZFEKi4w
 5+iBI9MeCVlGWJa+Npg5D27UsQs77xyZAEm+sJ3xPVgEbgtzRKBFogfIv
 TFFB4Lvu5iCs8+wvHiHNbiNQ/TPq2xWB4a1Ez9gCpXVUuw4L/yit6D4L9
 jwumSg/rIONnQB6QoYFr7d1nYrbLWULYXBv/nQNUFfSR1RGRij/8TXK2S
 Xm3WyJkTFWeQF6ptpSyX4T0Kd+fdWNOUZ0DGGtryUaeu7A6dEBnZ+7Y43
 m6iVxgfVDru6L+2QKiZpUWRblYb/iTqgdUY0W+o3XcjlRK4tVi+W6UoIW g==;
X-CSE-ConnectionGUID: F1Aas1LBQeqXcVicx1/sGw==
X-CSE-MsgGUID: nz5ikqXXS3KOyRC3xt04RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50518136"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="50518136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:37:51 -0700
X-CSE-ConnectionGUID: 58a7K3CyRziJwg6IvNVd7w==
X-CSE-MsgGUID: fpohco4kR0uTi8WsSlURkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146180194"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.193])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:37:49 -0700
Date: Thu, 5 Jun 2025 20:37:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Control compute-preempt bo allocation (rev2)
Message-ID: <4jvl3a6l6w4hcwiixl5i6ukwp5sk2wwvp7twwuug6giwnqljw3@3mtkgnlhr5pd>
References: <20250605142824.380177-4-zbigniew.kempczynski@intel.com>
 <174914550113.52730.13505743789405494758@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174914550113.52730.13505743789405494758@1538d3639d33>
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

On Thu, Jun 05, 2025 at 05:45:01PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Control compute-preempt bo allocation (rev2)                     
>    URL:     https://patchwork.freedesktop.org/series/149833/                 
>    State:   failure                                                          
>    Details: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13247/index.html 
> 
>          CI Bug Log - changes from XEIGT_8396_BAT -> XEIGTPW_13247_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with XEIGTPW_13247_BAT absolutely need to
>    be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13247_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (7 -> 7)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    XEIGTPW_13247_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
>           * bat-lnl-2: PASS -> DMESG-WARN

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in XEIGTPW_13247_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@addfb25-4-tiled:
>           * bat-lnl-2: PASS -> ABORT (Intel XE#5003)
> 
> Build changes
> 
>      * IGT: IGT_8396 -> IGTPW_13247
>      * Linux: xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b ->
>        xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311
> 
>    IGTPW_13247: 4fc6586b9a42f8c15d738726beb920921f655a70 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8396: 8396
>    xe-3194-573b98ac3ff9ff95c3316789e97980277e4ffe2b:
>    573b98ac3ff9ff95c3316789e97980277e4ffe2b
>    xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311:
>    4a82dcabe4230c77b75d4d4d10829458c6acb311
