Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8E5C282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 15:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FF010E8D7;
	Thu, 13 Mar 2025 15:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoBcKgXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD710E8D7
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741878554; x=1773414554;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=xwfoZzxrUcmuOa2CMf9RQ0uKpO7qx0Bcqs/9Vs4Tt0w=;
 b=KoBcKgXggSHnnNqxPaDLkLcc+xC8PR/h8CFH1aWJYWY58bv7HecdCIeL
 /XEXrKWXubkg27Nu1IrhPHY3fwt8fMSFK6UMF+vfKnB6h8V3ZHtDd8TV+
 Bv6ngfmYCGrLWoa83qOApyrm/8uw+jhcsBl1xyhV6udaXQSzJMPPiR/9+
 b9gomgpwiky2B1CsFVYdjghEKNm6Ib3rv5SwfEVbMIUobb7dd9AR7o2mA
 DkTsGcX3SPaVc3rNujZTOPwCpwpoIdDFgUkWWGFpaX+PGdAfJL9sJr4je
 LBvbmtHyudXteZ1FuQvVQ97t4gjSa1Oq8NtYrqf8kLro0/XnIp7BrzxSK A==;
X-CSE-ConnectionGUID: vFIIKSN3SZeMX27TqpvYKQ==
X-CSE-MsgGUID: DlnWp2S3Q76em1TGbgSbOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42171653"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42171653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:09:12 -0700
X-CSE-ConnectionGUID: 7cgVAlplR8m7wpjLgtzTwg==
X-CSE-MsgGUID: v8WrjmJgRRi6pH6ORdUGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121484633"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 08:09:12 -0700
Message-ID: <3547dc61d585e4a01eb3692635a4e874e96d5256.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 10/11] lib/intel_compute: Use constants for thread
 groups and local work size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 16:09:09 +0100
In-Reply-To: <20250311152321.16497-11-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-11-francois.dugast@intel.com>
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
> Define new constants and use them to build the pipeline instead of
> magic values. This also helps homogenize the code to enforce a
> similar execution across GPUs. Having them grouped together in the
> file makes it easier to experiment with different values, as they
> depend on each other but where previously distributed.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
> =C2=A0lib/intel_compute.c | 34 ++++++++++++++++++++++------------
> =C2=A01 file changed, 22 insertions(+), 12 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index f5b3a88f0..068d64b24 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -55,6 +55,16 @@
> =C2=A0
> =C2=A0#define
> USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> =C2=A0
> +#define THREADS_PER_GROUP		32
> +#define THREAD_GROUP_X			MAX(1, SIZE_DATA /
> (ENQUEUED_LOCAL_SIZE_X * \
> +							=C2=A0=C2=A0=C2=A0
> ENQUEUED_LOCAL_SIZE_Y * \
> +							=C2=A0=C2=A0=C2=A0
> ENQUEUED_LOCAL_SIZE_Z))
> +#define THREAD_GROUP_Y			1
> +#define THREAD_GROUP_Z			1
> +#define ENQUEUED_LOCAL_SIZE_X		1024
> +#define ENQUEUED_LOCAL_SIZE_Y		1
> +#define ENQUEUED_LOCAL_SIZE_Z		1

Nit: Perhaps define these before THREAD_GROUP macros to make it
clearer.
Anyway,=20
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> +
> =C2=A0/*
> =C2=A0 * TGP=C2=A0 - ThreadGroup Preemption
> =C2=A0 * WMTP - Walker Mid Thread Preemption
> @@ -781,9 +791,9 @@ static void xehp_create_indirect_data(uint32_t
> *addr_bo_buffer_batch,
> =C2=A0	addr_bo_buffer_batch[b++] =3D addr_output & 0xffffffff;
> =C2=A0	addr_bo_buffer_batch[b++] =3D addr_output >> 32;
> =C2=A0	addr_bo_buffer_batch[b++] =3D loop_count;
> -	addr_bo_buffer_batch[b++] =3D 0x00000400; // Enqueued local
> size X
> -	addr_bo_buffer_batch[b++] =3D 0x00000001; // Enqueued local
> size Y
> -	addr_bo_buffer_batch[b++] =3D 0x00000001; // Enqueued local
> size Z
> +	addr_bo_buffer_batch[b++] =3D ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] =3D ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] =3D ENQUEUED_LOCAL_SIZE_Z;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> @@ -1164,7 +1174,7 @@ static void xehpc_compute_exec_compute(uint32_t
> *addr_bo_buffer_batch,
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00180000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> -	addr_bo_buffer_batch[b++] =3D 0x0c000020;
> +	addr_bo_buffer_batch[b++] =3D 0x0c000000 | THREADS_PER_GROUP;
> =C2=A0
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000008;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> @@ -1332,10 +1342,10 @@ static void
> xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0xbe040000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0xffffffff;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x000003ff;
> -	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_X;
> =C2=A0
> -	addr_bo_buffer_batch[b++] =3D 0x00000001;
> -	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Y;
> +	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Z;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> @@ -1350,7 +1360,7 @@ static void xelpg_compute_exec_compute(uint32_t
> *addr_bo_buffer_batch,
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00001080;
> -	addr_bo_buffer_batch[b++] =3D 0x0c000020;
> +	addr_bo_buffer_batch[b++] =3D 0x0c000000 | THREADS_PER_GROUP;
> =C2=A0
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000008;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> @@ -1470,10 +1480,10 @@ static void
> xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> =C2=A0		 */
> =C2=A0		addr_bo_buffer_batch[b++] =3D 0x00200000; // Thread
> Group ID X Dimension
> =C2=A0	else
> -		addr_bo_buffer_batch[b++] =3D 0x00000002;
> +		addr_bo_buffer_batch[b++] =3D THREAD_GROUP_X;
> =C2=A0
> -	addr_bo_buffer_batch[b++] =3D 0x00000001; // Thread Group ID Y
> Dimension
> -	addr_bo_buffer_batch[b++] =3D 0x00000001; // Thread Group ID Z
> Dimension
> +	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Y;
> +	addr_bo_buffer_batch[b++] =3D THREAD_GROUP_Z;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> @@ -1494,7 +1504,7 @@ static void
> xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> =C2=A0
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> -	addr_bo_buffer_batch[b++] =3D 0x0c000020;
> +	addr_bo_buffer_batch[b++] =3D 0x0c000000 | THREADS_PER_GROUP;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00000000;
> =C2=A0	addr_bo_buffer_batch[b++] =3D 0x00001047;

