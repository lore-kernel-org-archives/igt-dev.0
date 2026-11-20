Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C38760A2629
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FiV+N8Nq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB1C112CBF;
	Fri, 20 Nov 2026 19:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED9112C36
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795201327; x=1826737327;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=yPu8LHzg423EdbOwLAtZmhoNSihAbQv2UFpav1dPYmU=;
 b=FiV+N8NqFAouaw+uAaSudxnONdtOW4EU5SSAesDZL885gIegCrD9FwrJ
 xf6ldK9TtCc01a/wpKPoQg7z6W0NBdC82rgsuBoXd1MQwN5kY4bEAVlBk
 gvQnQZ+8EV9g71rNbpN8jsnOGhSGXqyZPELCtrZfylw93xRzEkWWRuF3r
 DJJ/TcqK7GX3a86cRhmpNWEPk+BjRgIf8k/sMuHcYShZfXTbSEi3hWpgt
 ixLhmOAkixzRVNZVblpQlZSzm6vtLnL23uvb77VYX3QggtOXuKGby8Ye4
 B3YBdq8ZCYTjI6eAM1Ms7IK0CXTGZc1GM/19+Dtjnsx0zU8yEouowl0ev A==;
X-CSE-ConnectionGUID: /zdtfh1AQoyv/MYFKIZuOg==
X-CSE-MsgGUID: Ft4PCPUiSqyFWbG3wXwKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4166586"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4166586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:02:06 -0800
X-CSE-ConnectionGUID: jnrgIQmQS1e4+YYbbX9Wgw==
X-CSE-MsgGUID: ILeAWPvXTVafCXFecMgVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10744652"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:02:05 -0800
Date: Fri, 20 Nov 2026 20:02:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/core_sysfs: Create listing while reading (rev3)
Message-ID: <yuvauljv6vsfygnwekrs6uqejtz3nd3kqmtigwurchtdtu5m2x@nzoschljw63p>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
References: <20261118174245.207808-1-kamil.konieczny@linux.intel.com>
 <179515130979.56566.603913071200318826@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179515130979.56566.603913071200318826@9ac1b63fe3ea>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-11-20 at 05:08:29 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/core_sysfs: Create listing while reading (rev3)
> URL   : https://patchwork.freedesktop.org/series/178819/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9198_FULL -> XEIGTPW_16175_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_16175_FULL need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_16175_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_16175_FULL:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [DMESG-WARN][1] ([Intel XE#9365]) -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9198/shard-bmg-7/igt@xe_survivability@runtime-survivability.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16175/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_16175_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16175/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16175/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
...cut...
