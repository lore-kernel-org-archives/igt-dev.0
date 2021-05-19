Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 19 May 2021 11:50:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKTRVpuWOT/gsHdh@platvala-desk.ger.corp.intel.com>
References: <20210511165117.428062-1-matthew.auld@intel.com>
 <CAM0jSHO6RD=w2TDAxRsr9=Hqabj=U4kya_bwEcC_MKw0t+hncA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM0jSHO6RD=w2TDAxRsr9=Hqabj=U4kya_bwEcC_MKw0t+hncA@mail.gmail.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 00/12] DG1/LMEM uAPI basics
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 19, 2021 at 09:13:37AM +0100, Matthew Auld wrote:
> On Tue, 11 May 2021 at 17:52, Matthew Auld <matthew.auld@intel.com> wrote:
> >
> > Just the really basic stuff, which unlocks adding more interesting testcases
> > later, like gem_lmem_swapping.
> >
> > On the kernel side we landed the uAPI bits[1] behind CONFIG_BROKEN, which is
> > already enabled in CI builds, so it should be possible to get some more BAT
> > testing(outside of just the selftests) on DG1 to the point where we can start to
> > exercise the LMEM paths with the new bits of uAPI.
> >
> > [1] https://patchwork.freedesktop.org/series/89648/
> 
> Petri, any thoughts on this series? As an initial step we just need
> some way to start exercising the new bits of uAPI, and from that we
> can add more interesting test cases.

This series is in a confused state. First there's the addition of
local definitions and ioctl tokens, then they are replaced with the
proper stuff...

When this was starting to get developed the idea was to avoid icky
cases that break _testing_. Not tests, testing. Remember when engine
discovery was being developed and we had cases where for_each_engine
loop didn't progress, causing stuff like

for_each_engine(...)
 igt_subtest(...)

to never enter a subtest?

Pushing for stubbing memory regions ultimately wanted to avoid cases
where for_each_combination(memregions) breaks test enumeration.

It all boils down to: Can that break? Can we have cases where the
query gives garbage? Can it give two million smem regions? Can it give
0 regions, or -1 regions? And what happens then?

Is it just gem_create_ext that's hiding behind CONFIG_BROKEN or also
the querying?


-- 
Petri Latvala
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
