Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA36606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRu8k9tH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF2010E051;
	Tue, 10 Nov 2026 11:31:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A96910E051
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794310227; x=1825846227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iNg0SgxSyTI8YRhEWX6p5a6tnfLpuODNWTgpHrpKi5E=;
 b=IRu8k9tHBGyMI7w0WOiaDo8OZC3GeiO8Y3Gms5brmdLzATTHcktDvtPD
 QE8hkIELdM2FW0irli9fVX4WM0gIAsIsVP+0nKhcuHN81yW7hsWgM1b7b
 w/3d8Kyj94XEmpTR2NITU1wUGrrYEes8Nq86SMhj3qohZWd0AA+p//JDo
 qO5+/toRqsDnCcohCdHHYMcGv4sQ8LAIbAyKW53Vfv4zAOspxtcRdfmOA
 SXnTIRMXJE/Usnq7kHVddDCKHYWBAViXCDVQU6WtpY/ZKqWO3w4aEEISG
 2NxboKEMqTOE7vJ3+3MCzHbr8W1CiSizA8860WEnwDyxEat0HRqoOvyq3 w==;
X-CSE-ConnectionGUID: 9otU8go5TSi0S9hAcUPoYQ==
X-CSE-MsgGUID: DdyTlOpbRh+xMurqybrKfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3067826"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3067826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:30:27 -0800
X-CSE-ConnectionGUID: 6FKaw/DAQdSjEHoSPPkC6w==
X-CSE-MsgGUID: Y1iTk1ODR9qJY4D27MG95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7999051"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:30:24 -0800
Date: Tue, 10 Nov 2026 12:30:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com, 
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com, 
 raag.jadav@intel.com, soham.purkait@intel.com, mallesh.koujalagi@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH] intel-ci: Block cold-reset-wedged test
Message-ID: <s7qlxrpwjdjolb722c6l322sjqfxg7ww63h47tatpfpksl2yze@iw7hh5yns6ft>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Sk Anirban <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, 
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com, 
 raag.jadav@intel.com, soham.purkait@intel.com, mallesh.koujalagi@intel.com, 
 kamil.konieczny@intel.com
References: <20261110104115.1734778-2-sk.anirban@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110104115.1734778-2-sk.anirban@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sk,
On 2026-11-10 at 16:11:16 +0530, Sk Anirban wrote:
> cold-reset-wedged is only supported on CRI, so block it on the other
> xe platforms.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 2 ++
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 2 ++
>  4 files changed, 8 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
> index f83b544cb..e7b57558b 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -78,3 +78,5 @@ igt@xe_pm@d3hot-i2c
>  ##################################################################
>  igt@.*multi.queue.*
>  ##################################################################
> +igt@xe_wedged@cold-reset-wedged
> +##################################################################
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index 88115ec22..970c88932 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -106,3 +106,5 @@ igt@xe_pm@d3hot-i2c
>  ##################################################################
>  igt@.*multi.queue.*
>  ##################################################################
> +igt@xe_wedged@cold-reset-wedged
> +##################################################################
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..b960c15cc 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,5 @@ igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
>  ##################################################################
> +igt@xe_wedged@cold-reset-wedged
> +##################################################################
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index 9716e6071..e2284bdfe 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -86,3 +86,5 @@ igt@.*survivability.*
>  ##################################################################
>  igt@.*multi.queue.*
>  ##################################################################
> +igt@xe_wedged@cold-reset-wedged
> +##################################################################
> -- 
> 2.43.0
> 
