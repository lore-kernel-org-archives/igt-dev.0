Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F016E846
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 20:59:45 +0000 (UTC)
Date: Tue, 6 Apr 2021 23:59:21 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210406205921.ncr4brcusus6sb54@hatecraft.localdomain>
References: <20210325185915.51590-1-arek@hiler.eu>
 <20210325185915.51590-2-arek@hiler.eu>
 <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
 <20210401165450.e3mdubfmrkgyi225@hatecraft.localdomain>
 <YGv//+YE36fGsBjW@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGv//+YE36fGsBjW@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests: Build gem_concurrent_all
 with meson
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
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 09:30:23AM +0300, Petri Latvala wrote:
> On Thu, Apr 01, 2021 at 07:54:50PM +0300, Arkadiusz Hiler wrote:
> > On Thu, Mar 25, 2021 at 10:09:46PM +0100, Daniel Vetter wrote:
> > > On Thu, Mar 25, 2021 at 08:59:12PM +0200, Arkadiusz Hiler wrote:
> > > > ...and add it to test-list-full.txt just like we do when building with
> > > > autotools.
> > > > 
> > > > Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
> > > 
> > > tbh it might be time to sunset this. I kinda started it, it grew to
> > > astronomical combinatorial combinations, it's been on the skiplist since
> > > ages, and there's even more stuff on the skiplist. Looking at the history
> > > it started very benign to tests some pwrite/pread vs rendering
> > > synchronization issues. But it's definitely not doing just that anymore.
> > > 
> > > But maybe in a next patch series.
> > > 
> > > On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Ripping things out in a separate series IMO makes more sense, yep.
> > 
> > Thanks for the ACK :-)
> > 
> > /me pokes Petri and Tomi
> > 
> > Seems like the change was picked up and went through Intel's CI just
> > fine. Is there anything that blocks this series for you folks?
> 
> 
> No blocks in sight. Go ahead.

Thanks, merged.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
