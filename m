Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AACC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 11:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EA710EC1B;
	Wed, 20 Mar 2024 11:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i28jHiU9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFA610EC1B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710932786; x=1742468786;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RFN9KfxMgx6jbmIzKTrjBOqsjGhQ59AtTwU5nPPmg/w=;
 b=i28jHiU9F20QClGSCQaCz6Dj1abx+VE4/zfLu7NJVrvgt5hoCIHtVAXK
 /xmi8Ncfc5+DmPdU4Cr7yF0L3ypW4HFZ5hWTRSIc7CdBs1J4beUxAuGWx
 7mZG/+NZHCjgVb0BsVERV6NLXHM5R8jS8UfMZkqv1rT7fLQDdP1rZ+R/A
 Fkb3LTxEgsPf3pqWV67HQwnKdggF79rITCAhRkAHlbNIVM1jmxbi1Qbhh
 3If4w/H+nw98O0s7pZS2kPt5vDHjJWVcddxDGDS9u1s/dwDe1B7ekY8Ev
 MnTB4R4vGHXG5btf7q+6lgJaknaLIxQisec6sx5gl5/CldsDoVv/HjQJI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9645161"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9645161"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18776504"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 04:06:23 -0700
Date: Wed, 20 Mar 2024 12:06:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Himanshu Nayak <himanshu.nayak@amd.com>, sjamadar@amd.com,
 Leo.Liu@amd.com, Boyuan.Zhang@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, Ruijing.Dong@amd.com,
 Sathishkumar.Sundararaju@amd.com
Subject: Re: [PATCH 1/2] added support for hevc encoder
Message-ID: <20240320110606.mawc3q4mksh3qicv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Himanshu Nayak <himanshu.nayak@amd.com>, sjamadar@amd.com,
 Leo.Liu@amd.com, Boyuan.Zhang@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, Ruijing.Dong@amd.com,
 Sathishkumar.Sundararaju@amd.com
References: <20240319125915.1122577-1-himanshu.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240319125915.1122577-1-himanshu.nayak@amd.com>
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

Hi Himanshu,
On 2024-03-19 at 18:29:14 +0530, Himanshu Nayak wrote:

Add description here. Also correct your subject, was:

[PATCH 1/2] added support for hevc encoder
------^---- ^
should be:

[PATCH i-g-t 1/2] tests/amdgpu/amd_vcn_hevc: added support for hevc encoder

> ---
>  lib/amdgpu/amd_mmd_decode_messages.h | 373 ++++++++++-
>  lib/amdgpu/amd_mmd_frame.h           | 771 +++++++++++++++++++++++
>  tests/amdgpu/amd_vcn.c               | 828 ++-----------------------
>  tests/amdgpu/amd_vcn_common.c        | 727 ++++++++++++++++++++++
>  tests/amdgpu/amd_vcn_common.h        | 187 ++++++
---^^^^^^^^^^^^^^^^^^^^^^^^^^^
Consider moving this to new lib, also split this patch into
smaller ones to easy review.

Last note, please subscribe to igt-dev list here:

https://lists.freedesktop.org/mailman/listinfo/igt-dev

Regards,
Kamil

>  tests/amdgpu/amd_vcn_hevc.c          | 887 +++++++++++++++++++++++++++
>  tests/amdgpu/amd_vcn_hevc.h          |  89 +++
>  7 files changed, 3075 insertions(+), 787 deletions(-)
>  create mode 100644 tests/amdgpu/amd_vcn_common.c
>  create mode 100644 tests/amdgpu/amd_vcn_common.h
>  create mode 100644 tests/amdgpu/amd_vcn_hevc.c
>  create mode 100644 tests/amdgpu/amd_vcn_hevc.h
> 
> diff --git a/lib/amdgpu/amd_mmd_decode_messages.h b/lib/amdgpu/amd_mmd_decode_messages.h
> index 22f223aaf..c30202411 100644
> --- a/lib/amdgpu/amd_mmd_decode_messages.h
> +++ b/lib/amdgpu/amd_mmd_decode_messages.h
> @@ -324,6 +324,123 @@ static const uint8_t uvd_bitstream[] ={
>  	0xeb,0xae,0xba,0xf0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
>  };
>  
> +static const uint8_t hevc_bitstream[] ={
> +	0x00,0x00,0x00,0x01,0x26,0x01,0xAD,0xC0,0x37,0x12,0x32,0xE0,0x72,0x3D,0xA8,0x69,
> +	0x4D,0x13,0xB7,0x96,0xB6,0x88,0x98,0x91,0x51,0x41,0xAE,0x7B,0x2C,0x61,0xF0,0xE4,
> +	0xE0,0x37,0x42,0x4F,0x5A,0x44,0x6C,0xE2,0x34,0x0D,0x69,0x57,0x92,0x3A,0x00,0x03,

...cut...

