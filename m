Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE4CD343E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 14:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7EE10E5CA;
	Tue,  3 Sep 2024 14:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8OxZlx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D1910E5C9;
 Tue,  3 Sep 2024 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725375400; x=1756911400;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Quy0EMY8nrJHXHSMmtUEKMuIXwvJgXqf7IfpjRrX2Ro=;
 b=N8OxZlx5Au1dzFWsjzMomqDcQD0H1hUoaHIZgQDpGYypPWoNVxiOYgFJ
 pDjxzM02nspoFP+of8VvTO59H0nNjZjFiaj7tEUytAp0p/gYvK6j9K4U3
 uGFRo4MtTmBsFf7cfwV8fK//7m4LU0X0wk6g3jAOaH4XD56ewKYklqTur
 bDbrdmc9LqI/n8Yj2cp1Odc3uhQD9+sDCyPPMmrzzY3/JWKXZ5tHW+Jr4
 AWGVi6HcusNnPtFhXl3hTKKMu0ZPGoGxqVPcpRwJK5rE0DgsRym3dvU7J
 mDqLT7OgZqMM6A2bgn2aiARNroDie9wIl98W1TAGZx5Z4IYnsn7p60gMY A==;
X-CSE-ConnectionGUID: RTdfDp1JSXqlnPiVfc16GQ==
X-CSE-MsgGUID: im6Tkh+9TUGdylBnn+t+DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34547476"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="34547476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:56:38 -0700
X-CSE-ConnectionGUID: C0x2XDqUSSat0HINvXelDA==
X-CSE-MsgGUID: tkP3XmuYQNawFMJ3rSlY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="64990856"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.251.221.173])
 ([10.251.221.173])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:56:36 -0700
Message-ID: <267f8e6b-c18f-43ac-a2d9-78fac8556276@linux.intel.com>
Date: Tue, 3 Sep 2024 16:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_runner/executo?=
 =?UTF-8?Q?r=2Ec=3A_Detect_tests_killed_by_a_signal_=28rev5=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <172537480568.913396.13866995480997814090@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172537480568.913396.13866995480997814090@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915-ci,

[...]

On 03.09.2024 16:46, Patchwork wrote:
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11685_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_vm@large-split-binds-16777216:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8001/shard-dg2-436/igt@xe_vm@large-split-binds-16777216.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11685/shard-dg2-432/igt@xe_vm@large-split-binds-16777216.html

This is unrelated to my change.

[...]

Thank you,

Peter
