Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDCB606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hMzjgwpy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0610E107;
	Fri,  6 Nov 2026 13:32:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F656112D67
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793971866; x=1825507866;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NRCumEhCCtccNVyF1BHXiSJeEhRVyz/su6wQX69UOhE=;
 b=hMzjgwpyX7k9+lhSgIOUHCnaBtue845XgLqQhDZNqcbQfNTtm1Do44Bx
 D8dVaKvrj3yjrEdBIO3uUiD75AjnuEvS1nzA3GBRzBsoXF1jMZhQm3SkW
 2ZvxeQhXgURadkgvcLh/IU39iDtVpG9g78T8reXq9Uy5L5mS96Hwet24R
 5c6E4OG8YLRl7v7q6d7bbql3eqzVbLRXEV5hLgt1UXTh9qqJcdMtkn1AJ
 QKwHjOf81s36aGnBy1XswiTvaSzbOhRUNdlkuuGeIqM9ZNUHVT8SErvRS
 lzq8MK6YdddPMc0cOBNweoFLPVB92EHRjPPKav9ynwZ+7UqjsZPAGpvzP Q==;
X-CSE-ConnectionGUID: 2bL6v7qjQzqatmQW5RajBg==
X-CSE-MsgGUID: 4ivgUYITQJ+ZGgv9RlMtUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2824388"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2824388"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:31:06 -0800
X-CSE-ConnectionGUID: vj3XQO5tT9mxvA4fVNWTgA==
X-CSE-MsgGUID: eJG1TbuEQBelO7I/nRRjfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7178560"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:31:03 -0800
Message-ID: <695cfd26228ceea04be8aca01e3bd271449c81f7.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_bo_shrink: Add a user-space
 shrinker test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Fri, 06 Nov 2026 14:31:01 +0100
In-Reply-To: <13f44439-cf3c-4a14-a64a-a1710c40dd84@intel.com>
References: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
 <13f44439-cf3c-4a14-a64a-a1710c40dd84@intel.com>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-11-06 at 13:27 +0000, Matthew Auld wrote:
> On 06/11/2026 13:12, Thomas Hellstr=C3=B6m wrote:
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
ero,
> > =C2=A0=C2=A0 unless there was less than 1 GiB of free swap space at tes=
t
> > start.
> > - *-blit: Never access the objects using the CPU. Instead fill them
> > =C2=A0=C2=A0 from, and read them back to, a CPU-mapped dummy object usi=
ng
> > MEM_COPY
> > =C2=A0=C2=A0 blits in a separate VM, so that they are restored through =
the
> > GPU
> > =C2=A0=C2=A0 paths. On integrated devices with flat CCS, bind the objec=
ts
> > using a
> > =C2=A0=C2=A0 compressed PAT index to cover shrinking of compressed syst=
em
> > memory
> > =C2=A0=C2=A0 objects. On discrete devices, objects are created with sys=
tem
> > and VRAM
> > =C2=A0=C2=A0 placements, prefetched to system memory before the fill an=
d
> > prefetched
> > =C2=A0=C2=A0 to VRAM before the readback, so that they are restored by =
the
> > =C2=A0=C2=A0 migration to VRAM.
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
> >=20
> > v2:
> > - Don't fail the fault-inject subtests if no faults were injected
> > and
> > =C2=A0=C2=A0 there was less than XE_BO_SHRINK_FI_MIN_SWAP (1 GiB) free =
swap
> > space
> > =C2=A0=C2=A0 at test start, since nothing is then backed up or restored
> > - Never access the blit variant bos using the CPU, not even for the
> > =C2=A0=C2=A0 fill. Fill them by blitting from the dummy bo instead
> > - Bind the blit variant bos using a compressed PAT index on
> > integrated
> > =C2=A0=C2=A0 devices with flat CCS to test shrinking of compressed syst=
em
> > memory
> > =C2=A0=C2=A0 bos (Matthew Auld)
> >=20
> > v3:
> > - Create bos that are not intended to be compressed with
> > =C2=A0=C2=A0 DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION, if supported, for
> > consistent
> > =C2=A0=C2=A0 behaviour across platforms (Matthew Auld)
> > - Use cached MOCS for the blitter copies (Matthew Auld)
> >=20
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Assisted-by: GitHub_Copilot:claude-opus-5.5
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks for the review and all the good suggestions!

/Thomas
