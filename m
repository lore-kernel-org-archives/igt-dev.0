Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0228C28B2E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 12:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6510E401;
	Mon, 10 Mar 2025 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALjX9/Ou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FC110E3FF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741608032; x=1773144032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=EnOmEJpuoooITxy/V8Ge02SWBEgifBEXSQq7knDzsb0=;
 b=ALjX9/Oul+OTkLPCSvgnnm6OrWmXEw2J33FJ7+cprJWZxkuJjRJ2oOxh
 VaZZBmlNH4zWxOZgH5Jy7mu49MiGv5RpBZR8/4d2hGIPGzgWfMCJgl6KC
 CfObRVcnfnj0T5jN/cxv3CcZbFH5JbtxRJMgNsbARPju6SK0aFbijE0MG
 HEqGoqaPeo+sR05bCWSUvksGCT1LE9TXVA+2Va2rkn1ZNo1JsWjp539u7
 +TAzhaDbmy3tFdQoC67ETFXSZYH3jOEd1Sb/ex0T5XQg+jJ8zAi/l88mH
 hz7ge9Uq7yV4SVHI42b7/Hs7AUeTP8VkP0+M7Pd9wCcmTI/z1vHfXEI7X w==;
X-CSE-ConnectionGUID: MXllmyvUQHG5v3SI4oruMw==
X-CSE-MsgGUID: EpHYf9s0TO6xwXvBRErq2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53228008"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="53228008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:00:31 -0700
X-CSE-ConnectionGUID: GvCJgTuNQy2P7nGl0CQp2g==
X-CSE-MsgGUID: 3gK0De4xQ5OU88A0UNkojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119984398"
Received: from unknown (HELO localhost) ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:00:29 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Jan Sokolowski
 <jan.sokolowski@intel.com>, Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/eudebug: Fix xe_eudebug_client_stop
 corner case
In-Reply-To: <20250224130807.9249-3-dominik.karol.piatkowski@intel.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
 <20250224130807.9249-3-dominik.karol.piatkowski@intel.com>
Date: Mon, 10 Mar 2025 14:00:29 +0200
Message-ID: <87plipksde.fsf@mkuoppal-desk>
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

> After `token_signal(c->p_in, CLIENT_STOP, c->pid)`, the client is
> expected to end its work and exit. By the time the waitpid() is called,
> the client process may be gone already, resulting in a failed assert.
>
> Fix it by skipping the assert in case of errno being ECHILD, meaning
> the process already exited.
>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/xe/xe_eudebug.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index ad8bdf68a..58acb1dea 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -1450,12 +1450,16 @@ void xe_eudebug_client_stop(struct xe_eudebug_cli=
ent *c)
>  {
>  	if (c->pid) {
>  		int waitstatus;
> +		int ret;
>=20=20
>  		xe_eudebug_client_wait_done(c);
>=20=20
>  		token_signal(c->p_in, CLIENT_STOP, c->pid);
> -		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
> -			      c->pid);
> +		ret =3D waitpid(c->pid, &waitstatus, 0);
> +		/* process may be gone already */
> +		if (!(ret =3D=3D -1 && errno =3D=3D ECHILD))
> +			igt_assert_eq(ret, c->pid);
> +
>  		c->pid =3D 0;
>  	}
>  }
> --=20
> 2.34.1
