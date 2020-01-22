Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317AE6F614
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2020 17:21:30 +0000 (UTC)
Date: Wed, 22 Jan 2020 19:21:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200122172126.GD13686@intel.com>
References: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
 <157971295973.15024.11653081154812513001@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157971295973.15024.11653081154812513001@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Detect gdb harder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 05:09:19PM +0000, Chris Wilson wrote:
> Quoting Ville Syrjala (2020-01-22 16:43:32)
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The current gdb detection only works for the parent igt process,
> > but none of its children will see the gdb and so won't trap properly
> > in igt_fail_assert(). Also we will not detect gdb if it was attached
> > after the fact. Fix all of that by looking for the "TracerPid"
> > information in /proc/<pid>/status. We'll leave the current "assume
> > parent may be gdb" approach as a fallback.
> > =

> > Also annoyingly by default gdb will only track a single process.
> > To make it track all of them, and let them all run simultanously
> > one needs the following incantations:
> >  set detach-on-fork off
> >  set schedule-multiple on
> > =

> > Maybe that will save someone from having to trawl as many
> > docs/gogole hits as I did.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_core.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> > =

> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 0a0068946a6a..109b5926eac4 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -1609,12 +1609,12 @@ void igt_describe_f(const char *fmt, ...)
> >         assert(ret < sizeof(__current_description));
> >  }
> >  =

> > -static bool running_under_gdb(void)
> > +static bool is_gdb(pid_t pid)
> >  {
> >         char pathname[30], buf[1024];
> >         ssize_t len;
> >  =

> > -       sprintf(pathname, "/proc/%d/exe", getppid());
> > +       sprintf(pathname, "/proc/%d/exe", pid);
> >         len =3D readlink(pathname, buf, sizeof(buf) - 1);
> >         if (len < 0)
> >                 return false;
> > @@ -1624,6 +1624,40 @@ static bool running_under_gdb(void)
> >         return strncmp(basename(buf), "gdb", 3) =3D=3D 0;
> >  }
> >  =

> > +static pid_t tracer_pid(void)
> > +{
> > +       char pathname[30];
> > +       pid_t pid =3D 0;
> > +       FILE *f;
> > +
> > +       sprintf(pathname, "/proc/%d/status", getpid());
> > +
> > +       f =3D fopen(pathname, "r");
> > +       if (!f)
> > +               return getppid();
> > +
> > +       for (;;) {
> > +               char buf[1024];
> > +               char *s;
> > +
> > +               s =3D fgets(buf, sizeof(buf), f);
> =

> I'd prefer fgetline, /proc/<pid>status is >1024 bytes so there's always
> that chance we cut the TracerPid line.

fgets() reads at most one line (which means my 1024 copypasta is
probably a bit much). Not sure what fgetline() is.

> =

> > +               if (!s)
> > +                       break;
> > +
> > +               if (sscanf(s, "TracerPid: %d", &pid) =3D=3D 1)
> > +                       break;
> > +       }
> > +
> > +       fclose(f);
> > +
> > +       return pid ?: getppid();
> =

> Makes sense.
> =

> > +}
> > +
> > +static bool running_under_gdb(void)
> > +{
> =

> /*
>  * Annoyingly by default gdb will only track a single process.
>  * To make it track all of them, and let them all run simultaneously
>  * one needs the following incantations:
>  *   set detach-on-fork off
>  *   set schedule-multiple on
>  */

Yeah, a comment is probably a good idea for this.

> =

> =

> TIL two things, so
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
