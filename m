Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E6C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BE010E62D;
	Wed, 14 May 2025 12:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFgZxW0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E589F10E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747227394; x=1778763394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YK2DYZ9QGjwsgjnXt+5kK81djjMwuNbtMism0OKWMNc=;
 b=FFgZxW0dA9GQF3P+dExHPkLt2VcIIxk5kG4f9cmC7pbGcMfPR+vs0sY4
 1s4wOCNjNzR79gzrdIDJD47NmyfF700mcTU8Gjb2Eev4id9grFm9Odb5B
 mcLeqdmt3RsZyBE/SP1YcWSXSrkm8QI2Jj+R438fwdEE21Q+70Ctoj0oh
 3JaX67/dBw4M364qLf6XJKazdjCRIfE0+JYdW15+TKsFBmU7cq9w2neb9
 rG7ueqr+nBl3WWMFFsh/MDfRKjeJXtuTEi90InHw1TSMZXOZSXyKZ/f0p
 MaJMLdCw36WwSeRU0lN5+yHC4uj23PBK/UpJnkGz5Fm7w/Xxlnq/dlcsb g==;
X-CSE-ConnectionGUID: Vr3mKKKbTguyslYkVCSqZQ==
X-CSE-MsgGUID: +JTiRWUpTgqXozciwHXF0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48806271"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="48806271"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:56:31 -0700
X-CSE-ConnectionGUID: uNVkYGjPRqKt3el3cp6g+w==
X-CSE-MsgGUID: EBt8ht7XR6+4fvBi6xYpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="139021264"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:56:29 -0700
Date: Wed, 14 May 2025 14:56:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 12/15] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Message-ID: <wnokqfkrgxoxxfqfmezk6d3m53pffu4y6qpg5upizduiil22j2@3j5bvsxznmxe>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-13-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-13-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:45PM +0000, Jeevaka Prabu Badrappan wrote:
> Ensure PAGE_SIZE is defined only if it is not already defined,
> addressing compatibility with Android where PAGE_SIZE is predefined.
> 
> Note: PAGE_SIZE is defined in multiple files; a cleanup will be
> addressed in a future patch series.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tests/intel/xe_create.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index b22084c84..e8b8bb025 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -18,7 +18,9 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#ifndef PAGE_SIZE
>  #define PAGE_SIZE 0x1000
> +#endif

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  static struct param {
>  	unsigned int quantity;
> -- 
> 2.34.1
> 
