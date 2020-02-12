Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5816EA4D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 11:02:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d7e41438582999e2e22a557d443430da0d00c335.camel@intel.com>
References: <20200212091401.26642-1-dominik.grzegorzek@intel.com>
 <158150173353.5188.12750572995970677206@skylake-alporthouse-com>
 <d7e41438582999e2e22a557d443430da0d00c335.camel@intel.com>
Message-ID: <158150528740.11180.15746439470025810664@skylake-alporthouse-com>
Date: Wed, 12 Feb 2020 11:01:27 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_alignment.c: Update to
 be completable in a rational time.
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
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Grzegorzek, Dominik (2020-02-12 10:55:50)
> On Wed, 2020-02-12 at 10:02 +0000, Chris Wilson wrote:
> > Quoting Dominik Grzegorzek (2020-02-12 09:14:01)
> > > +       /*
> > > +        * Due to the high complexity of searching holes in virtual
> > > memory,
> > > +        * number of objects has to be limited. The algorithm for
> > > each alignment
> > > +        * performs execbuffer multiple times and doubles number of
> > > objects
> > > +        * in every iteration till timeout is reached.
> > > +        **/
> > >         for (alignment = 4096; alignment < gtt_size; alignment <<=
> > > 1) {
> > > -               for (i = 0; i < count; i++)
> > > -                       execobj[i].alignment = alignment;
> > > +               alignment_set_timeout(TIMEOUT);
> > > +               clock_gettime(CLOCK_MONOTONIC, &start);
> > 
> > I was thinking we made the timeout global and just run the test for a
> > maximum of N secs and see how far into the alignment loop we get?
> > 
> > There's no reason to believe that higher power of two alignments
> > provide
> > any different path coverage, just as noted we find ourselves in
> > increasingly fragmented virtual space. If you want a challenge,
> > supplement this with a priority-inversion test case... (Where a low
> > priority client can create a mess in their own address space, causing
> > a
> > delay [>10ms] of a high priority client. It's a clear and present
> > bug.)
> > -Chris
> Is that priority-inversion test case cricial for you? What about
> just making the timout global for now? 

At the moment this is a benchmark purporting to be a test. Demonstrating
that this can be abused to create a DoS is something we can use as a
regression test (since we can set hard bounds on our level of service
guarantees and assert that we do not violate them).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
