Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FEAC369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 17:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E7D10E96F;
	Wed, 16 Apr 2025 17:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy3O3FCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B3310E96F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744823384; x=1776359384;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=eFLKcN77QlD+mLBpaIjOIBk1bWeV/9xeqB00uFu2tdw=;
 b=Iy3O3FCYGItzSUhadydT5V+OWSvXsVkmUphfjMMVHgD3ZA0QUnJ0LjK0
 rJMH0uiLn8lcbPjO5Tk2GryuyMRzk3WeNK7Bc/l1d2KR/sZz0k9YK4N4U
 WduK6hGbUdL1ngYXiTbn14zsDop2nsydpTXuYeuo2/fmpZ8LAK2kNwbvk
 N5WW8RD77c0TWDnljA4gPR06J53vkJBtb5kFzoy1eUAJr8H6AxISJ/K+N
 j7AVi3BmMMvHOGeQqmYuJp1CpdTCG+GkBzEb85nUnVam+5frmd5AAd1q9
 dm3kndDA78Ywb/3vNtt1bjSTzAhOoTCEMELWKr5n0LQhpclAHNEy/q6zO w==;
X-CSE-ConnectionGUID: 4py432yYT8KA2rneoKi8qw==
X-CSE-MsgGUID: vYlwVN0eT9+QfqstWZO+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46306879"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46306879"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 10:09:44 -0700
X-CSE-ConnectionGUID: wkFadsfDS0igo7RpDa4Sfw==
X-CSE-MsgGUID: gVTuq4/aS6qjDF+aqmDaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130541376"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.121])
 ([10.245.246.121])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 10:09:42 -0700
Message-ID: <ac738d56a54052862f5e9fc74f905d05315c33c4.camel@linux.intel.com>
Subject: Re: [PATCH] tests/xe: Add system_allocator test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
Date: Wed, 16 Apr 2025 19:09:40 +0200
In-Reply-To: <20250416022040.355100-1-matthew.brost@intel.com>
References: <20250416022040.355100-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Matt,

On Tue, 2025-04-15 at 19:20 -0700, Matthew Brost wrote:
> Test various uses of system allocator in single thread, multiple
> threads, and multiple processes.
>=20
> Features tested:
> =C2=A0- Malloc with various size
> =C2=A0- Mmap with various sizes and flags including file backed mappings
> =C2=A0- Mixing BO allocations with system allocator
> =C2=A0- Various page sizes
> =C2=A0- Dynamically freeing / unmapping memory
> =C2=A0- Sharing VM across threads
> =C2=A0- Faults racing on different hardware engines / GTs / Tiles
> =C2=A0- GPU faults and CPU faults racing
> =C2=A0- CPU faults on multiple threads racing
> =C2=A0- CPU faults on multiple process racing
> =C2=A0- GPU faults of memory not faulted in by CPU
> =C2=A0- Partial unmap of allocations
> =C2=A0- Attempting to unmap system allocations when GPU has mappings
> =C2=A0- Eviction of both system allocations and BOs
> =C2=A0- Forking child processes and reading data from VRAM
> =C2=A0- mremap data in VRAM
> =C2=A0- Protection changes
> =C2=A0- Multiple faults per execbuf
>=20
> Running on LNL, BMG, PVC 1 tile, and PVC 2 tile.
>=20
> v2:
> =C2=A0- Rebase
> =C2=A0- Fix memory allocation to not interfear with malloc (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Did you have a chance to look at the memory (or rather virtual
adddress) leaks on the tests as well? =20
With the old version it would exceed 1GB after some time, which I
believe caused some slowdown.

Unfortunately the igt library funcs also leaks memory so running the
test under valgrind was a bit noisy, but helped to some extent.

/Thomas

