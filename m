Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60934C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 14:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EDB10EB64;
	Fri, 24 May 2024 14:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0RmSqiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9310EB64
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716562587; x=1748098587;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Wspj+jsHDGVOY2eBdsTjelk9Rz2X6n6Eg4rpx3dTkmg=;
 b=L0RmSqiWM0D1/EU9ITKi9w0swvHu1aW6Zx+vPhVCbDQrMZU1xbXr8V5B
 MyDtiBm4V7nohMWXi3sBvZLwFACohmtpTsvgo8bVMtNSNlD+Hj7v4smSx
 tBv6Lu3fiSHko4/tW6G25dj30ErOQnh11K2idgGZ2/y2Q6MCKBHn1y1jH
 mBxdTW01OkLHe0NQ9LO3BDIfj66e85nIgPNhqPFZG0zh9pyIW75/jkdfx
 FoMGjFdlyzeSk/+ejsyDz7yVhDV2em+JhEwa5mSdkEaN8kTFmBqlo7sSR
 Zh+d3V3UV3MQOn//7lVjsu4a5kwVRVgLfGwGraOFyfmJPKdP2mD3VxUtJ Q==;
X-CSE-ConnectionGUID: Ey8iRTh2QiCqik7BcPVgKw==
X-CSE-MsgGUID: Zp0B6POiS12SXGELpIvwJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24349740"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="24349740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:56:26 -0700
X-CSE-ConnectionGUID: uzKD3bv3Slahgl396epKEQ==
X-CSE-MsgGUID: sBeH+WirQF+OtGXvUoJ2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="64850665"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:56:26 -0700
Message-ID: <cb9f09c7-f25f-4221-a737-9c63bc1eaec5@intel.com>
Date: Fri, 24 May 2024 16:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_lib/gpgp?=
 =?UTF-8?Q?u=3A_add_shader_support_=28rev4=29?=
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
 <171656189439.2171858.17056506587711617977@8e613ede5ea5>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171656189439.2171858.17056506587711617977@8e613ede5ea5>
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



On 24.05.2024 16:44, Patchwork wrote:
> == Series Details ==
>
> Series: lib/gpgpu: add shader support (rev4)
> URL   : https://patchwork.freedesktop.org/series/133020/
> State : warning
>
> == Summary ==
>
> Pipeline status: FAILED.
>
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185231 for the overview.
>
> build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59116642):
>    Running with gitlab-runner 16.3.0 (8ec04662)
>      on fdo-equinix-m3l-27 EfLUxtkS, system ID: s_53a5e12e8cde
>    section_start:1716561526:prepare_executor
>    Preparing the "docker" executor
>    Using Docker executor with image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef ...
>    Authenticating with credentials from job payload (GitLab Registry)
>    Pulling docker image registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef ...
>    WARNING: Failed to pull image with policy "if-not-present": Error response from daemon: Get "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/manifests/sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f": read tcp [2604:1380:45f2:6900::19]:46846->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)
>    section_end:1716561527:prepare_executor
>    ERROR: Job failed: failed to pull image "registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64:commit-d8adf28de02fc33d435750c8cf3b5eb3c3bcdcef" with specified policies [if-not-present]: Error response from daemon: Get "https://registry.freedesktop.org/v2/gfx-ci/igt-ci-tags/build-debian-arm64/manifests/sha256:df8438cd0e218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f": read tcp [2604:1380:45f2:6900::19]:46846->[2604:1380:45f2:6901::2]:443: read: connection reset by peer (manager.go:237:0s)
>    
>
> build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59116636):
>    Installing collected packages: meson
>      Running setup.py install for meson: started
>        Running setup.py install for meson: finished with status 'done'
>    Successfully installed meson-0.47.2
>    $ meson $MESON_OPTIONS build
>    The Meson build system
>    Version: 0.47.2
>    Source dir: /builds/gfx-ci/igt-ci-tags
>    Build dir: /builds/gfx-ci/igt-ci-tags/build
>    Build type: native build
>    
>    meson.build:1:0: ERROR:  Meson version is 0.47.2 but project requires >=0.49.2.

OK, this is build system pre-historic requirement(?), I guess it should 
be safe to bump-up to 0.49.2?
CC: Kamil

Regards
Andrzej

>    
>    A full log can be found at /builds/gfx-ci/igt-ci-tags/build/meson-logs/meson-log.txt
>    section_end:1716561567:step_script
>    section_start:1716561567:cleanup_file_variables
>    Cleaning up project directory and file based variables
>    section_end:1716561568:cleanup_file_variables
>    ERROR: Job failed: exit code 1
>
> == Logs ==
>
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1185231

