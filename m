Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210511165117.428062-1-matthew.auld@intel.com>
 <CAM0jSHO6RD=w2TDAxRsr9=Hqabj=U4kya_bwEcC_MKw0t+hncA@mail.gmail.com>
 <YKTRVpuWOT/gsHdh@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YKTRVpuWOT/gsHdh@platvala-desk.ger.corp.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 19 May 2021 11:45:17 +0100
Message-ID: <CAM0jSHPN3TSkum54F6sHYaGHCpdEvu27j1zaVPx5_mWzg=UeRQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 00/12] DG1/LMEM uAPI basics
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 19 May 2021 at 09:49, Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, May 19, 2021 at 09:13:37AM +0100, Matthew Auld wrote:
> > On Tue, 11 May 2021 at 17:52, Matthew Auld <matthew.auld@intel.com> wrote:
> > >
> > > Just the really basic stuff, which unlocks adding more interesting testcases
> > > later, like gem_lmem_swapping.
> > >
> > > On the kernel side we landed the uAPI bits[1] behind CONFIG_BROKEN, which is
> > > already enabled in CI builds, so it should be possible to get some more BAT
> > > testing(outside of just the selftests) on DG1 to the point where we can start to
> > > exercise the LMEM paths with the new bits of uAPI.
> > >
> > > [1] https://patchwork.freedesktop.org/series/89648/
> >
> > Petri, any thoughts on this series? As an initial step we just need
> > some way to start exercising the new bits of uAPI, and from that we
> > can add more interesting test cases.
>
> This series is in a confused state. First there's the addition of
> local definitions and ioctl tokens, then they are replaced with the
> proper stuff...

Yeah, I think that's how it is internally. Maybe the idea with that
was to somehow land the igt changes first, before the kernel stuff
potentially landed? I can clean this up and just start with the proper
stuff.

>
> When this was starting to get developed the idea was to avoid icky
> cases that break _testing_. Not tests, testing. Remember when engine
> discovery was being developed and we had cases where for_each_engine
> loop didn't progress, causing stuff like
>
> for_each_engine(...)
>  igt_subtest(...)
>
> to never enter a subtest?
>
> Pushing for stubbing memory regions ultimately wanted to avoid cases
> where for_each_combination(memregions) breaks test enumeration.
>
> It all boils down to: Can that break? Can we have cases where the
> query gives garbage? Can it give two million smem regions? Can it give
> 0 regions, or -1 regions? And what happens then?

On integrated platforms it can only return one region: smem. If we
somehow don't have a smem region then the i915 module load would have
failed, since we must have been unable to populate the
i915->mm.regions. On DG1 we just get the extra lmem region, and for Xe
HP multi-tile we get a few more lmem regions, but again if we can't
populate the i915->mm.regions with the required regions then we fail
driver init. The only "optional" region is stolen memory, but for that
we don't expose it to userspace.

The query will fail on !CONFIG_BROKEN kernels though, where it just
returns -ENODEV, or of course some other error if the user provided an
invalid query.

>
> Is it just gem_create_ext that's hiding behind CONFIG_BROKEN or also
> the querying?

It's the region query, and specifically the placements extension in
gem_create_ext, since there is also pxp coming soon and for that we
don't need CONFIG_BROKEN.

>
>
> --
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
