Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 7 Jan 2021 12:06:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210107100651.GN7444@platvala-desk.ger.corp.intel.com>
References: <20201204195007.10215-1-janusz.krzysztofik@linux.intel.com>
 <160992609788.26089.16341465923272154441@build.alporthouse.com>
 <20210107094002.GL7444@platvala-desk.ger.corp.intel.com>
 <161001296371.839.15704890818022752458@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161001296371.839.15704890818022752458@build.alporthouse.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v2] runner: Don't kill a
 test on taint if watching timeouts
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 09:49:23AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2021-01-07 09:40:02)
> > On Wed, Jan 06, 2021 at 09:41:37AM +0000, Chris Wilson wrote:
> > > Quoting Janusz Krzysztofik (2020-12-04 19:50:07)
> > > > We may still be interested in results of a test even if it has tainted
> > > > the kernel.  On the other hand, we need to kill the test on taint if no
> > > > other means of killing it on a jam is active.
> > > > 
> > > > If abort on both kernel taint or a timeout is requested, decrease all
> > > > potential timeouts significantly while the taint is detected instead of
> > > > aborting immediately.  However, report the taint as the reason of the
> > > > abort if a timeout decreased by the taint expires.
> > > 
> > > This has the nasty side effect of not stopping the test run after a
> > > kernel taint. Instead the next test inherits the tainted condition from
> > > the previous test and usually ends up being declared incomplete.
> > > 
> > > False positives are frustrating.
> > > -Chris
> > 
> > 
> > Do you have a link to a test run where this happened? This patch
> > didn't change the between-tests abort checks.
> 
> The taint is from the warnings in the penultimate test:
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9550/shard-skl7/igt_runner20.txt

Ah, I see.

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9550/shard-skl7/dmesg20.txt

This is the tainting WARN I presume:

<4>[  917.575173] Memory manager not clean during takedown.
<4>[  917.575272] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x51/0x100

That happens after @gem, before @evict.

In other words, this is all in the same exec() of i915_selftest
--run-subtest live. Incorrect _dynamic_ subtest gets blamed.

Getting the killing right here is a bit tricky, possibly doable. Or
rather, getting the blame right is doable, killing will be inherently
racy...


-- 
Petri Latvala
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
