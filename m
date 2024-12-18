Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F8AE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B26310EB03;
	Wed, 18 Dec 2024 08:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3b/tn7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047A10EB03
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734512185; x=1766048185;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4FzE/vSxdq9C6C8dMx3DBMnWZG820cn8ULqGJKrevYs=;
 b=g3b/tn7vAflt4epkPPNzdGL7SP7rzEB+gs5lByYOGJZlMuLSVCUkObj0
 LVzTO2yi1WWCchdkQ72JzyDI7ThiRxCa03ZWFfiGiUVaTFOULQvm4m48n
 Ih1XP5ONbczdkaYXnwhBwuWzhhZh+FPMA4g79/IwyIH4PXB0przLQIXK4
 sEO8bMB0Hffwkhak8yUXVA58Dn9/4WUAt+PPpl81NVDNpSkoJwQuWCL9d
 PKi/sXxsKS7Fpvw2/lN0cX3dp/620jTsk17GLA9AlQmy2OCuNsBRGC6vu
 w08xIX2lnS6+bQ7olto/YJ2f+/Yp6tg+GPWgls/gE+dVLY99ZyhjJG2BY w==;
X-CSE-ConnectionGUID: ynp5hYByTOeWF3eNzFpWIQ==
X-CSE-MsgGUID: 2ojAHGO4Twqo6rL/EdYOZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="60365071"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="60365071"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:56:25 -0800
X-CSE-ConnectionGUID: 92jghLj4RWaj9DiELg4zxw==
X-CSE-MsgGUID: vDoYokVwRAutv/ofaurtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="128605617"
Received: from sshkruni-mobl2.ger.corp.intel.com (HELO [10.213.202.48])
 ([10.213.202.48])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:56:25 -0800
Message-ID: <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
Date: Wed, 18 Dec 2024 09:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241217135659.673564-1-pravalika.gurram@intel.com>
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

Hi Pravalika,

Please see my comment below.

On 17.12.2024 14:56, Pravalika Gurram wrote:
> Read and dump  below debugfs entries.
> ggtt
> register-save-restore
> workarounds
> default_lrc_rcs
> default_lrc_ccs
> default_lrc_bcs
> default_lrc_vcs
> default_lrc_vecs
> hwconfig"
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_debugfs.c | 46 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 700575031..bcbb5036a 100644
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
> @@ -194,6 +204,42 @@ test_gt(int fd, int gt_id)
>  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>  	igt_debugfs_dump(fd, name);
>  
> +	sprintf(name, "gt%d/ggtt", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/register-save-restore", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/workarounds", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_rcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_ccs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_bcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_vecs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/default_lrc_vcs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +
> +	sprintf(name, "gt%d/hwconfig", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
> +

Would something like the following work and clean up the code a bit?

	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
		igt_debugfs_dump(fd, name);
	}
