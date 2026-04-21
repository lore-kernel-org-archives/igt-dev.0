Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE46F8FA94
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 15:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134FF10E8D2;
	Tue, 21 Apr 2026 15:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIEQmhWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387F510E8DF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776786177; x=1808322177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6n/BF22tWPWVfVj/oTKJGg44f2guHTPNvC6IGaIG0Cw=;
 b=FIEQmhWSppBC2gzQ+9vDyNSPK6tq/TbHIZNf83zLNM/h71kyCOkd+9Rr
 28/AjZ4++3QHyBM75TJh3icjWoSDusOwn0muux5goQRaIVbXGGWHX50eV
 TI7thEZthwXmL/1nAus16CYG8/TxsruHWqitqQh+TI5vIa7rYahJs28Ll
 +yUwYy9RQ+ha+/DaXMLYGDKT8zXTxl9XFOvGE89kUsqs4zeuhJWWqMDCw
 VHSy+MOdO5ISDPBvxYGSo+8JUT3yX1qZhXzBtnegkt4YjotRdadqH+PmG
 PAzN0dgdBDL5koeT0nSiNOAhX7hkSt+EoUQWt96v4aQCoN6KjhQun7rrI A==;
X-CSE-ConnectionGUID: glsH7KQ/Q76tVH+Pm/sfdQ==
X-CSE-MsgGUID: zwT5lgJUSCKdJ2vYyU78mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88023484"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="88023484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:42:55 -0700
X-CSE-ConnectionGUID: 0xDuSjSRRPOJSffrOaOWJQ==
X-CSE-MsgGUID: +pRb6hQJQeyVGCnmFjwcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229387184"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.146])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 08:42:53 -0700
Date: Tue, 21 Apr 2026 17:42:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <sxd77athu3dccaza6poyxj2quzezvkuqel3bwbdxbcg4tklz7g@tokhbcpvqfqg>
References: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421145950.55091-1-kamil.konieczny@linux.intel.com>
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

On Tue, Apr 21, 2026 at 04:59:50PM +0200, Kamil Konieczny wrote:
> When first try for opening driver fails then opening function is
> searching for next available device. When that also fails
> reporting is printing last errno which could mislead developer:
> 
> $ build/tests/kms_dp_aux_dev
> IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
> Test requirement: !(fd<0)
> No known gpu found for chipset flags 0x4294965755 (any)
> Last errno: 2, No such file or directory
> SKIP (0.006s)
> 
> ls /dev/dri
> by-path  card1  renderD128
> 
> The real problem here is lack of permissions as there was a card
> but program could not open it. Break looking for a card as soon
> as an error is different from ENOENT. It will create a proper
> error report which will print:
> 
> Last errno: 13, Permission denied
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..66982f653 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -443,6 +443,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>  		fd = __drm_open_device(name, chipset);
>  		if (fd != -1)
>  			return fd;
> +
> +		if (errno == ENOENT)
> +			continue;
> +
> +		break;

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	}
>  
>  	return -1;
> -- 
> 2.53.0
> 
