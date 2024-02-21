Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B7C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D42710E56E;
	Wed, 21 Feb 2024 11:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDVH/wlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE8A10E56E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708514933; x=1740050933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ps9VwS4wMMynEcNboNgfx17q6CE1Mu/gUzXoXB9D/xE=;
 b=JDVH/wlqvXoJAzz43r3Wj0CyE7hn+HUtq8cZMxg7lH08SEpz+Ovx4D4Q
 Iolfmt5C4PVQq0A3Kgw1pNG/Opcw+r9R+VdixaKPkCUpupX+3N/7aqMR+
 TUyn5l3GB5srdeeAYpi5C2P63cYUaVWEyoze0NjDP932wy6XD+gVJKdUG
 vNP9YcTjvL772e/7YWatlTc72BaOUhCWNP0hckoOvqhSgFaGQummQ4Ypf
 fg245iHKN46ZZ2VgEqHMHB51220CVNEcAf9cnfT2o1Wc5Y3PQO4Z+rN3b
 9BCzwWsLxFHVKbW/WtYEhtiMNxv6FigPhILka7D5/Lnu2USMtNvjDch+k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2540338"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2540338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5084242"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:28:51 -0800
Date: Wed, 21 Feb 2024 12:28:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: aditya.chauhan@intel.com, himanshu.girotra@intel.com,
 ramadevi.gandi@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add debugfs subtest to i915 BAT
 testlist
Message-ID: <20240221112848.zg6dfpqaurm4y5mi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, aditya.chauhan@intel.com,
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com
References: <20240221104106.32576-1-aditya.chauhan@intel.com>
 <20240221104712.2vwb7nviacebhdmn@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221104712.2vwb7nviacebhdmn@kamilkon-desk.igk.intel.com>
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

Hi,

On 2024-02-21 at 11:47:32 +0100, Kamil Konieczny wrote:
> Hi Aditya,
> 
> On 2024-02-21 at 16:11:06 +0530, aditya.chauhan@intel.com wrote:
> > From: Aditya Chauhan <aditya.chauhan@intel.com>
> > 
> > Add debugfs_test@sysfs subtest to i915 fast feedback testlist to improve
> > validation if any changes are added in sysfs node
> > 

Something strange happens on patchwork, it didn't appear in fdo igt-dev
patchwork but it is on ML. I will merge this soon, any objections?

Ramadevi? Himanshu?

Regards,
Kamil

> > Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> > ---
> >  tests/intel-ci/fast-feedback.testlist | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> > index 662e49cc3..be0965110 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -5,6 +5,7 @@ igt@i915_module_load@load
> >  igt@core_auth@basic-auth
> >  igt@debugfs_test@read_all_entries
> >  igt@debugfs_test@basic-hwmon
> > +igt@debugfs_test@sysfs
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> >  igt@fbdev@eof
> >  igt@fbdev@info
> >  igt@fbdev@nullptr
> > -- 
> > 2.39.0
> > 
