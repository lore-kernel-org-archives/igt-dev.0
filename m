Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64703C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 12:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91510F889;
	Thu, 14 Mar 2024 12:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFF5Igg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7B10F873
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710420964; x=1741956964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLXT3dRzUru4aQ5kOqY6HkuvXAFQbEb/+Vhj13qzn7c=;
 b=JFF5Igg/0thqThGt9WAmNiAdn8MyqSBWN/omkLyyqyQHTI7sg11sU4Nr
 BYAGUqKRfhuPxqLSZIlWZ3rOuowmWtWOH30SkmX6Ex0TJFXqLfCNV7XrQ
 +N87eiC0+DmcJdePbMYLVWahiTGusrVQMwhOp6ZoKLzglK5vuntzsoVcb
 VJF9lh0xoPLOdTXbsFBJNkXeXjcBbNftTfn78k1RDLjtU7m//vkGFp3bO
 DHcOg+UDuKGNtkjP3LoYmCVulfRLCQfwYDLoJB/SSPf3dZMDUv+BIeL1Z
 7oCSv/OWp00ycfTnf2B46t3EqKygRPGb8lhKFN0WLSFZNxJBJGMBms5HS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5416672"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5416672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16945741"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.87])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 05:56:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v12 0/6] introduce Xe multigpu and other multi-GPU
 helpers
Date: Thu, 14 Mar 2024 13:55:57 +0100
Message-ID: <4828262.A9s0UXYOmP@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
References: <20240313192945.171395-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Kamil,

On Wednesday, 13 March 2024 20:29:39 CET Kamil Konieczny wrote:
>       Introduce some multi-gpu function helpers and macros. This allows
> writing new multiGPU tests for i915 without requiring filters.
> Solution for Xe is based on filtered views. Both allows to
> quickly write tests. There is still drawback of not printing in
> children logs <g:gpu-number> for first (for Xe) opened device or for
> all opened ones (for i915). I renamed lib from lib/i915/igt_multigpu.*
> to lib/igt_multigu.* as they should work for other vendors.

Looking at the patches, I can see you may be not able to implement a single=
=20
set of helpers that will satisfy requirements of both tests you need to ext=
end=20
with new subtests.  Since mixing two different solutions to similar problem=
s=20
in one series makes the picture less clear, could we have that split into t=
wo=20
series?

Thanks,
Janusz

>=20
> v2: corrected two patches which introduced multigpu lib (Dominik)
>   rebased patch intoducing Xe multigpu macro, corrected description
> v3: corrected include in first multigpu patch (Dominik)
>   fixed typo (Dominik), refactoring code with Xe and gem macro (Kamil)
> v4: corrected typo in macro (Dominik)
> v5: removed cached names and relaxing checks for filtered devices
>   in 3/8 patch, added Janusz to cc in 1/8...5/8 (Kamil)
> v6: extended description of patches 1 and 2, fixed bug in 3/8 (Janusz)
>   improved usage of _is_already_opened() (Kamil)
> v7: restored prohibition of opening the same card at other index (Janusz)
> v8: limit checks for N-th card to 0...N-1 range (Janusz)
>  simplify if-else in __search_and_open() (Kamil)
> v9: dropped patch 3/8 ("lib/drmtest: allow opening cards in random order")
>  as it can be added later, replaced 8/8 ("tests/intel/gem_mmap: add basic
>  multi-GPU") with refactor in gem_exec_gttfill (Kamil)
> v10: added new helper close function into drmtest.c (Kamil)
>  use skip in drm_open_driver() in drmtest.c (Janusz)
>  renamed macro from xe_multi_fork_foreach_gpu to multi_fork_foreach_gpu_c=
hip
>  and also adding chipset parameter to it, so it is more flexible (Zbignie=
w)
>  fix xe test to use new macro (Kamil)
>  squashed patches 3 and 4 into one (Janusz)
> v11: moved descriptions for new functions into patch where they are
>  introduced (Janusz)
>  corrected description in cover letter for v10 (Kamil)
> v12: many improvements suggested by Janusz
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Dominik Karol Pi=C4=85tkowski (3):
>   lib/igt_device_scan: Introduce filtering out non-PCI devices
>   lib/drmtest: Introduced drm_open_driver_another
>   lib/igt_multigpu: Introduce library for multi-GPU scenarios
>=20
> Kamil Konieczny (3):
>   lib/igt_multigpu: Add igt_foreach_gpu_chip
>   tests/intel/xe_exec_basic: add multigpu subtests
>   tests/intel/gem_exec_gttfill: simplify multiGPU subtest
>=20
>  lib/drmtest.c                  | 109 +++++++++++++++++---------
>  lib/drmtest.h                  |   2 +
>  lib/igt_device_scan.c          |  23 ++++++
>  lib/igt_device_scan.h          |   2 +
>  lib/igt_multigpu.c             | 135 +++++++++++++++++++++++++++++++++
>  lib/igt_multigpu.h             |  43 +++++++++++
>  lib/meson.build                |   1 +
>  tests/intel/gem_exec_gttfill.c |  13 +---
>  tests/intel/xe_exec_basic.c    |  36 +++++++++
>  9 files changed, 319 insertions(+), 45 deletions(-)
>  create mode 100644 lib/igt_multigpu.c
>  create mode 100644 lib/igt_multigpu.h
>=20
>=20




