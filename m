Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FFD6EAA5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:38:45 +0000 (UTC)
Date: Wed, 9 Dec 2020 21:55:02 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20201209162502.GA6486@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
 <20201209160642.6317-3-anshuman.gupta@intel.com>
 <160753115527.595.15173510320238280650@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160753115527.595.15173510320238280650@build.alporthouse.com>
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

On 2020-12-09 at 16:25:55 +0000, Chris Wilson wrote:
> Quoting Anshuman Gupta (2020-12-09 16:06:38)
> > Create a separate igt test group and move package C
> > state in to this subgroup.
> > Run powertop --auto-tune to tune SOC power configuration
> > for package C state tests.
> > 
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_rpm.c | 35 +++++++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > index af55b569..42bc44d9 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -832,6 +832,25 @@ static void basic_subtest(void)
> >         /* XXX Also we can test wake up via exec nop */
> >  }
> >  
> > +static bool setup_powertop(void)
> > +{
> > +       FILE *fp;
> > +       char tmp[512];
> > +
> > +       fp = popen("powertop --auto-tune", "r");
> 
> Doesn't this defeat the point of having it work out of the box?
> -Chris
Yes, but there is no other way as PC state are being dependent on other
non-gfx devices as well. These test kept disabled since gen9 platforms.
Thanks,
Anshuman Gupta.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
