Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D359B10F5C4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 11:19:53 +0000 (UTC)
Date: Fri, 22 Apr 2022 14:19:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YmKPSR7hs7r9equ4@platvala-desk.ger.corp.intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
 <165028686531.11405.10073846949189988435@emeril.freedesktop.org>
 <YmJ29T3cMpyawmfh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmJ29T3cMpyawmfh@intel.com>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A___warning_for?=
 =?utf-8?q?_D3Cold_Tool_=26_IGT?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 05:35:49AM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 18, 2022 at 01:01:05PM -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: D3Cold Tool & IGT
> > URL   : https://patchwork.freedesktop.org/series/102780/
> > State : warning
> > 
> > == Summary ==
> > 
> > Pipeline status: FAILED.
> > 
> > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/562529 for the overview.
> > 
> > test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21360839):
> >   Ok:                   22
> >   Expected Fail:         3
> >   Fail:                289
> 
> This is awful, but I couldn't find any current library change in this series
> that would justify this amount of fail.

That's all spurious, the runner failed to exec the test binaries
correctly. Can be ignored.


-- 
Petri Latvala


> 
> I already glanced through all the patches in this series and will continue
> with the review in a hope that I find what is causing this.
> 
> I notice that igt_assert_f is used in patch 3, but not modified...
> 
> >   Unexpected Pass:       0
> >   Skipped:               0
> >   Timeout:               0
> >   
> >   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
> >   section_end:1650286681:step_script
> >   section_start:1650286681:upload_artifacts_on_failure
> >   Uploading artifacts for failed job
> >   Uploading artifacts...
> >   build: found 1728 matching files and directories   
> >   Uploading artifacts as "archive" to coordinator... 201 Created  id=21360839 responseStatus=201 Created token=iQxHfmmd
> >   section_end:1650286689:upload_artifacts_on_failure
> >   section_start:1650286689:cleanup_file_variables
> >   Cleaning up project directory and file based variables
> >   section_end:1650286690:cleanup_file_variables
> >   ERROR: Job failed: exit code 1
> > 
> > == Logs ==
> > 
> > For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/562529
