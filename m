Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC62CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 12:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5B10E6B6;
	Wed,  1 Oct 2025 12:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlOyteou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67710E6B6
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 12:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759320265; x=1790856265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XXVQF29F/uvPJmGLnMC8ABR1oSedDbs0IFVeoIP5Kbo=;
 b=FlOyteouRvuUSlmjWMuxuSosqKHCuebRBkiCoEBSJ7b+/xcDHBPwJ7d2
 FcI8HfcGYdsrGh4CwpgU3AXjF8mU/TToUoVIJfPi4QwYFGS+342wxe03h
 v2/l6TgPmHakt89lZJRgnO7iLgH6K5RFGxBtuhjx1JjTyHdvrZ7aah7rF
 ev272WycW7Aw86dca+fH3oqHFOZYm2PuQvI1WWb3y3EwIekeV5HPGWYc7
 44GzdEFnZeeq69/kFzUOQL+YlWgowWjcKGZpID/km/ww63M8lccckREVI
 kQ4a7XbCN/XELZomkdM6OI7UaTYFeU6BIPbiwtl6M1OkUePzsEhbMt605 w==;
X-CSE-ConnectionGUID: BdeydLOKSQexdjB78iBQew==
X-CSE-MsgGUID: U4iwQ2qSTlyx+A4bXcdmuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84210300"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="84210300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:04:25 -0700
X-CSE-ConnectionGUID: QmfLUyt+QRG0p8bQf84e+w==
X-CSE-MsgGUID: FthsYXKZTtylsqYxtVn1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="215896545"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 05:04:23 -0700
Date: Wed, 1 Oct 2025 14:04:20 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
Message-ID: <nfbsoyylux5qyvteu7xcuiwteamx2zjry4x6fiyj4u6ve2ghke@yzttaaj55nc3>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
 <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
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

On Wed, Oct 01, 2025 at 01:54:38PM +0200, Dominik Karol Piątkowski wrote:
> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
> misleading, as the underlying error may be different. Do an early return
> with -errno if the poll fails, unless errno is set to EINTR - repeat the
> poll in this case.
> 

LGTM, but for being sure let's wait for CI.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_eudebug.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 667c31c6e..840b501c5 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -271,6 +271,10 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>  		if (!ret) {
>  			catch_child_failure();
>  			t += interval_ms;
> +		} else if (ret == -1) {
> +			if (errno == EINTR)
> +				continue;
> +			return -errno;
>  		}
>  	} while (!ret && t < timeout_ms);
>  
> -- 
> 2.34.1
> 
