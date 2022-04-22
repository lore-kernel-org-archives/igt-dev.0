Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A07510E0FE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 11:38:44 +0000 (UTC)
Date: Fri, 22 Apr 2022 14:38:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <YmKTxenDlaT4VeXF@platvala-desk.ger.corp.intel.com>
References: <20220421172858.263-1-quic_jesszhan@quicinc.com>
 <165057519298.10764.6605100681028658462@emeril.freedesktop.org>
 <cc310ef6-96b8-9002-e592-5811ef3bf56a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc310ef6-96b8-9002-e592-5811ef3bf56a@quicinc.com>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?eson=3A_Move_MSM-specific_tests_to_their_own_subdirectory_=28re?=
 =?utf-8?b?djUp?=
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

On Thu, Apr 21, 2022 at 03:40:39PM -0700, Jessica Zhang wrote:
> Hey Lakshmi,
> 
> I've looked over this failure, but it doesn't seem to be related to my
> change.
> 
> Can you help take a look?

It's a spurious error that happens more and more often now... I just
sent a patch to disable ninja-test-arm* temporarily to avoid this,
until it's properly fixed.


-- 
Petri Latvala


> 
> Thanks,
> 
> Jessica Zhang
> 
> On 4/21/2022 2:06 PM, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: meson: Move MSM-specific tests to their own subdirectory (rev5)
> > URL   : https://patchwork.freedesktop.org/series/102844/
> > State : warning
> > 
> > == Summary ==
> > 
> > Pipeline status: FAILED.
> > 
> > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566172 for the overview.
> > 
> > test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/21593547):
> >    Ok:                   22
> >    Expected Fail:         3
> >    Fail:                289
> >    Unexpected Pass:       0
> >    Skipped:               0
> >    Timeout:               0
> >    Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
> >    section_end:1650574984:step_script
> >    section_start:1650574984:upload_artifacts_on_failure
> >    Uploading artifacts for failed job
> >    Uploading artifacts...
> >    build: found 1725 matching files and directories
> >    Uploading artifacts as "archive" to coordinator... 201 Created  id=21593547 responseStatus=201 Created token=PeHyNtwf
> >    section_end:1650574997:upload_artifacts_on_failure
> >    section_start:1650574997:cleanup_file_variables
> >    Cleaning up project directory and file based variables
> >    section_end:1650574998:cleanup_file_variables
> >    ERROR: Job failed: exit code 1
> > 
> > == Logs ==
> > 
> > For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/566172
