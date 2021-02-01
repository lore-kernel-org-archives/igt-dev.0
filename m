Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB56689C28
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 08:12:28 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <YBe2xlzoqepycMNu@platvala-desk.ger.corp.intel.com>
References: <20210201063339.19874-1-petri.latvala@intel.com>
 <161216649171.30865.13362995240619604363@build.alporthouse.com>
 <YBe2xlzoqepycMNu@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 01 Feb 2021 08:12:20 +0000
Message-ID: <161216714086.30865.8565106652807413691@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Turn off -Werror
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2021-02-01 08:07:34)
> On Mon, Feb 01, 2021 at 08:01:31AM +0000, Chris Wilson wrote:
> > Quoting Petri Latvala (2021-02-01 06:33:39)
> > > No, we don't want all warnings ever to be errors. While being rid of
> > > compile warnings (especially the more obscure ones from future
> > > compilers) is great, having it on always is not acceptable. It's not
> > > even on "by default", it was non-overrideably set on.
> > > 
> > > Not to mention adding -Werror to compiler flags is the incorrect way
> > > of turning it on. Use the meson command line flag --werror instead on
> > > whatever local checkout or company-internal fork you're using, where
> > > you have control over which compilers are used. Turning it on
> > > unconditionally in an upstream repository for all current and future
> > > compilers is never ok.
> > 
> > Do you have a plan to enable --werror for CI?
> 
> 
> For select distros, possibly.

If you are confident we can enable Werror and keep [more] warnings from
entering, I accept that I acted out of annoyance that we were not doing
a good enough job in keeping the code clean.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
