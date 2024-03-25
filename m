Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC3CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5014410E046;
	Mon, 25 Mar 2024 15:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvixAlnq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098B310E986
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711380210; x=1742916210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XOa8D0Lp4C6xLVyOo85dpPuwIEwPtFXf+JXi0tniRiU=;
 b=BvixAlnqBQU2RadXQL7hq+D6cIZ/+ibIpNlIIqYedZdtCIWpCkaIPdgt
 vsgZIe2pnyv1jk36LWeMxK1Ygw7dwguvciLrcG+ZWVSs7Qs3osKjaC/rD
 hxLgHoSrtCvf/YBV1B+RaUVBdUC+9xkeejVCtHpSpNSfcY3gChXPctLPT
 fRQ8GQr/PPBbLZ5lAG8CInHcd3YCMLciHYeF6bphMx+oc++Mvmh19UNR5
 WRmKLdL8xaS12pRQ666QneA8gd6f57krWACU+aYP5TdeUNY0oMaVE92j6
 3wlzbeIIZhI/FyHtTONmRZ0pwOS1jcvzw/OovT0C66ydIBd71kgk+wZ3X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6219363"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6219363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20112242"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:23:27 -0700
Date: Mon, 25 Mar 2024 16:23:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 12/12] tests/intel: Move xe_exec_reset.c to Reset
 Sub-category
Message-ID: <20240325152324.4igpiw3es535vtbh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-14-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-14-katarzyna.piecielska@intel.com>
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
On 2024-03-22 at 12:41:08 +0000, Katarzyna Piecielska wrote:
> It looks like Sub-category=Reset and Functionality=gt reset is better
> for xe_exec_reset.c test.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 22735688a..cc10900d9 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -6,8 +6,8 @@
>  /**
>   * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
>   * Category: Hardware building block
> - * Sub-category: CMD submission
> - * Functionality: reset
> + * Sub-category: Reset
> + * Functionality: gt reset
>   * Test category: functionality test
>   */
>  

There are still some problems left:

n.Functionality:../tests/device_reset.c: * Functionality: reset
n.Functionality:../tests/device_reset.c: * Functionality: sysfs reset

Looks inconsitent.

n.Functionality:../tests/intel/gem_eio.c: * Functionality: reset
n.Functionality:../tests/intel/gem_reset_stats.c: * Functionality: reset
n.Functionality:../tests/intel/i915_selftest.c: * Functionality: engine/GT reset

n.Functionality:../tests/intel/xe_exec_reset.c: * Functionality: gt reset

It can be left to future patch,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> -- 
> 2.34.1
> 
