Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A855CD358FF
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADCD10E102;
	Thu, 29 Jan 2026 11:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrgvS5TQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D6A10E102
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769685321; x=1801221321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oHTYdwVLSlrhOK6sA6hFjbyIL+qjAOjq7v2aUKsqFwA=;
 b=lrgvS5TQRxau7zMfRFv1G8/vdbqdxHHKjngTVXj1RX6VJWXWPI8hLUW0
 VxtIb8e2Q0rufCoJm34RSvXaDdieIwsTiaD0QSd0AZyCX5BSYRajtWG7A
 Jhb3KYOJyOSAc4VKHZEEagQNi4eqCCjaV65A7qxmJZu3Cl7bUFRBM0iWt
 sL+2bwh9yUAoyYPNVo50XdlYlrHfHyPzutoFR4+BBeyWgMDXLjJYHQjyJ
 FPQKnv21LO74fxVg6sM0zIMYz2utC8iTM7t2rVJjWb/jES+5bmeRT/9zX
 OsQ+jJb8vwuXkq3PMNTPoRwCz9qHcHR3t8NaxHLb1kkpKGY8AQkIL0BGj Q==;
X-CSE-ConnectionGUID: X9WhSVe6R/egvKZsk1bXJw==
X-CSE-MsgGUID: vkm/qX4HRtChYPCrMwZ3nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70960452"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70960452"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:15:20 -0800
X-CSE-ConnectionGUID: 9/RE3BxaRFaEzGI2PdE/oQ==
X-CSE-MsgGUID: 3twocmxFRmCEoMX1a2rfPw==
X-ExtLoop1: 1
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.86])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:15:16 -0800
Date: Thu, 29 Jan 2026 13:15:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Message-ID: <aXtBQd_hHu3OgCG6@intel.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128082517.920321-2-jason-jh.lin@mediatek.com>
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

On Wed, Jan 28, 2026 at 04:24:42PM +0800, Jason-JH Lin wrote:
> Use clamp to restrict CTM matrix values to the -2.0 to 2.0 range for
> MediaTek devices, ensuring tests do not exceed hardware limits.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_color.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b2ca6975d6a5..c6cd35d74a2f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -76,6 +76,8 @@
>   * @gamma-lut:          Gamma LUT
>   */
>  
> +#define CTM_SIZE		(9)
> +
>  IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>  
>  static bool test_pipe_degamma(data_t *data,
> @@ -1025,7 +1027,7 @@ run_tests_for_pipe(data_t *data)
>  		const char *name;
>  		int iter;
>  		const color_t *fb_colors;
> -		double ctm[9];
> +		double ctm[CTM_SIZE];
>  		const char *desc;
>  	} ctm_tests[] = {
>  		{ .name = "ctm-red-to-blue",
> @@ -1128,6 +1130,19 @@ run_tests_for_pipe(data_t *data)
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
> +		double fixed_ctm[CTM_SIZE];
> +		const double *ctm_ptr = ctm_tests[i].ctm;
> +
> +		/* The valid value of MediaTek color matrix range is -2.0 ~ 2.0 */
> +		if (is_mtk_device(data->drm_fd)) {
> +			int j;
> +
> +			for (j = 0; j < CTM_SIZE; j++)
> +				fixed_ctm[j] = clamp(ctm_tests[i].ctm[j], -2.0, 2.0);
> +
> +			ctm_ptr = fixed_ctm;
> +		}

The kernel is supposed to clamp this.

> +
>  		igt_describe_f("%s", ctm_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>  			for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
> @@ -1135,7 +1150,7 @@ run_tests_for_pipe(data_t *data)
>  					      igt_output_name(data->output))
>  					run_ctm_tests_for_pipe(data, pipe,
>  							       ctm_tests[i].fb_colors,
> -							       ctm_tests[i].ctm,
> +							       ctm_ptr,
>  							       ctm_tests[i].iter);
>  				if (igt_run_in_simulation())
>  					break;
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
