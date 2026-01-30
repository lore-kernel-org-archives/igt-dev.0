Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93468E6BF1D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 15:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A76D10E02F;
	Fri, 30 Jan 2026 15:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA3NPPEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E9310E02F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786376; x=1801322376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S7n7XeGMx3AwsU8Rmpb6wNPtYBLyaD7+syrkopjvoqk=;
 b=oA3NPPEwA9WIvEgnR0P/Di3Qq/2e3q3RSwU1EpGyUaNMu84iBHEupptM
 SHcTKQq4l6X+fbMTx8/JwS2Ob1sPvxetI2ROHICNj7KAJM8FbKF2yT7sT
 4y9tHX1pIUXIIyw5sytvT5BG9I3jSwojCphAXnDD8U7OU+/GCTAkgnz0g
 vhR+SVe03tVgjo6T65Ef8d7Q7d/b8eFzI3CYu2CYv+U7kcYETFdMIqQHg
 ISnKc/0qPR6+0vzdpLz7/S8Py2I9POlFULHSvlWFUe7+TRpxDikouK6c7
 N+xRO/sp8o7xmoRF/WzQ0YY5x/CwMmmmjJ3JEue2sMeE+6farZlWG2lY9 A==;
X-CSE-ConnectionGUID: 4IzV5TaaTjGitqNoUycA7A==
X-CSE-MsgGUID: SWyMvMnNQTmCI/ME+oQaXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71091932"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71091932"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:19:35 -0800
X-CSE-ConnectionGUID: YdEI5ntMS9O8kZ8WHSwO5w==
X-CSE-MsgGUID: HyxEUzpFRryglk9jic7FUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="212953070"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:19:32 -0800
Date: Fri, 30 Jan 2026 17:19:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Message-ID: <aXzMAJT6ffwgpqZW@intel.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
 <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
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

On Fri, Jan 30, 2026 at 01:32:05PM +0000, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2026-01-29 at 13:15 +0200, Ville Syrjälä wrote:
> > On Wed, Jan 28, 2026 at 04:24:42PM +0800, Jason-JH Lin wrote:
> > > Use clamp to restrict CTM matrix values to the -2.0 to 2.0 range
> > > for
> > > MediaTek devices, ensuring tests do not exceed hardware limits.
> > > 
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  tests/kms_color.c | 19 +++++++++++++++++--
> > >  1 file changed, 17 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > > index b2ca6975d6a5..c6cd35d74a2f 100644
> > > --- a/tests/kms_color.c
> > > +++ b/tests/kms_color.c
> > > @@ -76,6 +76,8 @@
> > >   * @gamma-lut:          Gamma LUT
> > >   */
> > >  
> > > +#define CTM_SIZE		(9)
> > > +
> > >  IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> > >  
> > >  static bool test_pipe_degamma(data_t *data,
> > > @@ -1025,7 +1027,7 @@ run_tests_for_pipe(data_t *data)
> > >  		const char *name;
> > >  		int iter;
> > >  		const color_t *fb_colors;
> > > -		double ctm[9];
> > > +		double ctm[CTM_SIZE];
> > >  		const char *desc;
> > >  	} ctm_tests[] = {
> > >  		{ .name = "ctm-red-to-blue",
> > > @@ -1128,6 +1130,19 @@ run_tests_for_pipe(data_t *data)
> > >  	}
> > >  
> > >  	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> > > +		double fixed_ctm[CTM_SIZE];
> > > +		const double *ctm_ptr = ctm_tests[i].ctm;
> > > +
> > > +		/* The valid value of MediaTek color matrix range
> > > is -2.0 ~ 2.0 */
> > > +		if (is_mtk_device(data->drm_fd)) {
> > > +			int j;
> > > +
> > > +			for (j = 0; j < CTM_SIZE; j++)
> > > +				fixed_ctm[j] =
> > > clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
> > > +
> > > +			ctm_ptr = fixed_ctm;
> > > +		}
> > 
> > The kernel is supposed to clamp this.
> 
> Thanks for the reviews!
> 
> The reason I added the clamp in here is that, without it, IGT will
> generate a reference framebuffer using CTM=100.0 on the CPU side, then
> send CTM1.0 to kernel.
> IGT will generate another framebuffer using CTM=1.0, then send
> CTM=100.0 to the kernel.
> 
> The kernel will clamp the CTM from 100.0 to 2.0 due to hardware limits,
> so the hardware output will not match the CPU-generated reference,
> resulting in a CRC mismatch and a test failure.
> 
> Therefore, I think I need to clamp CTM from 100.0 to 2.0 before IGT
> generating a reference framebuffer on CPU side.

IIRC the way the test does things is that with the 100.0 (or
whatever >1.0) the colors should end up fully saturated anyway.
So whether it used 2.0 or 100.0 shouldn't matter.

-- 
Ville Syrjälä
Intel
