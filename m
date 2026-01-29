Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0ADD6100C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAB010E102;
	Thu, 29 Jan 2026 11:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp5G0XNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA91810E102
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769686944; x=1801222944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KwYtFhkQIPaBr2OJ2CH79d59ipjdSKJqlZssBCyBf4M=;
 b=Fp5G0XNxcAlEjmo8R/jfaJ0enEk8GyyF8blEC6yxgQQ7PHn6h1iOAyNx
 4XSyjW4zxJfPuaJHIG/tTWxsbn855+AuOPzFYGhx2OVx5utARv6E9lh7I
 ZAcijsAuZdv+sisS6NEvglBID0/ylv7LohDoFIisSOaNcpYQgrYvFrEII
 cXbB1F57voqrTjOAl1+WI06YGf0vvICcuspt8wQ5nkXttXVb4bkZQnB+c
 m0GETDy+ySaKw41lBOffhsMACyNGIIPUze/iwFIBgJWQRkS11gtiCNb9l
 SmvNy4bpkBNVU73aU71ZJPYdveAe+IXuNCpNFZW8l5XAvM4Tgj6TJlzFE g==;
X-CSE-ConnectionGUID: bVvo61bvTO+gUE6Bu8dSDw==
X-CSE-MsgGUID: BCu4SYdjQRixeXBIDkZs3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81239726"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="81239726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:42:24 -0800
X-CSE-ConnectionGUID: DhmTVL9rTte/r2rg8XWPVA==
X-CSE-MsgGUID: aDP3Yuq9RRGUNXAXK51R0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="207675701"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:42:21 -0800
Date: Thu, 29 Jan 2026 12:42:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Message-ID: <20260129114218.fzaxnqzindls6gud@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXtBQd_hHu3OgCG6@intel.com>
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

Hi Ville,
On 2026-01-29 at 13:15:13 +0200, Ville Syrjälä wrote:
> On Wed, Jan 28, 2026 at 04:24:42PM +0800, Jason-JH Lin wrote:
> > Use clamp to restrict CTM matrix values to the -2.0 to 2.0 range for
> > MediaTek devices, ensuring tests do not exceed hardware limits.
> > 
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > ---
> >  tests/kms_color.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > index b2ca6975d6a5..c6cd35d74a2f 100644
> > --- a/tests/kms_color.c
> > +++ b/tests/kms_color.c
> > @@ -76,6 +76,8 @@
> >   * @gamma-lut:          Gamma LUT
> >   */
> >  
> > +#define CTM_SIZE		(9)
> > +
> >  IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> >  
> >  static bool test_pipe_degamma(data_t *data,
> > @@ -1025,7 +1027,7 @@ run_tests_for_pipe(data_t *data)
> >  		const char *name;
> >  		int iter;
> >  		const color_t *fb_colors;
> > -		double ctm[9];
> > +		double ctm[CTM_SIZE];
> >  		const char *desc;
> >  	} ctm_tests[] = {
> >  		{ .name = "ctm-red-to-blue",
> > @@ -1128,6 +1130,19 @@ run_tests_for_pipe(data_t *data)
> >  	}
> >  
> >  	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> > +		double fixed_ctm[CTM_SIZE];
> > +		const double *ctm_ptr = ctm_tests[i].ctm;
> > +
> > +		/* The valid value of MediaTek color matrix range is -2.0 ~ 2.0 */
> > +		if (is_mtk_device(data->drm_fd)) {
> > +			int j;
> > +
> > +			for (j = 0; j < CTM_SIZE; j++)
> > +				fixed_ctm[j] = clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
> > +
> > +			ctm_ptr = fixed_ctm;
> > +		}
> 
> The kernel is supposed to clamp this.
> 

Thank you for looing into this, is second patch ok?

Regards,
Kamil

> > +
> >  		igt_describe_f("%s", ctm_tests[i].desc);
> >  		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
> >  			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
> > @@ -1135,7 +1150,7 @@ run_tests_for_pipe(data_t *data)
> >  					      igt_output_name(data->output))
> >  					run_ctm_tests_for_pipe(data, pipe,
> >  							       ctm_tests[i].fb_colors,
> > -							       ctm_tests[i].ctm,
> > +							       ctm_ptr,
> >  							       ctm_tests[i].iter);
> >  				if (igt_run_in_simulation())
> >  					break;
> > -- 
> > 2.43.0
> 
> -- 
> Ville Syrjälä
> Intel
