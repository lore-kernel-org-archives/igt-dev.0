Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A86CD1292
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A707910EB17;
	Thu, 11 Apr 2024 11:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKa0BDB3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CFA10F01A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834874; x=1744370874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hyKi9psCWHpCS11MBzQJRDVFzZPfhiMJe/DbQ98935M=;
 b=JKa0BDB3CNtlniOrWGg3ykueTSc3P1px3JTzHzJTERs1SRhstd8SeKbP
 AGXe7XSrbyGOcbkGn7eaMpXTlRHVEFumVpRtcZa1jtqQxWF/w9jRp1rtZ
 rMd9sYEj8RaO/4yFUK5N6+6hfVC5dAYd+S2+38NEIeH7UrdFCGPUswrNs
 g+61aLRkFl6c/vk6JIjJwjIw8fM0CiGtFog8s1mByfaVS25hTskaU97Qr
 Sfx2NNqehp+GKRUaIkmYcyYcqy2i6REC4GKWPXZBnyDcPBHrl9kGe+esV
 YBlMDN1OdUx1MAF1lA1CyGAZaBJ6+4VQT+GgcaB3PKeyEVvXa2JBRx8VS g==;
X-CSE-ConnectionGUID: ieKr12/RRhKm+/nBKHH3vw==
X-CSE-MsgGUID: ylXYNoqBQsKb0hFbgTVgQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18946750"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18946750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:27:47 -0700
X-CSE-ConnectionGUID: NtzxnbvXRIK1DRXi7wsBLQ==
X-CSE-MsgGUID: 0V2bpNGtQsuw88a0SeqIvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20876887"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 04:27:45 -0700
Date: Thu, 11 Apr 2024 13:27:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nakshtra.goyal@intel.com, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, himal.prasad.ghimiray@intel.com,
 priyanka.dandamudi@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 i-g-t] tests/intel/xe_sysfs_defaults: Validate for all
 default values
Message-ID: <20240411112727.gfad7txxxprd7gzy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, nakshtra.goyal@intel.com,
 ramadevi.gandi@intel.com, janga.rahul.kumar@intel.com,
 himal.prasad.ghimiray@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@intel.com
References: <20240410184330.3897514-1-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410184330.3897514-1-nakshtra.goyal@intel.com>
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

Hi Nakshtra,

On 2024-04-11 at 00:13:30 +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Change in igt_assert_f function parameters so that it also validate for
> property value equals to 0.
> 
> v2: use uint64_t for property_value,use bool __igt_sysfs_get_u64 in
> igt_assert_f(Kamil)
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_sysfs_defaults.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> index 4a6b3ba6d..d38a75e55 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -28,7 +28,7 @@
>  static void test_defaults(int xe, int engine, const char **property)
>  {
>  	struct dirent *de;
> -	int property_value;
> +	uint64_t property_value;
>  	int defaults;
>  	DIR *dir;
>  
> @@ -42,7 +42,7 @@ static void test_defaults(int xe, int engine, const char **property)
>  
>  		igt_debug("Checking attr '%s'\n", de->d_name);
>  
> -		igt_assert_f(property_value = igt_sysfs_get_u64(defaults, de->d_name),
> +		igt_assert_f(__igt_sysfs_get_u64(defaults, de->d_name, &property_value),
>  			     "Default value %s is not present!\n", de->d_name);
>  
>  		igt_debug("Default property:%s, value:%d\n", de->d_name, property_value);
> -- 
> 2.34.1
> 
