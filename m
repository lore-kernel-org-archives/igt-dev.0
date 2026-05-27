Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB939CD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 14:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792658949C;
	Wed, 27 May 2026 14:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9IXwNNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC98949C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779891771; x=1811427771;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=SupV8915gtQJfdcfgQG+F5tm03xTHn3pmpNGmno8fO0=;
 b=H9IXwNNN3n/03D17MCtktgUxIYxCetQ13KVYr/9lkpJktvmazHcWCOdq
 bUxdw3GUt6QQ3OxiPPEzUYeyK1moe06qwGX26U6HFEGB52iXxOw+Xf/dU
 jsB/lULjgaopmw5GWQUFs3BJxRR82l+/GU4pKUIlvt75pyFaMQFKMm+az
 hZdIuePmGP4X8KKW5Xb9ltSffByjm/0tileKynuvcn1snwcZH6WtwOYbx
 hSGuVnC8HUaIXCHb14vMWsPQA5/cqLLvsnbdmFDDa0npGZXWM0qQXS/QX
 ixUoTOn6QfpIVAyY9gYFMfwQQmX3ceXdGoudY5nqp/xtBDJb1K+Jlm9Kw A==;
X-CSE-ConnectionGUID: N4lxPIU5RbKtNrICIXo0FA==
X-CSE-MsgGUID: BW+IPSGqQIScL6clYo20cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91027999"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91027999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:22:50 -0700
X-CSE-ConnectionGUID: lM3KFT/HTJCnJQYtCrX1Hw==
X-CSE-MsgGUID: OIyZWrZuR4+TcXNW0RPMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="239659994"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.80])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:22:39 -0700
Date: Wed, 27 May 2026 17:22:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
Message-ID: <ahb-KCRgBiZFb0bH@intel.com>
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
 <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
 <DISLAJF1M2CM.34O1ZGNO7XPCJ@intel.com>
 <52f0ee9cddf9c1efdac53691c82f5a147afb8556@intel.com>
 <20260527132247.oqxnekctlpttxoyc@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527132247.oqxnekctlpttxoyc@kamilkon-DESK.igk.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, May 27, 2026 at 03:22:47PM +0200, Kamil Konieczny wrote:
> Hi Jani,
> On 2026-05-26 at 15:07:57 +0300, Jani Nikula wrote:
> > On Tue, 26 May 2026, "Sebastian Brzezinka" <sebastian.brzezinka@intel.com> wrote:
> > > Hi Jani,
> > >
> > > On Tue May 26, 2026 at 1:51 PM CEST, Jani Nikula wrote:
> > >> On Tue, 26 May 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
> > >>> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
> > >>> the given path with O_RDWR, verifies the resulting fd is a DRM device by
> > >>> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
> > >>> (returning -1 and closing on failure), logs the opened device path, and
> > >>> populates the xe_device cache when the device is Xe.
> > >>>
> > >>> The __ prefix signals that the function does not throw assertions or
> > >>> igt_require() calls, consistent with the existing __drm_open_driver*
> > >>> family.
> > >>
> > >> FWIW, I think the __ prefix should indicate "implementation detail,
> > >> don't call directly" or something along those lines.
> > >>
> > >> I think it's problematic to encourage tests to call __ prefixed
> > >> functions.
> 
> 
> > > In general I agree with you, but in v3 Kamil comment on this:
> > > ```
> > >>>Could you rename it into __drm_open_driver_path?
> > >>>The idea is that all __functions should not throw asserts nor
> > >>>require.
> > > ```
> > >
> > > So I added an explanation in the comment.
> > 
> > I obviously disagree with all of that, but *shrug*.
> 
> We could implement separete lib functions for tools but
> that will require duplicate effort.
> 
> The idea with __function is that it should be implemented
> without any igt_assert nor igt_require so tools could use them.
> We could go with function() but then developers could
> later on change behaviour and break a tool.
> 
> Or we could add some suffix to a name? function_safe()?
> 
> Btw why tool/igt_power couldn't just read sysfs? Why does it
> needs to open /dev/dri/card* to get any info? +cc Ville

It opens the device just because lib/igt_power and its
dependencies want the fd.

-- 
Ville Syrjälä
Intel
