Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BCEC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 04:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C150D10F616;
	Wed, 24 Jan 2024 04:56:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B710F616
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 04:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706072173; x=1737608173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KCKEggPbDEBiKzALEvyLOz9MJoIfSiEDcWRoyOdmsDY=;
 b=BoliXR8XodiZ7m9FrymcGXH+5Y0MCTf96ZQ5M6fBOlqUsZ9b5MFb1PUC
 vgveW6uPsZ3vusmyE4ZqDRdTcxQBSbE9O+I6BOtrK1hi6ZmpUubHtvPNh
 UKwBH5uAei020kvG/Ukm/8PTT5yKBCvjF0fV2diuKbAV69w5kAH38BRke
 bAlxMX/P/q5Oxt0JvUFiDt03LlMgdweBEuufghhwgXmy02f64kPoyWT+i
 52lIibJ7hvqgGAaSSbdTsQVKoqmQSNYKlnDL4zlzj5M5zvBXSPA/VvN84
 uBbZJaFvcBXMdEkha70pZruZdz5dwzo8ZRwoxl7oHjs+zX4GJEIhgnLq5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400604137"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400604137"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:56:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929557363"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929557363"
Received: from unknown (HELO localhost) ([10.246.3.92])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:56:11 -0800
Date: Wed, 24 Jan 2024 05:56:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_blt: use BYTE_COPY mode on xe2
Message-ID: <20240124045608.5cph37f2evqkdsl2@zkempczy-mobl2>
References: <20240123183323.173424-1-matthew.auld@intel.com>
 <20240123183323.173424-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123183323.173424-2-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 06:33:23PM +0000, Matthew Auld wrote:
> Currently we see various CAT errors and timeouts on xe2 when running
> xe_copy_basic. If selecting PAGE_COPY mode for MEM_COPY, the page size
> is defined as 256B block as xe2. Also the width should be defined in
> number of pages, and not bytes, which likely explains the CAT errors.
> However the caller in xe_copy_basic is not using a size that is aligned
> to 256B, so rather just select the more general BYTE_COPY mode instead,
> which should work for any reasonable number of bytes.
> 
> BSpec: 57561
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_blt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index e41e261ea..25d251c4f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1613,7 +1613,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
>  
>  	i = 0;
> -	batch[i++] = MEM_COPY_CMD | (1 << 19) | optype;
> +	batch[i++] = MEM_COPY_CMD | optype;
>  	batch[i++] = mem->src.width - 1;
>  	batch[i++] = mem->src.height - 1;
>  	batch[i++] = mem->src.pitch - 1;
> -- 
> 2.43.0
> 

+Sai

At first glance I don't like removing (1 << 19). For M_MATRIX
we require BYTE_COPY. I'm not sure Sai is working on such tests
but we discussed offline sometime I would like to have such
tests here.

--
Zbigniew
