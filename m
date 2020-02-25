Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <2cfd56bbd82abeba251ad38d7dd9830f8e503e68.camel@linux.intel.com>
References: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
 <20200221111701.30006-3-janusz.krzysztofik@linux.intel.com>
 <158229528380.6499.10205591790332300594@skylake-alporthouse-com>
 <2cfd56bbd82abeba251ad38d7dd9830f8e503e68.camel@linux.intel.com>
Message-ID: <158264555069.3062.12378145563887738523@skylake-alporthouse-com>
Date: Tue, 25 Feb 2020 15:45:50 +0000
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-02-25 15:41:28)
> Hi Chris,
> 
> On Fri, 2020-02-21 at 14:28 +0000, Chris Wilson wrote:
> > Quoting Janusz Krzysztofik (2020-02-21 11:17:01)
> > > +       /* create userptr object */
> > > +       igt_assert_eq(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE),
> > > 0);
> > > +       gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
> > > +
> > > +       /* set up mmap-offset mapping on top of the object, skip if
> > > refused */
> > > +       map = __gem_mmap_offset(fd, handle, 0, PAGE_SIZE,
> > > +                               PROT_READ | PROT_WRITE, t->type);
> > > +       igt_skip_on_f(!map && errno == -ENODEV,
> 
> errno should be compared against a positive value, sorry for that bug.
> Thanks for fixing it and merging.

I was lazier than that. I feared we had scrubbed errno.
But the fixes were an improvement so had no reason to delay.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
