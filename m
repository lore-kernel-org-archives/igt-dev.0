Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD90C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C9811A35A;
	Thu, 25 Apr 2024 10:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdxoxILq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBEF11A360
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714039309; x=1745575309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P6UkHx1SNRj6HQRRNsJxbIMouszcvD9D+kPC2ngBgrY=;
 b=mdxoxILqQrpZhkh6RbkRx2S8kFgn/T6KQ98t9hNi89wiOzAti5Kp3wpr
 SyplLmRPuMfZRhqWEycKCnrWh4IehYIFil/aKbmB+lfkkQaLYPuz6jPMh
 LTpsXqMAaC10nKc0m0jco80AQgESAQIh8+R/+gedgSljgfNPn+XZD27zY
 w088cJRzdA9Wd3OpwosHYTOsc2EAl2racyuAhlbujxCN6XeT8fkZGGcPp
 Qt2bnJso236bhzcjFgHparXjKjld++SAiz1noLrql0u2HRGqlgAK3WW1l
 UM3hMJSnmwNs6CDvXSR3J/5i3lUbccrxrDjeqvC/FKuFlxBby2csXJvzH w==;
X-CSE-ConnectionGUID: itFrIwWxS7O7Cu8CpTC7pg==
X-CSE-MsgGUID: Tei1VXG4RwC06KyaQ89pZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20262437"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="20262437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:01:46 -0700
X-CSE-ConnectionGUID: NI1IvyYrSqOBUGZJ43m+iw==
X-CSE-MsgGUID: YdSmY5nSTd+xH4Qijpg8Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="24886475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:01:45 -0700
Date: Thu, 25 Apr 2024 12:01:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_test_config.json: fix
 indentation
Message-ID: <20240425100128.pwaad4phebljmqiu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
 <20240425085203.142195-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425085203.142195-2-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-04-25 at 10:49:22 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There are some wrong indentation at Run Type. Fix it.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_test_config.json | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 7c37c831b72c..5c8db82dfc73 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -23,9 +23,9 @@
>                      "exclude": [
>                          { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
>                              { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> -                        ]
> -                    }
> -                },
> +                    ]
> +                }
> +            },
>              "Category": {
>                  "_properties_": {
>                      "description": "Contains the major group for the tested functionality 'Display'"
> -- 
> 2.44.0
> 
