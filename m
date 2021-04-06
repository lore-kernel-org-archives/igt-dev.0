Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FB189394
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 06:29:32 +0000 (UTC)
Date: Tue, 6 Apr 2021 09:30:23 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YGv//+YE36fGsBjW@platvala-desk.ger.corp.intel.com>
References: <20210325185915.51590-1-arek@hiler.eu>
 <20210325185915.51590-2-arek@hiler.eu>
 <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
 <20210401165450.e3mdubfmrkgyi225@hatecraft.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401165450.e3mdubfmrkgyi225@hatecraft.localdomain>
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
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 07:54:50PM +0300, Arkadiusz Hiler wrote:
> On Thu, Mar 25, 2021 at 10:09:46PM +0100, Daniel Vetter wrote:
> > On Thu, Mar 25, 2021 at 08:59:12PM +0200, Arkadiusz Hiler wrote:
> > > ...and add it to test-list-full.txt just like we do when building with
> > > autotools.
> > > 
> > > Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
> > 
> > tbh it might be time to sunset this. I kinda started it, it grew to
> > astronomical combinatorial combinations, it's been on the skiplist since
> > ages, and there's even more stuff on the skiplist. Looking at the history
> > it started very benign to tests some pwrite/pread vs rendering
> > synchronization issues. But it's definitely not doing just that anymore.
> > 
> > But maybe in a next patch series.
> > 
> > On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Ripping things out in a separate series IMO makes more sense, yep.
> 
> Thanks for the ACK :-)
> 
> /me pokes Petri and Tomi
> 
> Seems like the change was picked up and went through Intel's CI just
> fine. Is there anything that blocks this series for you folks?


No blocks in sight. Go ahead.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
