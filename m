Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBADD6EB87
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 10:22:38 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <158703182515.5570.1971964259948334386@build.alporthouse.com>
References: <20200416093918.3061840-1-chris@chris-wilson.co.uk>
 <20200416094805.GV9497@platvala-desk.ger.corp.intel.com>
 <158703182515.5570.1971964259948334386@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158711893731.5570.12825518017312689772@build.alporthouse.com>
Date: Fri, 17 Apr 2020 11:22:17 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] runner: More task debug!
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

Quoting Chris Wilson (2020-04-16 11:10:25)
> Quoting Petri Latvala (2020-04-16 10:48:05)
> > On Thu, Apr 16, 2020 at 10:39:18AM +0100, Chris Wilson wrote:
> > > In a few cases, we hit a timeout where no process appears to be
> > > deadlocked (i.e. tasks stuck in 'D' with intertwined stacks) but
> > > everything appears to be running happily. Often, they appear to be
> > > fighting over the shrinker, so one naturally presumes we are running low
> > > on memory. But for tests that were designed to run with ample memory to
> > > spare, that is a little disconcerting and I would like to know where the
> > > memory actually went.
> > > 
> > > sysrq('m'): Will dump current memory info to your console
> > > 
> > > Sounds like that should do the trick.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > 
> > If indeed 'm' does what you want and not just useless crud like first
> > two lines of /proc/meminfo,
> 
> It calls into show_mem(), the same as used for oom and panics. Sounds
> promising. /Fortunately/ we have some timeouts so we will get to see
> what happens in practice.

Well we won't, because all the timeouts are being filtered by
blacklist-premerge! Nvm, nothing like testing on production.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
