Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67565C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9AE10E59B;
	Mon, 13 Jul 2026 09:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBtk08NG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF0E10E59B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783936474; x=1815472474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IrBbjGHm3PgxxyQDL6Gffs9xbAMa2ug8zyfvXlYmHu8=;
 b=PBtk08NGm9pcSeFNHxzXGp1Y3LWTKDisK7PLOftFCE3eaRE35lR6kcqS
 IsopKkF/VgpEiUhFrZS+jUXwUz82PBWA6HcF1VVB4meRlFkyAzvTy0zeB
 4PJppIgN4pDl203DNewdPSKlzwEuTivGzXI6Cmqn8eNJuwaWllNyi+NQu
 Q6aCRLlGxhvF/nT1aGk4x+oCMDYipwqEKqzpDqoiUO0gZn4Z4scOHkdpx
 8vo6BR9UlnQSdvffWfCtd3uzrBBJxRrYynRalCa9mGunnTMm6AoP/hcnh
 FNNbmtd94C/LXTHBdzsBoQh0SxIQCB5JaTZrb6PZmSBQaJzWPP8Sw1mln w==;
X-CSE-ConnectionGUID: nKorRoKySoaSrqTQS0/DCA==
X-CSE-MsgGUID: uKHiXe14RoKGBRrutpHo5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84420174"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84420174"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:54:33 -0700
X-CSE-ConnectionGUID: SgcRKRPeQGCNSk+iwqVY1Q==
X-CSE-MsgGUID: P4xs2RwVRBSuSoZjgHqxKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259091463"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:54:31 -0700
Date: Mon, 13 Jul 2026 11:54:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH 2/2] Add xe_survivability to xe-fast-feedback
Message-ID: <20260713095428.3yfuoyazcpqg7i7e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-6-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709070905.405108-6-sk.anirban@intel.com>
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

Hi Sk,
On 2026-07-09 at 12:39:08 +0530, Sk Anirban wrote:

add description.

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Please look into Xe.CI.BAT failure, it seems you also need
a separate patch for intel-ci with adding this to blocklists.

Regards,
Kamil

> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index 64587cce1..716c7c5d7 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -223,6 +223,7 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
>  igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
>  igt@xe_sysfs_scheduler@job_timeout_ms-invalid
>  igt@xe_sysfs_scheduler@job_timeout_ms-min-max
> +igt@xe_survivability@runtime-survivability
>  #igt@xe_vm@bind-once
>  #igt@xe_vm@scratch
>  igt@xe_vm@shared-pte-page
> -- 
> 2.43.0
> 
