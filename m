Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d295e6e3-7022-de90-ae9e-36ac2baeb750@linux.intel.com>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
 <d295e6e3-7022-de90-ae9e-36ac2baeb750@linux.intel.com>
Message-ID: <158041743824.18112.16945030008587210959@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 20:50:38 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t]
 tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-30 20:44:57)
> 
> On 30/01/2020 20:41, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >   
> > -     igt_subtest("smoketest")
> > -             smoketest(i915);
> 
> I also moved this one to before the default context is configured with 
> engine map, since it uses legacy for_each_physical_engine, and is 
> therefore confused as to engine selection.
> 
> But perhaps better would be to leave it last and convert to 
> __for_each_physical_engine. In the spirit of a smoke test is to exercise 
> all engines after all.

Earlier was fine by me. It did make a bit of sense to get the smoketest
running earlier, but later is also fine.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
