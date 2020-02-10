Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334986EC34
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 13:24:01 +0000 (UTC)
Date: Mon, 10 Feb 2020 15:23:58 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200210132358.GK25209@platvala-desk.ger.corp.intel.com>
References: <20200210105653.20323-1-petri.latvala@intel.com>
 <158134068313.3100.7899120063608007393@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158134068313.3100.7899120063608007393@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_r?=
 =?utf-8?q?unner=3A_Print_an_error_message_if_resume_fails_to_load_data?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We seem to have a lot of these happen lately. Arek?



On Mon, Feb 10, 2020 at 01:18:03PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Print an error message if resume fails to load data
> URL   : https://patchwork.freedesktop.org/series/73235/
> State : warning
> 
> == Summary ==
> 
> Did not get list of undocumented tests for this run, something is wrong!
> 
> Other than that, pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/106751 for the overview.
> 
> test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1590973):
>     [test_root]           Directory that contains the IGT tests. The environment
>                           variable IGT_TEST_ROOT will be used if set, overriding
>                           this option if given.
>   Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdir2acmhN/test-list.txt
>   -------
>   
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>   FAILED: meson-test 
>   /usr/bin/meson test --no-rebuild --print-errorlogs
>   ninja: build stopped: subcommand failed.
>   section_end:1581339717:build_script
>   [0Ksection_start:1581339717:after_script
>   [0Ksection_end:1581339718:after_script
>   [0Ksection_start:1581339718:upload_artifacts_on_failure
>   [0K[32;1mUploading artifacts...[0;m
>   build: found 1345 matching files                  [0;m 
>   Uploading artifacts to coordinator... ok          [0;m  id[0;m=1590973 responseStatus[0;m=201 Created token[0;m=VmTfMsPk
>   section_end:1581339724:upload_artifacts_on_failure
>   [0K[31;1mERROR: Job failed: exit code 1
>   [0;m
> 
> test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1591013):
>     [test_root]           Directory that contains the IGT tests. The environment
>                           variable IGT_TEST_ROOT will be used if set, overriding
>                           this option if given.
>   Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirQjbzLm/test-list.txt
>   -------
>   
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>   FAILED: meson-test 
>   /usr/bin/meson test --no-rebuild --print-errorlogs
>   ninja: build stopped: subcommand failed.
>   section_end:1581340094:build_script
>   [0Ksection_start:1581340094:after_script
>   [0Ksection_end:1581340095:after_script
>   [0Ksection_start:1581340095:upload_artifacts_on_failure
>   [0K[32;1mUploading artifacts...[0;m
>   build: found 1345 matching files                  [0;m 
>   Uploading artifacts to coordinator... ok          [0;m  id[0;m=1591013 responseStatus[0;m=201 Created token[0;m=-hTZxs9n
>   section_end:1581340101:upload_artifacts_on_failure
>   [0K[31;1mERROR: Job failed: exit code 1
>   [0;m
> 
> test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1591053):
>     [test_root]           Directory that contains the IGT tests. The environment
>                           variable IGT_TEST_ROOT will be used if set, overriding
>                           this option if given.
>   Cannot open /builds/gfx-ci/igt-ci-tags/build/tmpdirEYIohy/test-list.txt
>   -------
>   
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>   FAILED: meson-test 
>   /usr/bin/meson test --no-rebuild --print-errorlogs
>   ninja: build stopped: subcommand failed.
>   section_end:1581340463:build_script
>   [0Ksection_start:1581340463:after_script
>   [0Ksection_end:1581340464:after_script
>   [0Ksection_start:1581340464:upload_artifacts_on_failure
>   [0K[32;1mUploading artifacts...[0;m
>   build: found 1345 matching files                  [0;m 
>   Uploading artifacts to coordinator... ok          [0;m  id[0;m=1591053 responseStatus[0;m=201 Created token[0;m=S7cHsjfj
>   section_end:1581340470:upload_artifacts_on_failure
>   [0K[31;1mERROR: Job failed: exit code 1
>   [0;m
> 
> == Logs ==
> 
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/106751
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
