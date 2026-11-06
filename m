Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D54606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4LnM9Yo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB28112D61;
	Fri,  6 Nov 2026 13:28:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A97112D65
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793971679; x=1825507679;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3nKw8TOhMxYPRFc8vnUfpypJE6A23uE01rr9yNw0wts=;
 b=n4LnM9YoYsj4wRqWlnJN4uPYL4UspZ56Pi9GNzFafPO07uUMzGP8Ivzn
 PwbbzQ5xJlPLfDsH6ExtdoiBou39h3ipyfAQYC2TfaybWVrGHZk73RlVS
 hu9ATYs4S8thVg7PkXVyZ8SRQ6TpTYdLAQyY9zxhMSra8oW8wGddUlcBF
 AngRSTgwv/V4TKMs3DucjGp+eOzxH5J1ddPkkh6q/6oEPO6u/RN1fbduB
 3LvXhvQjnxwETTH3WvlpPmJJJhi4CLZd/hgsZCwE+SnLA+PmZErI64ejj
 aTr+rKE1QDFn8oD4QUMSEkp0CEPWqwI6QPnCEbadX21MPwdM0dMQQXxC1 w==;
X-CSE-ConnectionGUID: Llr2HkkCSP22gBqMUQyFZQ==
X-CSE-MsgGUID: Y/HDxkDxRf+yFhz/Dqdz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2777352"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2777352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:27:58 -0800
X-CSE-ConnectionGUID: ZqzO9RjxQoGJ59FpDnXnIA==
X-CSE-MsgGUID: KEBoVXnRR+u8dPde27OcHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7634465"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.124])
 ([10.245.245.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:27:57 -0800
Message-ID: <13f44439-cf3c-4a14-a64a-a1710c40dd84@intel.com>
Date: Fri, 6 Nov 2026 13:27:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_bo_shrink: Add a user-space
 shrinker test
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 13:12, Thomas Hellström wrote:
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
>    fail. The number of injected faults is checked to be non-zero,
>    unless there was less than 1 GiB of free swap space at test start.
> - *-blit: Never access the objects using the CPU. Instead fill them
>    from, and read them back to, a CPU-mapped dummy object using MEM_COPY
>    blits in a separate VM, so that they are restored through the GPU
>    paths. On integrated devices with flat CCS, bind the objects using a
>    compressed PAT index to cover shrinking of compressed system memory
>    objects. On discrete devices, objects are created with system and VRAM
>    placements, prefetched to system memory before the fill and prefetched
>    to VRAM before the readback, so that they are restored by the
>    migration to VRAM.
> - *-private: Create the objects private to the test VM rather than as
>    external objects.
> - *-fast: Allocate at most the free system memory, half of it
>    purgeable, capped to 8 GiB purgeable and 8 GiB non-purgeable, and
>    shrink using drop_caches rather than memory overcommit.
> 
> The non-fast subtests are slow and require a substantial amount of
> swap space for meaningful coverage, so block them in CI and run only
> the fast subtests.
> 
> v2:
> - Don't fail the fault-inject subtests if no faults were injected and
>    there was less than XE_BO_SHRINK_FI_MIN_SWAP (1 GiB) free swap space
>    at test start, since nothing is then backed up or restored
> - Never access the blit variant bos using the CPU, not even for the
>    fill. Fill them by blitting from the dummy bo instead
> - Bind the blit variant bos using a compressed PAT index on integrated
>    devices with flat CCS to test shrinking of compressed system memory
>    bos (Matthew Auld)
> 
> v3:
> - Create bos that are not intended to be compressed with
>    DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION, if supported, for consistent
>    behaviour across platforms (Matthew Auld)
> - Use cached MOCS for the blitter copies (Matthew Auld)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: GitHub_Copilot:claude-opus-5.5
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
