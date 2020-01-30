Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <f12e30f0-a287-f821-4bc4-c7545e9821b6@linux.intel.com>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
 <158041727856.18112.4906224695590570854@skylake-alporthouse-com>
 <f12e30f0-a287-f821-4bc4-c7545e9821b6@linux.intel.com>
Message-ID: <158041903003.20421.14685928348321853302@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 21:17:10 +0000
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

Quoting Tvrtko Ursulin (2020-01-30 20:56:23)
> 
> On 30/01/2020 20:47, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-01-30 20:41:24)
> > Then I had a plan to add the pathological engines[] here.
> 
> Will see later what you exactly mean.

        for_each_gem_engine(ce, __context_engines_static(ctx), it) {
                struct intel_engine_cs *engine;

                if (intel_context_set_banned(ce))
                        continue;

                engine = active_engine(ce);

That's the bit I want to try and confuse.
So 1..64xrcs0, 1...64xVirtual and make sure it kills the right active
context.

I hope I had such nastiness in mind while writing, so hopefully there's
no hole here.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
