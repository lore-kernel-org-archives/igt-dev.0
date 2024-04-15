Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284FC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 16:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD6B10ECCC;
	Mon, 15 Apr 2024 16:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5P3+sua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB77810ECCC
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713197332; x=1744733332;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=on6PyjkEcUmf7XRn7+UnpUbz2lX74MZOeWSJKcDW6AM=;
 b=X5P3+suaRY83iAlr7XjN7pObmAM8kKESU3+VJZutYEVW6QVsLM3vmVxZ
 pMHCr3E/umXE8Ax7v4wVhT+eQT9AftrxDRN6LY2SGXFAqbHVWAXLAZcU2
 fzaACR5sDuObhWvtdYziQTjUeZU9OwlM5msLZruJ6m8ZMQ8Sh3kOcUSET
 6paPYEbRA6GOktkQzOynMdfAMh8azEjedk0QRgefaL9sPzpHTKJR+XsEK
 SIb8idPkidaYCQxbbEmDR2sCRVlZO3Ft2Bo72LJtqwvF3lZ/LsDiO7OY+
 Ngg2bj93DukDGY1o5Row9JfsrWrEA0MaCEjQkkRD8ZypdlevufegIQS0G w==;
X-CSE-ConnectionGUID: grSE23CUTBO3s2E5Y8AsDg==
X-CSE-MsgGUID: FGhoJjtaQmqbGStD/4jh+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19158768"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19158768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 09:08:51 -0700
X-CSE-ConnectionGUID: XxVnunF1SDinL6+3EfXgtQ==
X-CSE-MsgGUID: yrle/CeeRTWWT3nCgP4hCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22544861"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.116])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 09:08:50 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [i-g-t] lib/igt_kmod: Fix sigaction write to uninitialized memory
Date: Mon, 15 Apr 2024 18:08:46 +0200
Message-ID: <1882208.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zhz4QQLg4IssUI/m@kamilkon-DESK1>
References: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
 <Zhz4QQLg4IssUI/m@kamilkon-DESK1>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Monday, 15 April 2024 11:49:53 CEST Kamil Konieczny wrote:
> On 2024-04-12 at 14:20:14 +0200, Zbigniew Kempczy=C5=84ski wrote:
> > I've noticed on running kunit subtest:
> >=20
> > ./xe_live_ktest --r xe_bo
> >=20
> > IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.8.0-xeint+ x86_64)
> > Using IGT_SRANDOM=3D1712922311 for randomisation
> > Starting subtest: xe_bo
> > Received signal SIGSEGV.
> > Stack trace:
> >  #0 [fatal_sig_handler+0xda]
> >  #1 [__sigaction+0x50]
> >  #2 [__libc_sigaction+0x10f]
> >  #3 [kunit_get_tests+0x417]
> >  #4 [igt_kunit+0x35f]
> >  #5 [__igt_unique____real_main41+0x44]
> >  #6 [main+0x48]
> >  #7 [__libc_init_first+0x90]
> >  #8 [__libc_start_main+0x80]
> >  #9 [_start+0x25]
> > Subtest xe_bo: CRASH (0.005s)
> >=20
> > Looks this is related to sigaction() write to memory referenced
> > by uninitialized pointer located on the stack. Lets fix it.
> >=20
> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.co=
m>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Thx for reporting bug and fixing it.  +cc Janusz

Yeah, thanks for fixing, and I'm sorry for the bug.  I'm wondering how we=20
managed to leave that long (half a year?) with that bug not discovered.

Thanks,
Janusz

>=20
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> > ---
> > v2: missed cmdline (due to # character)
> > ---
> >  lib/igt_kmod.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 1ec9c8a602..6659c27eba 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -963,7 +963,7 @@ static int kunit_kmsg_result_get(struct igt_list_he=
ad *results,
> >  				 int fd, struct igt_ktap_results *ktap)
> >  {
> >  	struct sigaction sigchld =3D { .sa_handler =3D kunit_sigchld_handler,=
 },
> > -			 *saved;
> > +			 saved;
> >  	char record[BUF_LEN + 1], *buf;
> >  	unsigned long taints;
> >  	int ret;
> > @@ -975,7 +975,7 @@ static int kunit_kmsg_result_get(struct igt_list_he=
ad *results,
> >  			return -ENOTRECOVERABLE;
> > =20
> >  		if (modprobe) {
> > -			err =3D igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
> > +			err =3D igt_debug_on(sigaction(SIGCHLD, &sigchld, &saved));
> >  			if (err =3D=3D -1)
> >  				return -errno;
> >  			else if (unlikely(err))
> > @@ -988,7 +988,7 @@ static int kunit_kmsg_result_get(struct igt_list_he=
ad *results,
> >  				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> >  				__attribute__ ((fallthrough));
> >  			case ENOTRECOVERABLE:
> > -				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> > +				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> >  				if (igt_debug_on(modprobe->err))
> >  					return modprobe->err;
> >  				break;
> > @@ -996,7 +996,7 @@ static int kunit_kmsg_result_get(struct igt_list_he=
ad *results,
> >  				break;
> >  			default:
> >  				igt_debug("pthread_mutex_lock() error: %d\n", err);
> > -				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> > +				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> >  				return -err;
> >  			}
> >  		}
> > @@ -1005,7 +1005,7 @@ static int kunit_kmsg_result_get(struct igt_list_=
head *results,
> > =20
> >  		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
> >  			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> > -			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> > +			igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> >  		}
> > =20
> >  		if (igt_debug_on(!ret))
> > @@ -1236,7 +1236,7 @@ static bool kunit_get_tests(struct igt_list_head =
*tests,
> >  			    struct igt_ktap_results **ktap)
> >  {
> >  	struct sigaction sigalrm =3D { .sa_handler =3D kunit_get_tests_timeou=
t, },
> > -			 *saved;
> > +			 saved;
> >  	struct igt_ktap_result *r, *rn;
> >  	unsigned long taints;
> >  	int flags, err;
> > @@ -1263,13 +1263,13 @@ static bool kunit_get_tests(struct igt_list_hea=
d *tests,
> >  	igt_skip_on(modprobe(tst->kmod, opts));
> >  	igt_skip_on(igt_kernel_tainted(&taints));
> > =20
> > -	igt_skip_on(sigaction(SIGALRM, &sigalrm, saved));
> > +	igt_skip_on(sigaction(SIGALRM, &sigalrm, &saved));
> >  	alarm(10);
> > =20
> >  	err =3D kunit_get_results(tests, tst->kmsg, ktap);
> > =20
> >  	alarm(0);
> > -	igt_debug_on(sigaction(SIGALRM, saved, NULL));
> > +	igt_debug_on(sigaction(SIGALRM, &saved, NULL));
> > =20
> >  	igt_skip_on_f(err,
> >  		      "KTAP parser failed while getting a list of test cases\n");
>=20




