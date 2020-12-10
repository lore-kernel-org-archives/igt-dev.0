Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F076E3D3
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Dec 2020 05:16:19 +0000 (UTC)
Date: Thu, 10 Dec 2020 10:32:48 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20201210050247.GA9309@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
 <20201209160642.6317-3-anshuman.gupta@intel.com>
 <160753115527.595.15173510320238280650@build.alporthouse.com>
 <20201209162502.GA6486@intel.com>
 <160753242185.595.5436148780497590017@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160753242185.595.5436148780497590017@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] i915/i915_pm_rpm.c: create PC state
 subtest group
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-12-09 at 16:47:01 +0000, Chris Wilson wrote:
> Quoting Anshuman Gupta (2020-12-09 16:25:02)
> > On 2020-12-09 at 16:25:55 +0000, Chris Wilson wrote:
> > > Quoting Anshuman Gupta (2020-12-09 16:06:38)
> > > > Create a separate igt test group and move package C
> > > > state in to this subgroup.
> > > > Run powertop --auto-tune to tune SOC power configuration
> > > > for package C state tests.
> > > > 
> > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > ---
> > > >  tests/i915/i915_pm_rpm.c | 35 +++++++++++++++++++++++++++++++----
> > > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > > > index af55b569..42bc44d9 100644
> > > > --- a/tests/i915/i915_pm_rpm.c
> > > > +++ b/tests/i915/i915_pm_rpm.c
> > > > @@ -832,6 +832,25 @@ static void basic_subtest(void)
> > > >         /* XXX Also we can test wake up via exec nop */
> > > >  }
> > > >  
> > > > +static bool setup_powertop(void)
> > > > +{
> > > > +       FILE *fp;
> > > > +       char tmp[512];
> > > > +
> > > > +       fp = popen("powertop --auto-tune", "r");
> > > 
> > > Doesn't this defeat the point of having it work out of the box?
May be misunderstood your comment, is it PC state or powertop should work
out of box ?
> > > -Chris
> > Yes, but there is no other way as PC state are being dependent on other
> > non-gfx devices as well. These test kept disabled since gen9 platforms.
> 
> Could you be explicit in the steps required so that it is clear that
> powertop is not working around our own bugs?
We need to run powertop --auto-tune to tune SOC power configuration in order
to attain deeper package C state.
Without running "powertop --auto-tune" we may not hit to PC8/PC10 state
(other non-gfx devices can also block the PC8/PC10 state).
We don't want to fail these test due to other non-gfx devices, so it is
better to tune SOC power configuration by power-top.

Thanks,
Anshuman Gupta.
  
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
