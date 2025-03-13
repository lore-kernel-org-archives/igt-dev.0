Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF0C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0704B10E8B6;
	Thu, 13 Mar 2025 14:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKx1EEuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9A610E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741876320; x=1773412320;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=biJ9+U2JQYupyeigpLnhpJUfhtEge0CisZ1LzLUn49c=;
 b=oKx1EEuZxnyWmqtG12NjVU4EWXh/DJ5RE1xMIxZIhEvHNIxxBNpKspio
 1LAso861UMUFCpdn11/OMZC7MQOFLBHcjfBIBUe0ypADVsEEFHv3wbkXW
 SDGQ4TsRazjab3nQXjfIJE/xYtQG8cv7uQi8r5duOm9Tz0arjDMr+154D
 OnKPPH036VD8OggyZON4IlQpKdpXIurc9om6HIVXMwfb2rlL7yl52V+Wj
 ugncyEqm0Gozq+g12vh40uhsA96/lBW96WDP6lwaTk2jhIcJRDMKNWy93
 stTosMVVbaBfbt+MVQIP3pazfNbARKe4p2tzpvS6E2wWztpaJcOeIsQDK w==;
X-CSE-ConnectionGUID: zo/SahigQca2c4ftAdea9Q==
X-CSE-MsgGUID: M25sn6tDRZ2EJymTDErsLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46898746"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="46898746"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:31:58 -0700
X-CSE-ConnectionGUID: izJA8O8AQgWws0hD25Y8sw==
X-CSE-MsgGUID: 4cWZCS/vQT6L6mGUFQf4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="158123315"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:31:57 -0700
Message-ID: <5614d4018345ac4923513f3936665e7a451d6124.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 04/11] lib/intel_compute: Use common constant for
 binding table size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:31:54 +0100
In-Reply-To: <20250311152321.16497-5-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-5-francois.dugast@intel.com>
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
> =C2=A0lib/intel_compute.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index e3c8cf244..a85fd8121 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -31,6 +31,7 @@
> =C2=A0#define SIZE_SURFACE_STATE		0x10000
> =C2=A0#define SIZE_DYNAMIC_STATE		0x100000
> =C2=A0#define SIZE_INDIRECT_OBJECT		0x10000
> +#define SIZE_BINDING_TABLE		0x10000
> =C2=A0
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> @@ -993,7 +994,7 @@ static void xehp_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> -		=C2=A0 .size =3D 0x10000,
> +		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH, .size =3D SIZE_BATCH,
> =C2=A0		=C2=A0 .name =3D "batch" },
> @@ -1568,7 +1569,7 @@ static void xelpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> =C2=A0		=C2=A0 .size =3D SIZE_BATCH,
> @@ -1658,7 +1659,7 @@ static void xe2lpg_compute_exec(int fd, const
> unsigned char *kernel,
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> =C2=A0		=C2=A0 .size =3D SIZE_BATCH,
> @@ -1909,7 +1910,7 @@ static void xe2lpg_compute_preempt_exec(int fd,
> const unsigned char *long_kernel
> =C2=A0		{ .addr =3D ADDR_GENERAL_STATE_BASE, .size =3D 0x100000,
> =C2=A0		=C2=A0 .name =3D "general state base" },
> =C2=A0		{ .addr =3D ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE,
> -		=C2=A0 .size =3D 0x1000,
> +		=C2=A0 .size =3D SIZE_BINDING_TABLE,
> =C2=A0		=C2=A0 .name =3D "binding table" },
> =C2=A0		{ .addr =3D ADDR_BATCH,
> =C2=A0		=C2=A0 .size =3D SIZE_BATCH,

