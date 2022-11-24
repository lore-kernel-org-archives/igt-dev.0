Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EB910E274
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 12:30:45 +0000 (UTC)
Date: Thu, 24 Nov 2022 13:30:40 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221124123040.5epznja37a7rzkus@zkempczy-mobl2>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
 <Y39JxFxaRNdJXnNs@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y39JxFxaRNdJXnNs@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] Remove libdrm remnants in i915 code
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

On Thu, Nov 24, 2022 at 11:39:00AM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-11-22 at 15:00:03 +0100, Zbigniew Kempczyński wrote:
> > I want finally remove all libdrm stuff, to get this I had to:
> > 
> > 1. remove prime_udl tests - it is not used in CI due to lack of 
> >    DisplayLink hardware,
> > 2. remove prime_nv_* tests - similar, there's no compatible hw
> >    I can rewrite the test and it is not exercised by CI so lets
> >    get rid of it. If someone is complaining we can back to it
> >    in the future or is welcome to rewrite it.
> 
> imho it will be good to send these two removals in separate
> patchset so it will be more visibile to anyone interested.

I think it should be part of this series. prime_udl/prime_nv_* depends
on libdrm (intel_batchbuffer part) so natural is to remove all client
code which uses libdrm then remove library helpers. Especially if someone
will complain and I will have to revert - I need to revert all 4 commits.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> > 3. rewrite intel_upload_blit_* benchmarks - I tried to mimic 
> >    behavior as much as possible but there'e some minor differences
> >    in execution time. I think it is related to libdrm internals
> >    (how it caches handles/mappings). I'm not sure but it shouldn't
> >    much affect what benchmark is exercising.
> > 4. remove all intel_batchbuffer_* code
> > 
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > 
> > Zbigniew Kempczyński (4):
> >   tests/prime_udl: Remove prime_udl test
> >   tests/prime_nv_*: Remove prime_nv_* tests
> >   benchmarks/intel_upload_blit_*: Remove libdrm in upload blits
> >   lib/intel_batchbuffer: Get rid of libdrm batchbuffer
> > 
> >  benchmarks/intel_upload_blit_large.c     | 131 ++--
> >  benchmarks/intel_upload_blit_large_gtt.c | 130 ++--
> >  benchmarks/intel_upload_blit_large_map.c | 132 ++--
> >  benchmarks/intel_upload_blit_small.c     | 139 ++--
> >  lib/intel_batchbuffer.c                  | 574 +-------------
> >  lib/intel_batchbuffer.h                  | 248 -------
> >  tests/meson.build                        |   4 -
> >  tests/prime_nv_api.c                     | 410 ----------
> >  tests/prime_nv_pcopy.c                   | 905 -----------------------
> >  tests/prime_nv_test.c                    | 399 ----------
> >  tests/prime_udl.c                        | 160 ----
> >  11 files changed, 313 insertions(+), 2919 deletions(-)
> >  delete mode 100644 tests/prime_nv_api.c
> >  delete mode 100644 tests/prime_nv_pcopy.c
> >  delete mode 100644 tests/prime_nv_test.c
> >  delete mode 100644 tests/prime_udl.c
> > 
> > -- 
> > 2.34.1
> > 
