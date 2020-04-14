Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <87r1wp4ul3.wl-ashutosh.dixit@intel.com>
References: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
 <87r1wp4ul3.wl-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158690127855.24667.4483056113303151999@build.alporthouse.com>
Date: Tue, 14 Apr 2020 22:54:38 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] lib: Use read() for timerfd
 timeout detection
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, michal.winiarski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-04-14 22:37:44)
> On Tue, 14 Apr 2020 12:05:09 -0700, Chris Wilson wrote:
> >
> > The poll() is proving unreliable, where our tests timeout without the
> > spinner being terminated. Let's try a blocking read instead!
> 
> Weird, wondering if all we need to do is set TFD_NONBLOCK on the fd?
> 
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1676
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  lib/igt_dummyload.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > index 99ca84ad8..a59afd45b 100644
> > --- a/lib/igt_dummyload.c
> > +++ b/lib/igt_dummyload.c
> > @@ -399,12 +399,13 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
> >  static void *timer_thread(void *data)
> >  {
> >       igt_spin_t *spin = data;
> > -     struct pollfd pfd = {
> > -             .fd = spin->timerfd,
> > -             .events = POLLIN,
> > -     };
> > +     uint64_t overruns = 0;
> > +     int ret;
> >
> > -     if (poll(&pfd, 1, -1) >= 0)
> > +     do {
> > +             ret = read(spin->timerfd, &overruns, sizeof(overruns));
> > +     } while (ret == -1 && errno == EINTR);
> 
> do {} while (!overruns) and skip if () below?

I was concerned with how this should interact with pthread_cancel.
I'm not sure when that causes us to return.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
