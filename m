Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5336E5A4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Nov 2021 09:44:51 +0000 (UTC)
Date: Fri, 26 Nov 2021 11:43:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YaCsWC0qXKX/N/+T@platvala-desk.ger.corp.intel.com>
References: <20211119150024.2701531-1-Rodrigo.Siqueira@amd.com>
 <f6341eaa-9815-6d49-9e69-d355581e8585@amd.com>
 <aa4d94075c5f4b64b5d753323d745ed3@intel.com>
 <YZ83BCgRaTvnLX/j@platvala-desk.ger.corp.intel.com>
 <ab60b3f8-4739-9a59-ea52-4d5070908915@amd.com>
 <2f6c8166-1303-cb6d-ba6a-033a5861086b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f6c8166-1303-cb6d-ba6a-033a5861086b@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add test for AMD DP DSC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc: Eryk Brol <eryk.brol@amd.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Mikita Lipski <mikita.lipski@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 01:58:14PM -0500, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-11-25 10:57 a.m., Rodrigo Siqueira Jordao wrote:
> > 
> > 
> > On 2021-11-25 2:11 a.m., Petri Latvala wrote:
> > > On Thu, Nov 25, 2021 at 01:01:04AM +0200, Vudum, Lakshminarayana wrote:
> > > > @Rodrigo Siqueira I don't have the possibility to re-run the
> > > > series. @Latvala, Petri Can you help here?
> > > > 
> > > > Lakshmi.
> > > 
> > > Unfortunately patchwork got confused by your emails and thinks you've
> > > sent a patch, so the re-run button just reattempts the incorrect
> > > patch.
> > > 
> > > Rodrigo, please re-send this patch.
> > > 
> > 
> > 
> > Hi Petri/Lakshmi,
> > 
> > Thanks a lot for your help.
> > 
> > I submitted a V2:
> > https://patchwork.freedesktop.org/series/97108/
> > 
> > Thanks.
> 
> Lakshmi/Petri,
> 
> For some reason, it looks like that the new version is still assigned to
> Lakshmi in the patchwork

Is the patch data itself correct?

> , and it has some weird failures (see below). Any
> idea? Do I need to resubmit the patch with a different subject?
> 
> Thanks
> 
> Gitlab.Pipeline:
> 
> Pipeline status: FAILED.
> 
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/453561 for
> the overview.
> 
> containers:igt has failed
> (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/16168063):
>   STEP 2: COPY installdir/opt/igt /opt/igt
>   1895d20f5469210af8281acac7769fa51efbde5ca3931bd457af2c2834e1f7ee
>   STEP 3: COPY .gitlab-ci/docker-help.sh /usr/local/bin/docker-help.sh
>   b743d155d30d20100edf9b2df89664275b2ea33d402f9df69cf5a1824a781b01
>   STEP 4: ENV PATH="/opt/igt/bin:${PATH}"
>   5eb0330fdfca164d1ef769d62f1d3c1a539a09a81da3ca01273c4e7afe2ee974
>   STEP 5: ENV
> LD_LIBRARY_PATH="/opt/igt/lib:/opt/igt/lib64:${LD_LIBRARY_PATH}"
>   b4ea9d4538270ad267ff798de51f4b7bed3e1ae27f9d3df8cea163e78acc9d3e
>   STEP 6: ENV IGT_TEST_ROOT="/opt/igt/libexec/igt-gpu-tools"
>   ae060122c9eeab50d82bbafa097e8cd72bccdc8e8cb00b42de1b38531854d099
>   STEP 7: CMD docker-help.sh
>   STEP 8: COMMIT registry.freedesktop.org/gfx-ci/igt-ci-tags/igt:commit-dcfa579ba0a38131881dfd441d558b54d4cd3183
>   fcc29304314f515e7c8612f480ef56419de32ac5b5917000b434768cf94b6793
>   Getting image source signatures
>   Copying blob
> sha256:508381dd82aeb851da958db0528f2893285a9392bd0787020d3569a61fcdd513
>   Copying blob
> sha256:3504a8337d3b7eaabfd338d6a971d02441d28ebef8bd81f730d87f936ed58079
>   Copying blob
> sha256:f3f4119da36f8525b923a310c4b1f15579ca311a753c9973ef966cdb2a71a4e8
>   section_end:1637863318:step_script
>   ERROR: Job failed: execution took longer than 1h0m0s seconds

You can ignore this error. gitlab had issues talking to its docker
registry.


-- 
Petri Latvala




> 
> CI.BAT
> 
> IGT changes
> Possible regressions
> igt@kms_addfb_basic@addfb25-bad-modifier:
> 
> fi-rkl-11600: PASS -> FAIL +36 similar issues
> igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
> fi-rkl-guc: PASS -> FAIL +36 similar issues
> igt@kms_addfb_basic@bo-too-small:
> 
> fi-tgl-1115g4: PASS -> FAIL +37 similar issues
> igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
> fi-icl-u2: PASS -> FAIL +46 similar issues
> igt@kms_busy@basic:
> 
> fi-icl-u2: NOTRUN -> FAIL
> igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a:
> 
> fi-tgl-u2: NOTRUN -> FAIL +53 similar issues
> igt@prime_vgem@basic-fence-flip:
> 
> fi-icl-u2: PASS -> CRASH +2 similar issues
> 
> fi-tgl-u2: NOTRUN -> CRASH
> 
> fi-rkl-11600: PASS -> CRASH
> 
> fi-rkl-guc: PASS -> CRASH
> 
> fi-tgl-1115g4: PASS -> CRASH
> 
