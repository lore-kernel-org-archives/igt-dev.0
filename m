Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A5D2C55A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 13:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1310E68F;
	Tue, 22 Oct 2024 13:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr8QYqIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0810E68F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729605359; x=1761141359;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=aMP15CQOyZcOFSmZeD0VTVAMr7D9RMDLvL0zgsCeFgk=;
 b=Qr8QYqIbHRvjIhLOE4MDt7zyckRVBTkQtupz0fbyEuwm7gr95RSk8Etk
 LBtgcEgZZQYwMj7bdUIQHJQ1jH/w50jkycjGIHGhqBfkphLqn/+z9w/YY
 3eYh9AclOxIwQnXi1WT2xol6JFbgzWVvyOyTin/9Aih9sp7iYSKse0DWl
 tSLnyeyYoyA1cuPXZAKOr75DIfCvJ7tkpv0NFfaqotTSBskiJ+wLrpokc
 o1Lze9IVDCD6CU/1pyOP73iBAehwKBNI4FBuNDcHQWYno8J58UIyxyl5c
 qdbn+d/zr+tYw5/MijLZHtQUHtk7CY+veqS2OAFJvKT5PwrP8CEg71BaO A==;
X-CSE-ConnectionGUID: nDwborSGSC679oysC2uWBQ==
X-CSE-MsgGUID: FhQQXIFFQ0iB3SV5T4RyaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32951833"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="32951833"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 06:55:58 -0700
X-CSE-ConnectionGUID: 7ioU2EupS1us4iYNf5075g==
X-CSE-MsgGUID: s2icY8+eSWqXFyQ9itIObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79528492"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 06:55:56 -0700
Date: Tue, 22 Oct 2024 15:55:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: xe_find_engine_by_class helper
Message-ID: <20241022135556.cohaq7afvnurylai@zkempczy-mobl2>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <20241016101933.4191790-2-pravalika.gurram@intel.com>
 <20241021125908.cvcvo4svhxd2pmdy@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241021125908.cvcvo4svhxd2pmdy@kamilkon-desk.igk.intel.com>
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

On Mon, Oct 21, 2024 at 02:59:08PM +0200, Kamil Konieczny wrote:
> Hi Pravalika,
> On 2024-10-16 at 15:49:32 +0530, Pravalika Gurram wrote:
> > Added "xe_find_engine_by_class" helper function to query with the required
> > engine class and get the engine info.
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> >  lib/xe/xe_query.c | 20 ++++++++++++++++++++
> >  lib/xe/xe_query.h |  1 +
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 8694fa3f9..0c9cff066 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -731,6 +731,26 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
> >  	return false;
> >  }
> >  
> > +/**
> > + * xe_find_engine_by_class
> > + * @fd: xe device fd
> > + * @engine_class: engine class
> > + *
> > + * Returns engine info of xe device @fd and @engine_class otherwise NULL.
> > + */
> > +struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class)
> > +{
> > +	struct xe_device *xe_dev;
> > +
> > +	xe_dev = find_in_cache(fd);
> > +	igt_assert(xe_dev);
> 
> imho here just 'if (!xe_dev) return NULL;'
> 
> Regards,
> Kamil

Assert is fine here. Sth really wrong will happen if previously there
will be no fd xe_dev data in the cache.

--
Zbigniew

> 
> > +
> > +	for (int i = 0; i < xe_dev->engines->num_engines; i++)
> > +		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
> > +			return &xe_dev->engines->engines[i];
> > +
> > +	return NULL;
> > +}
> >  /**
> >   * xe_has_media_gt:
> >   * @fd: xe device fd
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index fd1155f7f..cabb8078c 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -108,6 +108,7 @@ uint16_t xe_dev_id(int fd);
> >  int xe_supports_faults(int fd);
> >  const char *xe_engine_class_string(uint32_t engine_class);
> >  bool xe_has_engine_class(int fd, uint16_t engine_class);
> > +struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
> >  bool xe_has_media_gt(int fd);
> >  bool xe_is_media_gt(int fd, int gt);
> >  uint16_t xe_gt_get_tile_id(int fd, int gt);
> > -- 
> > 2.34.1
> > 
