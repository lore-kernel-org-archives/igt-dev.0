Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B409C25B79
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 13:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6FC10E2C8;
	Mon, 27 May 2024 13:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNo52azR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E036C10E233
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716818142; x=1748354142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NByH7w+HbrcAEngXHI3wjQb60yg/cCd6u3PtiI4jhfk=;
 b=gNo52azROWIld+bUZiNMRTrRxmwmPm77mppLw4Nhols8MqTmuaRL9X81
 XU44gObulUi9DruPhU4kbUOCm8IA5EgJ4mC7+L7HVZpSZB048cidLRZtI
 IS6myNw2iVbahhUh1ntchXuC1Oz5h/wmqds5YbPDsoV3FEyVQsUF7JB97
 +lqHkgV7M3o8diz7WOYbwwLWx6VmWt3GEBZwWZeDOoPLCaolDq4btivCW
 krn6Ahq5NA1SjdMko88/k1aPrVMbDkB7KfPvA+68xNETV/tyNg2PZ37Co
 FByQPlbUm7fC/ua891dCcJu+ANTLmfbAF7XhNPsyK7pz6glEWVK0iiT+5 g==;
X-CSE-ConnectionGUID: ZE11YFC1QR2i+RavpnpuzA==
X-CSE-MsgGUID: 1DpJrIQfRnaleqe5uwmA6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16972057"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16972057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:55:41 -0700
X-CSE-ConnectionGUID: nN7tzaZORIynG1fe54f5cg==
X-CSE-MsgGUID: EL2SIATkQeWGPzpmu1Ap/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39564797"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 06:55:40 -0700
Date: Mon, 27 May 2024 15:55:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Unload module if
 loaded with modparams
Message-ID: <20240527135524.g2ghkj4srxiso6yb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240527131127.2860097-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240527131127.2860097-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-05-27 at 18:41:27 +0530, Bhanuprakash Modem wrote:
> Subtests should unload the module themselves if they use modparams,
> otherwise consequent subtests amy misbehave.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_module_load.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
> index 83f7df341..0856a57c8 100644
> --- a/tests/intel/xe_module_load.c
> +++ b/tests/intel/xe_module_load.c
> @@ -140,11 +140,13 @@ igt_main
>  		}
>  
>  		load_and_check_xe("force_probe=*");
> +		igt_xe_driver_unload();
>  	}
>  
>  	igt_subtest("reload-no-display") {
>  		igt_xe_driver_unload();
>  		load_and_check_xe("enable_display=0");
> +		igt_xe_driver_unload();
>  	}
>  
>  	igt_subtest("many-reload") {
> -- 
> 2.43.2
> 
