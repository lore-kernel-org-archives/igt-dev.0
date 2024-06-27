Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B274C2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C9010EA55;
	Thu, 27 Jun 2024 07:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvNVvtJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FED710EA55
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473475; x=1751009475;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aY/O3jX6LUhU4fstJOrFjdwFEsmOtxVG2z0mRqOM9y8=;
 b=MvNVvtJLzbxgVe98urIhD/FzpwBjGWrMEDf0lrKGpEWbGUfWXdJVZmwi
 Goq8FpOmiuLnu5Yg9adMyAczr1ev5Oup9neum46gze5aFlpefnKt4p5AE
 2KRsM3b/lDVeAbZnLqjbmR3PQv+mLDG2fY1ksUr20g15sUcR1R7vCoFpZ
 EDIDIo4OIpgFRHybIWJ1WHaU5WvlSUDMJbk8AEVMHtNvEPzqhziVrhG2t
 526HIoiMLQ7zj8xZrC/Y8MQutwLIx4YmGrCMeesOopADlJ4AXRGIQwaEo
 OIbRHqltkun/fxzaU6g8hs7CJul2ZtpTC2ul0aSr2fv7ug0CdFlJpVDvh A==;
X-CSE-ConnectionGUID: fbSV+1tFTZeIT+Q72iTOww==
X-CSE-MsgGUID: wDwsq3U5ReaTeMFuukWAFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16540748"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16540748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:31:14 -0700
X-CSE-ConnectionGUID: zf6bzkmkTI69gfCTXIpunw==
X-CSE-MsgGUID: QkUIDp20RFaF++wz4vHzuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="75471892"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.82])
 ([10.245.245.82])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:31:13 -0700
Message-ID: <cac23f80b7bec12bfdc5a35269a94e564d697536.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_evict: Reduce the "large" bo
 size for threaded eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Date: Thu, 27 Jun 2024 09:31:11 +0200
In-Reply-To: <Zn0H/D/DXVoEdSX0@DUT025-TGLU.fm.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
 <20240626123833.3164-3-thomas.hellstrom@linux.intel.com>
 <Zn0H/D/DXVoEdSX0@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-06-27 at 06:34 +0000, Matthew Brost wrote:
> On Wed, Jun 26, 2024 at 02:38:33PM +0200, Thomas Hellstr=C3=B6m wrote:
> > When calculating the number of bos that simultaneously fits in
> > VRAM + system memory, account for eviction pipelining by
> > subtracting
> > one bo for ongoing pipelined evictions per thread.
> >=20
> > With large bos this may lead to us not being able to use a working
> > set of 2 bos, which is the minimum, so reduce the large bo size for
> > threaded evictions, and instead increase the default number of bos.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0tests/intel/xe_evict.c | 41 +++++++++++++++++++++++++------------=
-
> > ---
> > =C2=A01 file changed, 25 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index 5691ad021..13e90d317 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -484,10 +484,16 @@ static unsigned int working_set(uint64_t
> > vram_size, uint64_t system_size,
> > =C2=A0	if (flags & MULTI_VM)
> > =C2=A0		set_size *=3D 2;
> > =C2=A0
> > -	/* All bos must fit in memory, assuming no swapping */
> > -	total_size =3D ((vram_size - 1) / bo_size + system_size /
> > bo_size) /
> > +	/*
> > +	 * All bos must fit in memory, assuming no swapping.
> > Subtract one bo per
> > +	 * thread for an active eviction.
> > +	 */
> > +	total_size =3D ((vram_size - 1) / bo_size + (system_size -
> > 1) / bo_size - 1) /
>=20
> Had a comment in previous patch about 'system_size / bo_size' too.
>=20
> Why change this to (system_size - 1) here?

It's to round down if the large bos is an exact multiple of system
size. However, with the comment on the previous patch I think it makes
more sense to use a fraction, say 90% of available system size. I'll
check if igt has a way of detecting available swap size as well...

/Thomas


>=20
> I get the '- 1' at the end.
>=20
> Matt
>=20
> > =C2=A0		num_threads;
> > =C2=A0
> > +	igt_debug("num_threads: %d bo_size : %lu total_size : %lu
> > \n", num_threads,
> > +		=C2=A0 bo_size, total_size);
> > +
> > =C2=A0	if (set_size > total_size)
> > =C2=A0		set_size =3D total_size;
> > =C2=A0
> > @@ -741,13 +747,13 @@ igt_main
> > =C2=A0			MIXED_THREADS | THREADED },
> > =C2=A0		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
> > =C2=A0			THREADED },
> > -		{ "threads-large", 2, 2, 4, 3, 8,
> > +		{ "threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			THREADED },
> > -		{ "cm-threads-large", 2, 2, 4, 3, 8,
> > +		{ "cm-threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			COMPUTE_THREAD | THREADED },
> > -		{ "mixed-threads-large", 2, 2, 4, 3, 8,
> > +		{ "mixed-threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			MIXED_THREADS | THREADED },
> > -		{ "mixed-many-threads-large", 3, 2, 4, 3, 8,
> > +		{ "mixed-many-threads-large", 3, 2, 16, 3, 32,
> > =C2=A0			THREADED },
> > =C2=A0		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
> > =C2=A0			MULTI_VM | THREADED },
> > @@ -755,11 +761,11 @@ igt_main
> > =C2=A0			COMPUTE_THREAD | MULTI_VM | THREADED },
> > =C2=A0		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1,
> > 128,
> > =C2=A0			MIXED_THREADS | MULTI_VM | THREADED },
> > -		{ "threads-large-multi-vm", 2, 2, 4, 3, 8,
> > +		{ "threads-large-multi-vm", 2, 2, 16, 3, 32,
> > =C2=A0			MULTI_VM | THREADED },
> > -		{ "cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
> > +		{ "cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
> > =C2=A0			COMPUTE_THREAD | MULTI_VM | THREADED },
> > -		{ "mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
> > +		{ "mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
> > =C2=A0			MIXED_THREADS | MULTI_VM | THREADED },
> > =C2=A0		{ "beng-threads-small", 2, 16, 128, 1, 128,
> > =C2=A0			THREADED | BIND_EXEC_QUEUE },
> > @@ -769,13 +775,13 @@ igt_main
> > =C2=A0			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE
> > },
> > =C2=A0		{ "beng-mixed-many-threads-small", 3, 16, 128, 1,
> > 128,
> > =C2=A0			THREADED | BIND_EXEC_QUEUE },
> > -		{ "beng-threads-large", 2, 2, 4, 3, 8,
> > +		{ "beng-threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			THREADED | BIND_EXEC_QUEUE },
> > -		{ "beng-cm-threads-large", 2, 2, 4, 3, 8,
> > +		{ "beng-cm-threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			COMPUTE_THREAD | THREADED |
> > BIND_EXEC_QUEUE },
> > -		{ "beng-mixed-threads-large", 2, 2, 4, 3, 8,
> > +		{ "beng-mixed-threads-large", 2, 2, 16, 3, 32,
> > =C2=A0			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE
> > },
> > -		{ "beng-mixed-many-threads-large", 3, 2, 4, 3, 8,
> > +		{ "beng-mixed-many-threads-large", 3, 2, 16, 3,
> > 32,
> > =C2=A0			THREADED | BIND_EXEC_QUEUE },
> > =C2=A0		{ "beng-threads-small-multi-vm", 2, 16, 128, 1,
> > 128,
> > =C2=A0			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> > @@ -783,11 +789,11 @@ igt_main
> > =C2=A0			COMPUTE_THREAD | MULTI_VM | THREADED |
> > BIND_EXEC_QUEUE },
> > =C2=A0		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128,
> > 1, 128,
> > =C2=A0			MIXED_THREADS | MULTI_VM | THREADED |
> > BIND_EXEC_QUEUE },
> > -		{ "beng-threads-large-multi-vm", 2, 2, 4, 3, 8,
> > +		{ "beng-threads-large-multi-vm", 2, 2, 16, 3, 32,
> > =C2=A0			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> > -		{ "beng-cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
> > +		{ "beng-cm-threads-large-multi-vm", 2, 2, 16, 3,
> > 32,
> > =C2=A0			COMPUTE_THREAD | MULTI_VM | THREADED |
> > BIND_EXEC_QUEUE },
> > -		{ "beng-mixed-threads-large-multi-vm", 2, 2, 4, 3,
> > 8,
> > +		{ "beng-mixed-threads-large-multi-vm", 2, 2, 16,
> > 3, 32,
> > =C2=A0			MIXED_THREADS | MULTI_VM | THREADED |
> > BIND_EXEC_QUEUE },
> > =C2=A0		{ NULL },
> > =C2=A0	};
> > @@ -823,6 +829,7 @@ igt_main
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 1, s->flags);
> > =C2=A0
> > =C2=A0			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > +			igt_skip_on_f(!ws, "System memory size is
> > too small.\n");
> > =C2=A0			test_evict(fd, hwe, s->n_exec_queues,
> > =C2=A0				=C2=A0=C2=A0 min(ws, s->n_execs), bo_size,
> > =C2=A0				=C2=A0=C2=A0 s->flags, NULL);
> > @@ -836,6 +843,7 @@ igt_main
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 1, s->flags);
> > =C2=A0
> > =C2=A0			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > +			igt_skip_on_f(!ws, "System memory size is
> > too small.\n");
> > =C2=A0			test_evict_cm(fd, hwe, s->n_exec_queues,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min(ws, s->n_execs),
> > bo_size,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->flags, NULL);
> > @@ -849,6 +857,7 @@ igt_main
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 s->n_threads, s-
> > >flags);
> > =C2=A0
> > =C2=A0			igt_debug("Max working set %d n_execs
> > %d\n", ws, s->n_execs);
> > +			igt_skip_on_f(!ws, "System memory size is
> > too small.\n");
> > =C2=A0			threads(fd, hwe, s->n_threads, s-
> > >n_exec_queues,
> > =C2=A0				min(ws, s->n_execs), bo_size, s-
> > >flags);
> > =C2=A0		}
> > --=20
> > 2.44.0
> >=20

