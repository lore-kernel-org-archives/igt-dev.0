Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A781606A322
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dNdACwpo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C65112558;
	Thu, 22 Oct 2026 11:26:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB17112558
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792668342; x=1824204342;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kcmrEYI8SeQRfkjBoIGz5X7IxM/Gsh1TSbfPfoHgjYI=;
 b=dNdACwpon0YiN3F0naqNIYX1QKzZDAUCwwoDiarkyJSp1+BVQiCVaBUT
 PDzWmWKUuBCJ+a0jC1ZtypFB+vI5ng4yH52DwIESKyejsUTt+gOfKySaF
 dUTcMQkScN3AvBGfxnBTt/GG6w7IGLx9KiyL9ouZEBDTnsLOriUWFh/+A
 X5CrhuEEircX+5omT5sn/UvqSWhL4LqBknCzJNuuMV8Nxk79RHCf9Ds6F
 YHufZEE6qLzbOtE57Tv6noYR/pBn29hs+A71SCXhBGQ0CwWSMuXV/kYuV
 5g7ljVeP0YK39M+EnzBgOmYYvVmqJWf7E9bhHqdr/e/HThpaKFVWduvaC w==;
X-CSE-ConnectionGUID: fk5KhhOIRoed7iIyg/ndOA==
X-CSE-MsgGUID: OfQ8SxHeSOaeGNLmwkgjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1414072"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1414072"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:22:16 -0700
X-CSE-ConnectionGUID: EEVOkKuNQDOEco3mcs8vuQ==
X-CSE-MsgGUID: I7jS2VO7QOmQNJblWiQw/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3681540"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:22:14 -0700
Message-ID: <98f71c1f-bb91-431e-8dbe-c3cae049eeba@intel.com>
Date: Thu, 22 Oct 2026 12:22:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_bo_shrink: Add a user-space shrinker
 test
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261021123315.10033-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261021123315.10033-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21/10/2026 13:33, Thomas Hellström wrote:
> Add a user-space counterpart of the xe_bo_shrink kunit test, now that
> user-space can mark buffer objects purgeable using the madvise IOCTL.
> 
> The test creates 64 MiB system buffer objects corresponding to twice
> the amount of free system memory, fills them with pseudo-random data
> through CPU mappings that are kept alive until readback, and verifies
> the contents after the overcommit has forced the shrinker to back up
> or purge them. As in the kunit test, the share of the memory that
> doesn't fit in free RAM and swap is marked purgeable (DONTNEED) and
> allocated first. Purgeable objects are only verified if found retained
> when marked WILLNEED again; purged objects are never accessed.
> 
> Subtests:
> - shrink: The kunit test equivalent.
> - purge: Ignore swap space when sizing the purgeable share, so that
>    the shrinker needs to purge rather than swap.
> - shrink-fault-inject: Enable TTM backup / restore fault injection
>    through debugfs, if available, making the shrinker back up only part
>    of the objects and making backup and restore of individual pages
>    fail. The number of injected faults is checked to be non-zero.
> - *-blit: Rather than restoring objects by CPU faults, restore them
>    through a GPU bind and read them back by a MEM_COPY blit to a dummy
>    object in a separate VM. On discrete devices, objects are created
>    with system and VRAM placements, prefetched to system memory on
>    creation and prefetched to VRAM before the copy, so that they are
>    restored by the migration to VRAM.

Do we use any compression here on igpu? IIRC that is still a pretty big 
test gap. We have the equivalent for VRAM via the CCS evict test, but I 
don't think we have anything for igpu + CCS via shrinker. Maybe the 
kunit does it, but IIUC that is never run in CI?

> - *-private: Create the objects private to the test VM rather than as
>    external objects.
> - *-fast: Allocate at most the free system memory, half of it
>    purgeable, capped to 8 GiB purgeable and 8 GiB non-purgeable, and
>    shrink using drop_caches rather than memory overcommit.
> 
> The non-fast subtests are slow and require a substantial amount of
> swap space for meaningful coverage, so block them in CI and run only
> the fast subtests.

Were there any issues with the test itself getting killed? I seem to 
vaguely remember something like that from the i915 shrinker test. Or is 
that not a concern here?

