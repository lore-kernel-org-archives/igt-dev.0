Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF26D58D4C
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 13:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D618310E118;
	Mon, 25 Nov 2024 13:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUF4/uCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3E10E118
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732541814; x=1764077814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2Y7Ke/ZkotA3l/Sy6cC7RSyZOSgOs/ng9Y5mu0w0QOU=;
 b=UUF4/uCbV0yYmV4CLOkn+y/togBOeTCjE+4Hz5HzHUqpFjeV8QrEa9Yn
 pa4pTpB2hPUefIuXzm90m0hldws0xCHirnpgqs/+nRia6sFvFDxP6uMCe
 TVGM1kg3Jp+ETh/AwCyJl6KRpTj/R0S/isHljYdCNXnggMDPayAbQuVsa
 5QaORTVfny2UEY8d/8kpFpWmxQ5QW3udXnqDq1ck9HU84JOjqlNZ0CqX4
 Z03EN4agZJ9lRcCpaYt2Dhv161OkTSn3RzarXA77e/cELQArzHtiERIMJ
 cCaJiFDElVUaOiWv9Cmw1yfUONqUCd4M3tA5w8f2HpOYf6Yg6OKeOOK+c Q==;
X-CSE-ConnectionGUID: LHPLJ13vTYqECCI0A5Eywg==
X-CSE-MsgGUID: gw0l1kxwSFy1RzYKen+oBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50058313"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="50058313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 05:36:53 -0800
X-CSE-ConnectionGUID: AXaFGmMaQGyUkp07MbaVbQ==
X-CSE-MsgGUID: 6zni5MR9RCm0KyGQhT6miw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="90893117"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:36:53 -0800
Date: Mon, 25 Nov 2024 14:36:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] intel_compute: Use valid number of array size for
 unbind
Message-ID: <20241125133636.vxvus67p5drrhjha@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122102931.210761-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-11-22 at 11:29:31 +0100, Zbigniew Kempczyński wrote:

small nit about subject, please add 'lib/' prefix so:

[PATCH i-g-t] lib/intel_compute: Use valid number of array size for unbind

Regards,
Kamil

> Due to copy-paste number of elements for unbind is wrong for xe2.
> Fix this as it should be paired with bind.
> 
> This is likely subject for refactor and use ARRAY_SIZE() but at the
> moment it's a quickfix. Luckily number or entries value was smaller
> than for bind so we didn't notice the failure, only there were some
> dangling vmas in the vm.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 3ab9ace793..879928ab64 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1406,7 +1406,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  		igt_assert(f1 == f2 * f2);
>  	}
>  
> -	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> +	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
>  	bo_execenv_destroy(&execenv);
>  }
>  
> -- 
> 2.34.1
> 
