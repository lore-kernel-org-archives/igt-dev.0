Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE0D6100C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F1010E102;
	Thu, 29 Jan 2026 11:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdQHkhkF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E9B10E102
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769687045; x=1801223045;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V24gBjjlkDQquz5VsQjmzqzOIa2aQ6klhZsgw7/foNU=;
 b=mdQHkhkFR4MEdV+xqpapNWEPIF7HF2pEGCI8akTKd55FGRhdDZ6Jz82E
 OY23wJn1Sfll99dk5lj5FtWpaElySiAdzp1Wup9XH4uADcJtUqNY3aUgy
 +73iQSpPj9/p5pFLv3MEHo3jQUGke9SLePJhIrIDXc/Z4bgjor8d+cpQ7
 GtTp2a/2prBUF89v0P24nCBpNIfRk0g7LAuzlx8Tv1v5hu6j3nzfkbrTk
 Ayv+CErLzBhsQqgdyKFZgeWcypHnXNw96qKaP/MPvwL2Ww0KdGJogX+ro
 tUSszQqOW/4aHAe2KUyhtfFzCjS6//D/PiL1XR9SaMvuuXkAT4pG3ykFm w==;
X-CSE-ConnectionGUID: eNRumoEyQiumijdoPrhesA==
X-CSE-MsgGUID: FEu1ne4bSXiNKs7JnwUYIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73517665"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="73517665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:44:05 -0800
X-CSE-ConnectionGUID: EYLm1kM/REiF9O4kVfYEfw==
X-CSE-MsgGUID: NuchdRnGTS+Y2WLpOvAQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208338358"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:44:02 -0800
Date: Thu, 29 Jan 2026 12:43:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci: Update NVL display blocklist
Message-ID: <20260129114359.6iztop2m52uui6gt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260129114440.155214-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129114440.155214-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-01-29 at 17:14:40 +0530, Swati Sharma wrote:
> Add deep-pkgc test to xe.nvl.display blocklist as valid skip.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index 41d9eed3e..749514129 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -130,3 +130,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*
>  ##############################################################################
>  igt@kms_pm_rpm@package-g7
>  ##############################################################################
> +# Valid skip: Deep-pkgc IGT not applicable
> +##############################################################################
> +igt@kms_pm_dc@deep-pkgc
> +##############################################################################
> -- 
> 2.25.1
> 
