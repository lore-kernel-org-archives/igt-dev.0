Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003CBEFB81C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5010E517;
	Tue, 24 Feb 2026 08:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDmcAK7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D110E517
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923513; x=1803459513;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=57dSjlvVCQ4NMOpe2+TXQAmisnNH5rr0N50GAkbRpsQ=;
 b=hDmcAK7Gn/+mynATwIOsbEICCnKKBuMkU+FcTvvgi1xUhhofUysR5erB
 Fm2xNIIs2h2Im9HC5WTOoA+se77CJSgvnQHst4SWULKZtmNBAMl8GV5d4
 DkgI5rAUMfd5ZYBTTsl3MBWWNxhtf1y3Sr3JVbrsFzrcjmxRRd7QsiQDa
 1qtGx23oa+cd/m+LNadOtG+CCogyO7ncS0BSfrEDbSQTP7Ck7ELNYQagF
 C5WkU/ZoG5af2RAE+clKw0o0JPnaRbRSQW5EbvgC9hVnPdM3m2CRiAxby
 lqsosRT1n/Ixvd2bYGm6uwqfz1RERosoB572N/ccKBZcpeT+diWLUJW/k Q==;
X-CSE-ConnectionGUID: /+boh3gnSE+5goUMMVuixA==
X-CSE-MsgGUID: hET6QUZ5TgOe6yj4bPvKoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72997179"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72997179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:58:33 -0800
X-CSE-ConnectionGUID: /hp1I0lNSvaDO4Esh4gc2w==
X-CSE-MsgGUID: 0ZZx8VVtS/inGBTz+1im2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="216002625"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:58:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 12/23] tests/drm_read: Use igt_crtc_t instead
 of enum pipe
In-Reply-To: <20260221032003.30936-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-13-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 10:58:28 +0200
Message-ID: <b3ea0ae876a9b4f206389add4975c52dff6efb93@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert drm_read from 'enum pipe' to 'igt_crtc_t'.
>
> The pipe usage in igt_main() creates a slight complication
> is this one.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @clean_igt_main@
> identifier PIPE;
> identifier CRTC;
> @@
> - enum pipe PIPE;
> + igt_crtc_t *CRTC;
> ...
> igt_fixture() {
> ...
> - igt_crtc_t *CRTC;
> <...
> (
> - PIPE =3D CRTC->pipe;
> |
> - PIPE
> + CRTC->pipe
> )
> ...>
> }
> <...
> - PIPE
> + CRTC->pipe
> ...>
>
> @func1@
> typedef igt_output_t;
> typedef igt_crtc_t;
> identifier FUNC, PIPE, CRTC;
> parameter list[N] P;
> @@
> FUNC(P
> -	,enum pipe PIPE
> +	,igt_crtc_t *CRTC
> 	,...)
> {
> ...
> (
> - igt_crtc_t *CRTC =3D igt_crtc_for_pipe(..., PIPE);
> |
> - igt_crtc_t *CRTC;
> ... when !=3D PIPE =3D ...
> - CRTC =3D igt_crtc_for_pipe(..., PIPE);
> )
> <... when !=3D PIPE =3D ...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + CRTC
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(CRTC)
> |
> - PIPE
> + CRTC->pipe
> )
> ...>
> }
>
> @depends on func1@
> identifier func1.FUNC;
> expression list[func1.N] EP;
> expression PIPE;
> @@
> FUNC(EP
> -	,PIPE
> +	,igt_crtc_for_pipe(display, PIPE)
> 	,...)
>
> @func2@
> typedef igt_crtc_t;
> identifier FUNC, PIPE;
> parameter list[N] P;
> @@
> FUNC(P
> -	,enum pipe PIPE
> +	,igt_crtc_t *crtc
> 	,...)
> {
> <+... when !=3D PIPE =3D ...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...+>
> }
>
> @depends on func2@
> identifier func2.FUNC;
> expression list[func2.N] EP;
> expression PIPE;
> @@
> FUNC(EP
> -	,PIPE
> +	,igt_crtc_for_pipe(display, PIPE)
> 	,...)
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @@
> typedef igt_display_t;
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY =3D ...;
> ... when !=3D DISPLAY
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/drm_read.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index e745e98534bd..23b9ebe0faa3 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -77,9 +77,9 @@ static void assert_empty(int fd)
>  	do_or_die(poll(&pfd, 1, 0));
>  }
>=20=20
> -static void generate_event(int fd, enum pipe pipe)
> +static void generate_event(int fd, igt_crtc_t *crtc)
>  {
> -	igt_assert(kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT));
> +	igt_assert(kmstest_get_vblank(fd, crtc->pipe, DRM_VBLANK_EVENT));
>  }
>=20=20
>  static void wait_for_event(int fd)
> @@ -132,7 +132,7 @@ static void test_invalid_buffer(int in)
>  	teardown(fd);
>  }
>=20=20
> -static void test_fault_buffer(int in, enum pipe pipe)
> +static void test_fault_buffer(int in, igt_crtc_t *crtc)
>  {
>  	int fd =3D setup(in, 0);
>  	struct drm_mode_map_dumb arg;
> @@ -146,7 +146,7 @@ static void test_fault_buffer(int in, enum pipe pipe)
>  	buf =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED, fd, arg.offset);
>  	igt_assert(buf !=3D MAP_FAILED);
>=20=20
> -	generate_event(fd, pipe);
> +	generate_event(fd, crtc);
>=20=20
>  	alarm(1);
>=20=20
> @@ -168,13 +168,13 @@ static void test_empty(int in, int nonblock, int ex=
pected)
>  	teardown(fd);
>  }
>=20=20
> -static void test_short_buffer(int in, int nonblock, enum pipe pipe)
> +static void test_short_buffer(int in, int nonblock, igt_crtc_t *crtc)
>  {
>  	char buffer[1024]; /* events are typically 32 bytes */
>  	int fd =3D setup(in, nonblock);
>=20=20
> -	generate_event(fd, pipe);
> -	generate_event(fd, pipe);
> +	generate_event(fd, crtc);
> +	generate_event(fd, crtc);
>=20=20
>  	wait_for_event(fd);
>=20=20
> @@ -214,7 +214,7 @@ static void *thread_short_buffer_wakeup(void *arg)
>  	return NULL;
>  }
>=20=20
> -static void test_short_buffer_wakeup(int in, enum pipe pipe)
> +static void test_short_buffer_wakeup(int in, igt_crtc_t *crtc)
>  {
>  	const int nt =3D sysconf(_SC_NPROCESSORS_ONLN) + 1;
>  	struct short_buffer_wakeup w =3D {
> @@ -243,7 +243,7 @@ static void test_short_buffer_wakeup(int in, enum pip=
e pipe)
>  		sched_yield();
>=20=20
>  		/* One event should wake all threads as none consume */
> -		generate_event(w.fd, pipe);
> +		generate_event(w.fd, crtc);
>=20=20
>  		clock_gettime(CLOCK_REALTIME, &tv);
>  		tv.tv_sec +=3D 5; /* Let's be very generous to the scheduler */
> @@ -274,13 +274,12 @@ int igt_main()
>  {
>  	igt_display_t display;
>  	struct igt_fb fb;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_fd_t(fd);
>=20=20
>  	igt_fixture() {
>  		struct sigaction alarm_action =3D {};
>  		igt_output_t *output;
> -		igt_crtc_t *crtc;
>=20=20
>  		igt_assert_neq(sigaction(SIGALRM, NULL, &alarm_action), -1);
>  		alarm_action.sa_flags &=3D ~SA_RESTART;
> @@ -302,20 +301,18 @@ int igt_main()
>=20=20
>  			igt_output_set_crtc(output, crtc);
>  			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRI=
MARY), &fb);
> -
> -			pipe =3D crtc->pipe;
>  			break;
>  		}
>=20=20
>  		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMM=
IT_LEGACY);
> -		igt_require(kmstest_get_vblank(fd, pipe, 0));
> +		igt_require(kmstest_get_vblank(fd, crtc->pipe, 0));
>  	}
>=20=20
>  	igt_subtest("invalid-buffer")
>  		test_invalid_buffer(fd);
>=20=20
>  	igt_subtest("fault-buffer")
> -		test_fault_buffer(fd, pipe);
> +		test_fault_buffer(fd, crtc);
>=20=20
>  	igt_subtest("empty-block")
>  		test_empty(fd, 0, EINTR);
> @@ -324,11 +321,14 @@ int igt_main()
>  		test_empty(fd, 1, EAGAIN);
>=20=20
>  	igt_subtest("short-buffer-block")
> -		test_short_buffer(fd, 0, pipe);
> +		test_short_buffer(fd, 0,
> +				  crtc);
>=20=20
>  	igt_subtest("short-buffer-nonblock")
> -		test_short_buffer(fd, 1, pipe);
> +		test_short_buffer(fd, 1,
> +				  crtc);
>=20=20
>  	igt_subtest("short-buffer-wakeup")
> -		test_short_buffer_wakeup(fd, pipe);
> +		test_short_buffer_wakeup(fd,
> +					 crtc);
>  }

--=20
Jani Nikula, Intel
