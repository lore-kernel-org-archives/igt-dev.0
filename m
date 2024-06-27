Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDC8C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D79810EA50;
	Thu, 27 Jun 2024 07:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSWPEDA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BCF10EA50
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473308; x=1751009308;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=60XG4iXdggEeueHoL6byoRg65wxkZ4bLFFGDQuGf9/E=;
 b=fSWPEDA5YVNLvryYo1/K7rwM48aNcfhovDvfP3voAL1o2nbFamwSrcjs
 qV2ZdWfaoNOzz9dhNygBb0Ou2nP17HdASKB/KPkdbPpLYtPik0IopwjVB
 yl4hhyeHqPiwcqn9XJfIBfvIjs/WBTjU9ZUvSMXKg8pi4R4OihaucP2Vt
 LHAdTtlrbzC6UNWm73OJnCzAN4cjJ7dTOkFQcjX9n70OXlBctfQfFUIuL
 1utYW9ywK7R/aBICFMJmCf64aLrw0eOVDEpsysazufRb9W6ZkhPU0DBQx
 M+CX3AN4xtgtH0De9cEpz2VAeGXFoeKN9tddE50Qmj3KJaoMJHYVYbM6k Q==;
X-CSE-ConnectionGUID: aQQDmTDEQti9NqKomeq6LQ==
X-CSE-MsgGUID: BFNufVlfSyi7qYZTf9qvgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16540411"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16540411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:28:27 -0700
X-CSE-ConnectionGUID: RLT6JiAGR4+HTs8FcTsJoQ==
X-CSE-MsgGUID: h1PZexfSTl2cpZxKNItYNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="48747192"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.82])
 ([10.245.245.82])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:28:26 -0700
Message-ID: <be5b00d7cdaba6ba4b8bab66a9581fcff7a8b226.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_evict: Reduce allocations to
 maximum working set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Date: Thu, 27 Jun 2024 09:28:23 +0200
In-Reply-To: <Zn0GvXZ/laQtVesC@DUT025-TGLU.fm.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
 <20240626123833.3164-2-thomas.hellstrom@linux.intel.com>
 <Zn0GvXZ/laQtVesC@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-06-27 at 06:29 +0000, Matthew Brost wrote:
> On Wed, Jun 26, 2024 at 02:38:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Current xe kmd allows for a maximum working set of VRAM plus
> > half of system memory, or if the working set is allowed only in
> > VRAM, the working set is limited to VRAM.
> >=20
> > Some subtests attempt to exceed that. Detect when that happens
> > and limit the working set accordingly.
> >=20
> > v2:
> > - The determination for which flags system bos are allowed in the
> > =C2=A0 working set was incorrect. Fix. (Zbigniew Kempczy=C5=84ski)
> > - Fix a typo.
> > - Add an assert that vram_size is indeed > 0.
> > =C2=A0 (Zbigniew Kempczy=C5=84ski, Thomas)
> > - Add asserts and make sure that the bo is bound to the same
> > =C2=A0 vm the exec_queue is using.
> > - Increase the allowed set size for the multi-vm test.
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0tests/intel/xe_evict.c | 89 ++++++++++++++++++++++++++++++++++++-=
-
> > ----
> > =C2=A01 file changed, 76 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index eebdbc84b..5691ad021 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -97,6 +97,7 @@ test_evict(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 uint32_t _vm =3D (flags & EXTERNAL_OBJ) &&
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i < n_execs / 8 ? 0 : vm;
> > =C2=A0
> > +			igt_assert((e & 1) =3D=3D (i & 1));
> > =C2=A0			if (flags & MULTI_VM) {
> > =C2=A0				__bo =3D bo[i] =3D xe_bo_create(fd, 0,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > bo_size,
> > @@ -115,6 +116,7 @@ test_evict(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > =C2=A0			}
> > =C2=A0		} else {
> > +			igt_assert((e & 1) =3D=3D ((i % (n_execs / 2))
> > & 1));
> > =C2=A0			__bo =3D bo[i % (n_execs / 2)];
> > =C2=A0		}
> > =C2=A0		if (i)
> > @@ -273,6 +275,7 @@ test_evict_cm(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 uint32_t _vm =3D (flags & EXTERNAL_OBJ) &&
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i < n_execs / 8 ? 0 : vm;
> > =C2=A0
> > +			igt_assert((e & 1) =3D=3D (i & 1));
> > =C2=A0			if (flags & MULTI_VM) {
> > =C2=A0				__bo =3D bo[i] =3D xe_bo_create(fd, 0,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > bo_size,
> > @@ -291,6 +294,7 @@ test_evict_cm(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > =C2=A0			}
> > =C2=A0		} else {
> > +			igt_assert((e & 1) =3D=3D ((i % (n_execs / 2))
> > & 1));
> > =C2=A0			__bo =3D bo[i % (n_execs / 2)];
> > =C2=A0		}
> > =C2=A0		if (i)
> > @@ -458,6 +462,46 @@ static uint64_t calc_bo_size(uint64_t
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
> > +	igt_assert(vram_size > 0);
> > +
> > +	set_size =3D (vram_size - 1) / bo_size;
> > +
> > +	/*
> > +	 * Working set resides also in system?
> > +	 * Currently system graphics memory is limited to 50% of
> > total.
> > +	 */
> > +	if (!(flags & (THREADED | MULTI_VM)))
> > +		set_size +=3D (system_size / 2) / bo_size;
> > +
> > +	/* Set sizes are per vm. In the multi-vm case we use 2
> > vms. */
> > +	if (flags & MULTI_VM)
> > +		set_size *=3D 2;
> > +
> > +	/* All bos must fit in memory, assuming no swapping */
> > +	total_size =3D ((vram_size - 1) / bo_size + system_size /
> > bo_size) /
>=20
> Should this not be '(system_size / 2) / bo_size'?

No, bos swapped out to shmem are allowed to fill system memory.

However, system_size is a bit aggressive if there is no swap-space...

/Thomas



>=20
> Matt
>=20
> > +		num_threads;
> > +
> > +	if (set_size > total_size)
> > +		set_size =3D total_size;
> > +
> > +	/* bos are only created on half of the execs. */
> > +	set_size *=3D 2;
> > +
> > +	/*
> > +	 * Align down to ensure the vm the bo is bound to matches
> > the vm
> > +	 * used by the exec_queue, fulfilling the asserts in the
> > +	 * tests.
> > +	 */
> > +	return ALIGN_DOWN(set_size, 4);
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * SUBTEST: evict-%s
> > =C2=A0 * Description:=C2=A0 %arg[1] evict test.
> > @@ -748,6 +792,7 @@ igt_main
> > =C2=A0		{ NULL },
> > =C2=A0	};
> > =C2=A0	uint64_t vram_size;
> > +	uint64_t system_size;
> > =C2=A0	int fd;
> > =C2=A0
> > =C2=A0	igt_fixture {
> > @@ -755,14 +800,16 @@ igt_main
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
> > @@ -770,25 +817,41 @@ igt_main
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

