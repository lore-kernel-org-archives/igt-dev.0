Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2855C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 15:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6004D10E075;
	Thu,  9 Jul 2026 15:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/QVmPRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BAE10E075
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783609814; x=1815145814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UML/h2nk2LGM+T4ez7yT6b7hLm/CderV77P/q5oRZlY=;
 b=f/QVmPRCqv+Jf+DVZZa5S0OK1oEpxy63vmT8mXXYvH80GPT6bj2de685
 F+bdJ60uaLJyeyvpIenj9etFfYqtHwfLwBchRUkFUpBpaNKzG9Wu2U5A6
 P9REy6v8uR8uoev03s3PSgivOlBsPXCZAm8bDBBZMxXCpSrw+AoXxeOVC
 1UZ68wbXw25WRrUu57uvjr6ApCnBz4Macx7gMyiyg18MZBb/TxpLzyOEq
 RaHuToslmieaO2I0aOculuIX4031QTnLf0/dZHQj26z2uswjTxDeuFUrG
 1P155szgwaXSbjb9rUSir1clFzC40qpcWyKTPoro6XxSD95C9ywT3a6g4 w==;
X-CSE-ConnectionGUID: 7ngRsISdQMiByQEDQBPckQ==
X-CSE-MsgGUID: Ha05q9QMTLCdpfmmO/YMIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84313205"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84313205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 08:10:13 -0700
X-CSE-ConnectionGUID: Jq6YwFzEQ3uHCyFgm3hCYg==
X-CSE-MsgGUID: wzczJLVtRqO5+vSXoYOI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253515125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:10:12 -0700
Date: Thu, 9 Jul 2026 17:10:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sk Anirban <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH 2/2] Add xe_survivability to xe-fast-feedback
Message-ID: <20260709151009.blxvnv5wmitmzap3@kamilkon-DESK.igk.intel.com>
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

Add description. Also add prefix intel-ci: in subject:

[PATCH 2/2] intel-ci: Add xe_survivability to xe-fast-feedback

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
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

Place this in alphabetical order, before 'sys'.

Regards,
Kamil


>  #igt@xe_vm@bind-once
>  #igt@xe_vm@scratch
>  igt@xe_vm@shared-pte-page
> -- 
> 2.43.0
> 
