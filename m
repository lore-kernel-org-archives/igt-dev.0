Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4776E22C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 10:58:10 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200430105137.GB9497@platvala-desk.ger.corp.intel.com>
References: <20200430103612.12579-1-arjun.melkaveri@intel.com>
 <158824349686.7361.9013835574158099808@build.alporthouse.com>
 <20200430105137.GB9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158824426341.7361.4903564485859064745@build.alporthouse.com>
Date: Thu, 30 Apr 2020 11:57:43 +0100
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]i915/gem_sync:Corrected legacy
 Dynamic test case name
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
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-04-30 11:51:37)
> On Thu, Apr 30, 2020 at 11:44:56AM +0100, Chris Wilson wrote:
> > Quoting Arjun Melkaveri (2020-04-30 11:36:12)
> > > Test case for legacy and new engines is same, when listed out.
> > > adding "legacy" in front of test case name to differentiate it.
> > 
> > Hmm, --run idle tests both, and --run idle -dyn rcs0 works, this would
> > seem to be a _feature_.
> > 
> > But maybe Petri wants to be super strict for some reason or another.
> 
> Tests both, but only one of them gets through to html.

And here I was hoping for some amalgamation in the presentation of
results :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
