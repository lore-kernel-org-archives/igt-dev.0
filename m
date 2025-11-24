Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5040FCFD31C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 09:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03088898C4;
	Mon, 24 Nov 2025 09:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFpiZeE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B4C898C4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763976596; x=1795512596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7y7qy5/TdVs8SjqVLl/KTc2BAXlsuppZ1oPdtnQd718=;
 b=YFpiZeE0Aq57ByZBLRyTvrheA4af/RukNxKHT0FJEoslyQkxMbess4lA
 r+k+Ibn1jCA8ANTWEQpL+Js6w9EYwdhTiqIApGs2lXijmsR+UWYcd8QhX
 CJAGQybchzO8el6qKWix80S/QMaL9pcImBpFVCiBNJmE3iB6dB8nISXqm
 Th4qJ4/SBKjR/OBpYTidSGBiG4DJEFNZu168HjUjGA+0WEJ4KVfd4E9Zv
 Te8buG5EcaJMoEBA99rsIAnt1hifIEuxo5BBpwRw1S0lijjTSvpk8TNAD
 cKRvDXjcx7DqFQfMvRuZMbC5zyGtvkPEQBir5rvQzXgGg91wt44prbxip w==;
X-CSE-ConnectionGUID: ZB5IDI8sTou9WXMCxLJzbw==
X-CSE-MsgGUID: l+o8FHiCQz23vrAJZnmStQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77333839"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="77333839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 01:29:56 -0800
X-CSE-ConnectionGUID: CQltDrQCTMmyAfo12QbjuQ==
X-CSE-MsgGUID: DMqIiXFYR46FFfRfdyWVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192074093"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 01:29:54 -0800
Date: Mon, 24 Nov 2025 10:29:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
Subject: Re: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device query
Message-ID: <20251124092935.bsi2npavvkktwdqp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
 <20251121-xe_query_helpers-v5-2-d69c1c160e96@intel.com>
 <CH3PR11MB8434E89B00773717823BD8D08DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
 <CH3PR11MB84348F138D2F23FA354D2A298DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH3PR11MB84348F138D2F23FA354D2A298DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
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

Hi Dandamudi,,
On 2025-11-24 at 08:55:50 +0000, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: Dandamudi, Priyanka
> > Sent: 24 November 2025 01:43 PM
> > To: Hajda, Andrzej <andrzej.hajda@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Mun, Gwan-gyeong
> > <Gwan-gyeong.Mun@intel.com>; Piorkowski, Piotr
> > <Piotr.Piorkowski@intel.com>; Manszewski, Christoph
> > <christoph.manszewski@intel.com>
> > Subject: RE: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device
> > query
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Hajda, Andrzej <andrzej.hajda@intel.com>
> > > Sent: 21 November 2025 04:29 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Dandamudi,
> > > Priyanka <priyanka.dandamudi@intel.com>; Mun, Gwan-gyeong <gwan-
> > > gyeong.mun@intel.com>; Piorkowski, Piotr <piotr.piorkowski@intel.com>;
> > > Manszewski, Christoph <christoph.manszewski@intel.com>; Hajda, Andrzej
> > > <andrzej.hajda@intel.com>
> > > Subject: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device
> > > query
> > >
> > > Helpers abstracts out common bits of
> > DRM_XE_DEVICE_QUERY_HWCONFIG
> > > ioctl:
> > > - query data size,
> > > - alloc memory,
> > > - get data,
> > > - error checks,
> > > - valgrind annotations.
> > >
> > > There are two flawors, to fulfill current usage patterns:
> > > - xe_query_device_may_fail - returns NULL if query is not supported,
> > > - xe_query_device - asserts on error otherwise returns valid pointer.
> > >
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > ---
> > >  lib/xe/xe_query.c | 43
> > +++++++++++++++++++++++++++++++++++++++++++
> > >  lib/xe/xe_query.h | 20 ++++++++++++++++++++
> > >  2 files changed, 63 insertions(+)
> > >
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> > >
> > 53af86a99378dfda6f988e01a4d842b266e94a80..a185b852e19b87e393f4bc6
> > > edbf9e0952439d518 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -25,6 +25,49 @@
> > >  #include "xe_query.h"
> > >  #include "xe_ioctl.h"
> > >
> > > +/**
> > > + * xe_query_device_may_fail:
> > > + * @fd: xe device fd
> > > + * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
> > > + * @size: pointer to get size of returned data, can be NULL
> > > + *
> > > + * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
> > > + * about specified @type. Returns pointer to malloc'ed data, which
> > > + * should be freed later by the user. If @query is not supported
> > > + * function returns NULL. On any other error it asserts.
> > > + */
> > > +void *xe_query_device_may_fail(int fd, uint32_t type, uint32_t *size) {
> > > +	struct drm_xe_device_query query = {
> > > +		.extensions = 0,
> > > +		.query = type,
> > > +		.size = 0,
> > > +		.data = 0,
> > > +	};
> > > +	void *data = NULL;
> > > +
> > > +	/* In case of unsupported query xe driver usually returns error,
> > > +	 * but in case of HWCONFIG it can also return query.size == 0
> > > +	 * on older platforms.
> > > +	 */
> > > +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) ||
> > > !query.size)
> > > +		goto skip_query;
> > 
> > If ioctl fails with say negative value -22 if condition is met and goes to skip
> > condition, I think that's not expected right?
> > if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0 && !query.size)
> > is it not this we want?
> Ok got the logic you want it to make it work for oa and eu for older platforms as well, 
> Why cant we do that check for that specific types instead of this confusion and use only one function instead of two functions.

Because using bool param in function is confusing, it is better
to have two functions.

Regards,
Kamil

> > > +
> > > +	data = malloc(query.size);
> > > +	igt_assert(data);
> > > +
> > > +	query.data = to_user_pointer(data);
> > > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> > > 0);
> > > +
> > > +	VG(VALGRIND_MAKE_MEM_DEFINED(data, query.size));
> > > +
> > > +skip_query:
> > > +	if (size)
> > > +		*size = query.size;
> > > +
> > > +	return data;
> > > +}
> > > +
> > >  static struct drm_xe_query_config *xe_query_config_new(int fd)  {
> > >  	struct drm_xe_query_config *config;
> > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> > >
> > 6a97d384a364979e1a3fa4e0785397236068d0fc..15d5c26baf5be6e10749524
> > > 7ca1aaefea551d821 100644
> > > --- a/lib/xe/xe_query.h
> > > +++ b/lib/xe/xe_query.h
> > > @@ -143,9 +143,29 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
> > > uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);  uint32_t
> > > *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute,
> > > uint32_t *len);  uint32_t xe_hwconfig_lookup_value_u32(int fd, enum
> > > intel_hwconfig attribute);
> > > +void *xe_query_device_may_fail(int fd, uint32_t type, uint32_t
> > > +*size);
> > >  int xe_query_pxp_status(int fd);
> > >  int xe_wait_for_pxp_init(int fd);
> > >
> > > +/**
> > > + * xe_query_device:
> > > + * @fd: xe device fd
> > > + * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
> > > + * @size: pointer to get size of returned data, can be NULL
> > > + *
> > > + * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
> > > + * about specified @type. Returns pointer to malloc'ed data, which
> > > + * should be freed later by the user. If @query is not supported
> > > + * or on any other error it asserts.
> > > + */
> > > +static inline void *xe_query_device(int fd, uint32_t type, uint32_t
> > > +*size) {
> > > +	void *data = xe_query_device_may_fail(fd, type, size);
> > > +
> > > +	igt_assert(data);
> > > +	return data;
> > > +}
> > > +
> > >  struct xe_device *xe_device_get(int fd);  void xe_device_put(int fd);
> > >
> > >
> > > --
> > > 2.43.0
> 
