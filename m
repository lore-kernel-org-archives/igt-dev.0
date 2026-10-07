Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE5CA6002
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 16:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939510E617;
	Wed,  7 Oct 2026 16:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOxg4Xaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D2B10E618
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791389976; x=1822925976;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HTPNwdFhLM7BPnWEuMnjmtwXBjwr3/gX8V8z8UPskAk=;
 b=jOxg4XaaNBnCaiDUOHA3QH+Qv9Z+wweNzzuub+Roc/CN66Dof+cpFKMR
 1pW/9sdG9rW7zfVMgFrUrgWuku62OdT9nEFYJj/kHQtgw4glAK5gsXE1x
 MdAmCXDykhn32REHwuW7gEpLOJ8Ss5o6Jk+/Kj0O/FcICmShKn1azT8HW
 0Vf1gMet+LuzvudIt6HuUJIFfpDZER51INWBJYPfis+OdF9A6Cf+dtOK5
 mgEq+EJIu6Jt0HjI4/mQmhSHScUgye0qfiKfzfnx3IkwIw6kWPmubJkv8
 EUmyEy29b9uNMkoN2szSTS3SFmoLMqEIdK/Ub4nVfp7YduQ/sEx8pm6gX Q==;
X-CSE-ConnectionGUID: K463HbrgQDyUFF3wyoZqag==
X-CSE-MsgGUID: rmXKy8CES8OhFirRl573cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="39859"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="39859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:19:35 -0700
X-CSE-ConnectionGUID: XLVjcGlxS6WFTAwokT4iog==
X-CSE-MsgGUID: rinqn+SiT3m+PNtxGTo6LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="275268851"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:19:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
 igt_get_free_pipes_mask()
In-Reply-To: <IA0PR11MB73070C19D34943D60C22E0C3BA942@IA0PR11MB7307.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007-joiner-v1-0-b40826411fa8@intel.com>
 <20261007-joiner-v1-1-b40826411fa8@intel.com>
 <45b38494fa17817bbcbae211010c3161706f364a@intel.com>
 <IA0PR11MB73070C19D34943D60C22E0C3BA942@IA0PR11MB7307.namprd11.prod.outlook.com>
Date: Wed, 07 Oct 2026 19:19:30 +0300
Message-ID: <d18d32cb4d1223e0dfb590abf6413a480c2a0aa1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 07 Oct 2026, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> -----Original Message-----
>> From: Nikula, Jani <jani.nikula@intel.com>
>> Sent: Wednesday, October 7, 2026 7:06 PM
>> To: Murthy, Arun R <arun.r.murthy@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
>> <kunal1.joshi@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
>> Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_joiner_helper: Add
>> igt_get_free_pipes_mask()
>> 
>> On Wed, 07 Oct 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> > The joiner tests derive the set of usable pipes from the pipe count
>> > alone, which assumes every pipe is free. A pipe already driven by
>> > another client is then handed to a modeset, making the commit fail.
>> >
>> > Add igt_get_free_pipes_mask(), which gets the current CRTC usage via
>> > drmModeGetCrtcList() and translates it into a bitmask of hardware
>> > pipes.
>> >
>> > drmModeGetCrtcList() is a recent libdrm addition, so probe for it in
>> > meson and fall back to plain CRTC enumeration when it is missing.
>> >
>> > Assisted-by: LLM
>> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> > ---
>> >  meson.build                     |  7 +++++
>> >  tests/intel/kms_joiner_helper.c | 66
>> > +++++++++++++++++++++++++++++++++++++++++
>> >  tests/intel/kms_joiner_helper.h |  1 +
>> >  3 files changed, 74 insertions(+)
>> >
>> > diff --git a/meson.build b/meson.build index
>> >
>> d7bbfd9698e5616ab777ac58128192ba1e0bec23..f41588c9d73361dbfd405de5
>> ea8f
>> > 764c6768a9c9 100644
>> > --- a/meson.build
>> > +++ b/meson.build
>> > @@ -129,6 +129,13 @@ endif
>> >
>> >  build_info += 'With libdrm: ' + ','.join(libdrm_info)
>> >
>> > +# drmModeGetCrtcList() is a recent libdrm addition; keep building
>> > +against # older libdrm by falling back to plain resource enumeration.
>> > +if cc.has_function('drmModeGetCrtcList', dependencies : libdrm,
>> > +		   prefix : '#include <xf86drmMode.h>')
>> > +	config.set('HAVE_DRMMODEGETCRTCLIST', 1) endif
>> > +
>> >  pciaccess = dependency('pciaccess', version : '>=0.10')  libkmod =
>> > dependency('libkmod')  # igt_procps.c reads /proc directly; libprocps
>> > and libproc2 are not needed.
>> > diff --git a/tests/intel/kms_joiner_helper.c
>> > b/tests/intel/kms_joiner_helper.c index
>> >
>> 36168030475c2725130e6c8ad924dcfb971a07f6..235e227fe9d82f598d0bd7df
>> 57ff
>> > 65d73d717ad0 100644
>> > --- a/tests/intel/kms_joiner_helper.c
>> > +++ b/tests/intel/kms_joiner_helper.c
>> > @@ -113,6 +113,72 @@ void
>> igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
>> >  	}
>> >  }
>> >
>> > +/**
>> > + * igt_get_free_pipes_mask:
>> > + * @display: The display structure containing pipe information.
>> > + *
>> > + * Get the CRTCs that are currently usable and translate that into a
>> > + * bitmask of hardware pipes. A CRTC is reported free only when it is
>> > +neither
>> > + * enabled through KMS nor active in hardware, so pipes claimed by
>> > +another
>> > + * client (fbcon, a compositor, joiner) are never handed out to a modeset.
>> > + *
>> > + * The returned mask reflects the state at call time, so query it
>> > +right before
>> > + * a modeset and after releasing the pipes a previous commit was using.
>> > + *
>> > + * Returns: bitmask of hardware pipes whose CRTC is free to be
>> > +assigned. When
>> > + * libdrm lacks drmModeGetCrtcList() every pipe of @display is reported
>> free.
>> > + */
>> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display) {
>> > +	uint32_t free_mask = 0;
>> > +#ifdef HAVE_DRMMODEGETCRTCLIST
>> 
>> #ifdefs belong outside of functions, not inside.
>> 
> If DrmModeGetCrtcList() is not available in the libdrm, i.e an older libdrm then the legacy method of getting crtc is used, which is handled in the #else part.

Yeah, but #ifdefs still belong outside of functions, not inside.

I'm not sure why I need to explain this in exhaustive detail.

Don't do this:

int foo(void)
{
#ifdef FOO
	return 1;
#else
	return 0;
#endif
}

Do this:

#ifdef FOO
int foo(void)
{
	return 1;
}
#else
int foo(void)
{
	return 0;
}
#endif

This is a contrived example; it makes a ton more sense when your
function is long and non-trivial, and the conditional compilation
branches are long. Like in the function you're adding. #ifdefs make it
hard to follow the code. It's much easier to read functions that don't
have conditional compilation inside them.

BR,
Jani.


>
> Thanks and Regards,
> Arun R Murthy
> --------------------
>> > +	drmModeCrtcListPtr list;
>> > +	int i;
>> > +
>> > +	list = drmModeGetCrtcList(display->drm_fd);
>> > +	igt_assert_f(list, "drmModeGetCrtcList() failed\n");
>> > +
>> > +	for (i = 0; i < list->count; i++) {
>> > +		drmModeCrtcInfoPtr info = &list->crtcs[i];
>> > +		igt_crtc_t *crtc = igt_crtc_for_crtc_id(display, info->crtc_id);
>> > +
>> > +		/* A CRTC the display never enumerated is not ours to use. */
>> > +		if (!crtc)
>> > +			continue;
>> > +
>> > +		if (info->in_use) {
>> > +			igt_debug("CRTC %s in use: %ux%u, fb %u\n",
>> > +				  igt_crtc_name(crtc), info->width,
>> > +				  info->height, info->buffer_id);
>> > +			continue;
>> > +		}
>> > +
>> > +		if (info->driver_active) {
>> > +			igt_debug("CRTC %s active in hardware, not enabled
>> via KMS\n",
>> > +				  igt_crtc_name(crtc));
>> > +			continue;
>> > +		}
>> > +
>> > +		free_mask |= BIT(crtc->hardware_pipe);
>> > +	}
>> > +
>> > +	igt_info("%d of %d CRTCs free, free pipe mask 0x%x\n",
>> > +		 list->count_available, list->count, free_mask);
>> > +
>> > +	drmModeFreeCrtcList(list);
>> > +#else
>> > +	igt_crtc_t *crtc;
>> > +
>> > +	for_each_crtc(display, crtc)
>> > +		free_mask |= BIT(crtc->hardware_pipe);
>> > +
>> > +	igt_debug("libdrm has no drmModeGetCrtcList(), assuming pipe mask
>> 0x%x free\n",
>> > +		  free_mask);
>> > +#endif
>> > +
>> > +	return free_mask;
>> > +}
>> > +
>> >  /*
>> >   * @drm_fd: DRM file descriptor
>> >   * @outputs: array of pointers to igt_output_t diff --git
>> > a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
>> > index
>> >
>> a0ab75b2c165084b643ead3f3ffc05cf5364e90b..14083d25c6f09e0577f123130
>> 697
>> > c34c2b6a15e4 100644
>> > --- a/tests/intel/kms_joiner_helper.h
>> > +++ b/tests/intel/kms_joiner_helper.h
>> > @@ -11,6 +11,7 @@
>> >
>> >  void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>> >  					   uint32_t *master_pipes);
>> > +uint32_t igt_get_free_pipes_mask(igt_display_t *display);
>> >  bool igt_assign_pipes_for_outputs(int drm_fd,
>> >  				  igt_output_t **outputs,
>> >  				  int num_outputs,
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
