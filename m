Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF3EEC047D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D3010E758;
	Tue,  3 Mar 2026 09:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjbdhmRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F50F10E0A5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772531194; x=1804067194;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iciXUjgqFocir9LGJngfEinNBFeBumMqNUpwy6RYBrY=;
 b=gjbdhmRJlOOyGqfCweOioBNyrRv+t7I3zffkNfkI88POV64+BiWIJu9f
 f0jUGq3cDN1Hlo8pNdTXKHecBEanecvaexcPA3kxUyNGXxGX6hkortlaV
 xTad1g2s35b+iSyFdGs4zJzENDBbzoAjBneOoOnYvmVNiOUbb0RT9dKmC
 K2Lif/Du+DjGsl6DbzqV4YQwIUX/vGBqpx5HQJKJtdbY8/gicEFs5HKzp
 D44J5DWZ+ILdHByvQAuF8b6HL9YXOBmvp7vQUaCC42zbxw1DpY9Tfe26d
 bloXMtQ96DgzlGJYYlYVtSGGtY6V7kC7IyiCg1Ql4d8YSl1EevosbABFG A==;
X-CSE-ConnectionGUID: nyLrGqQpRMegOZZL/yIYMQ==
X-CSE-MsgGUID: saS629/HRZ6MeRbo5N0N+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73625193"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73625193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:46:32 -0800
X-CSE-ConnectionGUID: 2RVGRIZERZSoOkwZnvlrQw==
X-CSE-MsgGUID: fkvD894oTh+4/KDE+kEb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="255831656"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.26])
 ([10.245.245.26])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:46:32 -0800
Message-ID: <34d574bb-9330-4145-bc30-d8d59f1667c4@intel.com>
Date: Tue, 3 Mar 2026 09:46:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/drm-uapi-experimental: Remove temporary
 NO_COMPRESSION experimental macros
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
References: <20260303065112.159575-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260303065112.159575-2-sanjay.kumar.yadav@intel.com>
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

On 03/03/2026 06:51, Sanjay Yadav wrote:
> Remove the temporary NO_COMPRESSION macros
> (DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION and
> DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT) from intel_drm_local.h.
> These macros are now part of upstream drm-next and provided through
> include/drm-uapi/xe_drm.h. They were originally added for early
> development and are no longer needed.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   include/drm-uapi-experimental/intel_drm_local.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index 9949d5350..b48c9e219 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,9 +20,6 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> -#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
> -#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> -
>   #if defined(__cplusplus)
>   }
>   #endif

