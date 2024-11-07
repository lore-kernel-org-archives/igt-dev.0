Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA4FD5D674
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332110E084;
	Thu,  7 Nov 2024 17:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXjbqCc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B6E10E084
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731001464; x=1762537464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hk9+Z91DQIQCzKNxjSjjHEqqgsGdDiSwWyBUPDqtzL8=;
 b=DXjbqCc8+Tw+5h8ACqAc/snZJRbNlZuB5KvsmCtJ3SULAq35NB+7ljCn
 oEg0cuATGRJ53QLqcWH9mV70PGpg8ubSEHrPhzd8JjDYeOedsAu1D9afY
 JWdNZFj1PM46mfRnyz9meu8+EEmYxBsSdnceLuJGFKrvshIWn4zUCHz9I
 gZgzXK+Y0h0DfIhfvUBrLJE4dTs/U08kOBPwZarw76it5PFtd02VuFLN7
 9skCXeJHAOjsBTyuJGVMJwI5WfBL5Vqi3hRAn9s0K9/wBu7s8ztUz2Mxg
 CPmHiZpc7svZ5wCXsKaN3jBZPRWJchTps072+bw6Kmdct9Pt3a66pHusw Q==;
X-CSE-ConnectionGUID: ubURZYyUQqaD8QJ5GVHa4Q==
X-CSE-MsgGUID: HswD4LhIRgiKCl3EGIUaOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30717677"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30717677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:44:23 -0800
X-CSE-ConnectionGUID: uNHAHQ+4RqW8WkVTyyRWGg==
X-CSE-MsgGUID: QiLnYfOsTUKz6W7orAp/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89982928"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:44:22 -0800
Date: Thu, 7 Nov 2024 18:44:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
Subject: Re: [PATCH i-g-t v2] igt-runner fact checking
Message-ID: <20241107174419.panxsi7kir737xzt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <8c573469-ff48-49bf-a3ab-ddcfaef83e95@linux.intel.com>
 <20241106124413.swtucaj5yjj6o3ou@kamilkon-desk.igk.intel.com>
 <5d8e05af-292f-47df-8eae-433c48365f96@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d8e05af-292f-47df-8eae-433c48365f96@linux.intel.com>
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

Hi Peter,
On 2024-11-07 at 08:03:12 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your review. Please see my comment below:
> 
> [...]
> 
> >> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> >> new file mode 100644
> >> index 000000000..b649f93b3
> >> --- /dev/null
> >> +++ b/lib/igt_facts.h
> >> @@ -0,0 +1,55 @@
> >> +// SPDX-License-Identifier: MIT
> > 
> > In headers use /* SPDX-.... */
> 
> Checkpatch can't decide itself. No matter the format, it complains...
> 
> WARNING: Improper SPDX comment style for 'lib/igt_facts.c', please use '//' instead
> #70: FILE: lib/igt_facts.c:1:
> +/* SPDX-License-Identifier: MIT */
> 
> [...]

Headers .h and C source .c have different convention.

Regards,
Kamil

