Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2811EC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BC910E96A;
	Mon, 25 Mar 2024 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nE2V39VW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824C10E96B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379144; x=1742915144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cYP9rNs2JYddEw/fYrqkPel4kMlIMQdkGZDnEW/w2C0=;
 b=nE2V39VW6D5iai+yNnI2zPv7bWBAjWxp7sjT3vd/+wHYvH7HwYq7qyNA
 NREcQVJYZUMjsyzzDhJAHLQ2b3lsPowe2fxKzU95Kb9R8JzDqCr+xd2Gv
 1muKKqpk7w8VGvbPK+Cw9qQt4+GbDTAgrvnWzAZ96E7qoYj/6JtAzN/gu
 ohwT5NKVjotRBQKk7esHhH8qFfDYgFgblb1l25B3u8Gqwysf94hdAJUMs
 aNwIdwuf4/x8meNf23TYviB4Z3E1OYsF1RX2nYhrP2ODPNqGQ/++uazsf
 +Wzv6stLAjqayYSDMDDHSCLLwJS8y/qULFJGBwL0KzW/p3PMPZ7dR+7eS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6246850"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6246850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15600881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:05:41 -0700
Date: Mon, 25 Mar 2024 16:05:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 04/12] tests/intel: Let's have Firmware subcategory
 in Xe tests as well
Message-ID: <20240325150539.ph2yq2vwj2oqrrax@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-6-katarzyna.piecielska@intel.com>
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
On 2024-03-22 at 12:41:00 +0000, Katarzyna Piecielska wrote:
> Let's put HUC test to Firmware subcategory to align with i915 docs.
> Also change functionality name s/HuC copy/huc copy/ to align with i915
> test docs.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_huc_copy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
> index ca045c41b..339cf6e5f 100644
> --- a/tests/intel/xe_huc_copy.c
> +++ b/tests/intel/xe_huc_copy.c
> @@ -6,8 +6,8 @@
>  /**
>   * TEST: Test HuC copy firmware.
>   * Category: Firmware building block
> - * Sub-category: HuC
> - * Functionality: HuC copy
> + * Sub-category: Firmware
> + * Functionality: huc copy
>   * Test category: functionality test
>   * TODO: make the test more generic, getting rid of the PCI ID list
>   * GPU requirements: This test currently requires TGL, and runs only if the
> -- 
> 2.34.1
> 
