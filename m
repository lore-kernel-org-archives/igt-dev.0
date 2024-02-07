Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8629DC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 11:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E55A10E05D;
	Wed,  7 Feb 2024 11:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vlncb5DL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9210E05D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707304508; x=1738840508;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WdZpXcOmhZ4bB5uP2lzjIiaXY2eotKPiXgNmCeabjN0=;
 b=Vlncb5DLu/ZPgaRc+e2reGnyHZI1RhIxHYazKY10m046eVuhYKIW6Tuk
 SUC4Sy2E9daw0byIcxujrqVnVJ9H7cPKVqxT0tp0hTVVw9SStAehdYl9T
 lmt0lYHryXJzMYMyO/ZMOeSf4nL4px/7fkTq2NialnTZVswwmTMSWFdg9
 XKZvLispOEbaXvDLD74LshhbyVMZaOMyIB8wJmhtNwmmMTxXoZGIT8qSf
 k85AKX14+WJAl0pHR/dAxge67mRS50hi/iDhAwzBHOPF8Q7pAbgWIz/fr
 WZP7o38rv5/IVxGBa3kDZhWJ7h6U5E/bP781LZNnNU4BBJdDoTMS6mt6l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18388735"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="18388735"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5925155"
Received: from rsen-mobl2.ger.corp.intel.com (HELO [10.252.0.193])
 ([10.252.0.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:14:56 -0800
Message-ID: <36a90f70-c0a2-441f-b3c7-de25fc5f96d3@intel.com>
Date: Wed, 7 Feb 2024 11:14:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add xe_vm large subtest to BAT
To: himanshu.girotra@intel.com, ramadevi.gandi@intel.com,
 igt-dev@lists.freedesktop.org
References: <20240207104733.16012-1-himanshu.girotra@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240207104733.16012-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 07/02/2024 10:47, himanshu.girotra@intel.com wrote:
> From: Girotra Himanshu <himanshu.girotra@intel.com>
> 
> Add xe_vm large subtest to fast feedback to enhance our premerge testing
> 
> Signed-off-by: Girotra Himanshu <himanshu.girotra@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f297fe965..23c2e185d 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -151,6 +151,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
>   igt@xe_vm@munmap-style-unbind-userptr-front
>   igt@xe_vm@munmap-style-unbind-userptr-inval-end
>   igt@xe_vm@munmap-style-unbind-userptr-inval-front
> +igt@xe_vm@large-split-binds-268435456
>   igt@xe_pat@userptr-coh-none
>   igt@xe_pat@prime-self-import-coh
>   igt@xe_pat@prime-external-import-coh
