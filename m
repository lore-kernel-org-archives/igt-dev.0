Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCDCD5AE6F
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995710E305;
	Thu,  7 Nov 2024 07:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqjFIppe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B8810E305
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730964950; x=1762500950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=frjUa4ECshkNcf1GITYpozTqI4WtyvsHUrwpiRbtp+A=;
 b=jqjFIppeDEMUCwLJFBxPlcPzvBjMjWiU3xlWScPQhE9oOuOZgUQrEzsq
 gFkwLB4pYttrd6qxNIPW8Xl93cMgR4ZjvpbSf0jtJh1iyAu89Bc+MCzkb
 uLXx1KFde7RXe4g3GTA5Lrc2VChomuN65XF6vj0wdMuIl+lKe7HSfsT/o
 Z8VQGWmxvWHoHDF6widnE7Tqy2meWyGLOqCUuvl8WyBA4d2WQXIZ7A6dH
 NNJAv70loUOnJomFJXeCTq69M3/wL29Vl60sLiFNPHEU9JCDaOpRbwaUz
 /8utExchTiqL2Q16K/pqvEtBKCvn8nOVET0JfRIQF3Xu8co4GMP/ZDxTo w==;
X-CSE-ConnectionGUID: Mm8ruT2pTJaBYnw/pL+tXA==
X-CSE-MsgGUID: Ydh3qyh6SliZ/XisqzA+9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41390330"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="41390330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:35:49 -0800
X-CSE-ConnectionGUID: iXXC9BsfQGSPXl/RLYRbCA==
X-CSE-MsgGUID: CcGaPNhIQC+iQlKSmVkZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="85154954"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:35:48 -0800
Date: Thu, 7 Nov 2024 08:35:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/xe_spin_batch: Add spin-timestamp-check
Message-ID: <20241107073545.x7icsu7zl5qwkw5j@zkempczy-mobl2>
References: <20241105092805.317286-1-pravalika.gurram@intel.com>
 <mqo3bj2b6fw6eb26pj5ojighk4fp67nzqanzuics7hjknekqfx@7utg2ppxwhqb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mqo3bj2b6fw6eb26pj5ojighk4fp67nzqanzuics7hjknekqfx@7utg2ppxwhqb>
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

On Wed, Nov 06, 2024 at 11:08:20AM -0600, Lucas De Marchi wrote:

<cut>
> > +/**
> > + * SUBTEST: spin-timestamp-check
> > + * Description: Intiate gt reset then check the timestamp register for each engine.
> > + * Test category: functionality test
> > + */
> > +static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance *eci)
> > +{
> > +
> > +	exec_store(fd, eci, false);
> 
> what is the first exec for?

That's sanity check exec submission is working fine before we submit job
which will hang it. If you think it is not necessary it might be dropped.
I'm not sure if is possible situation so that check might point if test
prerequisites are not met (and on CI we just die on exec). But then I
think fence error code should be checked as well.

--
Zbigniew

> 
> > +
> > +	exec_store(fd, eci, true);
> 
> please use flags instead of bool to improve readability.
> 
> Lucas De Marchi
> 
> > +
> > +	run_spinner(fd, eci);
> > +}
> > +
> > igt_main
> > {
> > 	struct drm_xe_engine_class_instance *hwe;
> > @@ -343,6 +495,12 @@ igt_main
> > 			xe_for_each_engine_class(class)
> > 				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
> > 
> > +	igt_subtest_with_dynamic("spin-timestamp-check")
> > +		xe_for_each_engine(fd, hwe) {
> > +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
> > +				xe_spin_timestamp_check(fd, hwe);
> > +		}
> > +
> > 	igt_fixture
> > 		drm_close_driver(fd);
> > }
> > -- 
> > 2.34.1
> > 
