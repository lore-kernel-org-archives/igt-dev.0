Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4AACAC5B8
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 08:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B7810E291;
	Tue, 30 Sep 2025 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYHrvCGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33A410E291
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759220517; x=1790756517;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=gYERJDDdOpRwKKjqgqWN5HixGoJpQQkX5LphYEKA0To=;
 b=XYHrvCGj6MZx4KLRFeWrJObPa2+Ytj4qIPpDEyaglB/tnql9zFYin8Jj
 yDjO6WgrIoNirqBAcqGOMOH5Nb9bj5bMNghsl+/Qo2fVMqK8s8rO0lncQ
 6th2wsO2aeOpoPNaEh5s4rIepdWHqli0Brhc+iitaAvcdUEoHjYH0GB/q
 4NV1T2KyN0KUNEHClq3wbMCJKmdr92jZdJlcj/3Lf3E7Mmp+cLW+oS7Qf
 EVbfTlqLGDait6cwJpuLdS8aiRIb7KsgDwlsnELsxcIWNLzhrjDW+yRLf
 oINdDn5D9NqDWrQGfKyDrK1JK7C4xM6j/iTMgST44l+8tIh6XV9Jh62y9 A==;
X-CSE-ConnectionGUID: 8rHlSvKxTi6jsWB8QVpQLA==
X-CSE-MsgGUID: hO9rq6lpQ/WfUCyCvvbrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71717187"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="71717187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:21:56 -0700
X-CSE-ConnectionGUID: KQoaEU7VS6WDXa3e4OivAg==
X-CSE-MsgGUID: WtVKL/fbSJ615Va/srM0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="179229108"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 01:21:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/6] tools/intel_vbt_decode: Convert eDP deocding
 to use to_str()
In-Reply-To: <20250929192127.5865-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
 <20250929192127.5865-4-ville.syrjala@linux.intel.com>
Date: Tue, 30 Sep 2025 11:21:51 +0300
Message-ID: <2568f0127d5f540e3122b014740b6a15ed27a68a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 29 Sep 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> -		switch (edp->fast_link_params[i].rate) {
> -		case EDP_RATE_1_62:
> -			printf("1.62Gbps\n");
> -			break;
> -		case EDP_RATE_2_7:
> -			printf("2.7Gbpc\n");

Also, that used to be a really, really deep color. :p


-- 
Jani Nikula, Intel
