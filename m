Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE3BC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 14:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066210E930;
	Fri,  9 Aug 2024 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C65IdfUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A2210E930
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723214330; x=1754750330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mNOrgvXJnmysyAJbtaO6ZTavBLZQAxdhh1c11d70SNI=;
 b=C65IdfUqZ+3XZcSsED7C8LqDY5Hvu5v7wNx9MbhWtGVtL3da/OXkPncj
 xa85eOhkpb3cWNxJGUerLC9YI9QmPRnT1987eSMouZO6LUfMlIgWa1s3h
 SJoX7oU0tvwB4f0CNzI3duBOSnatyTVZB4WOzSI5H+1SC69xEEucWbkA6
 OLFYi+tTdNBVPkk4G34BcT9yLWD3+egmnt9vSNULmgNezNrVPceASPJS4
 sgq/zY204prUOfJV6n0zMt52S4x+GS2N9H4E8IY7+LpQdLR7N9vwG/CTj
 GtneRPoQO4Qiy0ita2gXmoTGo6qL1W11w5kr6r1eg1ih/qbIjC213AMK3 Q==;
X-CSE-ConnectionGUID: XDlQswF3QTSZ1/uu4nEl/Q==
X-CSE-MsgGUID: vnIYtO9uTPSxFPfO1Sk3yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="38841489"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="38841489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:38:49 -0700
X-CSE-ConnectionGUID: ZHBPN2eNRMqAOZQ3iCY92Q==
X-CSE-MsgGUID: 03LAE7bgTLSpwIzEO7/VaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61991283"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:38:47 -0700
Date: Fri, 9 Aug 2024 16:38:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v3 13/14] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
Message-ID: <20240809143844.qwmrhabypfgpubxh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-14-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809123813.109365-14-christoph.manszewski@intel.com>
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

Hi Christoph,
On 2024-08-09 at 14:38:12 +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> For typical debugging under gdb one can specify two main usecases:
> accessing and manupulating resources created by the application and
> manipulating thread execution (interrupting and setting breakpoints).
> 
> This test adds coverage for the latter by checking that:
> - EU workloads that hit a instruction with breakpoint bit set will stop
>   halt execution and the debugger will report this via attention events,
> - the debugger is able to interrupt workload execution by issuing a
>   'interrupt_all' ioctl call,
> - the debugger is able to resume selected workloads that are stopped.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 2203 +++++++++++++++++++++++++++++++
>  tests/meson.build               |    1 +
>  2 files changed, 2204 insertions(+)
>  create mode 100644 tests/intel/xe_eudebug_online.c
[...cut...]

Please use checkpatch.pl from linux kernel, watch out for
whitespace errors, unbalanced braces '{/}' in if...else
and few other problems.

A few useful options for checkpatch.pl are in CONTRIBUTE.md

Regards,
Kamil

