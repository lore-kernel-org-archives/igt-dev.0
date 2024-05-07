Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFD1C25B5C
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 05:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073871123E4;
	Tue,  7 May 2024 05:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPSRzJZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91691123E4
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 05:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715060949; x=1746596949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HsCMEpeekXWwIxfR6G+xwZaGU3d0FxVt1ivuEw9Jlek=;
 b=LPSRzJZ/htJeMMkiGK1dbYdtdH82AnUP11xOU68eypxUAMf+2syzOWMm
 0KlMNqUD1yGoZP7G/bjkpWCK3yWz53wD2y85A16/cYiJl71JPRlnFtqeV
 WrkK8hIwT/GqPYACynQpLr3m8PFuW5fk2AvYcv2pTs2yYQJbZqbFaLn0p
 2Nwv+ddrZhUNIh57iEccL8emFQ5hbUmDx7nGNAvQ99FUbGKtnQIitIive
 N+7VSmvEPBY38gk2m5aF/zeq+BEvMCYcutIboGCACX/E4WaJVPumajB6X
 Esy6i76sQeSWFoVJZW99BoHblJva3o+O/fMFGk+E4JgeQOtKozJObBbu8 A==;
X-CSE-ConnectionGUID: 8LPXwSrjQGqRDBEMo+JrCA==
X-CSE-MsgGUID: bE4SIQ+QT4K8iosoq7gyFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14615330"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14615330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 22:49:09 -0700
X-CSE-ConnectionGUID: QruGI6fSRgCsvK1Gg70j7g==
X-CSE-MsgGUID: c22sK0N5RouDQUwyHAmsTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="59250998"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 22:49:07 -0700
Date: Tue, 7 May 2024 07:49:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 08/10] lib/intel_cmds_info: Introduce render
 tilings
Message-ID: <20240507054904.wtdc3qwmgdtzxpbl@zkempczy-mobl2>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-9-zbigniew.kempczynski@intel.com>
 <8c4fc09e-0a19-4dd9-a6d2-b9feb764002a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c4fc09e-0a19-4dd9-a6d2-b9feb764002a@intel.com>
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

On Fri, Apr 26, 2024 at 03:18:25PM +0200, Karolina Stolarek wrote:
> 
> On 26.04.2024 11:01, Zbigniew Kempczyński wrote:> +struct render_tiling_info
> {
> > +	uint32_t supported_tiling;
> > +	uint32_t supported_compressed_tiling;
> > +};
> > +
> >   struct intel_cmds_info {
> >   	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
> > +	struct render_tiling_info const *render_tilings;
> 
> These two structs should share the naming convention, as they describe
> the same thing but for two different copy operations.

Not exactly. blt_cmd_info keeps relation between commands and tilings
whereas render_tiling_info is just a list of supported tilings
(there's single render command so there's useless to define it as
a single element array to keep the convention).

--
Zbigniew

> 
> There are two ways about it -- either rename blt_cmd_info to
> blt_tiling_info in a separate patch or make the render one to be
> something like render_cmd_info.
> 
> All the best,
> Karolina
> 
> >   };
> >   extern const struct intel_cmds_info pre_gen6_cmds_info;
