Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FCFCD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 15:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06B810E5DB;
	Wed, 13 May 2026 15:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMJqte+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65F110E5DB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778687325; x=1810223325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IpECcksSZnkKkCQLT/cdJkkaJvMf4UmvkEK7N6ZDfPs=;
 b=PMJqte+/ZgeHYQ4xGkkkXuy0Vln3tK9qw0K0qJfMxGZaYA4m8cDsEM4Y
 f3ep+g5e+1XEt8HOND03RGWokn9uGKFzUCaCud+K+jklxMZvpJTo+3ZQ5
 BC9uaAiDL8okPJzPYv+ifBXx0XjFHeuhM4bqN6Zm0U7be03yjhxjh5v5A
 JVnNwnEmyr0oaX/q33vyhpYRxO/2b4Qjx0IOtmmtP3CFxp9Bnfm77EYeq
 jSExVT3azk8h35WWk2irnHX9IA3SE5nMBaWS2m2XQ+qt9+iWVLur43rja
 rr5nzPWjJ7kI9f9CmM9PTk5hRn4Pfdp5ek7z2EybbyxTDYoQIMDH4Z9yn Q==;
X-CSE-ConnectionGUID: DGgkE4nGTXmS/1vaYjzQTg==
X-CSE-MsgGUID: rn8K0s9zQSOvequTKrDk7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79733493"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79733493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 08:48:44 -0700
X-CSE-ConnectionGUID: yePCc+h1TkmVPBbeA019yA==
X-CSE-MsgGUID: 1foLWovHRbqx2V2sbg7ztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="235442392"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 08:48:43 -0700
Date: Wed, 13 May 2026 17:48:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/4] includes: Remove DRM_XE_VM_BIND_FLAG_DECOMPRESS
Message-ID: <20260513154828.aglnscw5uxnglsj5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org
References: <20260505194419.500600-5-dev@lankhorst.se>
 <20260505194419.500600-6-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505194419.500600-6-dev@lankhorst.se>
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

Hi Maarten,
On 2026-05-05 at 21:44:21 +0200, Maarten Lankhorst wrote:
> This is already defined in xe_drm.h too.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  include/drm-uapi-experimental/intel_drm_local.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
> index 10cc011f7f..b48c9e2195 100644
> --- a/include/drm-uapi-experimental/intel_drm_local.h
> +++ b/include/drm-uapi-experimental/intel_drm_local.h
> @@ -20,8 +20,6 @@ extern "C" {
>   * clean these up when kernel uapi headers are sync'd.
>   */
>  
> -#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 7)
> -
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.53.0
> 
