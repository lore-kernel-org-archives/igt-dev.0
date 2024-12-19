Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D678E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 05:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594510E046;
	Thu, 19 Dec 2024 05:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9Ba8Zpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2592510E046
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 05:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734585598; x=1766121598;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1z/zFYmv1HAmTCZMndSryizP2v3FN9FgNg0LojaFXOk=;
 b=Z9Ba8Zpg30PhOyuc/lbVbnzn3sa37z2fzBk+cMlFmeekicSrgUEFC97h
 imC32JKWN1oDshgp13HpNzMUh96YoXPuq8QGr5Osi9GBpsq55uOmszAuk
 M2mX5HDr7j708BHR3yWf2P43/i8rN6WIMTIlVx6u90rrVCtE1+QmaWOT0
 OTr9LPMOpBGzDIaJnUMg9NrafDk/gkK2iHyCTcbyv59cxC7X40qh53bpc
 0yj06GsE2N33Zb/GucIHrw60/DWIiaLdstltyxt9pxn7QdeiFN2AuaiRb
 KfaRVE7WFLQGd6BDr7mdmtCEihwpfpaEndo3optZG85GfZxsKPcQB/+3m g==;
X-CSE-ConnectionGUID: NkUBfx6jS6WPmb8mw4n8uA==
X-CSE-MsgGUID: NZvDyj3ZTbmnYSR13PFUWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38865015"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="38865015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 21:19:58 -0800
X-CSE-ConnectionGUID: 3qbJJEGATsOzCkDXn++95A==
X-CSE-MsgGUID: 68AOFZZkTpSR/2u259KNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="98143777"
Received: from gkelly-mobl.ger.corp.intel.com (HELO [10.213.202.21])
 ([10.213.202.21])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 21:19:57 -0800
Message-ID: <abfbfa54-b8ea-4453-9bfb-00498978bba0@linux.intel.com>
Date: Thu, 19 Dec 2024 06:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20241219035609.680347-1-pravalika.gurram@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241219035609.680347-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 19.12.2024 04:56, Pravalika Gurram wrote:
> Read and dump  below debugfs entries.
> ggtt
> register-save-restore
> workarounds
> default_lrc_rcs
> default_lrc_ccs
> default_lrc_bcs
> default_lrc_vcs
> default_lrc_vecs
> hwconfig
> 
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 50 ++++++++++++----------------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 700575031..a31de41a4 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -162,6 +162,16 @@ test_gt(int fd, int gt_id)
>  		"pat",
>  		"mocs",
>  //		"force_reset"
> +		"ggtt",
> +		"register-save-restore",
> +		"workarounds",
> +		"default_lrc_rcs",
> +		"default_lrc_ccs",
> +		"default_lrc_bcs",
> +		"default_lrc_vcs",
> +		"default_lrc_vecs",
> +		"hwconfig"
> +
>  	};
>  	static const char * const expected_files_uc[] = {
>  		"huc_info",
> @@ -170,41 +180,11 @@ test_gt(int fd, int gt_id)
>  //		"guc_ct_selftest"
>  	};
>  
> -	sprintf(name, "gt%d/hw_engines", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/sa_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/steering", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/topology", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/pat", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/mocs", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/uc/guc_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/uc/huc_info", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> -
> -	sprintf(name, "gt%d/uc/guc_log", gt_id);
> -	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> -	igt_debugfs_dump(fd, name);
> +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +		igt_debugfs_dump(fd, name);
> +	}
>  
>  	sprintf(name, "/gt%d", gt_id);
>  	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));

