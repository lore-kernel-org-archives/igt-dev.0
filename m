Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97170CAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 10:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B33310E187;
	Fri, 12 Sep 2025 10:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gW91+/Og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358B710E187
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757671887; x=1789207887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=P6dpCcNn9lJt/zoOx7WNfVS4qgD0yf1i3p+dAfKv3iQ=;
 b=gW91+/Og7vCqznvwU29UZiLHe2mlJGehfs0mwMkHTHAkhubaLn095FmH
 SqeDjgZxfjs617btFksVqSyAKRtEN5UhNsG7ucsX6WjllJlrK+sIu2Xmq
 fgREibKvtZ8t9nIQi7z5sHPjZnUhPBqBfy0/NaKUpQTzNfe/f5/P2ulUy
 hAfBTIJRngQD8wYt7k21A0W4qr3/zlvNBIol30lL2GiHwzgufzGVFEIiZ
 cXAVhn5pS4bHTqYPN8mv3l7mn8ew+ax24dnDPlKEY3jOtrNa/6QXAsXpQ
 ocy1vwg0VC5RXuqZ4W1pIjQNJEhkV72UKNcnV3uXSzfX6+2gngKsvDEdT A==;
X-CSE-ConnectionGUID: DE2x6GozTka5Ydntn39XRg==
X-CSE-MsgGUID: EnCe+D5PQbaeuudUSEcnPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59054054"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59054054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:11:27 -0700
X-CSE-ConnectionGUID: oFvnKBqcQHyiS2QYP8z51w==
X-CSE-MsgGUID: 7j/a3gklSPylM/ibmzQghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="179147490"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.162])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:11:25 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol
 =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/4] tests/xe_eudebug_online: Add startup delay
 for set-breakpoint-sigint-debugger
In-Reply-To: <20250908125448.13420-2-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-2-dominik.karol.piatkowski@intel.com>
Date: Fri, 12 Sep 2025 13:11:23 +0300
Message-ID: <87ldmkm14k.fsf@mkuoppal-desk>
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

> Add arbitrary delay to allow for uninterrupted startup before issuing
> SIGINT.
>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 535f00818..6a7b8d8d7 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1564,7 +1564,8 @@ static void test_set_breakpoint_online_sigint_debug=
ger(int fd,
>  	while (igt_seconds_elapsed(&ts) < 60) {
>  		uint64_t event_count;
>=20=20
> -		sleep_time =3D rand() % max_sleep_time;
> +		/* XXX: Add arbitrary delay to allow for uninterrupted startup */
> +		sleep_time =3D 20000 + rand() % (max_sleep_time - 20000);

I am not fun of random sleeps as they will end up with random fails and
noise.

Should really be sync mechanism to handle the boundaries of sigint
injection instead.

But as this just makes the previous sleep more consumable,
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

>  		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", loop_count, sleep_=
time);
>=20=20
>  		data =3D online_debug_data_create(hwe);
> --=20
> 2.34.1
