Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B6CD4F4C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 06:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C5810E2D7;
	Mon,  9 Sep 2024 06:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cELkCB3J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57FF10E2D7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 06:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725864853; x=1757400853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bS0KRkhw7m5srRgFWvNVomtpIaj82DylpFI4ffKzU2o=;
 b=cELkCB3JIy76AJ1sHwnrlYrEMrQgrp1BsaDza93jaRFu6bNAwEajr8Bm
 MSxKcMNeEqRGueyUbYywMMYTv3QXjsWJu7nQXJWhruGt8HBebRG/PUyfp
 s92ggwNa2qU3zTYCBXm0JbV807kwTvOSfYO3iTHj9l8aDjVfKaQO1DCfc
 tW9wN3U9zyRlKtq6+RrQ09NqZur7pAUjEkalYEOmWzSfoAG4qlbivh+C3
 iwhZVX3LXs8adQJvpANQ86Qauu+JNz2Xa7xQiWSlXSb+fmomGTtp7TwEz
 rWRcbZYfF28Hz+SMSMtCaLkE1IocLL7Bu2tRT7n0zzVSpoieFyIiA4ZHV A==;
X-CSE-ConnectionGUID: Fk44+IhsSQG25O6kojdW0w==
X-CSE-MsgGUID: lKWzawcMTPuGO/e/Z836wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35113255"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="35113255"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 23:54:12 -0700
X-CSE-ConnectionGUID: UAPLusGMQAO73fg1TqAMIg==
X-CSE-MsgGUID: KOv7RO/8Sa2FdzvgCu+oGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="89836805"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 23:54:09 -0700
Date: Mon, 9 Sep 2024 08:54:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v6 03/17] lib/gpgpu_shader: Extend shader building
 library
Message-ID: <20240909065406.6qexcqvctub2kvlh@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-4-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905092812.94553-4-christoph.manszewski@intel.com>
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

On Thu, Sep 05, 2024 at 11:27:58AM +0200, Christoph Manszewski wrote:

<cut>

> +
> +/**
> + * gpgpu_shader__end_system_routine:
> + * @shdr: shader to be modified
> + * @breakpoint_suppress: breakpoint suppress flag
> + *
> + * Return from system routine. To prevent infinite jumping to the system
> + * routine on a breakpoint, @breakpoint_suppress flag has to be set.
> + */
> +void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
> +				      bool breakpoint_suppress)
> +{
> +	/*
> +	 * set breakpoint suppress bit to avoid an endless loop
> +	 * when sip was invoked by a breakpoint
> +	 */
> +	if (breakpoint_suppress)
> +		emit_iga64_code(shdr, breakpoint_suppress, "			\n\
> +(W)	or  (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x8000:ud	\n\
> +		");
> +
> +	emit_iga64_code(shdr, end_system_routine, "				\n\
> +(W)	and (1|M0)               cr0.1<1>:ud   cr0.1<0;1,0>:ud   ARG(0):ud	\n\
> +	// return to an application						\n\
> +(W)	and (1|M0)               cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x7FFFFFFD:ud	\n\

I'm reading documentation and I've doubts regarding 0x7ffffffd value.
If I understand correctly, the bits 0 and 2 are mbz, so mask here
should likely be 0x7ffffffa.

> +	", 0x7fffff | (1 << 26)); /* clear all exceptions, except read only bit */
> +}
> +

--
Zbigniew

