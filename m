Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6D910E269
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Nov 2022 12:27:58 +0000 (UTC)
Date: Thu, 24 Nov 2022 13:27:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221124122755.bh5dgodm5ac7lxep@zkempczy-mobl2>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
 <Y39LeybxY76ItY3c@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y39LeybxY76ItY3c@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] Remove libdrm remnants in i915 code
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

On Thu, Nov 24, 2022 at 12:46:19PM +0200, Petri Latvala wrote:
> On Tue, Nov 22, 2022 at 03:00:03PM +0100, Zbigniew Kempczyński wrote:
> > I want finally remove all libdrm stuff, to get this I had to:
> > 
> > 1. remove prime_udl tests - it is not used in CI due to lack of 
> >    DisplayLink hardware,
> > 2. remove prime_nv_* tests - similar, there's no compatible hw
> >    I can rewrite the test and it is not exercised by CI so lets
> >    get rid of it. If someone is complaining we can back to it
> >    in the future or is welcome to rewrite it.
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
> 
> Old unused tests with old structuring of writing tests, e.g. not really
> using the multidevice selection mechanisms and whatnot.
> 
> If someone needs them back, please rewrite them.

Ok, will do. But at the moment I'm going to remove above.

> 
> For the series:
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> Although I have to say I'm also not sure whether the benchmark changes
> are 100% equivalent or even correct...

Me either, but according to what libdrm is doing (caching mapping/objects
are not really freed) I'm not sure about intention of author. Especially
that some operations are just bypassed (cached, like for mappings).

If someone will complain about I above (benchmarks) I will fix it later. 

--
Zbigniew

> 
> 
> -- 
> Petri Latvala
