Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F8C282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C7010E8B6;
	Thu, 13 Mar 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNeKoW4X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410FB10E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876215; x=1773412215;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=FtV9PZzo+NPAJi5T/x1WFXQToKhDVk8Sj+bndrBZIIE=;
 b=iNeKoW4XzvjaiJvXEpwa4xWvNqMCICTwHtfFpr6bKPCs+VrvoTJErb2F
 ceXZzf3DjaX/p6SkBNX4XN1Vdo0+FMg+JgaYBXxQRvCn3GvxvRhxKP73k
 PEYUsCjnK5lHa2CugtbdexmpRrSZW17TuLgSPfjFeBy8P+BCLe9xQ3gne
 jWdmEQXR+RxeWyccjbzqN3YOQwEuACbQKtmtUm4q4Hfyotox3iQBdgirp
 5ME20QVuAKklPXUhTyGnne0WmU7p15Sl2QXULnpO9lPbG/shReF+sTESS
 8XRw7UH/yOfB++uFyirqMtMIMkIVm1BKwGTQPHh9vVwI3gbOen8sCRwtB A==;
X-CSE-ConnectionGUID: +cH712b2TcWEmhspBeFq7g==
X-CSE-MsgGUID: 7wnaehvsQL6WW+YRshTLHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43097960"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43097960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:30:11 -0700
X-CSE-ConnectionGUID: tikkNrCLSWy4rou0oemC9A==
X-CSE-MsgGUID: NW//X8D3Rt+wWshucih2Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120756851"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:30:08 -0700
Message-ID: <3ff9c99feaa36d92b5b0e927e7d1d48fa310befb.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 02/11] lib/intel_compute: Use common constant for
 dynamic state size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:30:05 +0100
In-Reply-To: <20250311152321.16497-3-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-3-francois.dugast@intel.com>
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
> Reduce magic values in the code, homogenize the size which has no
> reason to be different among pipelines, define this value close to
> the addresses to make it easier to spot potential overlaps in the
> future.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/intel_compute.c | 11 ++++++-----
> =C2=A01 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 7d3380186..b4b022ae7 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -29,6 +29,7 @@
> =C2=A0#define SIZE_BUFFER_INPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> =C2=A0#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> =C2=A0#define SIZE_SURFACE_STATE		0x10000
> +#define SIZE_DYNAMIC_STATE		0x100000
> =C2=A0
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> @@ -691,7 +692,7 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0		{ .addr =3D ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "kernel" },
> =C2=A0		{ .addr =3D ADDR_DYNAMIC_STATE_BASE,
> -		=C2=A0 .size =3D=C2=A0 0x1000,
> +		=C2=A0 .size =3D SIZE_DYNAMIC_STATE,
> =C2=A0		=C2=A0 .name =3D "dynamic state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> @@ -976,7 +977,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_INSTRUCTION_STATE_BASE +
> OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "instr state base"},
> =C2=A0		{ .addr =3D ADDR_DYNAMIC_STATE_BASE,
> -		=C2=A0 .size =3D 0x100000,
> +		=C2=A0 .size =3D SIZE_DYNAMIC_STATE,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> @@ -1551,7 +1552,7 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_INSTRUCTION_STATE_BASE +
> OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "instr state base"},
> =C2=A0		{ .addr =3D ADDR_DYNAMIC_STATE_BASE,
> -		=C2=A0 .size =3D 0x100000,
> +		=C2=A0 .size =3D SIZE_DYNAMIC_STATE,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> @@ -1641,7 +1642,7 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_INSTRUCTION_STATE_BASE +
> OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "instr state base"},
> =C2=A0		{ .addr =3D ADDR_DYNAMIC_STATE_BASE,
> -		=C2=A0 .size =3D 0x100000,
> +		=C2=A0 .size =3D SIZE_DYNAMIC_STATE,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> @@ -1892,7 +1893,7 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		{ .addr =3D ADDR_INSTRUCTION_STATE_BASE +
> OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "instr state base"},
> =C2=A0		{ .addr =3D ADDR_DYNAMIC_STATE_BASE,
> -		=C2=A0 .size =3D 0x100000,
> +		=C2=A0 .size =3D SIZE_DYNAMIC_STATE,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,

