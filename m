Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4E4C5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 11:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2C010ECE7;
	Thu, 14 Mar 2024 11:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If3Ub/6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B36F10ECE7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710415474; x=1741951474;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I0IyaWHlNbYcJX97vcrA5yk7l4dkV3FRwzXWwL9hXPU=;
 b=If3Ub/6XE1MNU7lMLh2LkjzpiJEGdPltIffQ0if3hNIJlMfFG0Rti+uM
 1eZBhhTyrej+Lb7BFNmh1fXmr8xd3hID5uLtmiWC90Q0fMFIIp4ZyiHYI
 sAwhZ63O+qWSvxaZETAptS45LOG4P0GoE2cv00leKaq56s8n800xnkxDH
 tqCDF/GI7URomfQ00k8OhdLyHi/+JFQIzhxaPRsMIfbDeJ23rXwe564JR
 TJVQNbeQaBuY7HHQ8dhZ/16mEzPOpXCkZVfp2nqlHIr+9HmB2rBqbHrW6
 h1sebGWFzankRzvhr6J4PrJBzK86rrAUYSzeAvvRx3hjEJl44KKtyXEjp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5422645"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5422645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43296406"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.35.115])
 ([10.246.35.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:24:33 -0700
Message-ID: <9acb2321-0a14-4ab8-a3c9-c082ce381870@linux.intel.com>
Date: Thu, 14 Mar 2024 12:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/xe_spin: Fix MI_STORE_REGISTER_MEM instruction
 usage
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, igt-dev@lists.freedesktop.org
References: <20240314005852.2985628-1-matthew.d.roper@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240314005852.2985628-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 3/14/2024 1:58 AM, Matt Roper wrote:
> The MI_STORE_REGISTER_MEM macro in IGT's instruction header is the "old"
> version of this define, intended for use on pre-gen8 platforms since it
> bakes in the fixed 3-dword instruction length in the instruction header.
> For gen8 and beyond (i.e., every platform the Xe driver supports), the
> MI_STORE_REGISTER_MEM_GEN8 macro should be used instead, which properly
> bakes in the 4-dword instruction length.  Since the xe_spin library was
> using the old macro, but then manually |'ing in a "2" at the end of the
> expression, it was effectively winding up with a field value of 3 (which
> would represent a 5-dword instruction).
>
> Switch xe_spin to using the "GEN8" macro and drop the redundant "| 2"
> which is already handled by the macro itself.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/xe/xe_spin.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 2c531e85e..1ca54ea19 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -114,7 +114,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>   		spin->batch[b++] = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
>   
>   		/* Save delta for reading by COND_BBE */
> -		spin->batch[b++] = MI_STORE_REGISTER_MEM | MI_SRM_CS_MMIO | 2;
> +		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
>   		spin->batch[b++] = CS_GPR(NOW_TS);
>   		spin->batch[b++] = ticks_delta_addr;
>   		spin->batch[b++] = ticks_delta_addr >> 32;
