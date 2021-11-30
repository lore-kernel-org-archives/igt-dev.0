Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE056E81C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 15:42:40 +0000 (UTC)
Date: Tue, 30 Nov 2021 17:41:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YaZGOiLSNZ+XWu7d@platvala-desk.ger.corp.intel.com>
References: <20211126140911.1556205-1-Rodrigo.Siqueira@amd.com>
 <163793928750.11078.15559582292236440457@emeril.freedesktop.org>
 <1fc1d16e-4f89-f3f3-e279-7e42e83e448b@amd.com>
 <4e04b2e2c6e44718a1d7ec702626037c@intel.com>
 <YaXz1JqC6QXekQBZ@platvala-desk.ger.corp.intel.com>
 <34e4d1c9-02b5-6b44-de08-74c1661f7a6a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e4d1c9-02b5-6b44-de08-74c1661f7a6a@amd.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Introduces_DP_DSC_test?=
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lipski,
 Mikita" <mikita.lipski@amd.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 10:26:58AM -0500, Rodrigo Siqueira Jordao wrote:
> Hi Petri/Lakshmi,
> 
> Thanks a lot for your help with this issue.
> 
> Petri/Lakshmi, the only generic change that this patch made is in the `enum
> igt_atomic_crtc_properties` as described in the below diff:
> 
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_ACTIVE,
>         IGT_CRTC_OUT_FENCE_PTR,
>         IGT_CRTC_VRR_ENABLED,
> +       IGT_CRTC_DSC_SLICE_HEIGHT,
>         IGT_NUM_CRTC_PROPS
>  };
> 
> Please, correct me if I'm wrong, but from the CI report this patch might
> cause issues in the following subtests:
> 
> Possible regressions
> igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
> shard-iclb: PASS -> FAIL +803 similar issues
> igt@kms_plane@plane-panning-bottom-right:
> 
> shard-iclb: NOTRUN -> FAIL +159 similar issues
> igt@kms_prime@basic-crc@second-to-first:
> 
> shard-iclb: PASS -> CRASH +4 similar issues
> 
> (https://patchwork.freedesktop.org/series/97325/)
> 
> From the above list, the only test that I can try to reproduce on my end is
> igt@kms_plane@plane-panning-bottom-right which works fine with this patch or
> not. Additionally, it looks like that all failures in this shard-iclb
> machine has:
> 
> 	
> Received signal SIGSEGV.
> Stack trace:
>  #0 [fatal_sig_handler+0xd6]
>  #1 [killpg+0x40]
>  #2 [__nss_database_lookup+0x20792]
>  #3 [igt_display_require+0x62a]
>  #4 [__igt_unique____real_main1225+0xc1]
>  #5 [main+0x3f]
>  #6 [__libc_start_main+0xf3]
>  #7 [_start+0x2a]
> (https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6442/shard-iclb3/igt@kms_plane@plane-panning-bottom-right.html)
> 
> From the above error, I expected that I could reproduce this type of issue
> on my side. Additionally, when I looked at the shard-iclb machine
> ((https://intel-gfx-ci.01.org/hardware.html)), I noticed it is an Ice lake
> machine connected to a single eDP display (I suppose it is a laptop). If
> this patch introduces such a regression, I guess we have a bug in some of
> the igt_kms functions.
> 
> I don't have an Ice Lake machine for trying to reproduce this issue on my
> side; in this sense, do you have any suggestions? Is this error generic
> across Intel devices? Or only that specific machine? I think I can try to
> remove that property from igt_kms and make it only available inside the AMD
> test, but I'm not sure if this is the right approach.

The correct way is to add the property, and adjust all the other code
that uses the properties. The key word to look for is
IGT_NUM_CRTC_PROPS.

For example:

igt_kms.c:
const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS]

and inside igt_fill_pipe_props():

                        if (strcmp(prop->name, crtc_prop_names[j]) != 0)
			                                continue;


You add a prop enum, increasing IGT_NUM_CRTC_PROPS, but now there's an
uninitialized index in igt_crtc_prop_names.

Etc.


-- 
Petri Latvala
