Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4BEC4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 09:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18E110E335;
	Thu, 16 Jul 2026 09:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdlJuwNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C7D10E75C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784195414; x=1815731414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/akj0DoCcVFiNke1w1Delte+CaNypLLx5YlkDS03qdI=;
 b=ZdlJuwNZBfp+sc9GIIYqanfxI9OIg0oWGSluneMMEbT7CLS41bkxzOeN
 lLFWde8QxzCwFz5enom68OI9NwsZRkKnlUPZvoVihMye0B3x4tSQnlVwF
 bNFkXKR7xOYyZ/hsvePNvv7mb1V5Ik6i42lkHnZ9gdzpPxdRsp2dr6POQ
 vVK4Pug5YID6gdCba7eczBzie37e+WAhgfeEOzPuJHBxxUZcLSyG/GCL0
 S/mWfiFCWJJiOvZDH9HvABmVc280Ams8O9X+H5zGcLeV880I6NzDLJ/1o
 1FWmbFhG17EI3pUhUXsxGQZ9feGb1F7drtb4jqvUkmeziyqebIUIm2u/P g==;
X-CSE-ConnectionGUID: gbcEy+ejSJqAYOBD5Q7qhQ==
X-CSE-MsgGUID: 8nHhd8BAS/u0fCkROdz7oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102277155"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="102277155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:50:13 -0700
X-CSE-ConnectionGUID: oEM5hGoLRoyPVrJEeEFMxA==
X-CSE-MsgGUID: smoara/RSYSxhCgj7ZPR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260029690"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:50:13 -0700
Date: Thu, 16 Jul 2026 11:50:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 09/11] lib/rendercopy: Convert pipeline emit commands to
 genxml
Message-ID: <dut76zkjhvvcozjd4we3lijfeyx7onuxbzegmvdxcgju7pykhe@gldlmdnobvdz>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
 <20260622035106.3023047-10-jan.maslak@intel.com>
 <jqde5hdoyqor6snkirq3xgs3itsrceiqumjprsvgf4qre5k4fu@dr6gzlzobn3k>
 <alSvWQGtgJAYsEfS@ART-DEV-395>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSvWQGtgJAYsEfS@ART-DEV-395>
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

On Mon, Jul 13, 2026 at 11:26:49AM +0200, Jan Maslak wrote:
> > There's only one nit I got for this patch. Why HAS_4TILE() is necessary
> > and > 12 is not enough? Have CI complained without this before?
> 
> Both plain Gen12 LP (TGL/ADL/DG1) and Gen12.5 (DG2/ATS-M/MTL) return intel_gen() == 12.
> Gen12 LP wants GFX11 STATE_BASE_ADDRESS, while Gen12.5 platforms want GFX125.
> We need to differentiate between the two, and HAS_4TILE() is a way to do that.

Ok, you're right. Looks we could also use:

if (intel_graphics_ver(devid) >= IP_VER(12, 50))
    ...

but both would work. So keep as it is.

--
Zbigniew

> 
> Pre-genxml code also used this logic for differentiation so I kept it for consistency.
> No CI failures were tied to it either way.
> 
> --
> Jan
