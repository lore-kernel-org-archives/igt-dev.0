Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D04C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DD610E985;
	Mon, 25 Mar 2024 15:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1LcPwDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0610E985
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379505; x=1742915505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RpXY3qJNL/32ivN9MSFlmxbSZBulcl1XJEtBWYU4E+k=;
 b=U1LcPwDs3bArrz0sEL5PwIDlPTHY+QDcKqUhMfXdGJJ1KWbkvqdXlQda
 /qFXTwQzPZymExnA7vWJZ+6lBWTT8HFQXWJbdC7wkJdCWOjeuST/rhS7l
 pszDkq6QcVVBigboQB1OAJ2hl6Sl192nhNnRERsdp51HvDtwPZsG1RyYj
 /nN9LrBv094YnF4wBNFoTAgJvCKfBhocu+Pn62uQyZVf5d1ISBmMwNqcW
 B2gdORhFo5JDZq6Lv7m2iJCH2toeSt00e1ewK8W26gg6caT6vaOPMdrbl
 JI+pilnxXQ00Wm0j3vJDoo/IsLbxvETYo+MsTas4xKbCUqz8ascw/96TG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17019313"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17019313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20332613"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:11:42 -0700
Date: Mon, 25 Mar 2024 16:11:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 09/12] tests/intel: Move xe_exec_queue_property to
 Sub-category uapi
Message-ID: <20240325151140.45tzvgjraawnd2lj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-11-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-11-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-22 at 12:41:05 +0000, Katarzyna Piecielska wrote:
> Let's move xe_exec_queue_property to Sub-category uapi to align with
> i915 test documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_queue_property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index b1cdc7ffe..51ecd725d 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Basic tests to check exec_queue set/get property functionality
>   * Category: Software building block
> - * Sub-category: exec queue property
> + * Sub-category: uapi
>   * Functionality: exec queue set property
>   * Test category: functionality test
>   * SUBTEST: priority-set-property
> -- 
> 2.34.1
> 
