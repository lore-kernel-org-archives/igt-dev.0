Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67407C3601A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 17:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215DE10E248;
	Thu,  3 Apr 2025 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxjaNhnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD6D10E248
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743699616; x=1775235616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QfrXqZgWLUFq9j6QSy2A55nRo24skSPjh3HeXxKsXgY=;
 b=hxjaNhnl12ckeuhqwJjyu2sjtjro2Lex3AwCxIppMEADN4RjMFKO7Y7I
 s2TyvqKNNeofaGOg+w6HgvxdDPCAorkZ9t0z+PpwWcCP64k2JSMKzVP0d
 uASO2lV8cSQTkAlLLfVH6eSBorT+wZhVCARPrbwF2BxAj/jtPB5h5FsJC
 SV9fyQaKPiDfu9wIodQrMca3+AyqbqY1L6gd+uonAlhm7mkyFzoJl660v
 rdjS4N8dslw0GRIOGfF8Bc8pDqcOH020juOQogG5ihr7VMAI4IISrqfks
 ToANAOCkiXHHZgM18D50JhaYhSGx2GrHCrWm4/RYiIzMH2WPHq+sTYGCL w==;
X-CSE-ConnectionGUID: WIxKouORR5+vpesTLTVXGg==
X-CSE-MsgGUID: eS4+wbX6S1OdTxu9r8o4BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45137010"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="45137010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:00:16 -0700
X-CSE-ConnectionGUID: NB9VSP3ERCC6kUldxVTPsQ==
X-CSE-MsgGUID: hfsvA6ljQhKiIxjwhhAN/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127024311"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 10:00:14 -0700
Date: Thu, 3 Apr 2025 18:59:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v5 1/4] lib/ioctl_wrappers: let the caller handle
 capability check result
Message-ID: <20250403165955.vyrhuelgpksicd2b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
 <20250402022922.210495-2-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402022922.210495-2-andrealmeid@igalia.com>
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

Hi André,
On 2025-04-01 at 23:29:19 -0300, André Almeida wrote:
> From: Melissa Wen <mwen@igalia.com>
> 
> Rework igt_has_drm_cap to just check if a DRM capability is supported
> and let the called decide what to do from this check. It prevents the
> test fails because of an assert done when it's called in
> igt_subtest_with_dynamics.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  lib/ioctl_wrappers.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 146973f0d..15eeb9aa4 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1292,10 +1292,10 @@ int __kms_addfb(int fd, uint32_t handle,
>   */
>  bool igt_has_drm_cap(int fd, uint64_t capability)
>  {
> -	struct drm_get_cap cap = { .capability = capability };
> -
> -	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
> -	return cap.value;
> +	uint64_t value;
> +	if (drmGetCap(fd, capability, &value))
> +		return false;
> +	return value ? true : false;

So this will mix an error, for example due to bad fd, with the
capability not available. Why not writing this into new function?
Like:

/* description here */
int __igt_has_drm_cap(int fd, uint64_t capability)
{
	struct drm_get_cap cap = { .capability = capability };
	uint64_t value = 0;

	if (drmGetCap(fd, capability, &value))
		return -errno;

	return value ? 1 : 0;
}

or you could just fills caps:

/* description here */
int __igt_get_drm_cap(int fd, uint64_t cap_query, uint64_t &cap_value)
{
	....

	if (drmGetCap(fd, cap_query, &cap_value))
		return -errno;

	return 0;
}

Regards,
Kamil

>  
>  /**
> -- 
> 2.49.0
> 
