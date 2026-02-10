Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5CFEB26F2
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 17:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C910C10E5C7;
	Tue, 10 Feb 2026 17:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPRqQqqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545D10E5C7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770744535; x=1802280535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9dzSboHaoBLCbbwWb5atLNP/aqmDFxFbjjEP/GjOqsM=;
 b=jPRqQqqYAmm7w5ybUqbT9EneMNfSbffilSzbE37IMCF82Q7HU0OUBoMX
 NB5/6BN1AZlrk1/7UXbG2/d+hnsttxf4yQhjHUrROKhJgkjlXKOJRM1EP
 X2cHhlb4jgna0yIDKKLalwxd8nOue8D+9ZH7QdPFnuNiNpdiicX8Ilc41
 vFIyFOMYDM6jb5uuLd1D72TCZK+FHyGYeWey2gqb0OQTeLvvCRv6rMM2r
 N2saMqDm16h2tPHY0Ceu8uLYFpI+76rKe5STB3yQHzs5zfJGGkP9hEyFY
 0A+nelhSklMkXlPXosL97oUqYfMELFgES8zH/7Rr+NvsR43eb514FcJlg Q==;
X-CSE-ConnectionGUID: wVfqepSBT2S/ZxQJsyaexQ==
X-CSE-MsgGUID: Oqth1cIhSxmZ6b+OldNFtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71867419"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71867419"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:28:54 -0800
X-CSE-ConnectionGUID: 6anj9oU5Ta6e3SA4xu67Nw==
X-CSE-MsgGUID: FUykWmwSTuatm9tr88aYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216943327"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:28:50 -0800
Date: Tue, 10 Feb 2026 19:28:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Message-ID: <aYtqz9P6GC2_xgoq@intel.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
 <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
 <aXzMAJT6ffwgpqZW@intel.com>
 <2baaf7f837b254b10688b697c7aaa62056079dce.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2baaf7f837b254b10688b697c7aaa62056079dce.camel@mediatek.com>
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

On Sat, Jan 31, 2026 at 11:52:02AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Fri, 2026-01-30 at 17:19 +0200, Ville Syrjälä wrote:
> 
> [snip]
> 
> > > > >  	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> > > > > +		double fixed_ctm[CTM_SIZE];
> > > > > +		const double *ctm_ptr = ctm_tests[i].ctm;
> > > > > +
> > > > > +		/* The valid value of MediaTek color matrix
> > > > > range
> > > > > is -2.0 ~ 2.0 */
> > > > > +		if (is_mtk_device(data->drm_fd)) {
> > > > > +			int j;
> > > > > +
> > > > > +			for (j = 0; j < CTM_SIZE; j++)
> > > > > +				fixed_ctm[j] =
> > > > > clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
> > > > > +
> > > > > +			ctm_ptr = fixed_ctm;
> > > > > +		}
> > > > 
> > > > The kernel is supposed to clamp this.
> > > 
> > > Thanks for the reviews!
> > > 
> > > The reason I added the clamp in here is that, without it, IGT will
> > > generate a reference framebuffer using CTM=100.0 on the CPU side,
> > > then
> > > send CTM1.0 to kernel.
> > > IGT will generate another framebuffer using CTM=1.0, then send
> > > CTM=100.0 to the kernel.
> > > 
> > > The kernel will clamp the CTM from 100.0 to 2.0 due to hardware
> > > limits,
> > > so the hardware output will not match the CPU-generated reference,
> > > resulting in a CRC mismatch and a test failure.
> > > 
> > > Therefore, I think I need to clamp CTM from 100.0 to 2.0 before IGT
> > > generating a reference framebuffer on CPU side.
> > 
> > IIRC the way the test does things is that with the 100.0 (or
> > whatever >1.0) the colors should end up fully saturated anyway.
> > So whether it used 2.0 or 100.0 shouldn't matter.
> > 
> For MTK hardware, CTM values between 1.0 and 2.0 result in a gain
> effect, while values between 0 and 1.0 cause attenuation. Values above
> 2.0 are not supported by the hardware.
> 
> Therefore, if the reference framebuffer generated by the CPU using CTM
> 2.0 does not match the hardware’s output, the CRC should theoretically
> be different. However, in our current tests, the CRC results for CTM
> 2.0 are actually identical.
> 
> This means that CTM values greater than 1.0 may not be equivalent to
> CTM 1.0 in terms of output.

As I said IIRC the max-ctm test should only generate fully saturated
colors for any value >=1.0. So it shouldn't matter what the hardware
max is as long as it's >=1.0.

-- 
Ville Syrjälä
Intel
