Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE7EB363E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B55710E0FD;
	Wed,  4 Mar 2026 12:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwvCw1Mg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996D310E0FD
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772628275; x=1804164275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8zsMZztNILCOvS5BHW45avcBH145F0fF4FaEenWijMw=;
 b=cwvCw1MgJG+bEGyItHcLsEwipwcPuSETEE8MPJjmYKS2kgfo8RGIPtWr
 B8q05PxAiyN7++ObQxmlSZYTRRU7TwQvhRZ91ur+zWyItVaJ1b8KWZfy4
 ehVOHXrNwBCCRMU2lyqtBmtstYKhkO/rczq43M8cXgGcTSLJ+18Wp4tls
 r57ID+mNjgk9aBhixUsml3mvqEGFD528cQM9KeaNYcqKl+1wMqPCVSrfl
 A1Bk3txZ1/bawNK0Rld5l5Lt/NH8HK+ISJEbf4TWnYpDSUBpfGjoHQvaS
 TIj6QLefGtFRqa2c4AaH9FbDuIG8ka3Dci0xWd5/KSOBnmTIM4pKUb/EQ g==;
X-CSE-ConnectionGUID: zH7q1ABZRv292zqITvJlaw==
X-CSE-MsgGUID: GTr6du6+R6q4P/YDZ1xYsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77291611"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77291611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:44:34 -0800
X-CSE-ConnectionGUID: 8/dxd+UYRSScqULphthZIQ==
X-CSE-MsgGUID: FzwKc0hkR5+bu58Cc+QroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="248804213"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 04:44:32 -0800
Date: Wed, 4 Mar 2026 13:44:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH v2 i-g-t 1/2] drm-uapi/xe: Add support for No Overcommit
 flag
Message-ID: <20260304124430.k624ttshquohrr6h@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260302140010.1009564-1-sobin.thomas@intel.com>
 <20260302140010.1009564-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302140010.1009564-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-03-02 at 14:00:09 +0000, Sobin Thomas wrote:
> Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
> disallow VM overcommit in fault mode"). This adds support for the No
> Overcommit flag in IGT to match the kernel UAPI behavior.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..12a9da045 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -983,6 +983,8 @@ struct drm_xe_vm_create {
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
> +
>  	/** @flags: Flags */

As Nishit said, you should in drm-tip checkout into that commit, do

make INSTALL_HDR_PATH=~/tmp/ headers_install

and then
cp ~/tmp/include/drm/xe_drm.h include/drm-uapi/

There are a little more changes than that, so also please mension
them with additional commit hash and name.

Regards,
Kamil

>  	__u32 flags;
>  
> -- 
> 2.52.0
> 
