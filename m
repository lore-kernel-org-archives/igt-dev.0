Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8183F8ED52
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 18:12:11 +0000 (UTC)
Date: Mon, 1 Aug 2022 14:12:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <YugXcxUx/TCga390@intel.com>
References: <20220712164744.255984-1-anusha.srivatsa@intel.com>
 <YtBuR4Ua3hxSUCfe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YtBuR4Ua3hxSUCfe@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v2] tests/i915/i915_pm_dc: Remove PC8+
 dependency for DGFX DC9
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 03:28:07PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 12, 2022 at 09:47:44AM -0700, Anusha Srivatsa wrote:
> > For DGFX, the DC9 flow and dependency is different from igfx.
> > DC9 does not depend on BIOS/PCU to execute save
> > and restore or any other sequence when
> > going to PC9/PC10
> > 
> > DC9 actually depends on D3 and PCODE simply remove power
> > if SW allowed
> > 
> > v2: Get the info about platform being discrete or not from
> > i915_gpu_info debugfs (Anshuman)
> > 
> > v2: Update commit message and subject to reflect that the changes
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>(v2)
> > ---
> >  tests/i915/i915_pm_dc.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> > index a780f2cb..f664a2a2 100644
> > --- a/tests/i915/i915_pm_dc.c
> > +++ b/tests/i915/i915_pm_dc.c
> > @@ -422,6 +422,15 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc)
> >  			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
> >  }
> >  
> > +static bool check_is_dgfx(data_t *data)
> > +{
> > +	char buf[4096];
> > +
> > +	igt_debugfs_simple_read(data->debugfs_fd, "i915_gpu_info",
> > +				buf, sizeof(buf));
> > +	return strstr(buf, "is_dgfx: yes");
> 
> I couldn't verify right now if this is the right string, but considering
> this is the right string and that this was tested:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed, thanks

> 
> > +}
> > +
> >  static void setup_dc9_dpms(data_t *data, int dc_target)
> >  {
> >  	int prev_dc, sysfs_fd;
> > @@ -532,8 +541,9 @@ int main(int argc, char *argv[])
> >  
> >  	igt_describe("This test validates display engine entry to DC9 state");
> >  	igt_subtest("dc9-dpms") {
> > -		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > -				"PC8+ residencies not supported\n");
> > +		if (!(check_is_dgfx(&data)))
> > +			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > +				      "PC8+ residencies not supported\n");
> >  		test_dc9_dpms(&data);
> >  	}
> >  
> > -- 
> > 2.25.1
> > 
