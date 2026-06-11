Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B80DCD98C7
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 08:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C4F10ED99;
	Thu, 11 Jun 2026 08:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g79MD4q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8059C10ED99
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781167356; x=1812703356;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=4UEOZ+DnyXv7j5kOiEANqWP20BFJU6b2eI51NgXCpOw=;
 b=g79MD4q9saZ1edz+1ackOdPlnOIMDM0Kn/O2FzxZVpKvtLXG5E7nkJ9G
 zpau8JWKvwtS8DcBmNR8ikwNdBVr6Zv63nSmyPRQDlwuITVIcbjRBUXUc
 5EOhlJ+QQHnPBlYA0EvgGbJiS86nkUoJLfhSUrWEYEdLKwVNpVhz9QBQb
 +mUTJGtQWjnKlOkVFKriBU7MjQCUtT6iwMzlRlRJoYvW7pcsY4Qvt3/ba
 W5rO5ZNJNbG4vLSriaVvLM6PiHlMxSpCSRyZap1sdkUQkK0J00aM77d9X
 R/f2PpoRnvZkjlKyYmhMUijFzOwPMlnN44pRlIyryvpTLRPxF12Tg472+ w==;
X-CSE-ConnectionGUID: CWeOPdQeQLq9MaMjrbv/bg==
X-CSE-MsgGUID: uYa7BHJmTua4alSOhvm0yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81882571"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="81882571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:42:35 -0700
X-CSE-ConnectionGUID: jfsSP3peSGWJw5NK/e0dPw==
X-CSE-MsgGUID: JjD1Jm3AQ4ClJkTi0rh3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="245543557"
Received: from mwiniars-mobl.ger.corp.intel.com ([10.245.246.72])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 01:42:33 -0700
Message-ID: <cf3517458599630f209ddd247d8183bb74f509e1.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org, 
 zbigniew.kempczynski@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
Date: Thu, 11 Jun 2026 10:42:31 +0200
In-Reply-To: <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
 <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

On Wed, 2026-06-10 at 17:29 +0200, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
> > The exit_subtest() function always printed 'finished subtest' in kmsg
> > and trace output regardless of whether it was a regular subtest or a
> > dynamic subtest finishing. The 'starting' messages already correctly
> > distinguish between the two ('starting subtest' vs 'starting dynamic
> > subtest').
> >=20
> > Fix the 'finished' messages to print 'finished dynamic subtest' for
> > dynamic subtests, matching the starting message convention. This makes
> > syslog parsing and test hang detection more accurate.
>=20
> Should you add Closes tag here? See
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198
> Fix multiple results from one (dynamic) subtest reported
>=20
> +cc Janusz
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> >=20
> > Assisted-by: GitHub Copilot:Claude Opus 4.6
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >  lib/igt_core.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> This could potentailly affect other CI pipelines, so
> +cc Vitaly.
>=20
> Regards,
> Kamil
>=20
> >=20
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index dc3ac5304..a0d9c9d7d 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char =
*result)
> >  				*subtest_name,
> >  				result,
> >  				igt_time_elapsed(thentime, &now));
> > -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> > -		 command_str, *subtest_name, result);
> > -	igt_trace("%s: finished subtest %s, %s\n",
> > -		  command_str, *subtest_name, result);
> > +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
> > +		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> > +		 *subtest_name, result);
> > +	igt_trace("%s: finished %s %s, %s\n",
> > +		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> > +		  *subtest_name, result);

Isn't igt_runner watching those messages?  Won't it be confused if not
adjusted to the new message content?

Thanks,
Janusz

> > =20
> >  	igt_terminate_spins();
> > =20
> > --=20
> > 2.25.1
> >=20
