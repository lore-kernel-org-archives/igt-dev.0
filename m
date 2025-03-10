Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49A8C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 11:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7DF10E03A;
	Mon, 10 Mar 2025 11:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ps0jno34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63210E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741606823; x=1773142823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=uZtIII2BvsQX5LdGl0c6D1uvZP7alN3iHD1E5hoUQgk=;
 b=Ps0jno345/rpcA/kD5DUM942k46WXS4Rv1ZcE1Bau6WufmluV28O8UVf
 UrnAHi+yxDa2mveMMKQRt8BY+EQRxDsJwov7b0o4rhae+YGrO7XAx7fxX
 PA/0XP/TOkGrYsIITd83HKZmlf6Vklr+Gu/2uGU+nQ/4jI22UoAnQwf2b
 yQeG98AH+Wpr9DsU1trKdEQURHBmyKl1zBiYJk0Ayw9c/akWLhGhX738y
 pD8c6jzll1eslkexRlus3mq87oVzMJ49VmfTqw4FQtj4urMFhg+omvAz1
 z56yD9gBac7XCm8SM61V7ZBpulxjhuu0PwtlIbaklrw8VGxlLjw1px/kY w==;
X-CSE-ConnectionGUID: Lx/sqQqESzGJMCRLHqN7eg==
X-CSE-MsgGUID: 7RtcNi71RjiIDU9J3Uoe+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42449787"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42449787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:40:23 -0700
X-CSE-ConnectionGUID: MuVpkji1TmGyDA1n1TKeMg==
X-CSE-MsgGUID: /tHCOI8RQ8uSaxGGgqHxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120170936"
Received: from unknown (HELO localhost) ([10.237.72.193])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:40:21 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Jan Sokolowski
 <jan.sokolowski@intel.com>, Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/eudebug: Make debugger thread SIGINTable
In-Reply-To: <20250224130807.9249-2-dominik.karol.piatkowski@intel.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
 <20250224130807.9249-2-dominik.karol.piatkowski@intel.com>
Date: Mon, 10 Mar 2025 13:40:21 +0200
Message-ID: <87senlktay.fsf@mkuoppal-desk>
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

Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com> writes:

> Due to the fact that `pthread_kill(thread, SIGINT)` results in SIGINTing
> all of the threads - including main thread - by default, testcases that
> send SIGINT to debugger thread are crashing.
>
> Introduce SIGINT signal handler for debugger thread to fix this.
>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> ---
>  lib/xe/xe_eudebug.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 1205d945b..ad8bdf68a 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1050,6 +1050,11 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebu=
g_event *event)
>  	return ret;
>  }
>=20=20
> +static void terminate_debugger(int sig)
> +{
> +	pthread_exit(NULL);
> +}
> +
>  static void *debugger_worker_loop(void *data)
>  {
>  	uint8_t buf[MAX_EVENT_SIZE];
> @@ -1060,9 +1065,14 @@ static void *debugger_worker_loop(void *data)
>  		.revents =3D 0,
>  	};
>  	int timeout_ms =3D 100, ret;
> +	struct sigaction sa;

We should be safe to assume sigaction initializes everything
that it will use. Regarless sa =3D { 0 }; would help to convince
the reader that everything will be allright.

Regarless,
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

>=20=20
>  	igt_assert(d->master_fd >=3D 0);
>=20=20
> +	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
> +	sa.sa_handler =3D terminate_debugger;
> +	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
> +
>  	do {
>  		p.fd =3D d->fd;
>  		ret =3D poll(&p, 1, timeout_ms);
> --=20
> 2.34.1
