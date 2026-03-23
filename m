Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F62F483CC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 17:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27F10E04C;
	Mon, 23 Mar 2026 17:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niCufpwf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5447F10E04C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774285558; x=1805821558;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=u0WDHDtx0Nas+xeexJDDUe1VHymb2wAO1dz14oqFG8g=;
 b=niCufpwf0/L8o2BS+YcCvP/JRft71ZWjHSNLT8Gv2ivIDbxZFbK0AC3v
 7TwSIrIr7Bn2ZfNblVHlpk4wi89hEa9J3Fi/6qI229u2alkpBu7KhdtiA
 y6BXFkJOq88r0NKiG9OVxQVaGht9oZ8DYsoQOV1Hwm9wKEYdxN5+ajS50
 nhUqOKMUvxqE+Q6p3N+s/kXz1ARYx0hb0UqD7C5MllnBKajV5cx1ir41c
 uPmPqHo+T9pnq2TQW7WHeLNK+c9L/BKSHzGBR76oC+8KNfCxk3JdoDiSt
 818sjCyskxChR5y4WkbzC5g9NoFIdXRjQtDFpJcWGpA9CQKMeqvUGGcjs A==;
X-CSE-ConnectionGUID: lZ9UhwKtThSJ4gF8h/uaHw==
X-CSE-MsgGUID: gaImjW1bQYiThlNtuyTDaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75311525"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75311525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:05:46 -0700
X-CSE-ConnectionGUID: zjf4hqT7S7en/u8B3W5BmA==
X-CSE-MsgGUID: /Rc39GpNQJS1+Y/QgJAxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="247120965"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:05:45 -0700
Message-ID: <d51282450f3a4995afc39e3189e2dbac1fe880bb.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/1] tests/xe_vm: Add oversubscribe concurrent
 bind stress test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com
Date: Mon, 23 Mar 2026 18:05:42 +0100
In-Reply-To: <20260218164417.856114-1-sobin.thomas@intel.com>
References: <20260218164417.856114-1-sobin.thomas@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

Hi,

On Wed, 2026-02-18 at 16:44 +0000, Sobin Thomas wrote:
> Add an xe_vm subtest that oversubscribes VRAM and issues
> concurrent binds into a single VM (scratch-page mode) to
> reproduce the dma-resv/bind race found under memory pressure.
> Prior coverage lacked any case that combined multi-process bind
> pressure with VRAM oversubscription, so bind/submit could
> panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
> The new test expects successful completion or ENOMEM/EDEADLK.

No need to add a cover-letter when there is only a single patch. Just
add all information in the patch cover-message.

Are you seeing an EDEADLK error? That sounds like a KMD bug.

Thanks,
Thomas


>=20
> Sobin Thomas (1):
> =C2=A0 tests/xe_vm: Add oversubscribe concurrent bind stress
>=20
> =C2=A0tests/intel/xe_vm.c | 421
> ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 421 insertions(+)
