Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FA4CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 20:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01CE10E65F;
	Tue, 28 Oct 2025 20:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig6fPwQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C984710E670
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682759; x=1793218759;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OJ5LfMq1y/SRTPQ/CWE4PGm+cJEuzTCPJngLGsKM5is=;
 b=ig6fPwQzIdzWDVQ+ALIy6xfY9nt8NBnDOIbXhcbf6l+8qa4ZVemn5Vdz
 xZItuvTahfhcxDv36B+NhwnpWVhIfTJfemBWxN8mie4wMBU917eG3sGJg
 Z/Drf812R15q73G9KbRAy+zSo86RW6TBErPW5vjTf6+hiUf5MVgcNibVJ
 PV2cr+7EWUmbyx0RDfeUJJN3uGz4GVQiaBti5F7P5bIqnjFMsifzHVRd0
 ehGkDwRfxW4h/Ed3O3yVwRwm38zU8sB8TUbfIR7Jc7xjjyh4IHJtQNyAh
 u4QzOa9JS2w0shyaBUpepqnmL7kqQ9vQgcNyZ7BIquBt+qVYvkPqhEBYM g==;
X-CSE-ConnectionGUID: L/291XPFTXeSOpPiJJvkGQ==
X-CSE-MsgGUID: 5RTcHx/bSHmoP8QyPtF0og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63496885"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63496885"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:19:18 -0700
X-CSE-ConnectionGUID: 6zufK+0tRHet28r7yipHaw==
X-CSE-MsgGUID: /JmA1IArS7y79/gqUDxQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="190636417"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:19:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
In-Reply-To: <20251028165933.73ytkedshcwzs3sl@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
 <e50339ef85b308fb2b6fd8d88f3acf4fc5bd0057@intel.com>
 <3015f56dd17cf5c019824f69f532a0e06b98253a@intel.com>
 <20251028165933.73ytkedshcwzs3sl@kamilkon-DESK.igk.intel.com>
Date: Tue, 28 Oct 2025 22:19:12 +0200
Message-ID: <e654b5a6dbd3a0d5459de2277dd6780566facf0b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 28 Oct 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2025-10-28 at 16:41:45 +0200, Jani Nikula wrote:
>> On Tue, 28 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>> > This is the script I've used, but never bothered to upstream to igt. It
>> > does create separate commits for each kernel change, which was useful =
in
>> > catching up with a lot of kernel changes while remaining bisectable in
>> > igt.
>>=20
>> Seems to work still. Running it now generates this log:
>>=20
>> commit 3ce2a3f06b01cad80923740135bc33fe0967e237 (HEAD -> master)
>> Author: Jani Nikula <jani.nikula@intel.com>
>> Date:   Tue Oct 28 16:39:30 2025 +0200
>>=20
>>     lib: sync i915_pciids.h with kernel commit 5e0de2dfbc1b
>>=20=20=20=20=20
>>     Synchronize i915_pciids.h with kernel commit:
>
> Every code rots, here there are no longer i915_pciids.h nor
> xe_pciids.h, it is now one pciids.h.

Having done that change, I'm aware. ;D

The script does look at the right file, it's just the commit message
that is stale.

> Up to you, if you want to upstream it and maintain it later.

Nah. If anyone's interested, they can pick it up from the list.

SPDX-License-Identifier: MIT
Copyright =C2=A9 2025 Intel Corporation

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

--=20
Jani Nikula, Intel
