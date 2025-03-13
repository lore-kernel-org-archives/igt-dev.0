Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA70AC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A255410E8BD;
	Thu, 13 Mar 2025 14:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnFMmcSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DCA10E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876892; x=1773412892;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=9DDE1H2EthvhA/MeY6n6uXh+oXYmedZo5ktfD71PRNQ=;
 b=GnFMmcSSCPg5KSniIwb/04jo9fo+5IHSa/SXJur8hpBDIiergR2VKUAM
 qb8cfV/yXvfYBSQC9eX/meQ/He0VBO7Ca8loLRh4TGfpRHdh/impe/4/p
 Hn7NQTiLtWGoNo/4LfX9k1QVrd3WcGpWCBa8qvhB9Tx0cWyz2xeL8UNiC
 7+k76qdERR/gnJGNwSONP9knuB+jBE1cDljAgkNMkYGcTmZ//v6upALGq
 oQkIOmfb0tPrECM+YtyR5PX8LjupxlBmeSZdB/OtdnUfekHzcekMMmtB1
 yXUp5OUi9DRfNvrLJc0pr8n1kjXpxRJ7NGrZ5btkLExnEVUSIsEJuu5jD w==;
X-CSE-ConnectionGUID: /4anurYdSVuBdJ7HjO2miQ==
X-CSE-MsgGUID: LwWelCA3T8CwDktw75Ss9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30588677"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="30588677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:41:32 -0700
X-CSE-ConnectionGUID: 0FH4uznQTmyvf/Vl/l20zQ==
X-CSE-MsgGUID: xWuQCWMuQM2TwBtZyElVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="120928942"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:41:30 -0700
Message-ID: <e2f90d644f25f28ee941e3ba7ac60013ebb36c02.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 06/11] lib/intel_compute: Use constant for binding
 table address
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:41:28 +0100
In-Reply-To: <20250311152321.16497-7-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-7-francois.dugast@intel.com>
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

On Tue, 2025-03-11 at 16:21 +0100, Francois Dugast wrote:
> The binding address is the same, no need to duplicate its definition
> for each pipeline.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/intel_compute.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 302a1d35c..79c0f0f00 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -42,6 +42,7 @@
> =C2=A0#define ADDR_SURFACE_STATE_BASE		0x400000ULL
> =C2=A0#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
> =C2=A0#define ADDR_INDIRECT_OBJECT_BASE	0x100000000
> +#define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE)
> =C2=A0#define OFFSET_INDIRECT_DATA_START	0xFFFD0000
> =C2=A0#define OFFSET_KERNEL			0xFFFE0000
> =C2=A0
> @@ -995,7 +996,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> -		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> +		{ .addr =3D ADDR_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH, .size =3D SIZE_BATCH,
> @@ -1572,7 +1573,7 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> -		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> +		{ .addr =3D ADDR_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> @@ -1663,7 +1664,7 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> -		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> +		{ .addr =3D ADDR_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> @@ -1915,7 +1916,7 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> -		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> +		{ .addr =3D ADDR_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,

