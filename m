Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107FDC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 07:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597610F001;
	Fri, 22 Mar 2024 07:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5wJ6WfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96D10F001
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711093236; x=1742629236;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IIfILHU5caimrtmHuUNF9NkG8lyhRsFG8vR4mpn08TA=;
 b=h5wJ6WfMTzd6ZPA0KBwVkG1Dum4/shqoj94yyLnui9kVGt6faGFrWBsZ
 rD4wSw/MijAbrsqgiYXdURuXg5c8VtpHvwTI81D4ArjvQziWE1OB5+TbO
 TVnzpQh7JdFezMTGJ4EE6WkOECEwXwEfHZMpPMN4+YukNKlEAT0zX2jxY
 saFbeK9ixfrbaZvL8ypohGBNaPiGHAqsz+i5Xjxc94v2MLNXLJOWt738d
 PKIryKCuvB/KVOqZ2sWfyhThMblnBkqU0ehPJ6ShhwSTit9l5bSAsEYNf
 MOX+RJNjjdn9iBxSHV8+/VliNWWBFWSZ/NRiLk5KsxZd8K6fHyEgYv8A0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6333189"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="6333189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 00:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19506243"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 00:40:33 -0700
Date: Fri, 22 Mar 2024 08:40:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 04/24] tests/intel: Let's introduce Workarounds
 subcategory
Message-ID: <20240322074030.2xolfhzneygji2mq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
 <20240321153847.1787625-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321153847.1787625-5-katarzyna.piecielska@intel.com>
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
On 2024-03-21 at 15:38:27 +0000, Katarzyna Piecielska wrote:
> There is gem_workaround test that deserves it's own subcategory.
> 
> v2: Make Sub-category/Functionality/Feature unique values (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_workarounds.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d83c0a1db..682fc3163 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -35,9 +35,9 @@
>  /**
>   * TEST: gem workarounds
>   * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: workarounds
> - * Sub-category: Context
> + * Feature: workaround
> + * Functionality: context
> + * Sub-category: Workarounds
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> @@ -45,11 +45,14 @@
>   * SUBTEST: basic-read-context
>   * SUBTEST: basic-read-fd
>   * SUBTEST: hibernate-resume
> - * Feature: hibernate, workarounds
> + * Feature: hibernate, workaround
> + *
>   * SUBTEST: hibernate-resume-context
> - * Feature: hibernate, workarounds
> + * Feature: hibernate, workaround
> + *
>   * SUBTEST: hibernate-resume-fd
> - * Feature: hibernate, workarounds
> + * Feature: hibernate, workaround
> + *
>   * SUBTEST: reset
>   * SUBTEST: reset-context
>   * SUBTEST: reset-fd
> @@ -59,12 +62,12 @@
>   *
>   * SUBTEST: suspend-resume-context
>   * Description: Test to verify gem WA registers during suspend-resume
> - * Feature: suspend, workarounds
> + * Feature: suspend, workaround
>   * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-fd
>   * Description: Test to verify gem WA registers during suspend-resume
> - * Feature: suspend, workarounds
> + * Feature: suspend, workaround
>   * Test category: suspend
>   */
>  
> -- 
> 2.34.1
> 
