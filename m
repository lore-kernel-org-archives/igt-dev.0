Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B57CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 13:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78110E558;
	Thu, 14 May 2026 13:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKcWzeAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D72010E558
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778764713; x=1810300713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6Mzn1Qo64UriokUlFB6F1WQizFLRyJNurkIG7I/onhE=;
 b=nKcWzeAuzmT87PdtHALcPRFE834R8LRg3k8Ds6TQQTu7VlaEgLTcE115
 SZqoTFFSlUIuWRAvR2FAGEhwDlvnYJqb0jT2g3RDV9hwFHNDNuuGcrh6U
 JNLIPCqah10S0d+IQmYj6zDRFoYBgCEiz3Y8WVCe051klwE98wR+5dbM0
 NCTx0IsUYqAvuIkCHtiUxH29CgxmKfhRecAWzoADWnAhRItGZZTuN+LOq
 WOqDixRLwiqMHGNMkJKFWAAKFjKpwnaCl2eDVsggXKRRT7b18+Igq9lg9
 LRJcfZMae4+EXUqYQL1475oLEuFKICRts9usVRmbbFKRFBa/igo85B6RW g==;
X-CSE-ConnectionGUID: Ed/76Kh3S6O4RwolgfLhUg==
X-CSE-MsgGUID: NGTQS/WOTXeg72aXMUq0mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105165281"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="105165281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:18:32 -0700
X-CSE-ConnectionGUID: 2dWGclclRri3Sg1PgZcJww==
X-CSE-MsgGUID: zc8XnSwhQIabdvbZ36p8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237517394"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 06:18:31 -0700
Message-ID: <ed0bce1d-ea8e-4d1f-9b49-d80a99916a37@linux.intel.com>
Date: Thu, 14 May 2026 15:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tools/vmtb: Define IGT tests used as VF
 migration workloads
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
 <20260416083544.2441874-2-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260416083544.2441874-2-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 4/16/2026 10:35 AM, Adam Miszczak wrote:
> New VF busy migration scenarios are expected to utilize IGT tests as workloads,
> specifically several subtests from 'xe_exec_reset', 'xe_exec_threads', 'xe_ccs'
> and 'xe_compute_preempt'.
> Extend IgtExecutor support for relevant IGTs (IgtType definitions and mappings).
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/executors/igt.py | 96 +++++++++++++++++++++++++++++--
>   1 file changed, 90 insertions(+), 6 deletions(-)
>
> diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
> index a08f71d54..f443fb99e 100644
> --- a/tools/vmtb/bench/executors/igt.py
> +++ b/tools/vmtb/bench/executors/igt.py
> @@ -17,17 +17,101 @@ logger = logging.getLogger('IgtExecutor')
>   
>   
>   class IgtType(enum.Enum):
> -    EXEC_BASIC = 1
> -    EXEC_STORE = 2
> -    SPIN_BATCH = 3
> +    # Basic/generic IGT tests:
> +    EXEC_BASIC = enum.auto()
> +    EXEC_STORE = enum.auto()
> +    SPIN_BATCH = enum.auto()
> +    # VF migration workloads - xe_exec_reset/long_spin subtests:
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    # VF migration workloads - xe_exec_reset/cancel subtests:
> +    EXEC_RESET_CANCEL = enum.auto()
> +    EXEC_RESET_CANCEL_PREEMPT = enum.auto()
> +    EXEC_RESET_CANCEL_TIMESLICE_PREEMPT = enum.auto()
> +    EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT = enum.auto()
> +    # VF migration workloads - xe_exec_threads subtests:
> +    EXEC_THREADS_BASIC = enum.auto()
> +    EXEC_THREADS_BAL_BASIC = enum.auto()
> +    EXEC_THREADS_CM_USERPTR_INVALIDATE = enum.auto()
> +    EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE = enum.auto()
> +    EXEC_THREADS_MANY_QUEUES = enum.auto()
> +    # VF migration workloads - xe_ccs subtest:
> +    CCS_BLOCK_COPY_COMPRESSED = enum.auto()
> +    # VF migration workloads - xe_compute_preempt subtest:
> +    COMPUTE_PREEMPT_MANY = enum.auto()
>   
>   
>   # Mappings of driver specific (i915/xe) IGT instances:
>   # {IGT type: (i915 IGT name, xe IGT name)}
>   igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] = {
> -    IgtType.EXEC_BASIC: ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
> -    IgtType.EXEC_STORE: ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
> -    IgtType.SPIN_BATCH: ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic')
> +    # Basic/generic IGT tests:
> +    IgtType.EXEC_BASIC:
> +      ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
> +    IgtType.EXEC_STORE:
> +      ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
> +    IgtType.SPIN_BATCH:
> +      ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic'),
> +    # VF migration workloads - xe_exec_reset/long_spin subtests:
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-media'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt0-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt1-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-media'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads'),
> +    # VF migration workloads - xe_exec_reset/cancel subtests:
> +    IgtType.EXEC_RESET_CANCEL:
> +      ('n/a', 'igt@xe_exec_reset@cancel'),
> +    IgtType.EXEC_RESET_CANCEL_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-preempt'),
> +    IgtType.EXEC_RESET_CANCEL_TIMESLICE_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-preempt'),
> +    IgtType.EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-many-preempt'),
> +    # VF migration workloads - xe_exec_threads subtests:
> +    IgtType.EXEC_THREADS_BASIC:
> +      ('n/a', 'igt@xe_exec_threads@threads-basic'),
> +    IgtType.EXEC_THREADS_BAL_BASIC:
> +      ('n/a', 'igt@xe_exec_threads@threads-bal-basic'),
> +    IgtType.EXEC_THREADS_CM_USERPTR_INVALIDATE:
> +      ('n/a', 'igt@xe_exec_threads@threads-cm-userptr-invalidate'),
> +    IgtType.EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE:
> +      ('n/a', 'igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate'),
> +    IgtType.EXEC_THREADS_MANY_QUEUES:
> +      ('n/a', 'igt@xe_exec_threads@threads-many-queues'),
> +    # VF migration workloads - xe_ccs subtest:
> +    IgtType.CCS_BLOCK_COPY_COMPRESSED:
> +      ('n/a', 'igt@xe_ccs@block-copy-compressed'),
> +    # VF migration workloads - xe_compute_preempt subtest:
> +    IgtType.COMPUTE_PREEMPT_MANY:
> +      ('n/a', 'igt@xe_compute_preempt@compute-preempt-many')
>       }
>   

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

