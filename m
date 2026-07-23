Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A59C531F7
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5A410E110;
	Thu, 23 Jul 2026 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXfCuILl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0E510E110
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784819308; x=1816355308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CFPSMSezuOr7rtNdGT5ceKYHPWsCsBd1rZUWEmS3N8g=;
 b=cXfCuILlzjtkiv2ioVF5poS7F0oxLXtUph6G3YK0CdJmpPv5ZOUe4axR
 xZ4ZhqBO0NMvXBxK3Scm+0mfKQo35S2Gg6GCFuEIxhIHbzfxO39phsXsH
 HLS/1gHkzs1WwH+jvOmiFFXNN8/CrkZIadtuJlmYUxXKj9bzvl2gxkcsv
 vhxBz2GIM1X776UEFgVroh4HrL7FGj5hcLr9BwnFR6RYL/clV4TWCz00F
 w+aUErv48/ZhnGOdIGFK3mpC65maeB1WbeQbqAzkcTFzdof1BGih4kJbT
 p9ZlmFi1ttqTQ2h3oZu04b4m9YqBWYQIxdbrNYjyHoEQ63PHlHKDJSMW8 g==;
X-CSE-ConnectionGUID: OuoEs/fvSLiQu9eTHOSpkQ==
X-CSE-MsgGUID: k1xc9iD9QRqXythynHdDoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89299675"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="89299675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 08:08:27 -0700
X-CSE-ConnectionGUID: lR9TqRyzToGOz5ZV+d4HxQ==
X-CSE-MsgGUID: nczU2QtGRFysfDIqPP8LvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="262218530"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 08:08:25 -0700
Date: Thu, 23 Jul 2026 17:08:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Mark Yacoub <markyacoub@google.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
Message-ID: <20260723150823.fh6himsrei72bnfm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Mark Yacoub <markyacoub@google.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <db4400f05ba72613df363cc62496319a5c0fed9b.1784117512.git.sebastian.brzezinka@intel.com>
 <20260716140853.66ulgagvtzvp5mkh@kamilkon-DESK.igk.intel.com>
 <DK3D4887RI7E.HX0EF2D4CLAO@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DK3D4887RI7E.HX0EF2D4CLAO@intel.com>
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

Hi Sebastian,
On 2026-07-20 at 13:30:04 +0200, Sebastian Brzezinka wrote:
> Hi Kamil,
> 
> On Thu Jul 16, 2026 at 4:08 PM CEST, Kamil Konieczny wrote:
> > Hi Sebastian,
> > On 2026-07-15 at 14:15:40 +0200, Sebastian Brzezinka wrote:
> >> igt_load_igtrc() is used exclusively by igt_device_scan internals to read
> >> per-device configuration from the igtrc file.  Moving it from igt_core.c
> >> to igt_device_scan.c co-locates the function with its primary user and
> >> makes it possible for lsgpu to link against lib_igt_device_scan without
> >> needing the rest of libigt.
> >> 
> >> Update the declaration accordingly: remove from igt_core.h and add to
> >> igt_device_scan.h where the implementation now lives.
> >> 
> >> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> >> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >> ---
> >>  lib/igt_core.c        | 47 ------------------------------------------
> >>  lib/igt_core.h        |  2 --
> >>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
> >>  lib/igt_device_scan.h |  2 ++
> >>  runner/executor.c     |  1 +
> >
> > If this is used by igt_runner, maybe more proper solution
> > would be to move it to separate lib/igt_igtrc.[c|h]?
> Somehow, I don't like the idea of a file that holds a single function.
> 

There is already lib/igt_rc.h so just add implementation
to lib/igt_rc.c

Btw I don't like idea of loading .igtrc file in igt_device_scan.c.

Regards,
Kamil

> -- 
> Best regards,
> Sebastian
> 
