Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A970FE6BF13
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607F210E9EC;
	Fri, 30 Jan 2026 14:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWzv+XIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5F10E9EC
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782611; x=1801318611;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=N3xGskbo6/dG0GeNePYtBi/qpPQYtqTdxLUsOonESTE=;
 b=JWzv+XITLqy+pUKMOltPVo4JU7zidurt18gFMCrxsYzxIyR+Mp10q4Zq
 4q4IA9iGqAusIy1wVxQBdzgOZRrKh1kib5/t+3BvlPgMi/aWknKKpjYQ1
 kMAGl38J9rMdQhkNMJoXGqfAeIxsTIARS0r4+WsfNSCUG9EL5/qmtBCL3
 qQebtHDuvPApkhiiTYjSW6VRIw2y1AqKLcZbBTHkP0R58v5bc9E0yRMka
 3aI2tY3A12yNfyJe0IadaAeEkC8WvWsTC4CJSXTTLXZ7J6uC7/msi+SRW
 dIV4Mz/Z/vM39zSbSkmYYylUpPVjU6HpGNtZXt6hG3KLGXdHs2j/SfVVl Q==;
X-CSE-ConnectionGUID: sCBkkHa1R4eNIg8rH8y5HQ==
X-CSE-MsgGUID: YnV47Cr/RCWp6zDf1Xqc8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70936364"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70936364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:16:51 -0800
X-CSE-ConnectionGUID: mvBS8bx5R6G/rw9l6vcPmg==
X-CSE-MsgGUID: MUOEN19uQVmaQjxH5XloNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213356591"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:16:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/15] lib/kms: Use
 for_each_crtc_with_single_output(), part 1
In-Reply-To: <20260130105237.14481-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-9-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:16:41 +0200
Message-ID: <a40a5df54628b7565ff82ee65e2ceca7b1ca8b8a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert some uses of for_each_pipe_with_single_output()
> to for_each_crtc_with_single_output(). Take care of the
> cases where we (presumably) still have to keep some
> kind of 'data.pipe' thingy still up to date.
>
> Eventually we should probably replace 'data.pipe' with
> 'data.crtc' but I didn't want to go that far here.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe_with_single_output;
> iterator name for_each_crtc_with_single_output;
> typedef igt_crtc_t;
> identifier PIPE;
> expression DISPLAY, OUTPUT, X;
> @@
> - for_each_pipe_with_single_output(DISPLAY, X.PIPE, OUTPUT)
> + for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
> {
> + X.PIPE =3D crtc->pipe;
> <...
> (
> - igt_crtc_for_pipe(..., X.PIPE)
> + crtc
> |
> - kmstest_pipe_name(X.PIPE)
> + igt_crtc_name(crtc)
> |
> - X.PIPE
> + crtc->pipe
> )
> ...>
> }
>
> @depends on change@
> identifier FUNC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *crtc;
> <+...
> for_each_crtc_with_single_output(...) { ... }
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_cursor_edge_walk.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index eaf4c59b8a19..86577fbc53d8 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -344,6 +344,7 @@ static const char *help_str =3D
>=20=20
>  int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
> +	igt_crtc_t *crtc;
>  	struct {
>  		const char *name;
>  		unsigned flags;
> @@ -394,21 +395,24 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  					data.curw, data.curh, tests[i].name);
>  			igt_subtest_with_dynamic_f("%dx%d-%s", data.curw,
>  						   data.curh, tests[i].name) {
> -				for_each_pipe_with_single_output(&data.display, data.pipe, data.outp=
ut) {
> -					if (!extended && data.pipe !=3D active_pipes[0] &&
> -					    data.pipe !=3D active_pipes[last_pipe])
> +				for_each_crtc_with_single_output(&data.display,
> +								 crtc,
> +								 data.output) {
> +					data.pipe =3D crtc->pipe;
> +					if (!extended && crtc->pipe !=3D active_pipes[0] &&
> +					    crtc->pipe !=3D active_pipes[last_pipe])
>  						continue;
>=20=20
>  					igt_display_reset(&data.display);
>  					igt_output_set_crtc(data.output,
> -							    igt_crtc_for_pipe(data.output->display, data.pipe));
> +							    crtc);
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
>  					igt_output_set_crtc(data.output, NULL);
>=20=20
>  					igt_dynamic_f("pipe-%s-%s",
> -						      kmstest_pipe_name(data.pipe),
> +						      igt_crtc_name(crtc),
>  						      data.output->name)
>  						test_crtc(&data, tests[i].flags);
>  				}

--=20
Jani Nikula, Intel
