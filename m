Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A6710E118
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 11:17:01 +0000 (UTC)
Date: Thu, 9 Dec 2021 13:16:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbHlgCdBLqSkeWk/@platvala-desk.ger.corp.intel.com>
References: <20211207164331.306201-1-Rodrigo.Siqueira@amd.com>
 <20211207164331.306201-2-Rodrigo.Siqueira@amd.com>
 <9ebea7cb-714b-e61d-10db-f356c5e5df49@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ebea7cb-714b-e61d-10db-f356c5e5df49@amd.com>
Subject: Re: [igt-dev] [PATCH v4 1/2] lib/kms: Add DSC_SLICE_HEIGHT to CRTC
 property
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
Cc: igt-dev@lists.freedesktop.org, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 08:48:17PM -0500, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-12-07 11:43 a.m., Rodrigo Siqueira wrote:
> > This preparation work introduces a new CRTC property named
> > DSC_SLICE_HEIGHT, which will be required for amdgpu DSC tests.
> > 
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >   lib/igt_kms.c | 1 +
> >   lib/igt_kms.h | 1 +
> >   2 files changed, 2 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 34a2aa00..fdadb6d6 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -593,6 +593,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> >   	[IGT_CRTC_ACTIVE] = "ACTIVE",
> >   	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
> >   	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
> > +	[IGT_CRTC_DSC_SLICE_HEIGHT] = "DSC_SLICE_HEIGHT",
> >   };
> >   const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index e9ecd21e..5c7d7481 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
> >          IGT_CRTC_ACTIVE,
> >          IGT_CRTC_OUT_FENCE_PTR,
> >          IGT_CRTC_VRR_ENABLED,
> > +       IGT_CRTC_DSC_SLICE_HEIGHT,
> >          IGT_NUM_CRTC_PROPS
> >   };
> > 
> 
> Hi Petri,
> 
> I followed your advice to search for IGT_NUM_CRTC_PROPS, and only
> igt_kms.{h,c} and kms_atomic uses it.
> 
> In the lib/igt_kms.c, the occurrences of IGT_NUM_CRTC_PROPS appears in the
> function igt_fill_pipe_props() as a parameter, in its turn, it call
> drmModeObjectGetProperties and drmModeGetProperty. Finally, it only
> populates the prop array based on the returned value from the driver. I
> suppose we are safe here; I don't see how this patch could regress something
> in this function. The other places where this function appears are in the
> loop condition, but all of them look correct to me.

Yeah that looks correct, thanks.

> 
> Finally, the other place we can see it is in the kms_atomic, but again the
> for loop looks correct.
> 
> However, IGT CI failed:
> 
> https://patchwork.freedesktop.org/series/97470/#rev2
> 
> The potential new issue pointed by the CI is:
> 
>  Possible new issues
>  Here are the unknown changes that may have been introduced in
> IGTPW_6475_full:
> 
>  IGT changes
>  Possible regressions
>  igt@sysfs_heartbeat_interval@precise@vecs0:
>  shard-apl: PASS -> FAIL
> 
> And the log says:
> 
> Stack trace:
>   #0 ../lib/igt_core.c:1745 __igt_fail_assert()
>   #1 ../tests/i915/sysfs_heartbeat_interval.c:156 __test_timeout()
>   #2 [<unknown>+0xd0]
> Dynamic subtest vecs0: FAIL (1.713s)
> 
> After I resubmitted this patch, I also noticed that I got a different CI
> error from the one from the V1. The reported error looks a little bit
> inconsistent.
> 
> Petri, do you think this can be a false-positive, or am I missing something?
> Maybe re-trigger IGT.CI can help?

Looks like false positives to me and I believe Lakshmi already
addressed those for you.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
