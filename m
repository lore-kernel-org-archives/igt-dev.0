Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E45C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 13:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D5D10E1B5;
	Thu, 17 Jul 2025 13:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDFeyZge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FCB10E16E;
 Thu, 17 Jul 2025 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759732; x=1784295732;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YPCejalksJgpOxoplUhztIcPU0VX9Q1VEUl2XwqdhSw=;
 b=JDFeyZgetcqLNLP3klIcFCUzZ+jNdNHiqOSBXYAyG2Cf4ZVj1NURHg+3
 PPrvvGMfPs7d1U006d37sdoOsahUGbsw9/syrKc/wLrRsIWYA6ONixFx8
 rxlLfQ48jzp1RMlncmpArX765gvB6M5VrSykcyJeePGtRJYBJ2ySJUk/0
 vPrhhTqOV2uAQYsyn7ciX/QqazMqfh3tBHb1zuTretexSjHpnwPrHyf2I
 39ehY/f37vRD0A0JLh8h2OLtUBlxHrx/c/3k4sZtzPQkglKa0thFKYXot
 LF2rt+ShojLc+xdNIDunvc/WRcEo+ZgqXQDvzHlmO+bWxW0jxK6S/KQzi A==;
X-CSE-ConnectionGUID: w9/iuY8iRTOZmAiKWOk1nQ==
X-CSE-MsgGUID: Q+oLmTk0Qvy9MTyjluOeag==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54142602"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54142602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:42:11 -0700
X-CSE-ConnectionGUID: 81ZZQ+X9RvamfXk9ZtDGOA==
X-CSE-MsgGUID: ZrE8jNYmSKuSiDXykh/coQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="163438009"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:42:10 -0700
Message-ID: <4f1eba9e-946d-4426-a12a-ca7238c9e52f@linux.intel.com>
Date: Thu, 17 Jul 2025 15:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Replace_int?=
 =?UTF-8?Q?el=5Fsysfs=5Fdebugfs?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250716093656.169619-1-peter.senna@linux.intel.com>
 <175275225197.169254.9871917332077932390@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175275225197.169254.9871917332077932390@1538d3639d33>
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

Dear I915,

On 7/17/2025 1:37 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs
> URL   : https://patchwork.freedesktop.org/series/151696/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8461_FULL -> XEIGTPW_13481_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13481_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13481_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13481_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue:
>     - shard-lnl:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13481/shard-lnl-7/igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue.html

These are not related.

Thank you.,

Peter

[...]
