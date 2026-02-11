Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8E8E9E2FF
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 12:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0666910E189;
	Wed, 11 Feb 2026 12:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggsXEHPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61C10E189
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770813876; x=1802349876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Tg4otk8o8K8DteBSBfiiPQEdj8NpLqlkIRPhQRtOjAI=;
 b=ggsXEHPzgTBt74YtofGJDbjhrseNrG/aSVNMDLJ35ZVDp+Xj/UINpyMZ
 IYHlQ/rpRwYS9BLy0Xd3Zf8iUc8vZ6dsEf8LM+xLpvJWMiaoYCiE++N5A
 H9RA/QdAQLIvgMAeXz1SrM1TQxxT5cHcDk40JRY7yU5TVnqyZ1UgEzf7O
 E8bDzPkbMkgE31ziBEz9HZQjHu61vqF3BIkt3cNYPn484Bkldod50IpI/
 JSks0HpKjqnH4u6Tr0VE7pP1s+sIykjMLHq69+0l/8HYUI5hp6wrlbuSV
 0vyCT9sQoANop2WtMNDU5hBK+V4yu+JHGsXwq3L8tsOqVY5K2jdc1xr3f g==;
X-CSE-ConnectionGUID: MaPhJDDjSSmibebpqcyp8w==
X-CSE-MsgGUID: 5N04nJJ0SaGnfd+5z8z9Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71165290"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71165290"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:44:35 -0800
X-CSE-ConnectionGUID: sNJmHznYQ+60bpjB5IFa+A==
X-CSE-MsgGUID: YTcwjnzIR0yFAvhNpP6Jug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211623687"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 04:44:33 -0800
Date: Wed, 11 Feb 2026 13:44:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Message-ID: <20260211124430.7phldxmvjqjh5jad@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
 <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
 <aXzMAJT6ffwgpqZW@intel.com>
 <2baaf7f837b254b10688b697c7aaa62056079dce.camel@mediatek.com>
 <aYtqz9P6GC2_xgoq@intel.com>
 <b8f987522a91f8b5d20f634e1e77d349e97fdd17.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8f987522a91f8b5d20f634e1e77d349e97fdd17.camel@mediatek.com>
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

Hi Jason-JH,
On 2026-02-11 at 10:51:21 +0000, Jason-JH Lin (林睿祥) wrote:
> On Tue, 2026-02-10 at 19:28 +0200, Ville Syrjälä wrote:
> > On Sat, Jan 31, 2026 at 11:52:02AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > On Fri, 2026-01-30 at 17:19 +0200, Ville Syrjälä wrote:
> > > 
> > > [snip]
> > > 
> > > > > > >  	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> > > > > > > +		double fixed_ctm[CTM_SIZE];
> > > > > > > +		const double *ctm_ptr = ctm_tests[i].ctm;
> > > > > > > +
> > > > > > > +		/* The valid value of MediaTek color
> > > > > > > matrix
> > > > > > > range
> > > > > > > is -2.0 ~ 2.0 */
> > > > > > > +		if (is_mtk_device(data->drm_fd)) {
> > > > > > > +			int j;
> > > > > > > +
> > > > > > > +			for (j = 0; j < CTM_SIZE; j++)
> > > > > > > +				fixed_ctm[j] =
> > > > > > > clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
> > > > > > > +
> > > > > > > +			ctm_ptr = fixed_ctm;
> > > > > > > +		}
> > > > > > 
> > > > > > The kernel is supposed to clamp this.
> > > > > 
> > > > > Thanks for the reviews!
> > > > > 
> > > > > The reason I added the clamp in here is that, without it, IGT
> > > > > will
> > > > > generate a reference framebuffer using CTM=100.0 on the CPU
> > > > > side,
> > > > > then
> > > > > send CTM1.0 to kernel.
> > > > > IGT will generate another framebuffer using CTM=1.0, then send
> > > > > CTM=100.0 to the kernel.
> > > > > 
> > > > > The kernel will clamp the CTM from 100.0 to 2.0 due to hardware
> > > > > limits,
> > > > > so the hardware output will not match the CPU-generated
> > > > > reference,
> > > > > resulting in a CRC mismatch and a test failure.
> > > > > 
> > > > > Therefore, I think I need to clamp CTM from 100.0 to 2.0 before
> > > > > IGT
> > > > > generating a reference framebuffer on CPU side.
> > > > 
> > > > IIRC the way the test does things is that with the 100.0 (or
> > > > whatever >1.0) the colors should end up fully saturated anyway.
> > > > So whether it used 2.0 or 100.0 shouldn't matter.
> > > > 
> > > For MTK hardware, CTM values between 1.0 and 2.0 result in a gain
> > > effect, while values between 0 and 1.0 cause attenuation. Values
> > > above
> > > 2.0 are not supported by the hardware.
> > > 
> > > Therefore, if the reference framebuffer generated by the CPU using
> > > CTM
> > > 2.0 does not match the hardware’s output, the CRC should
> > > theoretically
> > > be different. However, in our current tests, the CRC results for
> > > CTM
> > > 2.0 are actually identical.
> > > 
> > > This means that CTM values greater than 1.0 may not be equivalent
> > > to
> > > CTM 1.0 in terms of output.
> > 
> > As I said IIRC the max-ctm test should only generate fully saturated
> > colors for any value >=1.0. So it shouldn't matter what the hardware
> > max is as long as it's >=1.0.
> > 
> 
> I conducted some experiments and confirmed that what you said is
> correct.
> 
> When the IGT test CTM value is greater than or equal to 1.0, the CPU
> always draws a pattern where all RGB channels are filled.
> 
> Therefore, regardless of the hardware CTM value setting, as long as it
> is greater than or equal to 1.0, the calculated RGB channels will
> always be full, resulting in the same CRC checksum result.
> 
> I found the previous ctm-max failure was due to a 10-bits issue, so
> please drop this patch and apply the first 10-bit patch in this
> series. 
> 
> Thank you for your patience and corrections.
> 
> Regards,
> Jason-JH Lin
> 

Thank you all, I merged 2nd patch.

Regards,
Kamil

