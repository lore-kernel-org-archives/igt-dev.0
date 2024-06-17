Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F84C2BA1A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 09:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AFA10E329;
	Mon, 17 Jun 2024 09:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hF5lGujA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35510E32B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718617850; x=1750153850;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HjL2Wl4AlqqeUJ3xC21gazx/wHJSm5Grm57QfAI1Aro=;
 b=hF5lGujA6zUy94pePM0Uug8fpO1Um8pCNtmQcAB6tEVIhnaqibdnJcNV
 Je1pd1sel7aFZg51myg33Wbz92lEo2W4KBMwljURoZZqJ53e35hEHGx6i
 urbsSsfK2pSHIj9XOXpV/VmuzjBcLbOF6y5lWevh9EeLqLdNXrgHtBsHm
 Vlm4ey1p2EFpps5f7BgcbCequnPfvlUACd+s9gQSVtZxlc3X7sbAVlYck
 lEwciWS8eUj1ag5zkjGelVKkZwT18iaLD00eQwJ4Xc8TnXCOe5Y+FXLj5
 VwRlLrdyvIwUm8paga0yWLu0Oe12ep7rwlEZccWESHPLHiV3YzmK96WBz Q==;
X-CSE-ConnectionGUID: r2S/XObcQ4aT3kzQP0mtdw==
X-CSE-MsgGUID: +1vyjBVhRKOQN44gQOX1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15272800"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="15272800"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 02:50:49 -0700
X-CSE-ConnectionGUID: aX0ReYwKTLCTJAW4uKJkQA==
X-CSE-MsgGUID: 0g29861nSearxU2FF8WyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45591401"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.222])
 ([10.245.244.222])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 02:50:47 -0700
Message-ID: <7280548bc35306c5701f90777819b0d8ba4e528a.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Reduce allocations to
 maximum working set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 17 Jun 2024 11:50:44 +0200
In-Reply-To: <20240617071413.vke6dqt5aeatu4d7@zkempczy-mobl2>
References: <20240614153001.9387-1-thomas.hellstrom@linux.intel.com>
 <20240617071413.vke6dqt5aeatu4d7@zkempczy-mobl2>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Mon, 2024-06-17 at 09:14 +0200, Zbigniew Kempczy=C5=84ski wrote:
> Hi Thomas,
>=20
> here are my questions:
>=20
> On Fri, Jun 14, 2024 at 05:30:00PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Current xe kmd allows for a maximum working set of VRAM plus
> > half of system memory, or if the working set is allowed only in
> > VRAM, the working set is limited to VRAM.
> >=20
> > Some subtests attempt to exceed that. Detect when that happens
> > and limit the working set accordingly.
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0tests/intel/xe_evict.c | 72 ++++++++++++++++++++++++++++++++++---=
-
> > ----
> > =C2=A01 file changed, 59 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index eebdbc84b..af5e5e5b6 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -458,6 +458,33 @@ static uint64_t calc_bo_size(uint64_t
> > vram_size, int mul, int div)
> > =C2=A0		return (ALIGN(vram_size, SZ_256M)=C2=A0 * mul) / div;
> > /* small-bar */
> > =C2=A0}
> > =C2=A0
> > +static unsigned int working_set(uint64_t vram_size, uint64_t
> > system_size,
> > +				uint64_t bo_size, unsigned int
> > num_threads,
> > +				unsigned int flags)
> > +{
> > +	uint64_t set_size;
> > +	uint64_t total_size;
> > +
> > +	set_size =3D (vram_size - 1) / bo_size;
>=20
> Is that intentional that if vram_size is 0 you're using max u64?
> I bet not as total_size is calculated similar and this might return
> huge values.

Yes, as you also mention in the follow-up mail, the assumption here is
that always vram_size > 0.


>=20
> > +
> > +	/*
> > +	 * Working set resizes also in system?
> > +	 * Currently system graphics memory is limited to 50% of
> > total.
> > +	 */
> > +	if (!(flags & !(THREADED | MULTI_VM)))
> > +		set_size +=3D (system_size / 2) / bo_size;
>=20
> You mean ~ instead of !?

Well almost, it should actually be

if (!flags & (THREADED | MULTI_VM))
=09
good catch. I'll respin, and also update the comment=20
s/resizes/resides/

/Thomas



>=20
> --
> Zbigniew
>=20
> > +
> > +	/* All bos must fit in memory, assuming no swapping */
> > +	total_size =3D ((vram_size - 1) / bo_size + system_size /
> > bo_size) /
> > +		num_threads;
> > +
> > +	if (set_size > total_size)
> > +		set_size =3D total_size;
> > +
> > +	/* bos are only created on half of the execs. */
> > +	return set_size * 2;
> > +}
>=20
>=20
> > +
> > =C2=A0/**
> > =C2=A0 * SUBTEST: evict-%s
> > =C2=A0 * Description:=C2=A0 %arg[1] evict test.
> > @@ -748,6 +775,7 @@ igt_main
> > =C2=A0		{ NULL },
> > =C2=A0	};
> > =C2=A0	uint64_t vram_size;
> > +	uint64_t system_size;
> > =C2=A0	int fd;
> > =C2=A0
> > =C2=A0	igt_fixture {
> > @@ -755,14 +783,16 @@ igt_main
> > =C2=A0		igt_require(xe_has_vram(fd));
> > =C2=A0		vram_size =3D xe_visible_vram_size(fd, 0);
> > =C2=A0		igt_assert(vram_size);
> > +		system_size =3D igt_get_avail_ram_mb() << 20;
> > =C2=A0
> > =C2=A0		/* Test requires SRAM to about as big as VRAM. For
> > example, small-cm creates
> > =C2=A0		 * (448 / 2) BOs with a size (1 / 128) of the
> > total VRAM size. For
> > =C2=A0		 * simplicity ensure the SRAM size >=3D VRAM before
> > running this test.
> > =C2=A0		 */
> > -		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size
> > >> 20),
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "System memory %lu MiB is less than
> > local memory %lu MiB\n",
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 igt_get_avail_ram_mb(), vram_size >>
> > 20);
> > +		igt_skip_on_f(system_size < vram_size,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "System memory %llu MiB is less than
> > local memory %llu MiB\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long long)system_size >>
> > 20,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long long)vram_size >>
> > 20);
> > =C2=A0
> > =C2=A0		xe_for_each_engine(fd, hwe)
> > =C2=A0			if (hwe->engine_class !=3D
> > DRM_XE_ENGINE_CLASS_COPY)
> > @@ -770,25 +800,41 @@ igt_main
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	for (const struct section *s =3D sections; s->name; s++) {
> > -		igt_subtest_f("evict-%s", s->name)
> > -			test_evict(fd, hwe, s->n_exec_queues, s-
> > >n_execs,
> > -				=C2=A0=C2=A0 calc_bo_size(vram_size, s->mul,
> > s->div),
> > +		igt_subtest_f("evict-%s", s->name) {
> > +			uint64_t bo_size =3D calc_bo_size(vram_size,
> > s->mul, s->div);
> > +			int ws =3D working_set(vram_size,
> > system_size, bo_size,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 1, s->flags);
> > +
> > +			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > +			test_evict(fd, hwe, s->n_exec_queues,
> > +				=C2=A0=C2=A0 min(ws, s->n_execs), bo_size,
> > =C2=A0				=C2=A0=C2=A0 s->flags, NULL);
> > +		}
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	for (const struct section_cm *s =3D sections_cm; s->name;
> > s++) {
> > -		igt_subtest_f("evict-%s", s->name)
> > -			test_evict_cm(fd, hwe, s->n_exec_queues,
> > s->n_execs,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 calc_bo_size(vram_size, s-
> > >mul, s->div),
> > +		igt_subtest_f("evict-%s", s->name) {
> > +			uint64_t bo_size =3D calc_bo_size(vram_size,
> > s->mul, s->div);
> > +			int ws =3D working_set(vram_size,
> > system_size, bo_size,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 1, s->flags);
> > +
> > +			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > +			test_evict_cm(fd, hwe, s->n_exec_queues,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min(ws, s->n_execs),
> > bo_size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->flags, NULL);
> > +		}
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	for (const struct section_threads *s =3D sections_threads;
> > s->name; s++) {
> > -		igt_subtest_f("evict-%s", s->name)
> > +		igt_subtest_f("evict-%s", s->name) {
> > +			uint64_t bo_size =3D calc_bo_size(vram_size,
> > s->mul, s->div);
> > +			int ws =3D working_set(vram_size,
> > system_size, bo_size,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 s->n_threads, s-
> > >flags);
> > +
> > +			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > =C2=A0			threads(fd, hwe, s->n_threads, s-
> > >n_exec_queues,
> > -				 s->n_execs,
> > -				 calc_bo_size(vram_size, s->mul,
> > s->div),
> > -				 s->flags);
> > +				min(ws, s->n_execs), bo_size, s-
> > >flags);
> > +		}
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	igt_fixture
> > --=20
> > 2.44.0
> >=20

