Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3528EB48F8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 11:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A0110E728;
	Thu, 12 Feb 2026 11:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbCFQVSh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D351610E728
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770897449; x=1802433449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wXIJn7vJuJhri/e4yEZgGILExn85LBosjqbA4wTh+Hk=;
 b=BbCFQVSh5xPk7vfOXMHEeSQKg8LIzMHvg6OFYQAXdwSyFgM/dKw/b3iM
 02Ytkjliccd51nOUICT0vm0p4J/fDZYIqEsVLMqUHUSBn/VFBULXQmbD5
 kE/A8+OWSqEPUIXGo34c4Y14pfST45uyeiW0J/v3xqDPAQ8oAsdmNCpud
 ruRudo86JxL8qJywsw98ZBXcF4vp/SRJDj8nhGWnAedEnJSGAS1wa41Vz
 mlFxJQocFvkJki5LmWxA/4g5DHc7Zv2e7tEr6dPQBRd0l/9cK9RpI5JfB
 a6lzg/YZ4hXBfuw/qzO7XqiR4QXPRjgaVmn1b3a9bITMQU7WHpvHAn0aR A==;
X-CSE-ConnectionGUID: yPTnYEcPQ2WkBwZCKjz4bw==
X-CSE-MsgGUID: vM2mpvVLSFOvzkSZX2jxOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="94707302"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="94707302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:57:28 -0800
X-CSE-ConnectionGUID: 7DCYaNxhSVyRK8c+M1o6oQ==
X-CSE-MsgGUID: gzNq6eNRQDyF64ifCGMCCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212408600"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:57:24 -0800
Date: Thu, 12 Feb 2026 13:57:21 +0200
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
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Message-ID: <aY3AIdkuWevKbr3y@intel.com>
References: <0a2d25af2c0ba3c5bc26e445a46413c90a77a19e.camel@mediatek.com>
 <aSBBG2n64m65CWLR@intel.com>
 <cb616c5e6c96d838f9dc5dd9c9e7b8110e776cd4.camel@mediatek.com>
 <aSTHiBaIAqNuggbt@intel.com>
 <4beb7387818893db802d5ca90058336cd5059a3f.camel@mediatek.com>
 <aSXiJ0gKJuUMZ0Am@intel.com>
 <c7855c8fb18d4cc622e77706ade501b4b9750b77.camel@mediatek.com>
 <2c3791e090ff1a074a044a5ac1f555e855c56aee.camel@mediatek.com>
 <aYyEq5jX_FnaP4wm@intel.com>
 <6cf344b28efd90e64e391d9768e6df458c3110d1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cf344b28efd90e64e391d9768e6df458c3110d1.camel@mediatek.com>
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

On Thu, Feb 12, 2026 at 10:15:50AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > [snip]
> > > > 
> > > > Okay, I checked that drm_mode_obj_set_property_ioctl() called
> > > > from
> > > > drmModeObjectSetProperty() will synchronize the CRTC properties,
> > > > such
> > > > as, gamm_lut into the CRTC state of atomic_state.
> > > > 
> > > > Our drm driver has implemented mode_config.funcs-
> > > > >atomic_commit(), 
> > > > so maybe we have some bug in our drivers that cause the issue I
> > > > encountered, the original IGT code should work fine.
> > > > 
> > > > I'll check out this later and send the wrapper API if needed.
> > > > Thanks for the correction and guidance.
> > > > 
> > > 
> > > Finally, I found the issue is that color_mgmt_changed is not set
> > > when
> > > updating gamma_lut, causing gamma changes to not be applied to
> > > hardware.
> > > 
> > > Root cause analysis:
> > > - When updating GAMMA_LUT, color_mgmt_changed is set correctly.
> > > - But when a subsequent unrelated property (e.g. VRR_ENABLED) is
> > > committed, __drm_atomic_helper_crtc_duplicate_state() resets
> > > color_mgmt_changed=0.
> > > - This results in crtc->state having gamma_lut but
> > > color_mgmt_changed=0, so gamma is never applied to hardware.
> > > 
> > > DRM framework design:
> > > - color_mgmt_changed is a per-commit flag, reset on each new
> > > commit.
> > > - Only set if color management properties change.
> > > - In COMMIT_LEGACY mode (used by IGT), each property is committed
> > > separately.
> > > - Unrelated property commits overwrite color_mgmt_changed=1 from
> > > previous gamma_lut update.
> > > 
> > > Solution in MTK DRM driver:
> > > - Retain color_mgmt_changed if the old state has the flag and color
> > > management blobs have not changed, preventing it from being
> > > overwritten
> > > by unrelated property commits.
> > 
> > That shouldn't be needed because, as you noted, each property
> > is commited separately. So the commit resulting from the GAMMA_LUT
> > setproperty should have already updated the hardware before the
> > next setproperty commit happens.
> > 
> 
> But what I notice in the DRM driver is that GAMMA_LUT setproperty won't
> update the hardware immediately until other properties are set in the
> same atomic_flush().

Then you must have a bug somewhere. Each ioctl should
result in an atomic commit.

> 
> Here is the log from my notice:
> 
> [ 2021.157476] [Jason] set_property_atomic START: prop=GAMMA_LUT,
> val=125
> [ 2021.157478] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: OLD gamma_lut=0000000000000000 (id=0),
> ctm=0000000000000000
> [ 2021.157480] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: NEW gamma_lut=0000000000000000 (id=0),
> ctm=0000000000000000
> [ 2021.157481] [Jason] crtc_set_property: CRTC 0, prop=GAMMA_LUT,
> val=125
> [ 2021.157482] BEFORE set: state->gamma_lut=0000000000000000 (id=0)
> 
> [ 2021.157484] BEFORE set: state->ctm=0000000000000000 (id=0)
> [ 2021.157485] BEFORE set: state->color_mgmt_changed=0
> [ 2021.157486] [Jason] AFTER gamma_lut set: replaced=1,
> color_mgmt_changed=1
> [ 2021.157487] AFTER set: state->gamma_lut=00000000602291e1 (id=125)
> [ 2021.157489] [Jason] swap_state: CRTC 0
> [ 2021.157490] BEFORE swap: crtc->state->gamma_lut=0000000000000000
> (id=0)
> [ 2021.157491] BEFORE swap: crtc->state->ctm=0000000000000000 (id=0)
> [ 2021.157492] BEFORE swap: crtc->state->color_mgmt_changed=1
> [ 2021.157493] ATOMIC STATE: new_crtc_state->gamma_lut=00000000602291e1
> (id=125)
> [ 2021.157495] ATOMIC STATE: new_crtc_state->ctm=0000000000000000
> (id=0)
> [ 2021.157496] ATOMIC STATE: new_crtc_state->color_mgmt_changed=1
> [ 2021.157497] [Jason] set_property_atomic COMMIT SUCCESS:
> prop=GAMMA_LUT
> 
> [ 2021.157499] [Jason] set_property_atomic START: prop=VRR_ENABLED,
> val=0
> [ 2021.157501] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: OLD gamma_lut=00000000602291e1 (id=125),
> ctm=0000000000000000
> [ 2021.157503] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: NEW gamma_lut=00000000602291e1 (id=125),
> ctm=0000000000000000
> [ 2021.157504] [Jason] crtc_set_property: CRTC 0, prop=VRR_ENABLED,
> val=0
> [ 2021.157505] BEFORE set: state->gamma_lut=00000000602291e1 (id=125)
> [ 2021.157506] BEFORE set: state->ctm=0000000000000000 (id=0)
> [ 2021.157508] BEFORE set: state->color_mgmt_changed=0
> [ 2021.157509] [Jason] swap_state: CRTC 0
> [ 2021.157510] BEFORE swap: crtc->state->gamma_lut=00000000602291e1
> (id=125)
> [ 2021.157512] BEFORE swap: crtc->state->ctm=0000000000000000 (id=0)
> [ 2021.157513] BEFORE swap: crtc->state->color_mgmt_changed=1
> [ 2021.157514] ATOMIC STATE: new_crtc_state->gamma_lut=00000000602291e1
> (id=125)
> [ 2021.157515] ATOMIC STATE: new_crtc_state->ctm=0000000000000000
> (id=0)
> [ 2021.157517] ATOMIC STATE: new_crtc_state->color_mgmt_changed=0
> [ 2021.157518] [Jason] set_property_atomic COMMIT SUCCESS:
> prop=VRR_ENABLED
> 
> [ 2021.157530] [Jason] set_property_atomic START: prop=rotation, val=1
> [ 2021.157535] [Jason] set_property_atomic COMMIT SUCCESS:
> prop=rotation
> [ 2021.157587] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: OLD gamma_lut=00000000602291e1 (id=125),
> ctm=0000000000000000
> [ 2021.157589] mediatek-drm mediatek-drm.7.auto: [Jason]
> duplicate_state: NEW gamma_lut=00000000602291e1 (id=125),
> ctm=0000000000000000
> [ 2021.157605] [Jason] swap_state: CRTC 0
> 
> [ 2021.157606] BEFORE swap: crtc->state->gamma_lut=00000000602291e1
> (id=125)
> [ 2021.157607] BEFORE swap: crtc->state->ctm=0000000000000000 (id=0)
> [ 2021.157608] BEFORE swap: crtc->state->color_mgmt_changed=0
> [ 2021.157609] ATOMIC STATE: new_crtc_state->gamma_lut=00000000602291e1
> (id=125)
> [ 2021.157611] ATOMIC STATE: new_crtc_state->ctm=0000000000000000
> (id=0)
> [ 2021.157612] ATOMIC STATE: new_crtc_state->color_mgmt_changed=0
> [ 2021.157970] mediatek-disp-pmqos mediatek-disp-pmqos.20.auto:
> mtk_disp_pmqos_set_mmclk[196] final_level(freq=3, 624000000)
> [ 2021.361663] mediatek-drm mediatek-drm.7.auto: [Jason] atomic_flush:
> color_mgmt_changed=0, gamma_lut=00000000602291e1, ctm=0000000000000000
> 
> 
> From the log above, color_mgmt_changed will be reset to 0 after
> VRR_ENABLED setproperty and swap crtc_state.
> 
> But if we use atomic_commit from IGT, then this won't happen.
> 
> Regards,
> Jason-JH Lin

-- 
Ville Syrjälä
Intel
