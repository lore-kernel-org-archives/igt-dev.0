Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C1FC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE71010E21B;
	Thu, 13 Mar 2025 14:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jH+1jamX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA1010E21B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741877146; x=1773413146;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=LlcF7a0RILc8xnMhJ06V/ct2f78ZcPUTBwqEr6kJH08=;
 b=jH+1jamX8wEN54dIQGTmJ3IuDDrvHErt1IcrQO4eHLu8IJzHi2LJwfqP
 zwwpaAwAK0Ehgu8SFjAPQJKc1LyFd/sqCzUxk0U16o+LSdBxteGFsqijP
 dtR5ZNmv1WVUKZG8Tr9NVZ76RHKnbYx99xno3wwdsoVb90KDiHxbCMd0e
 nPz1uQY+exk3SW0TiXGSC1j3qAb5djBq1xwqVUWNgSK4svnk8d5yqdkLs
 RnB7PMrcTtXlT0wqcSJfs7L+IvfVtLZTCVkvAD7WA0jVa+41+SWDg61qs
 IHtAOnHnvshyoyQtMivvGLffwK8Zdue/ii8AtlQh38Y43iPNMi9U2y5Yh g==;
X-CSE-ConnectionGUID: 9xQrsB2KSeandYfVBgn24w==
X-CSE-MsgGUID: sFVFIMQORhmNoP1auGbVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43128093"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="43128093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:45:46 -0700
X-CSE-ConnectionGUID: s9qMVOfeS1Cq63KZ45Xiuw==
X-CSE-MsgGUID: DJWRGq5VQEaH5mZF6SKanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="125599315"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:45:44 -0700
Message-ID: <019906f715d1fe5a090502c4cc630016391f937b.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 08/11] lib/intel_compute: Relocate input and
 output objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 15:45:42 +0100
In-Reply-To: <20250311152321.16497-9-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
 <20250311152321.16497-9-francois.dugast@intel.com>
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
> Move those objects after other objects and add space between them to
> make it possible to increase their dimension without overlapping
> between input and output.
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/intel_compute.c | 20 ++++++++++----------
> =C2=A01 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 364388e20..7a2e04b10 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -37,20 +37,20 @@
> =C2=A0#define ADDR_SYNC			0x010000ULL
> =C2=A0#define ADDR_SYNC2			0x020000ULL
> =C2=A0#define ADDR_BATCH			0x100000ULL
> -#define ADDR_INPUT			0x200000ULL
> -#define ADDR_OUTPUT			0x300000ULL
> -#define ADDR_SURFACE_STATE_BASE		0x400000ULL
> -#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
> -#define ADDR_INDIRECT_OBJECT_BASE	0x600000ULL
> +#define ADDR_INPUT			0x40000000ULL
> +#define ADDR_OUTPUT			0x80000000ULL
> +#define ADDR_SURFACE_STATE_BASE		0x200000ULL
> +#define ADDR_DYNAMIC_STATE_BASE		0x300000ULL
> +#define ADDR_INDIRECT_OBJECT_BASE	0x400000ULL
> =C2=A0#define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE +
> OFFSET_BINDING_TABLE)
> -#define OFFSET_INDIRECT_DATA_START	0x5D0000ULL
> -#define OFFSET_KERNEL			0x5E0000ULL
> +#define OFFSET_INDIRECT_DATA_START	0x3D0000ULL
> +#define OFFSET_KERNEL			0x3E0000ULL
> =C2=A0
> -#define ADDR_GENERAL_STATE_BASE		0x8000000ULL
> -#define ADDR_INSTRUCTION_STATE_BASE	0xa000000ULL
> +#define ADDR_GENERAL_STATE_BASE		0x6000000ULL
> +#define ADDR_INSTRUCTION_STATE_BASE	0x8000000ULL
> =C2=A0#define OFFSET_BINDING_TABLE		0x10000
> =C2=A0
> -#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0xb000000ULL
> +#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> =C2=A0#define OFFSET_STATE_SIP			0xFFFF0000
> =C2=A0
> =C2=A0#define
> USER_FENCE_VALUE			0xdeadbeefdeadbeefull

