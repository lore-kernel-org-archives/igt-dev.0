Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C26C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 15:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82ED10E049;
	Wed, 29 Jul 2026 15:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkqRISIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC5510ECB6
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785340188; x=1816876188;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MixzrvvO/0WvrkVmq6fHqEXUvHTiHN8i13Oo3/nrM00=;
 b=PkqRISIu8LSMkn86ctIEba6v2HPIWzTnJE+RcTgHJs1TZ3tiC9qWaR02
 2N1+aSUFJyfBow0856PRqcYfGMinDFy+dhyYTZIYVCE1ur7E47s7Whb2C
 G7sTCUeNJbhRwrfqsK436rjTNJGcblQH1iit+1/QN2vrN4787tq83taP7
 iFymdReHdBg3cIOJ0+g8Mp3UTZeJodoAhQXTA8+7kHPWuS3vSdbp691G6
 +s3ZWyEEKzJA9IDQx3kiOeDkHKo4lshtJwKzjffRhZ533/8zXHYalgjub
 Aq8P/vfE+fHyFXrW/cG3ZyHVLPkgduCKCUuptbqlor2+bo+qslwh7ADFF A==;
X-CSE-ConnectionGUID: j0yKRtnOSNO3/QY+yU7khg==
X-CSE-MsgGUID: FM6C4mlAQVy3m1tYdsM7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89838223"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89838223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:49:48 -0700
X-CSE-ConnectionGUID: dp5JMM14QfyQWGPCMTMLfw==
X-CSE-MsgGUID: vjF0lYkBQ5aEgw/kMXJQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260667609"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 08:49:45 -0700
Date: Wed, 29 Jul 2026 17:49:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v4 1/5] lib: Add generic platform filtering framework
Message-ID: <20260729154943.kappa755rs5wavwr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
References: <20260722022150.191615-1-vitaly.prosyak@amd.com>
 <20260722022150.191615-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722022150.191615-2-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2026-07-21 at 22:21:34 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>

sorry for 2nd mail, I forgot about incremental compilation. Your
series should compile with

git rebase origin -x ./compile.sh

Now, after a first patch is applied, there is warning:

[5/960] Compiling C object lib/libigt-igt_platform_filter_c.a.p/igt_platform_filter.c.o
../lib/igt_platform_filter.c:568:6: warning: no previous prototype for ‘igt_platform_filter_is_initialized’ [-Wmissing-prototypes]
  568 | bool igt_platform_filter_is_initialized(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Regards,
Kamil

> 
> Implement vendor-agnostic platform filtering system that allows any
> vendor to plug in platform-specific test skipping logic via callbacks.
> 
[cut]

