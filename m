Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11097E9B258
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B262E10E584;
	Tue, 24 Feb 2026 13:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McTj6Y+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0C010E589
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939217; x=1803475217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r7IG30XKdk81NXEtlY8vkK2fq2o+tQLkn8T5l46ykrw=;
 b=McTj6Y+4MOqeOTER08rkwObIkZTpDD2rqE7eMot4x238fK1k6RtCRskF
 UPsMxiURETAnNVD2yOkWYveguwa7e9+cBNDiZ8RNEelk5mKiwHfTecXga
 NsIE84DVQpfrq4N1RJE4HCOnmBv//KdXfsvNfz41Jcx0CrDlCmG4CrLHs
 Snwp9GsLH3lPaY6sY98fQDDlhQRMZwww10QVLFOidwhWFNuOjHn+h4BJE
 qvzsIhw+WEjKYYbG1+DRy06gtqEyBYktE0Gw/I9qWSYvxt4q0dxi02Xdk
 s0Ro+8w2FJexev/qSTiPUTNFdujkNp/bg3RasROh3XRnjEzNMAzoRIMAz Q==;
X-CSE-ConnectionGUID: Kx3nW2Z9TN644axdkqagvA==
X-CSE-MsgGUID: GvlfHiMTQjuVAeRBP52PgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73016015"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73016015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:20:16 -0800
X-CSE-ConnectionGUID: v6y6yuPHSNa743b38RHccA==
X-CSE-MsgGUID: iDDDFKgSR62uSPhgdZmAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215134962"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 05:20:15 -0800
Date: Tue, 24 Feb 2026 14:20:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 SR-IOV VF
Message-ID: <20260224132012.prlzw36las3j4uzk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260224112041.297334-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224112041.297334-2-nitin.r.gote@intel.com>
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

Hi Nitin,
On 2026-02-24 at 16:50:42 +0530, Nitin Gote wrote:
> The ctx-restore subtests use intel_register_read() via direct MMIO
> (PCI BAR) access to verify that the batch buffer wrote the expected
> register values. On SR-IOV Virtual Functions (VF), only a very limited
> subset of registers is accessible. Registers like 0x4F100 are not
> exposed to VFs, so the read always returns 0, causing a false test
> failure.
> 
> Skip all ctx-restore subtests (post-bb, mid-bb, and their invalid
> variants) when the device is running in SR-IOV VF mode.
> 

+cc Lukasz and Marcin

> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/intel/xe_configfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 0db4af201..ab55e333b 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -409,6 +409,7 @@ int igt_main()
>  
>  	igt_describe("Validate ctx_restore_post_bb with invalid options");
>  	igt_subtest("ctx-restore-post-bb-invalid") {
> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "post");
>  		close_configfs_group(configfs_fd, configfs_device_fd);
> @@ -416,6 +417,7 @@ int igt_main()
>  
>  	igt_describe("Validate ctx_restore_post_bb");
>  	igt_subtest("ctx-restore-post-bb") {
> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "post");
>  		close_configfs_group(configfs_fd, configfs_device_fd);
> @@ -423,6 +425,7 @@ int igt_main()
>  
>  	igt_describe("Validate ctx_restore_mid_bb with invalid options");
>  	igt_subtest("ctx-restore-mid-bb-invalid") {
> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore_invalid(configfs_device_fd, "mid");
>  		close_configfs_group(configfs_fd, configfs_device_fd);
> @@ -430,6 +433,7 @@ int igt_main()
>  
>  	igt_describe("Validate ctx_restore_mid_bb");
>  	igt_subtest("ctx-restore-mid-bb") {
> +		igt_require_f(!is_vf_device, "ctx-restore not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_ctx_restore(configfs_device_fd, "mid");
>  		close_configfs_group(configfs_fd, configfs_device_fd);
> -- 
> 2.50.1
> 
