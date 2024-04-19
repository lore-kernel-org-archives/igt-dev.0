Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6DC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 13:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4410E18E;
	Fri, 19 Apr 2024 13:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcsHygz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB8810E18E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713532512; x=1745068512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e4ATLl1+uNqPv7yUje17khhipncQ5mRB/OUXpq8kBgg=;
 b=fcsHygz4cenx07UNKUCif2lyAt6iwO+xLvy1GsdWcfdQXVchr33JGZP8
 2BtKpAe1JR55bksSKv9+YSL6ZrPrs2PTlih8f+Qb5Iq/D4F/I8Kys97ib
 JopeteW6vWDiEor/XFUb1nCxC6fNndkqWR34ghM/Ox2Zmu1x7iPiVuK1t
 N99CaTx4UbbIPdKHE9jnihSBoo1o74Ah5n5ctdCWT4euU8xEgDlC9StHP
 K5go+SXf8QOZuFbXx2rv2tvDyH6ayBshO1qB17yu1JD61YjcGF3MZPMwu
 wwC7pqS5yGrlQfth/z3HNXvMnwRmuvfSf2Rr/rpwdl9XAKp/HK5GUFs4I w==;
X-CSE-ConnectionGUID: 3t/yHHU8STSW2loiKNIkhQ==
X-CSE-MsgGUID: xw74O96UTkWWwZeagHJ1rQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26644865"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26644865"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:15:12 -0700
X-CSE-ConnectionGUID: onBirQPKT7+sp28xKsJOUg==
X-CSE-MsgGUID: y/yz/v3KR8qkqoUU9lw60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="60777426"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 06:15:10 -0700
Date: Fri, 19 Apr 2024 15:14:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <20240419131452.syac5sjam7ramkt4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240417145049.7-1-francois.dugast@intel.com>
 <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
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

Hi,
On 2024-04-17 at 11:07:54 -0500, Lucas De Marchi wrote:
> On Wed, Apr 17, 2024 at 02:50:45PM GMT, Francois Dugast wrote:
> > Align the XeKMD header with the current version and add the L3 bank mask
> > topology query proposed in this KMD series:
> > https://patchwork.freedesktop.org/series/132075/
> > 
> > This series first includes some patches to align the XeKMD header which
> > have already been reviewed but not yet applied, from this other series:
> > https://patchwork.freedesktop.org/series/131816
> > 
> > Francois Dugast (4):
> >  drm-uapi/xe: Align header with drm-xe-next
> >  drm-uapi/xe: Define topology types as indexes rather than masks
> >  drm-uapi/xe: Expose the L3 bank mask
> 
> no, I don't think we want to merge these as is in this series. It can be
> used for premerge testing, but this is just reintroducing the same
> problem fixed in patch 1.
> 
> I applied patch 1 locally and then did a diff with the current
> drm-xe-next:
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 4353595a4..0b709b374 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
>         /** @gt_id: GT ID the mask is associated with */
>         __u16 gt_id;
> 
> -#define DRM_XE_TOPO_DSS_GEOMETRY       (1 << 0)
> -#define DRM_XE_TOPO_DSS_COMPUTE                (1 << 1)
> -#define DRM_XE_TOPO_EU_PER_DSS         (1 << 2)
> +#define DRM_XE_TOPO_DSS_GEOMETRY       1
> +#define DRM_XE_TOPO_DSS_COMPUTE                2
> +#define DRM_XE_TOPO_EU_PER_DSS         4
>         /** @type: type of mask */
>         __u16 type;
> 
> @@ -871,10 +871,12 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> + *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
> + *    to ensure write protection
> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
>   *    MAP operation immediately rather than deferring the MAP to the page
> - *    fault handler.
> + *    fault handler. This is implied on a non-faulting VM as there is no
> + *    fault handler to defer to.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -1085,19 +1087,6 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT    2
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT           4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER           5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY            6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY       7
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_128K                                0
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_2M                          1
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_16M                         2
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_64M                         3
> 
>         /** @extensions: Pointer to the first extension struct, if any */
> 
> I seems we don't need patch 1 and 2. We only need the commit used to be
> closer to drm-xe-next.
> 
> include/drm-uapi/xe_drm.h should always and only be updated by copying
> from kernel from specific commits documented in the commit message.
> 
> WIP changes while the kernel side is not merged should be moved to
> another header. Traditionally we used LOCAL_* defines for that. But that
> comes with its own problems as it's more work to  go find them all and
> drop when we sync the headers.
> 
> What about doing this?
> 
> Add include/drm-uapi/local/ to -I in build system *before* the non-local
> one. Something like:

We already have similar solution for i915, located in
./lib/i915/i915_drm_local.h

imho we could have it here: ./lib/xe/xe_drm_local.h

Regards,
Kamil

> 
> meson.build:
> 	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> 
> Example content for
> include/drm-uapi/local/drm_xe.h:
> 	#pragma once
> 	#include_next <xe_drm.h>
> 
> 	/*
> 	 * Local definitions - delta with WIP UAPI while the upstream defines
> 	 * are not yet merged. These are supposed to conflict whenever the
> 	 * upstream header is updated and break the build. That is intended.
> 	 * Commit updating the upstream header should garbage collect these
> 	 * local definitions.
> 	 */
> 
> 	#ifdef DRM_XE_TOPO_L3_BANK
> 	#error "Already defined by upstream - remove"
> 	#define DRM_XE_TOPO_L3_BANK		3
> 	#endif
> 
> The ifdef + error could be optional as it's harmless (and allowed by
> compiler) to redefine it multiple times to the same value.
> 
> Thoughts?
> 
> If we don't want to decide on this and you only want to unblock this
> test for the kernel addition, then maybe just do the same LOCAL_
> approach currently being used. See e.g. lib/i915/i915_drm_local.h
> 
> Lucas De Marchi
> 
> >  lib/xe/xe_query: Add L3 bank mask test
> > 
> > include/drm-uapi/xe_drm.h | 27 +++-------------
> > tests/intel/xe_query.c    | 66 +++++++++++++++++++++++++++++++++++++++
> > 2 files changed, 71 insertions(+), 22 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
