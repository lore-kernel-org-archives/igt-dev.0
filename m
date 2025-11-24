Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B826CFD356
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 21:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4410E25A;
	Mon, 24 Nov 2025 21:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgUl88NA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E4E10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764018063; x=1795554063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2Va5VKSQAhG1PMP7fzJtFc6fljxttF2vi63JmpTXwgc=;
 b=AgUl88NABJ6kJcp+HkU5DvY+jfTqrGfGzvWy9gyQGEOc5EDEtEdZLTZ6
 d9qQyEJ5eyZ4O6jTkYQJHasOezz12KuxHeyV1bCrWtz7WzJd+VFmpn0G4
 RsUtk8lMPTU9FnBGJ28d6o2trtGsmEhxgmPaaKcGrCS12qtUP2MPP1Pu4
 WhuDFEfAHQITpiDK3/viR6p1l2Xz81PQqTMisJ+3y59/PHX8tXihYmwMM
 tOS66jfWUFwLhTLadwN5JdlRqjL4u6yJlDToRFbTfsrTET+fhRy1wc0R5
 ELtwAYbGn4VxjTUkC5ARAdt7ps0gnZHb0r2bJ+eEJ4Ad337II8MjhU8DA g==;
X-CSE-ConnectionGUID: xGcG1rX6Q3+7wftxDCYBWg==
X-CSE-MsgGUID: O8Fy/7A5TXi7o99siOADjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69895770"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="69895770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:01:03 -0800
X-CSE-ConnectionGUID: /NBKQxFMTDaPrX07Hlz8Ng==
X-CSE-MsgGUID: sKLBDxLfRwyou04vPwAXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192246037"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO localhost)
 ([10.124.222.165])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:00:59 -0800
Date: Mon, 24 Nov 2025 23:00:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Message-ID: <aSTHiBaIAqNuggbt@intel.com>
References: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
 <aSApNt1PwpgrX5E9@intel.com>
 <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
 <aSBBG2n64m65CWLR@intel.com>
 <cb616c5e6c96d838f9dc5dd9c9e7b8110e776cd4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb616c5e6c96d838f9dc5dd9c9e7b8110e776cd4.camel@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Nov 24, 2025 at 06:47:27AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Fri, 2025-11-21 at 12:38 +0200, Ville Syrjälä wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Fri, Nov 21, 2025 at 09:47:52AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > Hi Ville,
> > > 
> > > Thanks for your rapid reply.
> > > 
> > > On Fri, 2025-11-21 at 10:56 +0200, Ville Syrjälä wrote:
> > > > 
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > > 
> > > > 
> > > > On Fri, Nov 21, 2025 at 03:53:54PM +0800, Jason-JH Lin wrote:
> > > > > When a driver makes use of gamma_lut, degamma_lut, or ctm
> > > > > properties
> > > > > from crtc state, these properties are applied only via atomic
> > > > > commit.
> > > > > This change ensures all relevant properties are properly
> > > > > synchronized
> > > > > to crtc state during testing.
> > > > > 
> > > > > All upstream drivers that support color management properties
> > > > > also
> > > > > support atomic commits, so legacy commit handling in kms_color
> > > > > is
> > > > > no
> > > > > longer needed.
> > > > 
> > > > Incorrect.
> > > 
> > > The conclusion is refer from:
> > > https://patchwork.freedesktop.org/patch/254752/?series=50539&rev=1
> > > 
> > > I'll remove it because I'm not sure for this.
> > > 
> > > > 
> > > > But rather than spreading the current mess even further, I think
> > > > what we want is a igt_display_commit() variant that takes care of
> > > > the is_atomic check. So add that, blast it over all the existing
> > > > places that do the check by hand (with cocci/sed/etc), and
> > > > and then look at using it for new stuff like this where it
> > > > probably makes sense to use atomic when available.
> > > > 
> > > 
> > > Sorry for missing you in the cc loop.
> > > Does my previous version of this patch satisfy this?
> > > https://patchwork.freedesktop.org/patch/687863
> > 
> > I meant that you should add some kind of
> >  igt_display_commit_something()
> >  {
> >         igt_display_commit2(display, display->is_atomic ?
> > COMMIT_ATOMIC : COMMIT_LEGACY);
> >  }
> > wrapper thingy, and deploy it everwhere that currently
> > has that is_atomic check open coded. I guess the real problem
> > is coming up with a name... igt_display_commit_auto() maybe?
> > 
> 
> Got it, I'll use a wrapper API "igt_disaply_commit_auto()" in the next
> version.
> 
> > > 
> > > > > 
> > > > > Update the test logic to always use igt_display_commit_atomic
> > > > > with
> > > > > DRM_MODE_ATOMIC_ALLOW_MODESET for all color management
> > > > > operations.
> > > > > This simplifies code and guarantees correct validation of
> > > > > gamma,
> > > > > degamma, and ctm properties.
> > > > 
> > > > What do you mean with "guarantees correct validation"? The
> > > > current
> > > > code works just fine AFAIK.
> > > 
> > > I have encountered that GAMM_LUT drm property is not updated into
> > > the
> > > gamma_lut struct in drm_crtc_state via igt_disaply_commit().
> > > 
> > > I found igt_disaply_commit() will finally call
> > > drmModeObjectSetProperty() and igt_plane_commit() in
> > > igt_pipe_commit().
> > > These functions will set GAMM_LUT property to drm driver but they
> > > won't
> > > update the gamma_lut struct in crtc state. So our GAMMA driver
> > > won't do
> > > anything when running these IGT KmsColorTest.
> > 
> > Whether the commit comes via that atomic ioctl or the setproperty
> > ioctl
> > the same exact code gets used to update the blobs in the crtc state,
> > and then the driver's atomic hooks get called in exactly the same
> > way.
> > 
> > But with the non-atomic igt commit you obviously will see multiple
> > commits coming into the kernel, and you won't see the full state in
> > the kernel until all the commits are done.
> > 
> > So if you're saying that the crtc state gamma blob didn't have the
> > expected new stuff in it, then I think you were either looking at
> > the state before all the commits had arrived, or you have some kind
> > of driver bug where the state gets corrupted.
> > 
> 
> Looking into igt_pipe_commit(), it used drmModeObjectSetProperty() to
> set property to DRM and it used igt_plane_commit() to synchronize all
> plane states and only primary plane will call drmModeSetCrtc().
> 
> It think the reason we didn't get the new gamma_lut in crtc state is
> taht set_gamma() will only call igt_pipe_obj_prop_changed() to update
> pipe_obj->changed flag, but not update plane->changed flag.
> In igt_primary_plane_commit_legacy(), it'll return if primary->changed
> flag is not set.

The LUT properties are supposed to be on the CRTC. So the plane
stuff should not matter, unless you driver is doing something
completely non-stanadard.

-- 
Ville Syrjälä
Intel
