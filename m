Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A5606A32C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZTCGIsZ2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29F410E7F8;
	Tue,  3 Nov 2026 15:57:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A29110F6B8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 15:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793721370; x=1825257370;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=48Yqg3HK0iUwNnM0ceLmCZzcYkAjOHdvivaohJbnk0s=;
 b=ZTCGIsZ2F0PjDGPBSHXL9vrQR6giXhfH6h4d8X13w3dx+iGYrhTpCbPi
 iWzaetvBr8mqB3ZuqWx1kIFNHIkp9Nbme0JDW61HWrKO24WlX6PDuKhuq
 r6lJM0IlM5JxiWySdUv+LjafPldFCQqv6lsoLgcNjAJYsc5dPYVituNYW
 ylPiEQnLOoVQpmn9C4j/4ZS5cQYJsrzJ4kDaaxFM1N8XpjvTJGe+N/FH3
 B3Uz5BYU7srxdwaWsnW+dAdNt/sIHnCwCcru1btSD+dpPWE9xBgjZ0C/3
 eYLGnbCPCZ5K5AQSVzmsGZX70JMJJ0u1nvmAFfNwAysWforXaC8fLyKfK w==;
X-CSE-ConnectionGUID: /CTD84f5QliloSoGLVIWvw==
X-CSE-MsgGUID: pckp8l/HSgqtojgAUV38wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2360660"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2360660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:56:09 -0800
X-CSE-ConnectionGUID: AJe8gYBfSjul2xhDPe0KQw==
X-CSE-MsgGUID: qwwfTxRTQfSxJ89iN4EWVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6523942"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 07:56:07 -0800
Message-ID: <b3eb67de70169396afeda067e80d91e2448d7d44.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_bo_shrink: Add a user-space
 shrinker test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Tue, 03 Nov 2026 16:56:05 +0100
In-Reply-To: <98f71c1f-bb91-431e-8dbe-c3cae049eeba@intel.com>
References: <20261021123315.10033-1-thomas.hellstrom@linux.intel.com>
 <98f71c1f-bb91-431e-8dbe-c3cae049eeba@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Matt

Thanks for reviewing.

On Thu, 2026-10-22 at 12:22 +0100, Matthew Auld wrote:
> On 21/10/2026 13:33, Thomas Hellstr=C3=B6m wrote:
> > Add a user-space counterpart of the xe_bo_shrink kunit test, now
> > that
> > user-space can mark buffer objects purgeable using the madvise
> > IOCTL.
> >=20
> > The test creates 64 MiB system buffer objects corresponding to
> > twice
> > the amount of free system memory, fills them with pseudo-random
> > data
> > through CPU mappings that are kept alive until readback, and
> > verifies
> > the contents after the overcommit has forced the shrinker to back
> > up
> > or purge them. As in the kunit test, the share of the memory that
> > doesn't fit in free RAM and swap is marked purgeable (DONTNEED) and
> > allocated first. Purgeable objects are only verified if found
> > retained
> > when marked WILLNEED again; purged objects are never accessed.
> >=20
> > Subtests:
> > - shrink: The kunit test equivalent.
> > - purge: Ignore swap space when sizing the purgeable share, so that
> > =C2=A0=C2=A0 the shrinker needs to purge rather than swap.
> > - shrink-fault-inject: Enable TTM backup / restore fault injection
> > =C2=A0=C2=A0 through debugfs, if available, making the shrinker back up=
 only
> > part
> > =C2=A0=C2=A0 of the objects and making backup and restore of individual=
 pages
> > =C2=A0=C2=A0 fail. The number of injected faults is checked to be non-z=
ero.
> > - *-blit: Rather than restoring objects by CPU faults, restore them
> > =C2=A0=C2=A0 through a GPU bind and read them back by a MEM_COPY blit t=
o a
> > dummy
> > =C2=A0=C2=A0 object in a separate VM. On discrete devices, objects are
> > created
> > =C2=A0=C2=A0 with system and VRAM placements, prefetched to system memo=
ry on
> > =C2=A0=C2=A0 creation and prefetched to VRAM before the copy, so that t=
hey
> > are
> > =C2=A0=C2=A0 restored by the migration to VRAM.
>=20
> Do we use any compression here on igpu? IIRC that is still a pretty
> big=20
> test gap. We have the equivalent for VRAM via the CCS evict test, but
> I=20
> don't think we have anything for igpu + CCS via shrinker. Maybe the=20
> kunit does it, but IIUC that is never run in CI?

I'll add that in v2. Basically using compressed bo storage for the
*blit* tests. For CI we will only use the *fast* tests, but provided
there is swap-space available on the CI machine in question, we'd at
least test the copy to shmem objects and back.

>=20
> > - *-private: Create the objects private to the test VM rather than
> > as
> > =C2=A0=C2=A0 external objects.
> > - *-fast: Allocate at most the free system memory, half of it
> > =C2=A0=C2=A0 purgeable, capped to 8 GiB purgeable and 8 GiB non-purgeab=
le,
> > and
> > =C2=A0=C2=A0 shrink using drop_caches rather than memory overcommit.
> >=20
> > The non-fast subtests are slow and require a substantial amount of
> > swap space for meaningful coverage, so block them in CI and run
> > only
> > the fast subtests.
>=20
> Were there any issues with the test itself getting killed? I seem to=20
> vaguely remember something like that from the i915 shrinker test. Or
> is=20
> that not a concern here?

The *fast* tests are going to be the only ones running on CI (that is
in patch 2, but that's when we have a green CI for all tests) and those
shouldn't use up all memory, so hopefully we're safe.

Thanks,
Thomas


