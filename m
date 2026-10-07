Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A780CCA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 16:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7EB10E618;
	Wed,  7 Oct 2026 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luY3qBnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C8810E618
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791390832; x=1822926832;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=nMWxgDAfz6QsADSUkndqtGsZ+MuklFCoXguzE60n58Q=;
 b=luY3qBnnwXAqKvu/4Cd5VTaNaaQafNebl4kuWmdmn4S11sqHb3WXMUTm
 tNUuvq8JPG98mxa2SePzc34gEK19pVmcAbnkKpTYRXbwr+aBZYK9CzLou
 HQqo/0+y73P5P17Eldl0d++Bi3pfb17P5qcqBE0WS84MLSj1YYFd0KvwX
 2TfZaKpvACQwmHJjS+tSBwVMSIP4/yVQ3zqsDx6Xjw8/eiIB/HHcsmmZ1
 274e+NT8FKNvOX74dNPFGZophazdyjb5CfUA/9dv/Wbk4GV2lg3Lr2oVc
 vw9KWyN5kSqJvBQ7GgsbgstcWsuHXyokIoDlG/JSf3++xFW73jtkuSWdI w==;
X-CSE-ConnectionGUID: hUvEDAcrSfeH/flWSedxPg==
X-CSE-MsgGUID: mFtiYeRfTRW3eQtRuvpb4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="153903"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="153903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:33:52 -0700
X-CSE-ConnectionGUID: mYCtYikGQGizU/PDN8bzUw==
X-CSE-MsgGUID: /nlTv+xNTgWXIW6foXJLRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="280787471"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:33:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, Bernd Kuhls
 <bernd@kuhls.net>
Subject: Re: [PATCH i-g-t] lib/igt_platform_filter: Fix musl build
In-Reply-To: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007160847.169029-1-kamil.konieczny@linux.intel.com>
Date: Wed, 07 Oct 2026 19:33:48 +0300
Message-ID: <c1c52d5186778ed3b3be6e5e8ca13c612d233bf9@intel.com>
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

On Wed, 07 Oct 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> When using musl C libs, stdout/stderr are read-only vars and
> compilation reports errors, for example:
>
> ../lib/igt_platform_filter.c: In function =E2=80=98igt_platform_filter_du=
mp_to_file=E2=80=99:
> ../lib/igt_platform_filter.c:551:16: error: assignment of read-only varia=
ble =E2=80=98stdout=E2=80=99
>   551 |         stdout =3D f;
>
> Fix it on such platforms by dumping platform filters to stdout.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Reported-by: Bernd Kuhls <bernd@kuhls.net>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_platform_filter.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> index 15b4e9690..c2c28e7f0 100644
> --- a/lib/igt_platform_filter.c
> +++ b/lib/igt_platform_filter.c
> @@ -537,6 +537,7 @@ void igt_platform_filter_dump(void)
>   */
>  int igt_platform_filter_dump_to_file(const char *filename)
>  {
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && =
!defined(__UCLIBC__)
>  	FILE *old_stdout;
>  	FILE *f;
>=20=20
> @@ -549,14 +550,19 @@ int igt_platform_filter_dump_to_file(const char *fi=
lename)
>  	/* Redirect stdout to file */
>  	old_stdout =3D stdout;
>  	stdout =3D f;
> +#endif
>=20=20
>  	igt_platform_filter_dump();
>=20=20
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && =
!defined(__UCLIBC__)
>  	/* Restore stdout */
>  	stdout =3D old_stdout;
>  	fclose(f);
>=20=20
>  	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +#else
> +	igt_info("Platform filter configuration dumped\n");
> +#endif
>  	return 0;
>  }

Funny, I was just saying ifdefs belong outside of the functions [1].

Here too, the code shared between the two conditional compilation
branches are the igt_platform_filter_dump() call and return
0. Everything else is different, and the complex #if condition is
duplicated. IMO would be cleaner to have the #if outside of the
function.

BR,
Jani.


[1] https://lore.kernel.org/r/d18d32cb4d1223e0dfb590abf6413a480c2a0aa1@inte=
l.com


--=20
Jani Nikula, Intel
