Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC0ECD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13010E44A;
	Wed, 10 Apr 2024 15:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajFixEhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91A410E44A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761418; x=1744297418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ebxCmNAJ5DsNrRjwBqjDH4f0nxTPlEuxDby2M7IrPM8=;
 b=ajFixEhSAVhIdZO5RCAzolBZ6dHWJ4xXMbqF+KZmTXnA0L5YFDD9LMr5
 gKZ/2Q0fM88E1krS+Ht2qZTIp1JLn1Tg1I1Qk4bJ4NEaZWckYAigRYJbY
 fCEVXjH3FiOoOGkbNjED4Vt5KSJfYjr9oDpbGG8zWanfx0jTxLo5FJtIJ
 uI426KWjQCy2nSRyzjJhlH/kYeKzpsxZGnXrDgmMDydaxj4UFrPmcPNeM
 C9d+4aaOMgwAuGHJLKp6tv1EzKij38shl4CQteky6mA/+aIyenhirTQX9
 UKk7+SLLw0+slOdKSPsKUQsFCtScdA8/E34dReGuQXt5qaMcXB+e4dzhz w==;
X-CSE-ConnectionGUID: sJf11O7mThOFIjchikDI7A==
X-CSE-MsgGUID: dnHWaPUvRiO/B2dwVUmg6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8697408"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8697408"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827793163"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="827793163"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 10 Apr 2024 08:03:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Apr 2024 18:03:34 +0300
Date: Wed, 10 Apr 2024 18:03:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/9] enhancements for forcing debugfs of connector
Message-ID: <ZhaqRsA3TRh1OCB9@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Apr 10, 2024 at 12:14:17PM +0530, Kunal Joshi wrote:
> We have kmstest_force_connector that allows forcing a state
> to status sysfs, use the same mechanism for debugfs as well.
> Haven't reused the kmstest_force_connector as its used for sysfs
> and wanted to have seperate flows for debugfs and sysfs.
> 
> patch series adds kmstest_force_connector_debugfs which allows
> set value to particular debugfs of a connector, also it adds an exit
> handler to clear the state at exit.

I had a look at this and thought we could generalize
the code quite a bit. I took a quick stab at doing just
that: https://patchwork.freedesktop.org/series/132284/

> 
> Kunal Joshi (9):
>   lib/igt_kms: Refacror forced_connector struct
>   lib/igt_kms: add forced_connectors_debugfs array
>   lib/igt_kms: add enum kmstest_force_type
>   lib/igt_kms: refactor helpers forced_connectors helpers
>   lib/igt_kms: add igt_reset_connectors_debugfs
>   lib/igt_kms: add exit handler function to clear force debugfs state
>   lib/igt_kms: add kmstest_force_connector_debugfs
>   tests/intel/km_big_joiner: use kmstest_force_connector_debugfs for
>     better cleanup functionality
>   lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
> 
>  lib/igt_kms.c                | 203 +++++++++++++++++++++++++++--------
>  lib/igt_kms.h                |  25 ++++-
>  tests/intel/kms_big_joiner.c |  23 ++--
>  3 files changed, 193 insertions(+), 58 deletions(-)
> 
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
