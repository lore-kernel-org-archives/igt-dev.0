Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0402C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 16:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F1210E928;
	Tue, 27 Feb 2024 16:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqCOZSnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7C10E5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709050136; x=1740586136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x6ZvK72+Pu3yAlldtycA7YLNfnM9kYei6FjYjfIscSI=;
 b=MqCOZSnIVNQF/PhhQxO6d+wV8/2NS01HwGxNOkAttkXbYgbK53GhhAQr
 D7KIbEEIMdg1Jd7RarOXQrMDg5G+cJSYFEXCYzCgStnUGlJt63Nz9K3xK
 foABbawDC1iJghJ1zvUXV3JNuN3eTUcAnQ+IYBlJqPQXtwevITVo78f76
 lEhoZALEbIkMOI4vuCY2nANYwMcvcKK0Y6bbsgt7rQRH8IeDABk1OH2br
 gXx9bkdHlESWhveU5W2hIcBZdk45+bu9pn+KLegeHv+KmDw43wHKMyeH/
 3Nerx2w+zcg7vhtNbnPkABxJ8ql+X9WXCK6DNeqK3xmnGqUVUDILMvAs1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3558489"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3558489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="38124082"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.4.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 08:08:53 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v10 0/6] introduce Xe multigpu and other multi-GPU
 helpers
Date: Tue, 27 Feb 2024 17:08:50 +0100
Message-ID: <4555521.LvFx2qVVIh@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
References: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
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

On Wednesday, 21 February 2024 17:46:31 CET Kamil Konieczny wrote:
>       Introduce some multi-gpu function helpers and macros. This allows
> writing new multiGPU tests for i915 without requiring filters.
> Solution for Xe is based on filtered views. Both allows to
> quickly write tests. There is still drawback of not printing in
> children logs <g:gpu-number> for first (for Xe) opened device or for
> all opened ones (for i915). I renamed lib from lib/i915/igt_multigpu.*
> to lib/intel_multigu.* as I do not know of any non Intel developer
> using igt for such tests.
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
>  renamed macro from xe_ to generic and also adding chipset parameter to i=
t,
>  so it is more flexible now (Zbigniew) fix xe test to use new macro (Kami=
l)
>=20
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Dominik Karol Pi=C4=85tkowski (3):
>   lib/igt_device_scan: Introduce filtering out non-PCI devices
>   lib/drmtest: Introduced drm_open_driver_another
>   lib/intel_multigpu: Introduce library for multi-GPU scenarios

Since the above patches, those three that you expect me to provide my revie=
w=20
for, introduce new functions and no users of them, I decided to look into=20
other patches of the series for some use cases, and I found that those=20
functions, just introduced, are further modified and/or extended, be that o=
nly=20
with a documentation.  I propose to move those updates to patches that=20
introduce those functions, or to separate patches that follow, before the=20
functions are used.

Thanks,
Janusz

>=20
> Kamil Konieczny (3):
>   lib/intel_multigpu: Add multi_fork_foreach_gpu_chip
>   tests/intel/xe_exec_basic: add multigpu subtests
>   tests/intel/gem_exec_gttfill: simplify multiGPU subtest
>=20
>  lib/drmtest.c                  | 109 ++++++++++++++++++---------
>  lib/drmtest.h                  |   2 +
>  lib/igt_device_scan.c          |  23 ++++++
>  lib/igt_device_scan.h          |   2 +
>  lib/intel_multigpu.c           | 134 +++++++++++++++++++++++++++++++++
>  lib/intel_multigpu.h           |  36 +++++++++
>  lib/meson.build                |   1 +
>  tests/intel/gem_exec_gttfill.c |  13 +---
>  tests/intel/xe_exec_basic.c    |  36 +++++++++
>  9 files changed, 311 insertions(+), 45 deletions(-)
>  create mode 100644 lib/intel_multigpu.c
>  create mode 100644 lib/intel_multigpu.h
>=20
>=20




