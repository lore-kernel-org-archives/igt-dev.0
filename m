Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358516ED16
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 14:35:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200121123120.27148-1-arjun.melkaveri@intel.com>
 <157961043554.3096.4464531165987455648@skylake-alporthouse-com>
 <bd4c78e6-59fd-ebdd-d18e-0c8cbf0d30ac@linux.intel.com>
 <157961501097.4434.16751788916831756518@skylake-alporthouse-com>
In-Reply-To: <157961501097.4434.16751788916831756518@skylake-alporthouse-com>
Message-ID: <157961731627.4434.10247900102727148942@skylake-alporthouse-com>
Date: Tue, 21 Jan 2020 14:35:16 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop:Adjusted test to
 utilize all available engines
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2020-01-21 13:56:51)
> Quoting Tvrtko Ursulin (2020-01-21 13:50:34)
> > 
> > On 21/01/2020 12:40, Chris Wilson wrote:
> > > Quoting Arjun Melkaveri (2020-01-21 12:31:20)
> > >> Added __for_each_physical_engine to utilize all available engines.
> > >> Moved single, signal, preempt, poll and headless test cases
> > >> from static to dynamic group.
> > > 
> > > But doesn't this prevent us from exercising the legacy ABI?
> > 
> > It was my suggestion that for gem_exec_nop (measuring execution speed) 
> > we don't care about legacy ABI.
> 
> It's my glxgears, the first thing I check to get a feel of a system.
> I'm particularly sensitive to it :)

Ok, there's no requirement here for the legacy ABI at all. So long as
there is a test somewhere that sends a request along an I915_EXEC_*, we
don't care about it here.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
