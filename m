Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED5CC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0146410E948;
	Mon, 25 Mar 2024 15:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gs+iPtp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE9310E948
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711379693; x=1742915693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+9lI3wAzJimf80+g2GnZfcKVhMu25x4/TQKAOwtr3eA=;
 b=gs+iPtp4S+9t5tkNDBqZX501GpIdt8RzrLAAkObScdd8g1wkj58xkCT2
 Owm/QXDPz/bDwjkXS0IsuWErl5vSAJNpaYJjzwtmYqfA33e0C18/9bUYH
 43VhUPMy4bin8xpN+X1HG4681bj4Os/F1Dkj1VjC6LzotKwUTOa4xPBfl
 stf1AeIL8XEIYUw/8LGuMfjUHUCxvpBxXFbfaSp2q95wZabHd7qO4Kvjj
 yGTKR5Sv//nx4aQcMNaKAKx5EHeouyxBo8i6swfMjG3u7d2fNKhd8zNwE
 iVLBSjp8MM8AcD6byoxZU7J6szvAZuRivGy1/NONzPWkW6hnG2g4Iq54N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="23839050"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="23839050"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16321977"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:14:50 -0700
Date: Mon, 25 Mar 2024 16:14:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 10/12] tests/intel: Move xe_waitfence test to
 Synchronization sub-category
Message-ID: <20240325151447.kaelubzmgslzyolo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-12-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240322124108.1825345-12-katarzyna.piecielska@intel.com>
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
On 2024-03-22 at 12:41:06 +0000, Katarzyna Piecielska wrote:
> Let's move xe_waitfence test to Synchronization sub-category to align
> with i915 test documentation.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 5a67148ed..071e67bd6 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -16,7 +16,7 @@
>  /**
>   * TEST: Check if waitfences work
>   * Category: Software building block
> - * Sub-category: waitfence
> + * Sub-category: Synchronizatio

There are conflicts with Functionality fields here:

n.Functionality:../tests/intel/gem_fenced_exec_thrash.c: * Functionality: synchronization
n.Functionality:../tests/intel/gem_fence_thrash.c: * Functionality: synchronization
n.Functionality:../tests/intel/gem_fence_upload.c: * Functionality: synchronization
n.Functionality:../tests/intel/kms_fence_pin_leak.c: * Functionality: kms_core, synchronization

but maybe this should be solved in separate patch.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>   * Functionality: waitfence
>   * Test category: functionality test
>   * Description: Test waitfences functionality
> @@ -140,7 +140,6 @@ waitfence(int fd, enum waittype wt)
>  /**
>   * TEST: Negative test for wait ufence ioctl
>   * Category: Software building block
> - * Sub-category: waitfence
>   * Functionality: waitfence
>   * Test category: negative test
>   *
> -- 
> 2.34.1
> 
