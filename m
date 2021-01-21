MIME-Version: 1.0
Date: Thu, 21 Jan 2021 14:55:56 -0500
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
	<20201209160642.6317-3-anshuman.gupta@intel.com>
	<160753115527.595.15173510320238280650@build.alporthouse.com>
	<20201209162502.GA6486@intel.com>
	<160753242185.595.5436148780497590017@build.alporthouse.com>
	<20201210050247.GA9309@intel.com>
	<160758613245.595.6370833186215737580@build.alporthouse.com>
In-Reply-To: <160758613245.595.6370833186215737580@build.alporthouse.com>
Message-ID: <CABVU7+uTHuEeG2k9dO3fFFc_Fea8OdbMTntF+E4AX+E6X=oTSg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] i915/i915_pm_rpm.c: create PC state
 subtest group
From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c78c3f05b96e75cc"
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000c78c3f05b96e75cc
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 2:42 AM Chris Wilson <chris@chris-wilson.co.uk>
wrote:

> Quoting Anshuman Gupta (2020-12-10 05:02:48)
> > On 2020-12-09 at 16:47:01 +0000, Chris Wilson wrote:
> > > Quoting Anshuman Gupta (2020-12-09 16:25:02)
> > > > On 2020-12-09 at 16:25:55 +0000, Chris Wilson wrote:
> > > > > Quoting Anshuman Gupta (2020-12-09 16:06:38)
> > > > > > Create a separate igt test group and move package C
> > > > > > state in to this subgroup.
> > > > > > Run powertop --auto-tune to tune SOC power configuration
> > > > > > for package C state tests.
> > > > > >
> > > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > ---
> > > > > >  tests/i915/i915_pm_rpm.c | 35
> +++++++++++++++++++++++++++++++----
> > > > > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > > > > > index af55b569..42bc44d9 100644
> > > > > > --- a/tests/i915/i915_pm_rpm.c
> > > > > > +++ b/tests/i915/i915_pm_rpm.c
> > > > > > @@ -832,6 +832,25 @@ static void basic_subtest(void)
> > > > > >         /* XXX Also we can test wake up via exec nop */
> > > > > >  }
> > > > > >
> > > > > > +static bool setup_powertop(void)
> > > > > > +{
> > > > > > +       FILE *fp;
> > > > > > +       char tmp[512];
> > > > > > +
> > > > > > +       fp = popen("powertop --auto-tune", "r");
> > > > >
> > > > > Doesn't this defeat the point of having it work out of the box?
> > May be misunderstood your comment, is it PC state or powertop should work
> > out of box ?
>
> Powermanagement should not require the user to configure it before it
> can work.
>
> powertop in particular may tweak the gfx, which is verboten.
>
> Manually perform any configuration you think is required, and warn if the
> initial configuration does not support reaching the lowest pc state the
> system can. File bugs.
>

I understand why Anshuman did this. There are many many components
out there that are blocking the PC10 and this powertop --auto-tune
is trying to take care of all the corner cases to get the "best" of all the
components so we can try to garantee that we are not getting blocked by
other components.

However this is very very dangerous. It toggles a lot of unsafe and
untested cases.

I have lost a laptop right after a powertop --auto-tune and have never used
that
in my life again. Coincidence? Maybe... but I don't want to take the risk
in my
machine and I definitely cannot recommend its use.


> -Chris
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
>

--000000000000c78c3f05b96e75cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 2:42 AM C=
hris Wilson &lt;<a href=3D"mailto:chris@chris-wilson.co.uk">chris@chris-wil=
son.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Quoting Anshuman Gupta (2020-12-10 05:02:48)<br>
&gt; On 2020-12-09 at 16:47:01 +0000, Chris Wilson wrote:<br>
&gt; &gt; Quoting Anshuman Gupta (2020-12-09 16:25:02)<br>
&gt; &gt; &gt; On 2020-12-09 at 16:25:55 +0000, Chris Wilson wrote:<br>
&gt; &gt; &gt; &gt; Quoting Anshuman Gupta (2020-12-09 16:06:38)<br>
&gt; &gt; &gt; &gt; &gt; Create a separate igt test group and move package =
C<br>
&gt; &gt; &gt; &gt; &gt; state in to this subgroup.<br>
&gt; &gt; &gt; &gt; &gt; Run powertop --auto-tune to tune SOC power configu=
ration<br>
&gt; &gt; &gt; &gt; &gt; for package C state tests.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Anshuman Gupta &lt;<a href=3D"mailt=
o:anshuman.gupta@intel.com" target=3D"_blank">anshuman.gupta@intel.com</a>&=
gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 tests/i915/i915_pm_rpm.c | 35 ++++++++++++++=
+++++++++++++++++----<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 31 insertions(+), 4 deletion=
s(-)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915=
/i915_pm_rpm.c<br>
&gt; &gt; &gt; &gt; &gt; index af55b569..42bc44d9 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/tests/i915/i915_pm_rpm.c<br>
&gt; &gt; &gt; &gt; &gt; +++ b/tests/i915/i915_pm_rpm.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -832,6 +832,25 @@ static void basic_subtest(voi=
d)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX Also we ca=
n test wake up via exec nop */<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; +static bool setup_powertop(void)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *fp;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp[512];<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D popen(&quot;pow=
ertop --auto-tune&quot;, &quot;r&quot;);<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Doesn&#39;t this defeat the point of having it work out=
 of the box?<br>
&gt; May be misunderstood your comment, is it PC state or powertop should w=
ork<br>
&gt; out of box ?<br>
<br>
Powermanagement should not require the user to configure it before it<br>
can work.<br>
<br>
powertop in particular may tweak the gfx, which is verboten.<br>
<br>
Manually perform any configuration you think is required, and warn if the<b=
r>
initial configuration does not support reaching the lowest pc state the<br>
system can. File bugs.<br></blockquote><div><br></div><div>I understand why=
 Anshuman did this. There are many many components</div><div>out there that=
 are blocking the PC10 and this powertop --auto-tune</div><div>is trying to=
 take care of all the corner cases to get the &quot;best&quot; of all the</=
div><div>components so we can try to garantee that we are not getting block=
ed by other components.</div><div><br></div><div>However this is very very =
dangerous. It toggles a lot of unsafe and untested cases.</div><div><br></d=
iv><div>I have lost a laptop right after a powertop --auto-tune and have ne=
ver used that</div><div>in my life again. Coincidence? Maybe... but I don&#=
39;t want to take the risk in my</div><div>machine and I definitely cannot =
recommend its use.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
-Chris<br>
_______________________________________________<br>
igt-dev mailing list<br>
<a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blank">igt-dev@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/igt-dev" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/igt-dev</a><br>
</blockquote></div></div>

--000000000000c78c3f05b96e75cc--
