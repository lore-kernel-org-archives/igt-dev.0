Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27757CFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 03:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD70610E00B;
	Mon,  7 Oct 2024 03:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xh79FvMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4695010E00B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 03:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728272846; x=1759808846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bA2Wj+BApc7xml/6EKqhbM9nDLM5mcJWYq2i5UdiQsk=;
 b=Xh79FvMNGKOag9BcUKoe8M/X2+CVoCKUrqy9L1n4DNxfAE72ve3NJ64w
 UNX7V3dLF3tLObr1PpNR4Q/gX2DzqyqqVQQm5qqcKlz9C54Qgj/GgLxXx
 TDsLagqtonB3UGkSwuNYu8qs+bvl/2xyvbOOoqYvjETl8vxy3JAm7NrLm
 U5LPomR7nEvW+wvGs8BKemT27gnPaK8JRar1i4hLJUO13rStIbwSEdG3Q
 Qwtz5p7FHA+prLF5dWxQ15O0DtjHxeh2UhZ8+5/gnWH/A/+0qMrMWA8Pu
 KFc7hmpWLDG21X33JNaip9/0+KZQg6uaCrSZl/+nbjeixb+VqrqMDAjb8 Q==;
X-CSE-ConnectionGUID: hT5a09z+SkexoQBz0LsSJA==
X-CSE-MsgGUID: M1aJUJPFTAGdbazet87EQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27538010"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="27538010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 20:47:25 -0700
X-CSE-ConnectionGUID: /8sS8INZS02BMkYWC0ccPQ==
X-CSE-MsgGUID: d6XqxYYlQjyRi3ZPVOTAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="75692586"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 20:47:23 -0700
Date: Mon, 7 Oct 2024 05:47:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sikora, Pawel" <pawel.sikora@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout
 helpers
Message-ID: <20241007034720.l6gyelnzuohzntyi@zkempczy-mobl2>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
 <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
 <7a9f1171dbe6a0a4dd0398c95b34c3e69b221635.camel@intel.com>
 <20240927051806.jn7pvk662we6phyw@zkempczy-mobl2>
 <94b8a9e2-5b94-45a6-a991-fde38665a77f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94b8a9e2-5b94-45a6-a991-fde38665a77f@intel.com>
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

On Fri, Sep 27, 2024 at 01:27:18PM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 27.09.2024 07:18, Zbigniew Kempczyński wrote:
> > On Thu, Sep 26, 2024 at 04:54:53PM +0200, Grzegorzek, Dominik wrote:
> > > On Thu, 2024-09-26 at 14:18 +0200, Dominik Karol Piątkowski wrote:
> > > > This patch introduces preempt_timeout helpers:
> > > >   - xe_eudebug_set_preempt_timeout_to_max
> > > >     Sets preempt_timeout_us for given engine_class to maximum.
> > > >   - xe_eudebug_restore_preempt_timeout
> > > >     Sets preempt_timeout_us for given engine_class to previous value.
> > > > 
> > > 
> > > I think this should really go to igt_sysfs.c. And in sligtly different form:
> > > How about sth like:
> > 
> > We're compiling lib/xe_eudebug.c conditionally so I wouldn't pollute igt_sysfs.c
> > with eudebug code (at least yet).
> 
> I am a little bit confused by this comment as this is not eudebug specific
> code. The eudebug series did introduce some code to common/core igt library
> parts (like gpgpu_shader or intel_bachbuffer) which seemed to be fine (and
> rightly so IMO). I am not sure why this case is any different.

From my pov:

1. changes in gpgpu_shader are related to shaders generation, they may be
used or not, but they don't assume eudebug is turned on in the linux kernel.
2. intel_batchbuffer changes (set + lr mode) also don't assume eudebug is in use
3. change in igt_sysfs assumes kernel supports eudebug, but we're still
on the way to it, so this file at the moment is not correct place imo.

As eudebug feature is big thing I would keep it separated as much as
possible. Create xe_eudebug_util.[ch] or whatever but keep it separated
but this is mine opinion and if someone else will convince me that
I'm wrong I can accept your changes.

--
Zbigniew

> 
> The only reason I could think of was that igt_sysfs.c might be for generic
> and not i915/Xe specific functions but from what I see, there is plenty
> i915/Xe specific stuff in there.
> 
> Thanks,
> Christoph
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > igt_sysfs_engine_set_property(engines_fd, "preempt_timeout_us", value);
> > > igt_sysfs_engine_set_property_bound(engines_fd, "preempt_timeout_us", max);
> > > 
> > > ,where max is a bool variable which tells whether it should be min or max.
> > > 
> > > To find engines_fd xe_sysfs_engine_open could be used.
> > > 
> > > Regards,
> > > Dominik
> > > 
> > > > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > > > ---
> > > >   lib/xe/xe_eudebug.c | 120 ++++++++++++++++++++++++++++++++++++++++++++
> > > >   lib/xe/xe_eudebug.h |   3 ++
> > > >   2 files changed, 123 insertions(+)
> > > > 
> > > > diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> > > > index 2c7cd2ae1..229f9e6a1 100644
> > > > --- a/lib/xe/xe_eudebug.c
> > > > +++ b/lib/xe/xe_eudebug.c
> > > > @@ -16,6 +16,7 @@
> > > >   #include "intel_pat.h"
> > > >   #include "xe_eudebug.h"
> > > >   #include "xe_ioctl.h"
> > > > +#include "xe_drm.h"
> > > >   struct event_trigger {
> > > >   	xe_eudebug_trigger_fn fn;
> > > > @@ -1717,6 +1718,125 @@ bool xe_eudebug_enable(int fd, bool enable)
> > > >   	return old;
> > > >   }
> > > > +/**
> > > > + * xe_eudebug_set_preempt_timeout_to_max
> > > > + * @fd: xe client
> > > > + * @engine_class: engine class to modify (drm_xe_engine_class_instance->engine_class)
> > > > + * @value: pointer to variable to store previous preempt_timeout value in, needed for restore
> > > > + *
> > > > + * Sets preempt_timeout_us for given engine_class to maximum.
> > > > + *
> > > > + * Returns: true on success, false on failure.
> > > > + */
> > > > +bool xe_eudebug_set_preempt_timeout_to_max(int fd, uint16_t engine_class, uint32_t *value)
> > > > +{
> > > > +	int engines_fd;
> > > > +	int gt_fd;
> > > > +	uint32_t max_value;
> > > > +
> > > > +	igt_assert(engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> > > > +		   engine_class == DRM_XE_ENGINE_CLASS_COMPUTE);
> > > > +
> > > > +	gt_fd = xe_sysfs_gt_open(fd, 0);
> > > > +	if (gt_fd == -1) {
> > > > +		igt_debug("Failed to open gt.\n");
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (engine_class == DRM_XE_ENGINE_CLASS_RENDER)
> > > > +		engines_fd = openat(gt_fd, "engines/rcs", O_RDONLY);
> > > > +	else
> > > > +		engines_fd = openat(gt_fd, "engines/ccs", O_RDONLY);
> > > > +
> > > > +	if (engines_fd == -1) {
> > > > +		igt_debug("Failed to open engine class.\n");
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (!__igt_sysfs_get_u32(engines_fd, "preempt_timeout_us", value)) {
> > > > +		igt_debug("Failed to read preempt_timeout_us.\n");
> > > > +		close(engines_fd);
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (!__igt_sysfs_get_u32(engines_fd, "preempt_timeout_max", &max_value)) {
> > > > +		igt_debug("Failed to read preempt_timeout_max.\n");
> > > > +		close(engines_fd);
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (!__igt_sysfs_set_u32(engines_fd, "preempt_timeout_us", max_value)) {
> > > > +		igt_debug("Failed to write preempt_timeout_us.\n");
> > > > +		close(engines_fd);
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	close(engines_fd);
> > > > +	close(gt_fd);
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_eudebug_restore_preempt_timeout
> > > > + * @fd: xe client
> > > > + * @engine_class: engine class to modify (drm_xe_engine_class_instance->engine_class)
> > > > + * @value: previous preempt_timeout value
> > > > + *
> > > > + * Sets preempt_timeout_us for given engine_class to previous value.
> > > > + *
> > > > + * Returns: true on success, false on failure.
> > > > + */
> > > > +bool xe_eudebug_restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t value)
> > > > +{
> > > > +	int engines_fd;
> > > > +	int gt_fd;
> > > > +
> > > > +	igt_assert(engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> > > > +		   engine_class == DRM_XE_ENGINE_CLASS_COMPUTE);
> > > > +
> > > > +	gt_fd = xe_sysfs_gt_open(fd, 0);
> > > > +	if (gt_fd == -1) {
> > > > +		igt_debug("Failed to open gt.\n");
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (engine_class == DRM_XE_ENGINE_CLASS_RENDER)
> > > > +		engines_fd = openat(gt_fd, "engines/rcs", O_RDONLY);
> > > > +	else
> > > > +		engines_fd = openat(gt_fd, "engines/ccs", O_RDONLY);
> > > > +
> > > > +	if (engines_fd == -1) {
> > > > +		igt_debug("Failed to open engine class.\n");
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	if (!__igt_sysfs_set_u32(engines_fd, "preempt_timeout_us", value)) {
> > > > +		igt_debug("Failed to write preempt_timeout_us.\n");
> > > > +		close(engines_fd);
> > > > +		close(gt_fd);
> > > > +
> > > > +		return false;
> > > > +	}
> > > > +
> > > > +	close(engines_fd);
> > > > +	close(gt_fd);
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > >   /* Eu debugger wrappers around resource creating xe ioctls. */
> > > >   /**
> > > > diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> > > > index 29ab68fee..144035862 100644
> > > > --- a/lib/xe/xe_eudebug.h
> > > > +++ b/lib/xe/xe_eudebug.h
> > > > @@ -167,6 +167,9 @@ void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
> > > >   bool xe_eudebug_enable(int fd, bool enable);
> > > > +bool xe_eudebug_set_preempt_timeout_to_max(int fd, uint16_t engine_class, uint32_t *value);
> > > > +bool xe_eudebug_restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t value);
> > > > +
> > > >   int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
> > > >   void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
> > > >   uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
> > > 
