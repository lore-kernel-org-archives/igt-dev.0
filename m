Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5FFD41C19
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 09:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C603610E36F;
	Wed, 13 Nov 2024 09:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFTxYIQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434310E36F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731488511; x=1763024511;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TdTue62uopJhY3t1e6vpZ9+HjZYSiOQ27Rdvis9djE8=;
 b=nFTxYIQKp7MIXXcwEg4cyAXRYAQXhdwJZKodP6Bmvdf4b1i4OfBWUbmP
 QSM0p50jls7wUV5zu/teHDAHS53fd8c+lZZXuYzI+nTXlpsQeAeIt8TBC
 jZt32mCST1SkihWNyyd9C94AUYH1LEcFjOJ3wHe/EyxCl4bRTpkgnKhTI
 Rtk7X1/tSd9RzyTN3pORqyJoNSZg22rmFZrM0qcDIayJAA7O13oiZz1VS
 BS+6THhyWNf2qF76XmYOvKDa3p1ik8VyYHpWMJARwWP5+MDxMQ2MzC8fd
 aWtQhq4uYFYAOpVVWxg1o7tRNV+RyGe56LqHDWQBfu3rIc4zGx58h5gRs Q==;
X-CSE-ConnectionGUID: 8saoJMm2SiS6mznNnDc1FQ==
X-CSE-MsgGUID: C2DcmH7mTjSVYXIp2lAR9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35161127"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="35161127"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:01:51 -0800
X-CSE-ConnectionGUID: tFT+g8yoTTCd01bpH2KHhQ==
X-CSE-MsgGUID: T1GLp1DNSNuna0gWoWp9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88621426"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:01:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ngai-Mint Kwan
 <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
In-Reply-To: <20241113064849.udg2ey5bglp35eyf@zkempczy-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
 <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
 <87cyj0d7co.fsf@intel.com>
 <20241112115745.qwb2qqovpntdn6uz@zkempczy-mobl2>
 <871pzgd2r1.fsf@intel.com>
 <20241113064849.udg2ey5bglp35eyf@zkempczy-mobl2>
Date: Wed, 13 Nov 2024 11:01:45 +0200
Message-ID: <87plmzbj7q.fsf@intel.com>
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

On Wed, 13 Nov 2024, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.=
com> wrote:
> On Tue, Nov 12, 2024 at 03:02:10PM +0200, Jani Nikula wrote:
>
> <cut>
>
>> >
>> > I see no __KERNEL__ in current xe_pciids.h and i915_pciids.h so
>> > there's some change from my perspective. intel_vbt_defs.h also
>> > doesn't contain any kernel conditional inside. I think author
>> > of this change should provide additional documentation about this
>> > (not me) - commit message for me is not enough. Till this change
>> > I haven't noticed any __KERNEL__ usage in igt codebase and I think
>> > if it appears it should be documented what's for dead code is
>> > imported to the project.
>>=20
>> See igt commit e966143f5c5f ("lib/intel_device_info: use dedicated macro
>> for struct pci_id_match init"). INTEL_VGA_DEVICE has been unused in igt
>> since then.
>>=20
>> I wrapped the macro in #ifdef __KERNEL__ in kernel commit fc9cb46bdca8
>> ("drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()")
>> to avoid it being used in igt again.
>
> Rationale of your change is clear to me - isolation of INTEL_VGA_DEVICE()
> to use in the kernel only. My problems are when I see such thing in the
> igt header
>
> #ifdef __KERNEL__
>
> ... some definitions ...
>
> #endif
>
> 1. is someone really is setting up __KERNEL__ in igt build system?
>    What's for it is here? (cognitive problem)
> 2. this conditional is not necessary here, let's remove it.
>    (dead code problem)
>
> I guess you will not accept change in which I would remove __KERNEL__
> conditional from the header (2).
>
>>=20
>> I'm not going to document this further in igt.
>
> I'm asking for the documenting of this change not for me, but for
> other developers who might be confused by this conditional in the
> future. Especially we want to copy this header from the kernel.
> If you still think this is not necessary I have no other arguments
> to convince you to add some note to README.md.

I didn't say it's not necessary (nor did I say that it is). I said I
decline to write further documentation on this. If igt developers want
more documentation, they know what it needs to say, and I don't.


BR,
Jani.


--=20
Jani Nikula, Intel
