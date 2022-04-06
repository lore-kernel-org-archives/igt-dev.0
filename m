Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9752410F47A
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 07:26:24 +0000 (UTC)
Date: Wed, 6 Apr 2022 10:26:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Melissa Wen <mwen@igalia.com>
Message-ID: <Yk1AkdwNMjku+jq5@platvala-desk.ger.corp.intel.com>
References: <20220331145344.2503592-1-mwen@igalia.com>
 <164874782770.14474.9535419622516592112@emeril.freedesktop.org>
 <20220405205656.qyrwslu6c7tx5sej@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405205656.qyrwslu6c7tx5sej@mail.igalia.com>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fplane=5Falpha=5Fblend=3A_refactor_alpha-7efc_for_cle?=
 =?utf-8?q?arer_validation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 05, 2022 at 07:56:56PM -0100, Melissa Wen wrote:
> On 03/31, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer validation
> > URL   : https://patchwork.freedesktop.org/series/102026/
> > State : warning
> > 
> > == Summary ==
> > 
> > Pipeline status: FAILED.
> > 
> > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547045 for the overview.
> > 
> > test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20569675):
> >   Ok:                   22
> >   Expected Fail:         3
> >   Fail:                287
> >   Unexpected Pass:       0
> >   Skipped:               0
> >   Timeout:               0
> Hi,
> 
> Can these failures be false positives too? Basically all tests fail
> after the expected fails.

Yes, you can ignore this. The arm64 (and sometimes armhf) pipeline is
not feeling well.



-- 
Petri Latvala


> 
> Thanks,
> >   
> >   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
> >   section_end:1648747524:step_script
> >   section_start:1648747524:upload_artifacts_on_failure
> >   Uploading artifacts for failed job
> >   Uploading artifacts...
> >   build: found 1713 matching files and directories   
> >   Uploading artifacts as "archive" to coordinator... 201 Created  id=20569675 responseStatus=201 Created token=ZkXD-TSJ
> >   section_end:1648747535:upload_artifacts_on_failure
> >   section_start:1648747535:cleanup_file_variables
> >   Cleaning up project directory and file based variables
> >   section_end:1648747536:cleanup_file_variables
> >   ERROR: Job failed: exit code 1
> >   
> > 
> > test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/20569676):
> >   Ok:                   22
> >   Expected Fail:         3
> >   Fail:                287
> >   Unexpected Pass:       0
> >   Skipped:               0
> >   Timeout:               0
> >   
> >   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
> >   section_end:1648747524:step_script
> >   section_start:1648747524:upload_artifacts_on_failure
> >   Uploading artifacts for failed job
> >   Uploading artifacts...
> >   build: found 1713 matching files and directories   
> >   Uploading artifacts as "archive" to coordinator... 201 Created  id=20569676 responseStatus=201 Created token=GWysfov2
> >   section_end:1648747535:upload_artifacts_on_failure
> >   section_start:1648747535:cleanup_file_variables
> >   Cleaning up project directory and file based variables
> >   section_end:1648747535:cleanup_file_variables
> >   ERROR: Job failed: exit code 1
> > 
> > == Logs ==
> > 
> > For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547045

