Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA2511316F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 15:36:45 +0000 (UTC)
Date: Tue, 17 May 2022 18:34:13 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YoPAdZzMPdEY434C@platvala-desk.ger.corp.intel.com>
References: <20220516150824.3535-1-jeevan.b@intel.com>
 <165279998496.31031.12765250259822717647@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165279998496.31031.12765250259822717647@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/intel=5Fbatchbuffer=3A__Fix_typo_from_src=5Ftiling_to_dst=5F?=
 =?utf-8?q?tiling_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 17, 2022 at 03:06:24PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/intel_batchbuffer: Fix typo from src_tiling to dst_tiling (rev2)
> URL   : https://patchwork.freedesktop.org/series/104031/
> State : warning
> 
> == Summary ==
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/588687 for the overview.
> 
> test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/22801045):
>   Ok:                   22
>   Expected Fail:         3
>   Fail:                289
>   Unexpected Pass:       0
>   Skipped:               0
>   Timeout:               0
>   
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>   section_end:1652799924:step_script
>   section_start:1652799924:upload_artifacts_on_failure
>   Uploading artifacts for failed job
>   Uploading artifacts...
>   build: found 1725 matching files and directories   
>   Uploading artifacts as "archive" to coordinator... 201 Created  id=22801045 responseStatus=201 Created token=1sGsWREb
>   section_end:1652799936:upload_artifacts_on_failure
>   section_start:1652799936:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1652799937:cleanup_file_variables
>   ERROR: Job failed: exit code 1


I was asked offline about this:

Feel free to ignore this. Mips occasionally showing same issues as the
arm runs earlier: Executing the tests doesn't wrap it in qemu properly
and testing the command line handling fails with "wrong arch".


-- 
Petri Latvala
