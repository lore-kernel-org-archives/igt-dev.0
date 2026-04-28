Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC17FF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 13:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475E810EC21;
	Tue, 28 Apr 2026 13:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS///NbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E12510EC21
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777383643; x=1808919643;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A/A+ggvu3FMU+GMFQ/Z/ych5K97iG9s46hUo4jULvSw=;
 b=WS///NbWPMV1VSEk47hDlrKGk9RMNkQJ8jNxKbNVylA9Y3PTOo4Xekox
 Ul0SAq/PUCjC7BK/LHCX1spm5F9ai2LM+0KV/bGdH1FJkqMJLt673U9Sc
 HaOl+smaaiP5iFoPjaVPAdgEnwyZPLOwM9OiqTgYm3dzT4s7LlbBQEsFp
 IkH5D7GhklZdBOpBdY+GMBPB4FJjubwwjtY076KbTiQjfgN2VDnGD4a0n
 PlhRGkCo2LpQPvAb7Qn9IC029UtD1auuwgtdyYKo+1BqVcWNuZXWnoHge
 S3xq7GMhgdD2atQ41D40CL0/CZqkI0CfhGXE1RVYqD7KDlT9RTkHDubyi g==;
X-CSE-ConnectionGUID: SxrQK6R1TtKd8Duk78c04w==
X-CSE-MsgGUID: Kugl7R+nRu+h0xmbozG0wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78403366"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78403366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 06:40:42 -0700
X-CSE-ConnectionGUID: rTSXJyucTyOW/o7wmBunpg==
X-CSE-MsgGUID: dNyM+JoGRe2x47/HnRl5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238935087"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 06:40:41 -0700
Message-ID: <231027ad-d1a6-4e9b-924d-5cd30a3391cb@linux.intel.com>
Date: Tue, 28 Apr 2026 15:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
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


On 4/28/2026 10:22 AM, Adam Miszczak wrote:
> Enable basic VM tests as BATs:
> - create and provision VFs, assign to VMs and probe guest driver
> - execute simple IGT workloads on booted VMs
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   .../vmtb/vmm_flows/intel-ci/fast-feedback.testlist | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
>
> diff --git a/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
> new file mode 100644
> index 000000000..37c4dea3a
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
> @@ -0,0 +1,14 @@
> +#####################################################
> +#
> +# VMM Flows fast-feedback test list:
> +# defines tests to be executed pre-/post-merge BATs.
> +#
> +# This is allow list, needs to be extended if new
> +# tests need to be added to scope.
> +#
> +#####################################################
> +######################
> +# Basic VF/VM create
> +######################
> +test_basic.py::TestVmSetup
> +test_basic.py::TestVmWorkload

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

