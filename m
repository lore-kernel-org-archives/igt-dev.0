Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA32D232ED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 08:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82310E3A7;
	Fri,  9 Jan 2026 08:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGfXUADw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E88510E3A7
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767946326; x=1799482326;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AimgGf28uJdNkY2mJXONy+dlDnrNYwkmS4NA8k5YcT8=;
 b=eGfXUADwRtHcK8WUDChHNCwXe8LABF6QbzvUbZmtfP2fv3WEL4+6Q00t
 lXnJVJv/nSed+A4KsZ9VxsJon1I5QL8PbCvTkV2ub+ZpUXfnzSLELhipC
 yQ3pGF8a/p7wayecIhZGh42KlWvkuJctGVc3hTW8R/f5tjJvWVG/uB3tN
 He+HGr8CaIacZR/qsyPq9KKRpjsdFQCXgtL6rLHgAlGpzgemVg+3DC/xW
 P8vIZqE7FIX9RP/gTmJNIpQO6EbIJZZ7PP/E9Vq0IdUpxrSQXP35a016n
 PF59IGANif2jCZWI0+7hLe5Y5VaYWLY0iMsfqFYDIrDz2gZwjE8Y5LMdP w==;
X-CSE-ConnectionGUID: imElP2oDQzS+hp3QTADZCA==
X-CSE-MsgGUID: vRJPaFHCSDaFkmpBQ6MS+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69400950"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69400950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:12:06 -0800
X-CSE-ConnectionGUID: urZEXK7TRSCWHa+EkTYdNg==
X-CSE-MsgGUID: mccOI/VmS8yR3QyB3/DvaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203040969"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:12:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, igt-dev@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_vbt_decode: Add decoding for eDP pipe
 joiner enable flag
In-Reply-To: <20260108115255.1405329-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260108115255.1405329-1-ankit.k.nautiyal@intel.com>
Date: Fri, 09 Jan 2026 10:12:01 +0200
Message-ID: <5abb893bfb01845524a336dc101ecd43e3adf092@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 08 Jan 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Extend intel_vbt_decode to parse and display the VBT field that
> controls eDP Pipe Joiner enablement. This field was introduced in VBT
> version 261 and allows OEMs to specify whether the joiner feature should
> be enabled for eDP panels.
>
> Bspec:20142
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tools/intel_vbt_decode.c | 4 ++++
>  tools/intel_vbt_defs.h   | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index d4aada743e42..a96b936d4b8e 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2483,6 +2483,10 @@ static void dump_edp(struct context *context,
>  		if (context->bdb->version >= 251)
>  			printf("\t\teDP DSC disable: %s\n",
>  			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
> +
> +		if (context->bdb->version >= 261)
> +			printf("\t\teDP Joiner Enable: %s\n",
> +			       YESNO(panel_bool(edp->joiner_enable, i)));
>  	}
>  }
>  
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 6612d3a4ec49..550a9bfba868 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1090,6 +1090,7 @@ struct bdb_edp {
>  	u16 edp_dsc_disable;					/* 251+ */
>  	u16 t6_delay_support;					/* 260+ */
>  	u16 link_idle_time[16];					/* 260+ */
> +	u16 joiner_enable;					/* 261+ */

Changes to intel_vbt_defs.h *must* be just copies from the kernel, with
the commit message referencing the kernel commit. See git log of the
file in igt.

If the field doesn't exist in the kernel version yet, then please get
that merged first.


BR,
Jani.


>  } __packed;
>  
>  /*

-- 
Jani Nikula, Intel
