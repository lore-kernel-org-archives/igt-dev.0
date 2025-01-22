Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C700AC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 08:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5588B10E68A;
	Wed, 22 Jan 2025 08:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Isvy/cyK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E0410E199;
 Wed, 22 Jan 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737534159; x=1769070159;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ODTuhpHzpirxMQRMmyLJzYvF5CPnlm57xz878L83S8Y=;
 b=Isvy/cyKZBCPAzG86IGNC2YN9UouuefnpF3BYKKkrT0fD6LxM7DCackx
 6bt6Rt2eTIKSqvDMV4HK04xXGhHEg9CwNa/TUHYzMBvEw5vtwA9IoaUal
 83uPYy2yVZMaD01lDcRzOYHdjgg30koEvDLxQpGdXDtg1laeSdpgpipIF
 ons/OT6m1yoY/6AFWGvMqhzhTjhw/zDQdRiR9n3+tfoOpYRhV4/r8MQF1
 qMUchrObDIQLddAoPSqV79EnYgBfj8gRrfC1/VC+fkOFUjg0aOeEH2ffD
 mcLZirITpZ/nrfHzsL6w2OapO9MBVc06KOl6dQNJ7cHJLX+ReJGXPOLB2 g==;
X-CSE-ConnectionGUID: cGZ1GT2iT6yIyL2W2xP5Dg==
X-CSE-MsgGUID: H3yQhmASR9Cjh77Naqaeqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48968590"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="48968590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:22:39 -0800
X-CSE-ConnectionGUID: /Lt9MWYrSOSWwA+4UkBdmw==
X-CSE-MsgGUID: MgHEZ6yKTV2SIPio+zy4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="107593714"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:22:37 -0800
Message-ID: <c9040883-6aec-438c-9725-dfd6c4de69fb@linux.intel.com>
Date: Wed, 22 Jan 2025 09:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Integrat?=
 =?UTF-8?Q?_kmemleak_scans_in_igt=5Frunner?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <173746202588.2580601.867186536034401178@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173746202588.2580601.867186536034401178@b555e5b46a47>
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

Dear i915,



On 21.01.2025 13:20, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrat kmemleak scans in igt_runner
> URL   : https://patchwork.freedesktop.org/series/143791/
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1349443 for the overview.
> 
> build-containers:build-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/69686593):
>   section_start:1737461819:get_sources
>   Getting source from Git repository
>   $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
>   Checking if the user of the pipeline is allowed...
>   Checking if the job's project is part of a well-known group...
>   Thank you for contributing to freedesktop.org
>   Fetching changes...
>   Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
>   Checking out a9e69f72 as detached HEAD (ref is intel/IGTPW_12473)...
>   
>   Skipping Git submodules setup
>   section_end:1737461830:get_sources
>   section_start:1737461830:step_script
>   Executing "step_script" stage of the job script
>   Using docker image sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176 for registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0 with digest registry.freedesktop.org/wayland/ci-templates/buildah@sha256:7dbcf22cd2c1c7d49db0dc7b4ab207c3d6a4a09bd81cc3b71a688d3727d8749f ...
>   section_end:1737461834:step_script
>   section_start:1737461834:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1737461835:cleanup_file_variables
>   ERROR: Job failed (system failure): Error response from daemon: no such image: docker.io/library/sha256:594aa868d31ee3304dee8cae8a3433c89a6fcfcf6c7d420c04cce22f60147176: image not known (docker.go:650:0s)
> 
> == Logs ==
> 
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1349443

The error is unrelated to my change. Can you please re-run?
