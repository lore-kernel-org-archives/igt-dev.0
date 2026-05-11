Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C064CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 13:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B7310E726;
	Mon, 11 May 2026 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDafMRSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120410E726
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778507505; x=1810043505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0eNjnXRDZjBBnJ/0oFZnzDnWuzdWHZra8zOgwDDJAwE=;
 b=XDafMRSr66R+mgeEqMkXPScF8sJi9bz8sYfqjzqJz4VPPPkwqAqNAVt6
 E7kfi3OXQmdkTyI7Rbh3OLwV8ryYQY6AdWlSjxj2CBVe2wCMmCYEcbQdI
 9sApd0evvkuXnSBOFQoqQlOvsdioyfGscS++IX4GiNq3WizCX/xEWq/go
 nFgvHyoHOiTbiDoq+7lWG5s6XMyppRKOdebQSdRINLkyZjlKNsIJfDlb9
 l08zMN2r9pGAYXhOQVkM2fTrZPAG3u32ui8RQK/3V806XymHFMjCkoKV0
 +Z9P5FrEQlGYk/OtTUa7UxLg4BZroX3+4Q+dHtITy51SAU8/kVVBJYkBH w==;
X-CSE-ConnectionGUID: u4+ohTLZSeCD3dfTp5Scbg==
X-CSE-MsgGUID: AVkvgmHBQm6wVrc/Q2zb2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83007292"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="83007292"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:51:44 -0700
X-CSE-ConnectionGUID: xW7QgM6DRpaZYXE0ImpEKQ==
X-CSE-MsgGUID: MokbxRHUQYeeQJgjjPDYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="231067574"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:51:42 -0700
Date: Mon, 11 May 2026 15:51:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jakub Legowski <jakub.legowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com, 
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com
Subject: Re: [PATCH v1 1/1] tests/intel/xe_exec_basic: skip test when no GTs
Message-ID: <ktf5cqus7c3yvxconxg32ubshn6zcj5fkgqq7uwbwaouwwy5zx@5kwu33whtf47>
References: <20260511133359.198762-1-jakub.legowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511133359.198762-1-jakub.legowski@intel.com>
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

On Mon, May 11, 2026 at 03:33:59PM +0200, Jakub Legowski wrote:
> Add igt_require_f() in the fixture to check that GT count
> is non-zero, ensuring the test is properly skipped when
> the device has no usable GTs.
>

May you point out what's the failure you're trying to address?
TBH it would be extremely weird if we wouldn't have any GT.

--
Zbigniew


> Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
> ---
>  tests/intel/xe_exec_basic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 5335bffc4..70a0d999f 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -345,9 +345,12 @@ int igt_main()
>  	};
>  	int fd;
>  
> -	igt_fixture()
> +	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
>  
> +		igt_require_f(xe_number_gt(fd) > 0, "No GTs available on device\n");
> +	}
> +
>  	for (const struct section *s = sections; s->name; s++) {
>  		igt_subtest_with_dynamic_f("once-%s", s->name)
>  			xe_for_each_engine(fd, hwe)
> -- 
> 2.48.1
> 
