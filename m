Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA093D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 15:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281C10E027;
	Mon,  1 Dec 2025 15:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJFPIflf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221B010E027
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 15:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764602392; x=1796138392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CfupvknbJe2UkVbTvDW6bSA0yuU0xXdXiy7ELlFxVdM=;
 b=HJFPIflfPEPJ/pSI6/A4+0E9K5O9E03EOySboeRtZ6b3S5/AQa2NOTQb
 9im6u1sPMSZUWCDyUPVRlZ3Mipf1KD/CgWO6e3rdWKUmE6rM2TNk6TEwQ
 nOmlCk7nK2NtbayodZsLppeo0N/jpNcDYBYeya33WAg0hTg3/ItsM2w/s
 uLsSbcfqbIf9pwZX3KpbbbIGJtv1iyXQElCrkkK938x09f2E90eZemVtq
 hfJkwE46sFJmqac+Yvl4XQYkUPydWJr3g05NEbIsm/OoAF2iaxqLHsm2E
 jOn9Rb4q5YIpfSn8QXaz9FOnr0irqyx8f2AKWyW3LXbwxgke1CC07F2Rd A==;
X-CSE-ConnectionGUID: LEM9JE6sQZC6+4VXcMdDMA==
X-CSE-MsgGUID: Oj6D0vxEQBqvqNf93pFpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65728615"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="65728615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:19:52 -0800
X-CSE-ConnectionGUID: Rid5566VSNWKmutFvMrHQg==
X-CSE-MsgGUID: HReggL1RRwuiw7YPGjLzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="225077048"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:19:49 -0800
Date: Mon, 1 Dec 2025 16:19:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH i-g-t v2 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
Message-ID: <20251201151933.rmvjwifpfacd6lgu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
 <20251128093858.3844420-3-boris.brezillon@collabora.com>
 <20251201111409.ylxykp74vpewq5p6@kamilkon-DESK.igk.intel.com>
 <B8DE2124-771E-4C2B-8752-0B32EF740250@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B8DE2124-771E-4C2B-8752-0B32EF740250@collabora.com>
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

Hi Daniel,
On 2025-12-01 at 10:25:06 -0300, Daniel Almeida wrote:
> Hi Kamil,
> 
> > On 1 Dec 2025, at 08:14, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > 
> > Hi Boris,
> > On 2025-11-28 at 10:38:57 +0100, Boris Brezillon wrote:
> >> This covering for this bug [1]. Add an IGT test to make sure we don't
> >> hit that again.
> >> 
> >> [1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collabora.com
> >> 
> >> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > 
> > I merged 1/3 and this one,
> > 
> > Regards,
> > Kamil
> > 
> 
> I’ll have a look on 2/3 today.

I merged 1/3 and 2/3, did you mean last one 3/3?

Regards,
Kamil

> 
> — Daniel
> 
