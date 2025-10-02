Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E4CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C027210E845;
	Thu,  2 Oct 2025 19:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrgOfiEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60FE10E845
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434897; x=1790970897;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=rWnWQ41pq8HZGzE+TwZC0SqfyPB6JF9MN0s/6Qf+Z7I=;
 b=ZrgOfiEZ1/1xvCRaZainybUbloER9uVCq4mkzEU72ZURD5xlVQbNxNLc
 nhfE4mM0NAl0ypxhzo4GwnJQC3Ay/ZRZh6FyHQwRQJzuUWrCcG4HB/tfR
 kCRpbHl3HVmY3iyAhLdY+JrPInSiKVXCFDcIEhIHjLrMUJw3Q4Sa+AyAy
 8r+HY0tygdrS1lNiFIY54vTsz2FREOp0CVChdUwJDZx/YHi3TnNtCC0Vw
 0toRvVwcJ+cFC3eHTqERE7NzdVWU1IAwEqAxP11gZh5/ejhPBT9rfEJRJ
 JFFGGswpS99cedn18ds84SuM+kO5YGGQoanIpFma8WXQ15TZyzbIUiG7H Q==;
X-CSE-ConnectionGUID: jY2h40KRRDOHbwtEw0UPuQ==
X-CSE-MsgGUID: GQYdC0I8RmOGa1IZdC/y5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65575784"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="65575784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:56 -0700
X-CSE-ConnectionGUID: 47NlKcKMQsmKUmwsGILWSw==
X-CSE-MsgGUID: z6Ke+ZwRSOKc6oQDukAuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178721454"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:54:55 -0700
Date: Thu, 2 Oct 2025 21:54:53 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/7] tools/intel_display_poller: Add
 --auto-scanline-offset/-O comamnd line option
In-Reply-To: <20250922160950.27250-6-ville.syrjala@linux.intel.com>
Message-ID: <a9c1d0ae-2ad4-be43-0aa7-230e893d3e99@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1980405653-1759433183=:1357965"
Content-ID: <b0749957-d3eb-2b52-827a-a047c7736cb9@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1980405653-1759433183=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <8f8ac963-2d63-f69c-c888-6eb83f90cbef@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Using the --scanline-offset/-o option to manually specify the scanline
> offset can be a bit error prone since the appropriate offset depends
> not only on the hardware generation, but sometimes also on the output
> type (HDMI vs. not). Add a --auto-scanline-offset/-O option that tries
> to automagically determin the correct offset by examinign the current
> hardware state.
>
> Note that DSI outputs aren't really handled properly by
> hsw_ddi_is_hdmi(), or even by trans_reg() in general. So this
> might give the wrong answer there.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
--8323329-1980405653-1759433183=:1357965--
