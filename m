Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CADD3943C
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 14:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E4510E07E;
	Thu,  2 Apr 2026 14:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjvW5Gpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B947610F2BE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775141861; x=1806677861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bTRjMp2aLy3hQjqr5OhKcS6JvpQHbvSqz+l2Ams/M14=;
 b=mjvW5Gpe9KrQ8ea1ftyMvuSMFb3XzaXyvqQirczgFMlyEMAbqOeavio5
 KeqDS4fA4p6zdJnRg34Xb1IKcPo6tV/CN4XAXUUgU3aEATwHzqTZvvAOM
 5jvNPwtbVrzbG4jyJfB17nCyOvq7v2xsQsWhRnXL74mRbPERMnJdpsbtH
 8Qxvl47Xg8P+g4y+O8GVpnkJ52SHb1vwcd+oWPGRuBZiomzWhl29W+DPV
 Lc1l12xKMsPPYTK7n9IzOpNnJIK21OkJxCHiOJHjo4y0QyTX2h4C3YCd7
 LUj7ux73OwfLQNjeEoPs4tSzy3SzsHJezekVDTOeGhA9ntmWVqzCyMwPW A==;
X-CSE-ConnectionGUID: lhJ+ltRzQH6B5qRgPSXPbA==
X-CSE-MsgGUID: KEK2AbboSkiLrvio3yktjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93595137"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93595137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:57:40 -0700
X-CSE-ConnectionGUID: v0quO7tJQX6WBgIjkrd42g==
X-CSE-MsgGUID: 9N4YibaxR0m8pmlCq9sY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231805323"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 07:57:38 -0700
Date: Thu, 2 Apr 2026 16:57:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.rudnicki@intel.com
Subject: Re: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust
 definition in xe_drm_eudebug.h
Message-ID: <20260402145736.3txn6vjolmdadzz2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 igt-dev@lists.freedesktop.org, piotr.rudnicki@intel.com
References: <20260402132004.1712065-1-maciej.patelczyk@intel.com>
 <a25ed362-ffd3-4004-8b34-7f436a641ea2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a25ed362-ffd3-4004-8b34-7f436a641ea2@intel.com>
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

Hi Hajda,,
On 2026-04-02 at 16:04:08 +0200, Hajda, Andrzej wrote:
> W dniu 2.04.2026 o 15:20, Maciej Patelczyk pisze:
> > Adjust the IOCTL numbers an exec_queue eudebug extension number to
> > match drm-tip.
> > 
> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 

Thank you, pushed.

Regards,
Kamil

> > ---
> >   include/drm-uapi-experimental/xe_drm_eudebug.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> > index 8e74ced2f..a1733f543 100644
> > --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> > +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> > @@ -19,9 +19,9 @@ extern "C" {
> >    */
> >   /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
> > -#define DRM_XE_EUDEBUG_CONNECT		0x0f
> > -#define DRM_XE_DEBUG_METADATA_CREATE	0x10
> > -#define DRM_XE_DEBUG_METADATA_DESTROY	0x11
> > +#define DRM_XE_EUDEBUG_CONNECT		0x10
> > +#define DRM_XE_DEBUG_METADATA_CREATE	0x11
> > +#define DRM_XE_DEBUG_METADATA_DESTROY	0x12
> >   /* ... */
> > @@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
> >   /* ... */
> > -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
> > +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		7
> >   #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
> >   /* ... */
> 
