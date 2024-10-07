Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4950CFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 04:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45410E00B;
	Mon,  7 Oct 2024 04:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4DCuM7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0510E00B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 04:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728273841; x=1759809841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kY+Vd1MjRRHSeAU5KAjzTMdQ1d0Er5AkP83aYCKYkcs=;
 b=C4DCuM7SFjn8hLevpFzDVOwzYq0N4Jcold/cB+ErZu8SsHpxJp7rA/Lx
 2d5VQRa9lrY5fqb2dqzYd6Nf04ErzDjRZX3+/9pwYc4X47UDVAWN6H1V7
 ABwWu7VIi+ux3u0ok7J9evx0XvLqEfdvqO7232nGOTJqkcrc3Nb46kVXg
 Yy+gwxrnqxozlSYC8xVYOFTgd4dWTqq2MmPkgXCe7rrFJMMGt/gfQcsXg
 U9Pv2i6TBVNvVwIjBrtWVUExj4rWH75R6C5UGHuDqfsrq4PU3gLoQUcwJ
 OiOkq7ZlDXKHU9nemTP7FQaavau47WAhRSwBwr3AZg5gclma/yiSpDpG2 g==;
X-CSE-ConnectionGUID: Zu6IDQr7Qp24aobcOQbgjw==
X-CSE-MsgGUID: 1lEOlfxPRxSUoQHGLbofhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="15028490"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="15028490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 21:04:00 -0700
X-CSE-ConnectionGUID: TPPb2W6FRDiTOypiqV2TJg==
X-CSE-MsgGUID: izC+q++1SiSSF5XJLtfK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="75694997"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 21:03:58 -0700
Date: Mon, 7 Oct 2024 06:03:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Message-ID: <20241007040356.m3txyzjhi53h5krp@zkempczy-mobl2>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
 <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
 <047945a8a2587de77c88ddc45146be38486aff96.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <047945a8a2587de77c88ddc45146be38486aff96.camel@intel.com>
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

On Thu, Oct 03, 2024 at 03:58:09PM +0200, Grzegorzek, Dominik wrote:
> Hi Dominik,
> 
> Since you made this generic it looks good to me, and I would vote for merging it to igt_sysfs,
> as this could be useful function for anyone who would like to manipulate/read engine params.
> However, Zbigniew had some objections againt it under mine previous comment in which I asked you to
> place it here. Let's hear from him if this is acceptable in a current form. If not, I would just
> move those functions as they are to the test file.

I'm sorry for late answer. Please check my answer to previous series,
I'm catching up my email queue.

--
Zbigniew

> 
> Regards, 
> Dominik
> 
> On Wed, 2024-10-02 at 13:29 +0200, Dominik Karol Piątkowski wrote:
> > Introduce the following engine_class helpers:
> >  - xe_sysfs_engine_class_get_property
> >    Convenience wrapper to get value of given property for given engine
> >    class on given gt.
> >  - xe_sysfs_engine_class_set_property
> >    Convenience wrapper to set given property for given engine class on
> >    given gt to given value.
> > 
> > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > ---
> >  lib/igt_sysfs.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h |  5 +++
> >  2 files changed, 90 insertions(+)
> > 
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index aec0bb53d..8fe6d7ede 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -1360,3 +1360,88 @@ int xe_sysfs_get_num_tiles(int xe_device)
> >  
> >  	return num_tiles;
> >  }
> > +
> > +/**
> > + * xe_sysfs_engine_class_get_property
> > + * @xe_device: fd of the device
> > + * @gt: gt number
> > + * @class: engine class
> > + * @property: property of engine class to retrieve
> > + * @value: pointer for storing read value
> > + *
> > + * Convenience wrapper to get value of given property for given engine class on given gt.
> > + *
> > + * Returns: true on success, false on failure.
> > + */
> > +bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
> > +					uint32_t *value)
> > +{
> > +	int engines_fd;
> > +
> > +	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
> > +
> > +	if (engines_fd == -1) {
> > +		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
> > +
> > +		return false;
> > +	}
> > +
> > +	if (!__igt_sysfs_get_u32(engines_fd, property, value)) {
> > +		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
> > +			  xe_engine_class_to_str(class), gt);
> > +		close(engines_fd);
> > +
> > +		return false;
> > +	}
> > +
> > +	close(engines_fd);
> > +
> > +	return true;
> > +}
> > +
> > +/**
> > + * xe_sysfs_engine_class_set_property
> > + * @xe_device: fd of the device
> > + * @gt: gt number
> > + * @class: engine class
> > + * @property: property of engine class to be modified
> > + * @new_value: value to be set
> > + * @old_value: pointer for storing old value, can be NULL
> > + *
> > + * Convenience wrapper to set given property for given engine class on given gt to given value.
> > + *
> > + * Returns: true on success, false on failure.
> > + */
> > +bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
> > +					uint32_t new_value, uint32_t *old_value)
> > +{
> > +	int engines_fd;
> > +
> > +	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
> > +
> > +	if (engines_fd == -1) {
> > +		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
> > +
> > +		return false;
> > +	}
> > +
> > +	if (old_value && !__igt_sysfs_get_u32(engines_fd, property, old_value)) {
> > +		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
> > +			  xe_engine_class_to_str(class), gt);
> > +		close(engines_fd);
> > +
> > +		return false;
> > +	}
> > +
> > +	if (!__igt_sysfs_set_u32(engines_fd, property, new_value)) {
> > +		igt_debug("Failed to write %s property of %s on gt%d.\n", property,
> > +			  xe_engine_class_to_str(class), gt);
> > +		close(engines_fd);
> > +
> > +		return false;
> > +	}
> > +
> > +	close(engines_fd);
> > +
> > +	return true;
> > +}
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> > index 2a1e3b1bf..3cede07f9 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -175,4 +175,9 @@ int xe_sysfs_get_num_tiles(int xe_device);
> >  char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
> >  int xe_sysfs_engine_open(int xe_device, int gt, int class);
> >  
> > +bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
> > +					uint32_t *value);
> > +bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
> > +					uint32_t new_value, uint32_t *old_value);
> > +
> >  #endif /* __IGT_SYSFS_H__ */
> 
