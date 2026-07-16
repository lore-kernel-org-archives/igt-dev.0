Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905C4C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 10:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390AF10E25E;
	Thu, 16 Jul 2026 10:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTWWtZYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67D310E328
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784199269; x=1815735269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tb7oS5MCpeXWSDCqv1Vzj4S65BWRLOt4LtmflgMBc+c=;
 b=XTWWtZYrl9JOU7YxCbAZfUR+oykZ9K1IPoRli17mYbU2lNZ9/Z7GMUX/
 TInFCk8E79gU0TRgFrsd0Xtf/yP8EZ4HZUQwQiS8rnaQc2iUPOMatFOnc
 WJppdJY9czMxTt013Z4im1Ap3c6vmGJryWCcwVQuTKB0rrCYztwuA1qnI
 5UB103bgjy7wYITHon3icY9kI/42KNoBf2pPYaVPj+8Xo7aAoLApxuAIJ
 Sla4wS1aVS49xs6TUMN5AopNbeYUzhSbKx9ZaKClZsVJmNc5BdH9UFGie
 D30YfxX0JvMlSw07QH9sQna+jVh07pEnxWwHvczYqG4Nyl081Nr1285Ew A==;
X-CSE-ConnectionGUID: 7TG3/InCRCSZ8O3OMPRlAw==
X-CSE-MsgGUID: GpRUfzx2TAitTcE+aicInQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102406789"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="102406789"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:54:29 -0700
X-CSE-ConnectionGUID: X/UkXAbETr+ZXAmdphw/nQ==
X-CSE-MsgGUID: +qW3oJcjSBG836mmIFfW+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="257113403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:54:27 -0700
Date: Thu, 16 Jul 2026 12:54:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v6 11/11] lib: Add genxml annotated batch buffer decode
Message-ID: <20260716105424.jb2umavb6dtfkdub@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
References: <20260713133746.453051-1-jan.maslak@intel.com>
 <20260713133746.453051-12-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713133746.453051-12-jan.maslak@intel.com>
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

Hi Jan,
On 2026-07-13 at 15:37:46 +0200, Jan Maslak wrote:
> When IGT_BB_ANNOTATE=1 is set, intel_bb_dump() writes a companion
> <filename>.annotated file alongside the raw hex dump.  The annotated file
> identifies each command and prints its field names and values, decoded via
> the genxml *_decode.h headers.
> 
> The opt-in environment variable avoids file I/O overhead in normal test runs.
> A disclaimer in the file header notes that the decode is best-effort and may
> lag hardware on newer platforms.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Applied, thanks!

Regards,
Kamil

> ---
>  lib/intel_batchbuffer.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
[cut]
