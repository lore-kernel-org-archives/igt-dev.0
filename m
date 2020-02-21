Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <2714492.eSyeoD3iCD@jkrzyszt-desk.ger.corp.intel.com>
References: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
 <20200221111701.30006-3-janusz.krzysztofik@linux.intel.com>
 <158229528380.6499.10205591790332300594@skylake-alporthouse-com>
 <2714492.eSyeoD3iCD@jkrzyszt-desk.ger.corp.intel.com>
Message-ID: <158229951247.7320.6866015757235628790@skylake-alporthouse-com>
Date: Fri, 21 Feb 2020 15:38:32 +0000
Subject: Re: [igt-dev] [Intel-gfx] [RFC PATCH i-g-t v2 2/2]
 tests/gem_userptr_blits: Exercise mmap-offset mapping to userptr
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-02-21 15:36:08)
> Hi Chris,
> 
> Thanks for review.
> 
> On Friday, February 21, 2020 3:28:03 PM CET Chris Wilson wrote:
> > Quoting Janusz Krzysztofik (2020-02-21 11:17:01)
> > > +       /* set object pages in order to activate MMU notifier for it */
> > > +       gem_set_domain(fd, handle, t->domain, t->domain);
> > 
> > I would suggest (a variant?) that also attached a igt_spin_t to the userptr,
> > waited for it to start executing, call igt_spin_set_timeout and then do
> > the munmap.
> 
> OK.  Will that be OK if I prepare a follow up patch with that subtest variant 
> added?

Perfectly acceptable.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
