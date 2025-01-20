Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A408C02182
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 12:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E8D10E3DA;
	Mon, 20 Jan 2025 12:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pbeay6Qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B73D10E3DA
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737377397; x=1768913397;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NRjWbT/lKXJ0PC04xZTnOBnt8IV6HIBj2RWBcJCAJ7k=;
 b=Pbeay6QvSwq5x1ceFlpXVRbNf0B4RANpHmJDaHRSHILKpFuy8v/b9X6h
 +PTJl7TFfyo5BCJLpukk1vAeWXrR2exgTT2FpfMI/8sO8IysIV+aLMKGr
 DgHJ7SFRAF73NsLRqXvv/+9vF348Ck7vdchAOwayUxeI3c/6dnERUESQ2
 4OmoRbRH9SOwdZcHHeKFQZ9hQ0ykeixVfRmFlIWsXaKtT/imfNLfzRDZ+
 dJtJE3zMcQJzsSZKw+nApWGtcDgR9qoN6Sz4R/a/mZQbyLY3qweJfNdXk
 FFhqmqUbC8tDGbqZvY3mwIs5X4eadRHi1shTGAT1uv/t0E6OBZbnLHBbc Q==;
X-CSE-ConnectionGUID: TnSlHXoQSd+3GZJG7hTBfg==
X-CSE-MsgGUID: ybf+DWJqSWmyiSTyO6EpWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41694547"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="41694547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:49:57 -0800
X-CSE-ConnectionGUID: UiGjuSq8Qa+zscAogTgLSg==
X-CSE-MsgGUID: iMgwiJTYTwGMOzYYTim47g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143785015"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:49:55 -0800
Date: Mon, 20 Jan 2025 13:49:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_util: introduce helper for enabling
 ccs mode
Message-ID: <20250120124951.bujiuec4bwo4rsrb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
 <e2c35d58-f033-45a9-8d95-1c90ed60d0e7@intel.com>
 <2208c434-10f1-4fb3-ba89-1f7bcfd8d03a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2208c434-10f1-4fb3-ba89-1f7bcfd8d03a@intel.com>
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

Hi Manszewski,,
On 2025-01-17 at 14:18:53 +0100, Manszewski, Christoph wrote:
> On 17.01.2025 14:07, Manszewski, Christoph wrote:
> > Hi Dominik,
> > 
> > On 16.12.2024 14:11, Dominik Grzegorzek wrote:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
> > > Multiple tests will require enabled ccs mode. Add special helper to
> > > avoid code duplication.
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > ---
> > >   lib/xe/xe_util.c | 31 +++++++++++++++++++++++++++++++
> > >   lib/xe/xe_util.h |  1 +
> > >   2 files changed, 32 insertions(+)
> > > 
> > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > > index 9482819c2..f7ae19f08 100644
> > > --- a/lib/xe/xe_util.c
> > > +++ b/lib/xe/xe_util.c
> > > @@ -302,3 +302,34 @@ int xe_gt_count_engines_by_class(int fd, int
> > > gt, int class)
> > >       return n;
> > >   }
> > > +
> > > +/**
> > > + * xe_sysfs_enable_ccs_mode:
> > > + * @fd: pointer to xe drm fd, can reopened multiple times
> > > + *
> > > + * Enables ccs_mode on all GTs, it must succeed for at least one GT.
> > > + * Since function requires the driver to be closed during ccs_mode
> > > change
> > > + * @fd will be closed then re-opened.
> > > + */
> > > +void xe_sysfs_enable_ccs_mode(int *fd)
> > > +{
> > > +    int gt, gt_fd, num_slices, ccs_mode, num_gt, enabled_count = 0;
> > > +
> > > +    num_gt = xe_number_gt(*fd);
> > > +
> > > +    for (gt = 0; gt < num_gt; gt++) {
> > > +        gt_fd = xe_sysfs_gt_open(*fd, gt);
> > > +        drm_close_driver(*fd);
> > 
> > Why not outside the loop?

imho this is a valid question, why not collect all gt_fd
and use them later, so drm_close_driver/open_driver will
be called only once? Second concern is that this lib function
assumes a caller have only one open drm fd, this also needs
to be documented.

> 
> Nevermind
> 
> > 
> > Thanks,
> > Christoph
> > 
> > > +
> > > +        if (!igt_debug_on(igt_sysfs_scanf(gt_fd, "num_cslices",
> > > "%u", &num_slices) <= 0) &&
> > > +            !igt_debug_on(igt_sysfs_printf(gt_fd, "ccs_mode", "%u",
> > > num_slices) <= 0) &&
> > > +            !igt_debug_on(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u",
> > > &ccs_mode) <= 0) &&
> > > +            !igt_debug_on(num_slices != ccs_mode))
> > > +            enabled_count++;
> > > +        close(gt_fd);
> > > +        *fd = drm_open_driver(DRIVER_XE);
> > > +    }
> > > +
> > > +    if (!enabled_count)
> > > +        igt_require_f(0, "Cannot enable ccs mode for any GT\n");
> 
> Unless I am missing something (again):
> igt_require_f(enabled_count, "Cannot enable ccs mode for any GT\n")?

And this one is also tricky, it was ok in a test but in library imho
it should be avoided. Why not returning bitfield with bits sets for
each gt with ccs enabled? So in case of no css just return zero and
igt_require will be called in a test, not in a lib.

Also it should have a counterpart with _disable()

Regards,
Kamil

> 
> Reviewed-by: Chritoph Manszewski <christoph.manszewski@intel.com>
> 
> > > +}
> > > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > > index b9fbfc5cd..a82c44a2a 100644
> > > --- a/lib/xe/xe_util.h
> > > +++ b/lib/xe/xe_util.h
> > > @@ -53,5 +53,6 @@ int xe_gt_fill_engines_by_class(int fd, int gt,
> > > int class,
> > >                   struct drm_xe_engine_class_instance eci[static
> > > XE_MAX_ENGINE_INSTANCE]);
> > >   int xe_gt_count_engines_by_class(int fd, int gt, int class);
> > > +void xe_sysfs_enable_ccs_mode(int *fd);
> > >   #endif /* XE_UTIL_H */
