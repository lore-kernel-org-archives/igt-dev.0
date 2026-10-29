Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C35606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ow1bieOJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0611234F;
	Thu, 29 Oct 2026 14:26:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30ED112345
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793283914; x=1824819914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4RRDvFhrH+AvMJLoTSaxZ3AAdPjWJau0V7h49DAgutA=;
 b=Ow1bieOJHuo66NFrTZCwATxBHpwvomjtyb2ygFZy3cYaRONyjewNMPqk
 8L5uXd8pl4TMXeHU+iIcUd8KrSpef3VkpbWVHDwWNEMmp1mD5sFtX3BJP
 /hssTRwkJ58YhYCeVdGK/3cuIKIF+MvumkP4SDILGEpvySLrSE8U1eRjF
 PZZajV/fXDYOTlDv5ly2ZIh3ZUgo3p+A8x7kg4yv8laAFDHd+5hE2e5EZ
 Whn63r2EhERNG2/OtcXGX0Z9r4BRlRfYvbA6NSN+tq0dyA09E8mKZfnhj
 wniZHGUW6IOsFP/kDDJ/X+AvuA1GIvqhPMRCA0U1lwMLPETzovskU8Mn+ A==;
X-CSE-ConnectionGUID: KKgEeT7vT9W3laV23LgVHQ==
X-CSE-MsgGUID: z8xx/smRRrq6Uig4OSp0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1934826"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1934826"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:25:13 -0700
X-CSE-ConnectionGUID: g300zpboTNO8zLg8mVTquQ==
X-CSE-MsgGUID: ChvB7Yq6Tmu/qGdU0FGHqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5121207"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 07:25:10 -0700
Date: Thu, 29 Oct 2026 15:25:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v6 02/10] lib/meson: Add libnl dependencies for DRM RAS
 support
Message-ID: <20261029142508.fhbr5w4jbgo27nlw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 igt-dev@lists.freedesktop.org, soham.purkait@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-3-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029085955.1232163-3-ravi.kishore.koppuravuri@intel.com>
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

Hi Ravi,
On 2026-10-29 at 14:29:47 +0530, Ravi Kishore Koppuravuri wrote:
> Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
> library support.
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> Reviewed-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/meson.build | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 911bf3550..b00353f92 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -147,6 +147,11 @@ lib_sources = [
>  	'vendor/uwildmat/uwildmat.c',
>  ]
>  
> +libnl = declare_dependency(dependencies : [
> +	dependency('libnl-3.0', required : true),
> +	dependency('libnl-genl-3.0', required : true),

Can we build this as optional? If we need it here you also
need to modify Dockerfiles and add to Cc developers outside
of Intel.

+cc Karthik and Swati


Regards,
Kamil

> +])
> +
>  lib_deps = [
>  	cairo,
>  	glib,
> @@ -154,6 +159,7 @@ lib_deps = [
>  	libdrm,
>  	libdw,
>  	libkmod,
> +        libnl,
>  	libpci,
>  	libudev,
>  	math,
> -- 
> 2.34.1
> 
