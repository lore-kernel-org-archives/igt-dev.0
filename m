Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F6D49212
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382510E081;
	Mon, 18 Nov 2024 12:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5SpxDQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1866C10E081
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731933843; x=1763469843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IwuoxOW+fjl6SHzNA6314ejnb1o/86bhm4ubeBspsTU=;
 b=Z5SpxDQp7nwcX6X+ouI9vkMkCYLWqbHAOxkCOrE2waAVyLpMJz+sY6n8
 RnJLVKzTIPbEMIejC6GUhYeR/5fOIYT/lSDd4SurnjtAnXooa4dKid+AJ
 cxqzO5NGQj1CcgIkcY1vStJpkNb4wbEhopWX+kSkz3aA+XxW7Twy+xfmB
 aRg0+w1XT0i297zpHyh/PQoh4uJ4GNOB4AAVMmE8y1BHEL493qbHFcxqz
 3BTsBDIQeS42/VLZhI31IeoWy5cSHNFagvj1ibfJo7IvRaGNzGQ3WuAbC
 OW9u6v68t/wR62usuES6bl8zLyYQ7XEZC/G6WrT+0xAZDk7ogc1ks0AGE g==;
X-CSE-ConnectionGUID: bm9P7J9URliP386j+MP1bw==
X-CSE-MsgGUID: vuFA6ay+QwiRcZg5lWt3Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="57290695"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="57290695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:02 -0800
X-CSE-ConnectionGUID: a8v8TLy9Qo+JZsaw24j+vA==
X-CSE-MsgGUID: nAezysUTSv2GIgsu2/5iVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="120145265"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:02 -0800
Date: Mon, 18 Nov 2024 13:43:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, swati2.sharma@intel.com
Subject: Re: [i-g-t] tests/intel/kms_frontbuffer_tracking: Fix testplan
 documentation
Message-ID: <20241118124348.ku4azqvdjt7ywbnp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 swati2.sharma@intel.com
References: <20241118083624.1936758-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118083624.1936758-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-11-18 at 14:06:24 +0530, Bhanuprakash Modem wrote:
> Fix the testplan documentaion for i915 specific tests.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_frontbuffer_tracking.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index b7e3f7379..f149be3da 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -763,18 +763,22 @@
>  /**
>   * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
>   * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
>   * Functionality: fbc, fbt, kms_core
>   *
>   * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
>   * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
>   * Functionality: drrs, fbc, fbt, kms_core
>   *
>   * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
>   * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
>   * Functionality: fbc, fbt, kms_core, psr1
>   *
>   * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
>   * Description: Check if the hardware tracking works after page flips
> + * Driver requirement: i915
>   * Functionality: drrs, fbc, fbt, kms_core, psr1
>   *
>   * arg[1].values:   1, 2
> -- 
> 2.43.0
> 
