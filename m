Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8AEC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D310E8B3;
	Thu, 13 Mar 2025 14:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFlW8PH2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8AC10E8B3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876130; x=1773412130;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=S3xpE2HjMZD79fOF1keRxwUrM+unnntD7wpEtlRXqVU=;
 b=oFlW8PH2PIIwKDcE0W9EQwMP6B8dkyIjeN8/uMTBJalttloqtg9JJv2M
 /k3Vsw4WPHdAWb3iX8DiUo6ubE1CD1o0dcAKG2vbyAoYrK/5iFZ2R51jZ
 UIva3f9aAbBLdne90gmvvaqSPbHAzjkRA6E6mGeyRFRV+gI1rZwyEPI3q
 BGOCJxY8lChxfCdbOihhniITenKnOaXyI8c+S80xoqNiAk/6Uogt/QI3N
 caClD4qOtDzfECRlwnSJtl/6UPJREqgEqc+TcznWMwzah8XREecudzMBo
 4ZKQTEFhhRAFJkBhy9/6h5aGz68C1KFkJmwVJweY1tzEYBukMLUVX2ZgK A==;
X-CSE-ConnectionGUID: +iR9H4CzRZCv4p4oilCG9A==
X-CSE-MsgGUID: DdxzJoDhT/iBQcWnmqq4fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30586479"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="30586479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:28:50 -0700
X-CSE-ConnectionGUID: tQHmjG+gS5uTlXGqSPXNeA==
X-CSE-MsgGUID: eGmvT+7MReKEgXTqp19JWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="151834156"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:28:48 -0700
Message-ID: <f774aa2aa7d0b1dd58ceddc3b35cdc18f02d4fa0.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 01/11] lib/intel_compute: Use common constant for
 surface state size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:28:46 +0100
In-Reply-To: <20250311152321.16497-2-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-2-francois.dugast@intel.com>
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
> =C2=A0lib/intel_compute.c | 13 ++++++++-----
> =C2=A01 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index dd9c83c9c..7d3380186 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -23,10 +23,13 @@
> =C2=A0#define PIPE_CONTROL			0x7a000004
> =C2=A0#define MEDIA_STATE_FLUSH		0x0
> =C2=A0#define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
> +
> =C2=A0#define SIZE_DATA			64
> =C2=A0#define SIZE_BATCH			0x10000
> =C2=A0#define SIZE_BUFFER_INPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> =C2=A0#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> +#define SIZE_SURFACE_STATE		0x10000
> +
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> =C2=A0#define ADDR_BATCH			0x100000ULL
> @@ -691,7 +694,7 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x1000,
> =C2=A0		=C2=A0 .name =3D "dynamic state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> -		=C2=A0 .size =3D=C2=A0 0x1000,
> +		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base" },
> =C2=A0		{ .addr =3D ADDR_INDIRECT_OBJECT_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x10000,
> @@ -976,7 +979,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> -		=C2=A0 .size =3D 0x10000,
> +		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x10000,
> @@ -1551,7 +1554,7 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x1000,
> @@ -1641,7 +1644,7 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x1000,
> @@ -1892,7 +1895,7 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		=C2=A0 .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "dynamic state base"},
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> =C2=A0		=C2=A0 .size =3D=C2=A0 0x1000,

