Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF5FC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 13:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB88310E984;
	Thu,  6 Mar 2025 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFitXUgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3FF10E984
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741269065; x=1772805065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0cxYu4m+QMHEv2YWWH5PSdbnJPBKnFlW3XeiBzmUFSk=;
 b=iFitXUgptVb98zE00g7X+btMcxKBNYoO17mS2y4KgVpVuDNOvhpbGTRZ
 yi7iLYy/2lXxhOw+I32Biyv+idChI3jRox7m85MeCc05Nt9vObjm/HWxT
 HRJ/L54Oi++WqxO2sthLJjFWfZnyisLNMyzVBEyvrcVknjN8s0UnyWJHw
 BfAESe/MkV8dUXRrEcCeINr80hQO8sFV0Ws9/V7c0aIVwCnUyhjIzgUPJ
 zUiWDx8Pc0bbJ3I9obVrN0RXgU6uoCnGMLbPcmiAe25TT23o39Fz7Xh1g
 WmKwavokwte6Zu/whCLoqT2PLEI0qwsiJ8zTDQTWFNd3NLqJ5eiP8Jog1 A==;
X-CSE-ConnectionGUID: WaghfBXwSjaX1C3yFA/Kog==
X-CSE-MsgGUID: Iiwpq+rGR6SAyNK//IHUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41452414"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41452414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:51:05 -0800
X-CSE-ConnectionGUID: PBKoPQoKR5ypDcnrf7C3aw==
X-CSE-MsgGUID: V1iHpKJSSbeG1A5//TnJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156243301"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 05:51:03 -0800
Date: Thu, 6 Mar 2025 14:51:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
References: <20250306112754.1483363-1-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306112754.1483363-1-soham.purkait@intel.com>
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

Hi Soham,
On 2025-03-06 at 16:57:54 +0530, Soham Purkait wrote:

add prefix 'tools/intel_pm_rpm:' in subject, so it will be:

[PATCH i-g-t v1] tools/intel_pm_rpm: Add support for Xe driver

> Add support for runtime power management
> for Xe driver.
> 

Add here your s-o-b:

Soham Purkait <soham.purkait@intel.com>

Please use checkpatch.pl for some obvious corrections like this,
you can find this script in Linux kernel sources, also read
CONTRIBUTING.md in i-g-t sources for some options for checkpatch.

> ---
>  tools/intel_pm_rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..945247d2e 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
>  			goto exit;
>  		}
>  	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) && !igt_device_find_first_xe_discrete_card(&card)) {

Split this line:
		if (!igt_device_find_first_i915_discrete_card(&card) &&
		    !igt_device_find_first_xe_discrete_card(&card)) {

Btw should we also add support for other cards in multi-GPU
case? If yes this is some more work for another patch.

Regards,
Kamil

>  			igt_warn("No discrete gpu found\n");
>  			ret = EXIT_FAILURE;
>  			goto exit;
> -- 
> 2.34.1
> 
