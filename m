Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945BEC3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 10:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592F110E725;
	Thu, 18 Jul 2024 10:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfPMnoOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3751510E725
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721299047; x=1752835047;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s03IO83MZOHc++em8U87iZlUNLK9xNmHteupR6F4unw=;
 b=kfPMnoOJwRGr3hGf6p4aQ4115neBzeZjjUQhHSODF83IzI0NK5csLxWr
 Bt0pbMUNaixnADeZpGG4kcTv8AprB1z36Ji/u13Huxo9sePOh56E93pBs
 kNn7hwSg2eyKz7tL94ai6AaRoCwzxsqYD1U3MV0dGnknHfXXQ/byUONOh
 y84FZ/SJSwfYYylDASHXKGN97HE9YE8+Lx5XlJFo+UHLP8DlnY5IjTYwH
 eFj/WnDEYotWsYWjxQhNdk0+SlqJ93CbOoVobKHUbJM+lUDp4W+DeFRCH
 vTMEHYMjDrLbScQwoV9OxO0XVJ96UDo2AU4nmze5fmyzUQfiKfN8SYrq4 w==;
X-CSE-ConnectionGUID: JSuakVcaTb6HlHWas3z93g==
X-CSE-MsgGUID: Ndw6LwKZQfKHwnYNdqHpzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22713959"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22713959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 03:37:23 -0700
X-CSE-ConnectionGUID: 4bq42+/GTPmqHf19LAW6IA==
X-CSE-MsgGUID: x/QwG3DpQu2V8ysdgv9Q3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="55566981"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 18 Jul 2024 03:37:21 -0700
Received: from [10.246.36.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.36.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8B6B7125AF;
 Thu, 18 Jul 2024 11:37:18 +0100 (IST)
Message-ID: <ec909366-edd6-45d5-901c-880334ce3fdd@intel.com>
Date: Thu, 18 Jul 2024 12:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist
 for SR-IOV VF BAT runs
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240717153051.1000030-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240717153051.1000030-1-marcin.bernatowicz@linux.intel.com>
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



On 17.07.2024 17:30, Marcin Bernatowicz wrote:
> Blocklist tests not applicable for Virtual Function (VF) BAT runs.

is this 'VF BAT run' about running IGTs in VM, or it's something different?

> The list extends xe.blocklist.txt to enable xe-fast-feedback.testlist
> execution on VF device.

maybe it's just a outdated doc, but README [1] says that blocklist is
only applied to *FULL* not *BAT* runs:

"blacklist.txt

This file contains regular expressions (one per line) for tests that are
not to be executed in full suite test rounds."

[1]
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/intel-ci/README?ref_type=heads

> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel-ci/meson.build               |  1 +
>  tests/intel-ci/xe-sriov-vf.blocklist.txt | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 tests/intel-ci/xe-sriov-vf.blocklist.txt
> 
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index f16243cbb..59323eda9 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -11,6 +11,7 @@ intelci_files = [
>    'xe.blocklist.txt',
>    'xe-fast-feedback.testlist',
>    'xe-fast-feedback-chamelium-only.testlist',
> +  'xe-sriov-vf.blocklist.txt',
>  ]
>  
>  install_data(sources : intelci_files, install_dir : datadir)
> diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> new file mode 100644
> index 000000000..dae20bc6c
> --- /dev/null
> +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt

not a CI expert, but if there is:

	xe-fast-feedback.testlist

then maybe corresponding blocklist should be named:

	xe-fast-feedback.vf.blocklist

(and btw, I'm wondering why blocklists have .txt extension while
testlists correctly don't have it)



> @@ -0,0 +1,21 @@
> +##################################################################
> +# Block list for VF xe-fast-feedback runs
> +##################################################################
> +# The module is already loaded when VF is created
> +##################################################################
> +igt@xe_module_load

if tests are executed inside the VM then testing a module reload is
something that we want to have, no?

> +##################################################################
> +# Not applicable on VF
> +##################################################################
> +igt@fbdev

some devices don't have display (like ATSM) and likely don't have
dedicated .blocklist for them, so maybe it's fine that these tests will
SKIP (unless there will be separate BAT.display run introduced, where we
can also run kms tests)

> +igt@sriov_basic
> +igt@kms.*
> +igt@xe_gt_freq
> +igt@xe_live_ktest

only individual live-testcases might be N/A for VFs, but in general we
want to be able to execute live-tests on the VF

see [2] how this will be improved soon

[2] https://patchwork.freedesktop.org/patch/604990/?series=136163&rev=2

> +igt@xe_pm_residency
> +##################################################################
> +# Under investigation

what does it mean?
is it broken test or broken VF driver?
do we track those failures anywhere?

> +##################################################################
> +igt@xe_debugfs@gt
> +igt@xe_evict_ccs@evict-overcommit-simple
> +igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
