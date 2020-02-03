Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123146E321
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 12:25:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200203122305.GE25209@platvala-desk.ger.corp.intel.com>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
 <20200203111344.GB25209@platvala-desk.ger.corp.intel.com>
 <158072891643.20090.13007450821769380286@skylake-alporthouse-com>
 <20200203115007.GC25209@platvala-desk.ger.corp.intel.com>
 <158073123509.20090.16190760955128007475@skylake-alporthouse-com>
 <20200203122305.GE25209@platvala-desk.ger.corp.intel.com>
Message-ID: <158073274143.20090.7739992905161137805@skylake-alporthouse-com>
Date: Mon, 03 Feb 2020 12:25:41 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Kill residual children at the end
 of a subtest
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

Quoting Petri Latvala (2020-02-03 12:23:05)
> On Mon, Feb 03, 2020 at 12:00:35PM +0000, Chris Wilson wrote:
> > Quoting Petri Latvala (2020-02-03 11:50:07)
> > > Care to beef up lib/tests/igt_fork.c to make sure this is all done
> > > gracefully at subtest level, currently it only checks that the state
> > > is sane at exit() time?
> > 
> > Something evil like:
> > 
> > pid_t *children = mmap(4096, SHARED);
> > 
> > igt_subtest() {
> >       igt_fork(child, 4096/sizeof(pid_t)) {
> >               children[child] = getpid();
> >       }
> >       /* leak the children */
> > }
> > 
> > for (int i = 0; i < 4096/sizeof(pid_t); i++)
> >       assert(kill(children[i], 0) == -1);
> > munmap(children, 4096);
> > 
> > Is that legal?
> 
> Do we need crazy? lib-tests get run on qemu'd mips and arm,
> and anyway fork-bombing on gitlab is not very nice.

Bah, it's not that crazy. 1024 processes, barely a scratch :)

I didn't think it's particularly onerous, but I don't have much
experience with the gitlab-ci targets.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
