Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBD7C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B6210E21B;
	Thu, 13 Mar 2025 14:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQQA5UZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EBC10E21B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741877050; x=1773413050;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=RsXkkvpx4cRg817FgZxjVplJ646d1B1AH0vbO8tJSZ8=;
 b=nQQA5UZdd5CXtxGpFUCtGeiF+nc1EEznZfyX3/vtVKX+UBtC2hntjfNB
 Qcaj2UDxfRh6L/W/sBTDPJJJ5fal2AphusovcTeHoSkfLzLAWhb+kXuuF
 Pl9FgJn6etG9oTo7nsSNQl+/esmtDbHmC1SQdJOsDMGHJBUxxQbHS8Nac
 a+ANef02h4UPw+Ok230vbEqdv6mDNoJTd7fUuyF1xFSLaUt23J81kNDZL
 OLOf6sPq0mXSei5MKDHJSm3ECqG7hZdxrO5qTmz+XGHmm9guqzW1k7Qkk
 MxlXesXlB/1sfFRIAcMyq2s2HaJMYz9FwfB1ko+V7KaEY5yiFcUGLW33a w==;
X-CSE-ConnectionGUID: GTDET4XpRVqSkgyh3inXjw==
X-CSE-MsgGUID: 0zbIM0/7SdGWjW1woec0tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42879229"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42879229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:44:09 -0700
X-CSE-ConnectionGUID: A2AyOsUpQzeJliOoFCTZlQ==
X-CSE-MsgGUID: fJQ7LE+4ToydZ1bZWnu9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121027652"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:44:08 -0700
Message-ID: <2a5d449ed48cf0fc0d9bb1c956ce1205380b9c35.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 07/11] lib/intel_compute: Compact memory map
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:44:05 +0100
In-Reply-To: <20250311152321.16497-8-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-8-francois.dugast@intel.com>
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
> Bring the objects close to each other at the beginning of the memory
> space to reduce distribution and make room for very large contiguous
> memory ranges for user buffers.
>=20
> For compute square, memory after ADDR_INSTRUCTION_STATE_BASE + kernel
> size is now free.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/intel_compute.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 79c0f0f00..364388e20 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -41,16 +41,16 @@
> =C2=A0#define ADDR_OUTPUT			0x300000ULL
> =C2=A0#define ADDR_SURFACE_STATE_BASE		0x400000ULL
> =C2=A0#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
> -#define ADDR_INDIRECT_OBJECT_BASE	0x100000000
> +#define ADDR_INDIRECT_OBJECT_BASE	0x600000ULL
> =C2=A0#define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE)
> -#define OFFSET_INDIRECT_DATA_START	0xFFFD0000
> -#define OFFSET_KERNEL			0xFFFE0000
> +#define OFFSET_INDIRECT_DATA_START	0x5D0000ULL
> +#define OFFSET_KERNEL			0x5E0000ULL
> =C2=A0
> -#define ADDR_GENERAL_STATE_BASE		0x80000000ULL
> -#define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
> +#define ADDR_GENERAL_STATE_BASE		0x8000000ULL
> +#define ADDR_INSTRUCTION_STATE_BASE	0xa000000ULL
> =C2=A0#define OFFSET_BINDING_TABLE		0x10000
> =C2=A0
> -#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
> +#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0xb000000ULL
> =C2=A0#define OFFSET_STATE_SIP			0xFFFF0000
> =C2=A0
> =C2=A0#define
> USER_FENCE_VALUE			0xdeadbeefdeadbeefull

