Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC8CCDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 11:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C7F10E033;
	Wed, 24 Jun 2026 11:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDu8QzYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC83710E033
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301479; x=1813837479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uU0ZGIYR+Ak6UsYKXbP7feiVXLW3JD2Fsh85aagA96U=;
 b=fDu8QzYH61TWH8cz5sQFJHUh8hP3mrp3lMOQtEcxIElc1dntOevzNzp1
 pTmqfps5yDXPwbIRHrlmhBsWj7BJTCUaq3Kc+z61HZJAvEQ2RGCLpF0V/
 I7S+2lQB75jlGpR3rfSIt+K7HbSo7zlwUdkfbCHhHzZjMvP20K12bYvAk
 v7MqB3VRr5SrA27EUTZweKfT3zITVgi0s6NiX1j8mJtonwhawP9GaZ7Dz
 8kDHk6vF00X3DwTF//4eSDTHdEUN53h7KPtmx6Oyk2ChQasI00o+TYs35
 Uvx53c425HqaNgcZaUsibvbtHdrckhFpHecAX9REUUZDmB0lIwwWnVihW g==;
X-CSE-ConnectionGUID: uPlbXcXwTCK9Z7NDgMpb7g==
X-CSE-MsgGUID: wfAWD7hjRPWN5lv/exxjQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93417323"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93417323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:44:39 -0700
X-CSE-ConnectionGUID: skDuVZsTQwea5B5rwRjfFg==
X-CSE-MsgGUID: pfiFYqaGQZ28CMb+PuUtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254189459"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:44:37 -0700
Date: Wed, 24 Jun 2026 13:44:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] blocklists: Add asahi tests to i915 and Xe
 blocklists
Message-ID: <20260624114433.z3atxtzpegksvwfy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20260624102913.903645-1-krzysztof.karas@intel.com>
 <DJH7ZZOA7MF0.3GZ69BKPSYOIC@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJH7ZZOA7MF0.3GZ69BKPSYOIC@intel.com>
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
On 2026-06-24 at 12:50:47 +0200, Sebastian Brzezinka wrote:
> Hi Krzysztof,
> 
> On Wed Jun 24, 2026 at 12:29 PM CEST, Krzysztof Karas wrote:
> > These tests are not supposed to run on Intel drivers.
> >
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16489
> > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> Looks good,
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> 

Thank you, I merged it with prefix intel-ci: and changed
description. I forgot to add it when I merged asahi tests.



Regards,
Kamil

> -- 
> Best regards,
> Sebastian
> 
> 
