Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1648BE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 10:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E710E24E;
	Fri, 20 Dec 2024 10:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBUn6jEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE81310E24E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 10:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734691954; x=1766227954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uIWYbo2wjKH2Te7M1Ed+N5LoLW4MqRCcNYyvdYK8zMQ=;
 b=EBUn6jEy8CiF4FbnjWI0+Vd0jwa9paq9mHlFYVG3rDe6kXwyD3ama2x+
 QIrMz3onibmBYgk8WshUX8DqDfAgRuzczbZW5T8MX8L+Qu4CnK8PycTQv
 TtuFMw0XylSZ52QQ0m7pRZnWRUogFJWe68HXlMLEIJ1Fz06ydbUv3ZdLc
 7kAiGzP8eEBalIGYlRfX3PY7eBrcQLA6HIJqDejKmJ3p6+AtWeT0kg0s5
 ByV2QQyqKRcXa4XeEs7iADQKpEb0cb1UWg4S6p03g2KU4rCuai1Lu+taV
 KA+b+fYrQveYzhZ/jwgcDsucga8Jdn1lOy2xKxepGpUKeugYa9w4SQeDb g==;
X-CSE-ConnectionGUID: RKizRT42Qnedqkn09H0JCw==
X-CSE-MsgGUID: uSiMwidbTm2Nvk086SQIlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52762486"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="52762486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:52:33 -0800
X-CSE-ConnectionGUID: jYF6oEpRTACIzGI2oRofew==
X-CSE-MsgGUID: rGIRFTfNTE6FElN+8AiQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98879074"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 02:52:32 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_eudebug.c: Enhance memory access testcases
In-Reply-To: <20241219184826.603072-1-dominik.grzegorzek@intel.com>
References: <20241219184826.603072-1-dominik.grzegorzek@intel.com>
Date: Fri, 20 Dec 2024 12:52:46 +0200
Message-ID: <87r062bp8h.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Dominik Grzegorzek <dominik.grzegorzek@intel.com> writes:

> UMD tests revealed issues with memory read/write operations when
> accessing data at any nonzero offset within a VMA. Address this by
> verifying access to a buffer object at random unaligned offset.
>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>


Thanks for fixing the really bad coverage in here,

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

And if you want you can add
Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>


> ---
>  tests/intel/xe_eudebug.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index d9281f78f..51d02e06c 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1556,6 +1556,7 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
>  	struct drm_xe_eudebug_vm_open vo = { 0, };
>  	uint64_t *v1, *v2;
>  	uint64_t items = va_length / sizeof(uint64_t);
> +	uint64_t offset;
>  	int fd;
>  	int r, i;
>  
> @@ -1573,14 +1574,24 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
>  	r = pread(fd, v1, va_length, va_start);
>  	igt_assert_eq(r, va_length);
>  
> +	for (i = 0; i < items; i++)
> +		igt_assert_eq(v1[i], va_start + i);
> +
> +	/* random unaligned offset within the vm */
> +	offset = 1 + random() % (va_length / 2);
> +	r = pread(fd, (char *)v1 + offset, va_length - offset, va_start + offset);
> +	igt_assert_eq(r, va_length - offset);
>  	for (i = 0; i < items; i++)
>  		igt_assert_eq(v1[i], va_start + i);
>  
>  	for (i = 0; i < items; i++)
>  		v1[i] = va_start + i + 1;
>  
> -	r = pwrite(fd, v1, va_length, va_start);
> -	igt_assert_eq(r, va_length);
> +	r = pwrite(fd, v1, offset, va_start);
> +	igt_assert_eq(r, offset);
> +
> +	r = pwrite(fd, (char *)v1 + offset, va_length - offset, va_start + offset);
> +	igt_assert_eq(r, va_length - offset);
>  
>  	lseek(fd, va_start, SEEK_SET);
>  	r = read(fd, v2, va_length);
> -- 
> 2.34.1
