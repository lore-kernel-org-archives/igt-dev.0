Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F60DC43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 11:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424B689D5C;
	Thu,  2 Jul 2026 11:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUrC4CH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B6610F2FD
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782992341; x=1814528341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QPI2h+ofXY/gfoY3eFLeSPZytoBhcfGU06ref58WDQk=;
 b=XUrC4CH/AC4BJpbDrCKKTqypg4jZDpWQpsPk+mLAoHvMUtSHpq1KTbOX
 xlMolX/ANDkov/2AvVptclSdQayPAC3aeEMIB227+DMdgODOy0wxQJrIQ
 wk1oTmAYQLCHetFamR//kZ9TW/wa936IiZ2fgQ1iWimmdcUyoFwX2UiCR
 pmKkJR9NdYWUikmlpovfAzNJ0CwFDteOjaS4mB2AHUWHh/q/APa+PgDx/
 xb+I5f6cc8cmlKaJieBkuBlOS3q8leKS4cphyevX9XV+x66Ulo5MnEMS9
 Wcy3/oPYSXbcZ98rJOcPxN9HbJ7Sr8FToSPjC32VcGQ8EDmwGEQC+Z98O g==;
X-CSE-ConnectionGUID: uldoZ52CRIelZViAQQhHfQ==
X-CSE-MsgGUID: BqbKO5GZSbKvf0ZLdpBABg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83937157"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="83937157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:39:01 -0700
X-CSE-ConnectionGUID: Q8TcBoR6R4eILIALHmE6EQ==
X-CSE-MsgGUID: UXCzwRH7Sb+48DkQddNnzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="277165036"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:39:00 -0700
Date: Thu, 2 Jul 2026 13:38:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/msm: fix BO allocation tests to use
 explicit cache flags
Message-ID: <20260702113857.k3gtips4htkxrba4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org
References: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2026-07-02 at 14:43:50 +0530, Jitta Vignan wrote:
> Use explicit cache mode flags (MSM_BO_WC) instead of flags=0 in BO
> allocation tests to match current kernel requirements.
> 
> Also update bo-alloc-uncached to use a raw GEM_NEW ioctl so the
> deprecated MSM_BO_UNCACHED flag can be handled gracefully without
> triggering helper assertions. The test now accepts either successful
> allocation or EINVAL on kernels where the flag is no longer supported.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>

Both applied.

Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
[cut]
