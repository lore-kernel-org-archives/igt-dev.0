Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BBE6E598
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Dec 2020 23:22:03 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <87wnxoou0j.wl-ashutosh.dixit@intel.com>
References: <20201211222152.2952035-1-chris@chris-wilson.co.uk>
 <87wnxoou0j.wl-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 11 Dec 2020 23:21:56 +0000
Message-ID: <160772891653.1732.9892518923664415606@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Include the small concurrent
 tests
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-12-11 22:30:36)
> On Fri, 11 Dec 2020 14:21:52 -0800, Chris Wilson wrote:
> >
> > The tiny tests run quick, but sometimes just enough to trip over the
> > system.
> 
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

It's still going to work out as far too many, and the overhead of
running each subtest individually will greatly magnify the runtime.

Drat. Still will be interesting to see how Jenkins handles it.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
