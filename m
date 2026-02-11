Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC3E9E305
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 13:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CF310E124;
	Wed, 11 Feb 2026 13:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exLm6UMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957D010E124
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770816691; x=1802352691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T4fNEV6NOo54mA2Oud3lR2MPfrCawC0JET99AZax8nY=;
 b=exLm6UMbKzTtI+bNHvNDNOAzE+4qUIlllSvZf1Ij8CGy3GvcivZC6dNz
 5BjRfYzsKN1H+maeG+CF76j3o6bFP8fP2bck9GTs3wfTRZIbWeiZmx30g
 qPrJFVeSfT1AHL8RbK/Sa9dgjy0dFO24MZy1gRa6fCJMEX/mXHawGa+eO
 I1ySa6RBCo7HeaedoF+OUVLOBpMbPhIPD8k4+Ep+jAQjVCe7rvcqkkreD
 f8Qg8p9gy5mLrDTJTnov1X+8BE+6Lywi7s59O2z+TD8fhrzSgK0si4JJw
 r7b6g6IHAETiD0W2ZXkGbZbPQ3cyMNs2qOm0dyaYNq6MaN+Ucpia3r+h1 g==;
X-CSE-ConnectionGUID: xrP3fvNNSEyZR8933gTU2A==
X-CSE-MsgGUID: 3jyaeCkRThWvFi/AfjPJ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97421293"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="97421293"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:31:30 -0800
X-CSE-ConnectionGUID: qwaNC6CxTdKXJZnbTZkMVg==
X-CSE-MsgGUID: 0XCM5MJMTOKaGEtoWNUxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235240255"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:31:26 -0800
Date: Wed, 11 Feb 2026 15:31:23 +0200
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
Message-ID: <aYyEq5jX_FnaP4wm@intel.com>
References: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
 <aSApNt1PwpgrX5E9@intel.com>
 <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
 <aSBBG2n64m65CWLR@intel.com>
 <cb616c5e6c96d838f9dc5dd9c9e7b8110e776cd4.camel@mediatek.com>
 <aSTHiBaIAqNuggbt@intel.com>
 <4beb7387818893db802d5ca90058336cd5059a3f.camel@mediatek.com>
 <aSXiJ0gKJuUMZ0Am@intel.com>
 <c7855c8fb18d4cc622e77706ade501b4b9750b77.camel@mediatek.com>
 <2c3791e090ff1a074a044a5ac1f555e855c56aee.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c3791e090ff1a074a044a5ac1f555e855c56aee.camel@mediatek.com>
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

On Wed, Feb 11, 2026 at 11:24:43AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Wed, 2025-11-26 at 22:40 +0800, Jason-JH.Lin wrote:
> > > > > > > > > 
> > 
> > [snip]
> > 
> > > > > > > > > 
> > > > > > Looking into igt_pipe_commit(), it used
> > > > > > drmModeObjectSetProperty()
> > > > > > to
> > > > > > set property to DRM and it used igt_plane_commit() to
> > > > > > synchronize
> > > > > > all
> > > > > > plane states and only primary plane will call
> > > > > > drmModeSetCrtc().
> > > > > > 
> > > > > > It think the reason we didn't get the new gamma_lut in crtc
> > > > > > state
> > > > > > is
> > > > > > taht set_gamma() will only call igt_pipe_obj_prop_changed()
> > > > > > to
> > > > > > update
> > > > > > pipe_obj->changed flag, but not update plane->changed flag.
> > > > > > In igt_primary_plane_commit_legacy(), it'll return if
> > > > > > primary-
> > > > > > > changed
> > > > > > flag is not set.
> > > > > 
> > > > > The LUT properties are supposed to be on the CRTC. So the plane
> > > > > stuff should not matter, unless you driver is doing something
> > > > > completely non-stanadard.
> > > > > 
> > > > 
> > > > You're right. Plane stuff should not matter to CRTC.
> > > > 
> > > > So I means drmModeSetCrtc() won't be called if plane properties
> > > > is
> > > > not
> > > > set in igt_primary_plane_commit_legacy() currently.
> > > > 
> > > > I think this legacy flow logic:
> > > > {
> > > > 
> > > > if (!igt_plane_is_prop_changed(primary, IGT_PLANE_FB_ID)) &&
> > > >     !(primary->changed & IGT_PLANE_COORD_CHANGED_MASK) &&
> > > >     !igt_pipe_obj_is_prop_changed(primary->pipe,
> > > > IGT_CRTC_MODE_ID))
> > > >         return 0;
> > > > ...
> > > > 
> > > > drmModeSetCrtc()
> > > > 
> > > > ...
> > > > 
> > > > }
> > > > may block LUT properties being synchronized into crtc state when
> > > > we
> > > > only called set_gamma() and not updated any plane properties.
> > > 
> > > That doesn't affect CRTC properties apart from the mode.
> > > For all other CRTC properties drmModeObjectSetProperty()
> > > will be called regardless by igt_pipe_commit().
> > > 
> > 
> > Okay, I checked that drm_mode_obj_set_property_ioctl() called from
> > drmModeObjectSetProperty() will synchronize the CRTC properties, such
> > as, gamm_lut into the CRTC state of atomic_state.
> > 
> > Our drm driver has implemented mode_config.funcs->atomic_commit(), 
> > so maybe we have some bug in our drivers that cause the issue I
> > encountered, the original IGT code should work fine.
> > 
> > I'll check out this later and send the wrapper API if needed.
> > Thanks for the correction and guidance.
> > 
> 
> Finally, I found the issue is that color_mgmt_changed is not set when
> updating gamma_lut, causing gamma changes to not be applied to
> hardware.
> 
> Root cause analysis:
> - When updating GAMMA_LUT, color_mgmt_changed is set correctly.
> - But when a subsequent unrelated property (e.g. VRR_ENABLED) is
> committed, __drm_atomic_helper_crtc_duplicate_state() resets
> color_mgmt_changed=0.
> - This results in crtc->state having gamma_lut but
> color_mgmt_changed=0, so gamma is never applied to hardware.
> 
> DRM framework design:
> - color_mgmt_changed is a per-commit flag, reset on each new commit.
> - Only set if color management properties change.
> - In COMMIT_LEGACY mode (used by IGT), each property is committed
> separately.
> - Unrelated property commits overwrite color_mgmt_changed=1 from
> previous gamma_lut update.
> 
> Solution in MTK DRM driver:
> - Retain color_mgmt_changed if the old state has the flag and color
> management blobs have not changed, preventing it from being overwritten
> by unrelated property commits.

That shouldn't be needed because, as you noted, each property
is commited separately. So the commit resulting from the GAMMA_LUT
setproperty should have already updated the hardware before the
next setproperty commit happens.

-- 
Ville Syrjälä
Intel
