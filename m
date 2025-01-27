Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E5FC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 14:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E8A10E542;
	Mon, 27 Jan 2025 14:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdGwDAwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F310E542
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737988024; x=1769524024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=45peeRqy4ClyiLVMNIXlRB6npPlw2M5nVzU4AUZuRLU=;
 b=JdGwDAwboyg+XpdkSI7+r+oyP8PS1HugH51bzibFLOrxj+lxAxtiDjMX
 dZv56QgSft7UuPYFw6KO6ff0q6/pWCasZ9lKKwmG23d4KnVAoQOXsVuEo
 z6ZmeOBlGCo9x1x2uLDTSwhuU+miVfelLg1BARMST9sIRbN/tr/9nHx+G
 wkSonGZ7f3U0rF1mg3GGnMV6V7G1gr1x/7vIjPj1cEwhPqELsxxvzJWb1
 DN+ZOqKXd8nHrXZ5TOF9M5F+OMYxvB1VT5RsYRtG/NTE02tXrHSeSYq/z
 TbTBp9LjcBoF2Iizk8P5e0xQM1oZgAo/gKaMy+jB4DrWZm+IQJWQtvpk0 Q==;
X-CSE-ConnectionGUID: PorFFMTASbSVbD4OsafZ/w==
X-CSE-MsgGUID: J+tkr54WTxSGgasT4apxJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60916686"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="60916686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 06:27:03 -0800
X-CSE-ConnectionGUID: BbRKJjsOS1+D2mKuFyYQlg==
X-CSE-MsgGUID: jEnk8AO4SEqCLqy0GzcfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108352044"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:27:02 -0800
Date: Mon, 27 Jan 2025 15:27:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 jonathan.cavitt@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH v2 i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Message-ID: <20250127142700.pl4xtn76uqmpex4g@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nakshtra.goyal@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, jonathan.cavitt@intel.com,
 kamil.konieczny@intel.com
References: <20250122210255.795600-1-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122210255.795600-1-nakshtra.goyal@intel.com>
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

Hi Nakshtra,
On 2025-01-22 at 21:02:55 +0000, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Negetive test cases to check expected errors using invalid
s/Negetive/Negative/

Applied, thanks!

> flags, width, pad, reserved bits, num_placements, extensions, exec_queue_id
> 
> v1: Combining width and numplacement test for len,
>  adding width and numplacement in extension,
>  change error type (Jonathan Cavitt)
> 
> Adding functionality inside subtest description and
>  removing new added TEST section     (Kamil)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_create.c | 137 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)

...cut...
 
