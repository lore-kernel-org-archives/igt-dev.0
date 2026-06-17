Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A75CCD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 12:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41D910E455;
	Wed, 17 Jun 2026 12:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhgdD9tA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6DC10EFCF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781698750; x=1813234750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X4tA81o2uPElNMBs5vZKN/netV+VZ76MeVYeTmoKLNU=;
 b=lhgdD9tA6KSaRD15/0Fme/t9cxlol6cun4SJT7JlTOTCVPRA0wLDn9tB
 mUDL1C3IdtEEI2ijyjqTjed1ovkz1Vj7fITzzJmTlZK8NIHKPYTQN1T70
 qo7uudBM2Cusfv2vcouPXUAln0PodXN/YKYFS7Zdva+Xjh37h750lOXjw
 qC8lQj/aESwmgxAAWT+hNwTvTtph/8hDy2oJAo/wz2wU14Va7DBuvHV0e
 Ozc+A7/I2ZLXsLWojLQPoWklVtaPfbi6AB4hQsMgzxMbgeAQ8Tt5/1E7A
 ndNbuvpc7OyQ1gkqdMRgvF8vv6Ws/XpX4jIgMe84kinygacNJ8MrarTST Q==;
X-CSE-ConnectionGUID: 9CqnGFiqTTywwZUpWmJghQ==
X-CSE-MsgGUID: yte3QhFUSumqMZY0FT9PNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82370126"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82370126"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:19:10 -0700
X-CSE-ConnectionGUID: aYDrTfMFRXym26Z3ro59oA==
X-CSE-MsgGUID: kq24thspQtqaJz5vzkprvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248124161"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 05:19:09 -0700
Date: Wed, 17 Jun 2026 14:19:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: ramadevi.gandi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_exec_multi_queue: Rename MultiQ
 to Multi-Queue in docs
Message-ID: <20260617121905.4st6hibpyeuehom2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
 <20260617083549.1347431-5-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617083549.1347431-5-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2026-06-17 at 14:05:51 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Update the test documentation in xe_exec_multi_queue to use
> consistent "Multi-Queue" terminology instead of "MultiQ".
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_multi_queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index d9d648b022..84e0750b4e 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -6,8 +6,8 @@
>  /**
>   * TEST: Basic tests for exec functionality with multi-queue feature
>   * Category: Core
> - * Mega feature: MultiQ
> - * Sub-category: MultiQ tests
> + * Mega feature: Multi-Queue
> + * Sub-category: Multi-Queue tests
>   * Functionality: multi-queue
>   */
>  
> -- 
> 2.43.0
> 
