Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B8EC282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D44010E8BF;
	Thu, 13 Mar 2025 14:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2PIEfAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AB710E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876544; x=1773412544;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=UBT8sXTqanN9zmEVyeo4kRaTJ7dctZtB8WBHKm1p7/U=;
 b=U2PIEfAVCTP1dNS+J8JUzXjOs3druNxpC94Dq3Ak2jzv/8RGVxWl4HGS
 2tbDFkPkLPB6Kccc17RJAklaImnIHVJMPLySI8rnQUOQ1GYmnNUy5/TlF
 U8otFR5u4/+kpKA7g2I/Lp5WSneVKiOUF4qMm7QnDdfnDpm85sDld7c+u
 CV6Ejtu5m8C8pluqHG2zfYlXj1MX0D9uzmdkgYt4GYh2tPysGUwzDYmx5
 QXh6Vac4YIoBtAh1/FPfNf2YTGlWyZiwFGBbSnPOPeygxVmXzAiFdRik+
 9I3esjHSDBSl9aB9YTZJuw0zCqyk4TK6MO6ybaQG16OPU7opAZ7u0LDIj Q==;
X-CSE-ConnectionGUID: 9qpFd+rCS5K8RO7avRCg+w==
X-CSE-MsgGUID: xs+oJvgKSjqL14yc6OuoOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43126759"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="43126759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:35:44 -0700
X-CSE-ConnectionGUID: 4gw7nHxOSmav84QZZ7aQqg==
X-CSE-MsgGUID: iYjsqsgJQ7uUOPu0Pyy6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="125595748"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:35:44 -0700
Message-ID: <da47fcb83e5d6d7e36e59380ad97198c85e92b5c.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 05/11] lib/intel_compute: Use common constant for
 general state size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:35:40 +0100
In-Reply-To: <20250311152321.16497-6-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-6-francois.dugast@intel.com>
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
> =C2=A0lib/intel_compute.c | 16 +++++++++++-----
> =C2=A01 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index a85fd8121..302a1d35c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -32,6 +32,7 @@
> =C2=A0#define SIZE_DYNAMIC_STATE		0x100000
> =C2=A0#define SIZE_INDIRECT_OBJECT		0x10000
> =C2=A0#define SIZE_BINDING_TABLE		0x10000
> +#define SIZE_GENERAL_STATE		0x100000
> =C2=A0
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> @@ -991,7 +992,8 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> =C2=A0		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> -		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> +		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> +		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> @@ -1208,7 +1210,8 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> =C2=A0		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> -		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x10000,
> +		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> +		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_BATCH, .size =3D SIZE_BATCH,
> =C2=A0		=C2=A0 .name =3D "batch" },
> @@ -1566,7 +1569,8 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> =C2=A0		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> -		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> +		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> +		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> @@ -1656,7 +1660,8 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> =C2=A0		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> -		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> +		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> +		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> @@ -1907,7 +1912,8 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		=C2=A0 .name =3D "addr input"},
> =C2=A0		{ .addr =3D ADDR_OUTPUT, .size =3D SIZE_BUFFER_OUTPUT,
> =C2=A0		=C2=A0 .name =3D "addr output" },
> -		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> +		{ .addr =3D ADDR_GENERAL_STATE_BASE,
> +		=C2=A0 .size =3D SIZE_GENERAL_STATE,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> =C2=A0		=C2=A0 .size =3D SIZE_BINDING_TABLE,

