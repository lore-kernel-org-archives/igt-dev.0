Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3537F6E0F8
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 16:55:10 +0000 (UTC)
Date: Thu, 1 Apr 2021 19:54:50 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210401165450.e3mdubfmrkgyi225@hatecraft.localdomain>
References: <20210325185915.51590-1-arek@hiler.eu>
 <20210325185915.51590-2-arek@hiler.eu>
 <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 10:09:46PM +0100, Daniel Vetter wrote:
> On Thu, Mar 25, 2021 at 08:59:12PM +0200, Arkadiusz Hiler wrote:
> > ...and add it to test-list-full.txt just like we do when building with
> > autotools.
> > 
> > Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
> 
> tbh it might be time to sunset this. I kinda started it, it grew to
> astronomical combinatorial combinations, it's been on the skiplist since
> ages, and there's even more stuff on the skiplist. Looking at the history
> it started very benign to tests some pwrite/pread vs rendering
> synchronization issues. But it's definitely not doing just that anymore.
> 
> But maybe in a next patch series.
> 
> On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ripping things out in a separate series IMO makes more sense, yep.

Thanks for the ACK :-)

/me pokes Petri and Tomi

Seems like the change was picked up and went through Intel's CI just
fine. Is there anything that blocks this series for you folks?

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
