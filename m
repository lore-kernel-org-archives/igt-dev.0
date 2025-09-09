Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C03CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 15:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34A110E798;
	Tue,  9 Sep 2025 15:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAHA5xlF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D84010E798
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757430258; x=1788966258;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dDe11JwRBqI71jztFt3vxLDXSSpQEQwsZyXwlAm4Hcs=;
 b=EAHA5xlF0S3sbprR2KnH36TYbCiSPz//ZKnDQHaQ++yaWv1acZXdvVVT
 k3BExYvQ1MWAwRM8PQG6bIIhdNDabl6tIlIKh3FPBub329z9YP6g0NUiY
 nGX5uF6BsZqykPc1Byua5dYRQCJ/lGghJRd1/ujimSpIaEUVp7qOGz9ya
 0NioegoK2ppz4KAOUvE88CN/yuPjr2hqN960iMlshP6rsm5guudmKf0sw
 gAMf5zS926/pTU1RWUYrdQce+VGmOu2RS5B9rzD2UWerrgQaFq0oKqzaJ
 duUCD+DUkV7OeGydjMNUbp9DFRQUTXxkVa6T2I5O/aLai4oBwHRMpaCDT w==;
X-CSE-ConnectionGUID: 1SOoDpjLQ4iT+b95plG8Hg==
X-CSE-MsgGUID: JoaNZ0jeQvyMkGx9LM5HHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59659149"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59659149"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:04:17 -0700
X-CSE-ConnectionGUID: i5Bj+1q1RluMi4KxlfgYHw==
X-CSE-MsgGUID: euYP7g15TTy/xGq4OjkJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="204095224"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:04:16 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol
 =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v2 i-g-t 4/4] lib/xe_eudebug: Don't fail in __wait_token
 if pipe was broken
In-Reply-To: <20250908125448.13420-5-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-5-dominik.karol.piatkowski@intel.com>
Date: Tue, 09 Sep 2025 18:04:14 +0300
Message-ID: <87o6rjmzv5.fsf@mkuoppal-desk>
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

> If safe_pipe_read returns -EPIPE, print it and carry on. This will allow
> for debugging if something goes wrong, while reducing the false tripping
> of xe_eudebug_online@set-breakpoint-sigint-debugger test.

I fail to get the why part. You want to carry on if the client is dead?

Should we then just define CLIENT_DEAD and let the upper layer decide
if it is accetable?

-Mika

>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> ---
>  lib/xe/xe_eudebug.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 8e5664496..7a43bc902 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -302,6 +302,10 @@ static uint64_t __wait_token(int pipe[2], const uint=
64_t token, int timeout_ms)
>  	int ret;
>=20=20
>  	ret =3D safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> +	if (ret =3D=3D -EPIPE) {
> +		igt_info("safe_pipe_read returned -EPIPE!\n");
> +		return 0x0000dead;
> +	}
>  	igt_assert_f(ret > 0,
>  		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
>  		     token_to_str(token), token);
> @@ -309,6 +313,10 @@ static uint64_t __wait_token(int pipe[2], const uint=
64_t token, int timeout_ms)
>  	igt_assert_eq(in, token);
>=20=20
>  	ret =3D safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
> +	if (ret =3D=3D -EPIPE) {
> +		igt_info("safe_pipe_read returned -EPIPE!\n");
> +		return 0x0000dead;
> +	}
>  	igt_assert_f(ret > 0,
>  		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
>  		     token_to_str(token), token);
> --=20
> 2.34.1
