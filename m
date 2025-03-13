Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3339AC35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 15:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE79210E1DE;
	Thu, 13 Mar 2025 15:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWX1JV3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288310E1E9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741880141; x=1773416141;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=SSN0Ky/Vps4++GIunvKYBvfzhVle4zGiFNQFkhnbMWE=;
 b=QWX1JV3h9uSRaM77iGUajrCDZtajet8eD2EyURKQ4lSsmPr9zuOfgTYF
 4ZD9Br2GeqRIYkfLyzOFDOyye4qtcZM1EdxHiyXBlAjQRyeulFJjoB+VK
 /Yar5XJriZPMESxS45+LdOhc2jWhrOn1yxh+FMm5397APT8Ht7SrDRXSO
 zo+3zR6y8k+DwY55+frIlfARNhwnbHiM3dBiDg5SJ0QFVHFRt29XfgpP9
 8ZyPc98YxnKLfSXVA+VG/BkPvGDLWMoJVpp6lKN/QDSYs3qY0yfMKIThM
 5pB1AoSINBVOKUymRWTmGd00L03TnuU66/slFkUMcsFPj/VuIAX3CDmDq g==;
X-CSE-ConnectionGUID: pYy2OkS6QzyyGRi4j4xWFg==
X-CSE-MsgGUID: gFHLK9paTl2PpadIBd7gEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42888264"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42888264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:35:41 -0700
X-CSE-ConnectionGUID: Au9jH2lqTm+6gCqJ2LGWLQ==
X-CSE-MsgGUID: vP0EG/DGQTGKYBRrLZ9J9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="125878521"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:35:40 -0700
Message-ID: <3808b4b77f7cb941e038588e6e5fb842a4bca1fd.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 03/11] lib/intel_compute: Use common constant for
 indirect object size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 16:35:36 +0100
In-Reply-To: <20250311152321.16497-4-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-4-francois.dugast@intel.com>
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
> =C2=A0lib/intel_compute.c | 13 +++++++------
> =C2=A01 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index b4b022ae7..e3c8cf244 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -30,6 +30,7 @@
> =C2=A0#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) *
> SIZE_DATA, 0x10000)
> =C2=A0#define SIZE_SURFACE_STATE		0x10000
> =C2=A0#define SIZE_DYNAMIC_STATE		0x100000
> +#define SIZE_INDIRECT_OBJECT		0x10000
> =C2=A0
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> @@ -698,7 +699,7 @@ static void compute_exec(int fd, const unsigned
> char *kernel,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base" },
> =C2=A0		{ .addr =3D ADDR_INDIRECT_OBJECT_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x10000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect data start" },
> =C2=A0		{ .addr =3D ADDR_INPUT,
> =C2=A0		=C2=A0 .size =3D SIZE_BUFFER_INPUT,
> @@ -983,7 +984,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x10000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> =C2=A0		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> @@ -1200,7 +1201,7 @@ static void xehpc_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_INSTRUCTION_STATE_BASE +
> OFFSET_KERNEL,
> =C2=A0		=C2=A0 .name =3D "instr state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x10000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> =C2=A0		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> @@ -1558,7 +1559,7 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x1000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> =C2=A0		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> @@ -1648,7 +1649,7 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x1000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> =C2=A0		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},
> @@ -1899,7 +1900,7 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		=C2=A0 .size =3D SIZE_SURFACE_STATE,
> =C2=A0		=C2=A0 .name =3D "surface state base"},
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE +
> OFFSET_INDIRECT_DATA_START,
> -		=C2=A0 .size =3D=C2=A0 0x1000,
> +		=C2=A0 .size =3D SIZE_INDIRECT_OBJECT,
> =C2=A0		=C2=A0 .name =3D "indirect object base"},
> =C2=A0		{ .addr =3D ADDR_INPUT, .size =3D SIZE_BUFFER_INPUT,
> =C2=A0		=C2=A0 .name =3D "addr input"},

