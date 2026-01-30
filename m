Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66148E6BF13
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377510E11C;
	Fri, 30 Jan 2026 14:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TS3oNpdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2110E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783235; x=1801319235;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=0FS5TbIH1gRSzEu8Fo+uCF40seGjJo4SC22O5EeCrFo=;
 b=TS3oNpdMXSWv+0EnIkIueX3uM1HqCEbQYq5O3PtVa6ge46AIl+lcy/C0
 02S+BDsFkdMv8qTdeP5an9Akq9VTMzBi5p6WUC/dY+TB4LsJowcASoR1S
 rGE5nWcNXUws0pzUdAaxPVQEFlxZTO39hgwXqoEzdxrZd0yfl+IHyl4d9
 NsTwys9sZD+HdCyz5t87zuZI69ZLAUvx/zQ9cjghT4Q3sdp+fL81J9cYV
 IrfFFQRUGdlKGAo3AGPGVXmNX0zRfCncubhZG5Hw3hvtX1W2vhVwpny3Q
 sndIfIJ74YexfHjxDWSlOW3NUAYFS9AbQgH11wKIIVUKat2QIk+f4jzAd g==;
X-CSE-ConnectionGUID: FympFkWkTV6TQ4H082Az1g==
X-CSE-MsgGUID: JARSdDRBQO+mj9nn0qeHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58612502"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="58612502"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:27:15 -0800
X-CSE-ConnectionGUID: nvKbVHumSRO85ONazmPGOg==
X-CSE-MsgGUID: Hl7cfXyeQFaa+Yk1eun58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209114124"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:27:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 13/15] lib/kms: Use
 for_each_crtc_with_valid_output(), part 3
In-Reply-To: <20260130105237.14481-14-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-14-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:27:10 +0200
Message-ID: <c25b7dca3c5753a92ae860191ff139235c81e61e@intel.com>
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
> Convert some uses of for_each_pipe_with_valid_output()
> to for_each_crtc_with_valid_output(). Take care of the
> cases where we (presumably) still have to keep some
> kind of 'pipe' pointer thingy still up to date.

*tests/kms

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Eventually we should probably replace the pipe pointer
> with a crtc pointer but I didn't want to go that far here.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe_with_valid_output;
> iterator name for_each_crtc_with_valid_output;
> typedef igt_crtc_t;
> enum pipe *PIPE;
> expression DISPLAY, OUTPUT;
> @@
> - for_each_pipe_with_valid_output(DISPLAY, *PIPE, OUTPUT)
> + for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
> {
> + *PIPE =3D crtc->pipe;
> <...
> (
> - igt_crtc_for_pipe(..., *PIPE)
> + crtc
> |
> - kmstest_pipe_name(*PIPE)
> + igt_crtc_name(crtc)
> |
> - *PIPE
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
> for_each_crtc_with_valid_output(...) { ... }
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_prime.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index f51c463211f4..7b13e9f538e1 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -118,14 +118,16 @@ static bool has_prime_export(int fd)
>  static igt_output_t *setup_display(int importer_fd, igt_display_t *displ=
ay,
>  				   enum pipe *pipe)
>  {
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	bool found =3D false;
>=20=20
> -	for_each_pipe_with_valid_output(display, *pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
> +		*pipe =3D crtc->pipe;
>  		igt_display_reset(display);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, *pipe));
> +				    crtc);
>  		if (intel_pipe_output_combo_valid(display)) {
>  			found =3D true;
>  			break;

--=20
Jani Nikula, Intel
