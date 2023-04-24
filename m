Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5B210E5D9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 19:15:19 +0000 (UTC)
Date: Mon, 24 Apr 2023 22:15:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Message-ID: <ZEbVQmgEpx2PMSIj@intel.com>
References: <20230424134845.67398-1-hersenxs.wu@amd.com>
 <2e34a61e-4006-1cf7-fd4c-7578413a2e14@amd.com>
 <PH8PR12MB69628ACAD108D765A888BBFBFD679@PH8PR12MB6962.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH8PR12MB69628ACAD108D765A888BBFBFD679@PH8PR12MB6962.namprd12.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_hotplug: add delay
 after igt_system_suspend_autoresume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 07:02:04PM +0000, Wu, Hersen wrote:
> [AMD Official Use Only - General]
> 
> After igt_system_suspend_autoresume is executed, Linux kernel should be out of sleep mode.
> By adding read power_state from /sys/class/drm/card0/device# cat power_state. Value is D0.
> This is already checked by reading amdgpu adev->in_suspend, value is false.
> 
> Some other components may not finish process for resume.
> 
> When batch run test case below,
> 
> igt@amdgpu/amd_hotplug@basic-suspend
> igt@amdgpu/amd_link_settings@link-training-configs
> igt@amdgpu/amd_mem_leak@connector-suspend-resume
> 
> 
> igt@amdgpu/amd_hotplug@basic-suspend is executed, but the rest two test case are skipped.
> 
> I do not find method to check if all SW components are out of resume processing. The delay 30 seconds is safe value based on experiments.

There is no such suspend processing. The kernel just freezed/thaws
userspace as a whole. Once the igt is running so is rest of userspace.

> AMD IGT test list are executed 15 loops.
> 
> With delay 15 seconds, intermittent failure could still be captured.
> 
> Thanks!
> Hersen
> 
> 
> 
> 
> 
> 
> 
> -----Original Message-----
> From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com> 
> Sent: Monday, April 24, 2023 12:50 PM
> To: Wu, Hersen <hersenxs.wu@amd.com>; igt-dev@lists.freedesktop.org; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@amd.com>; Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_hotplug: add delay after igt_system_suspend_autoresume
> 
> 
> 
> On 4/24/23 07:48, Hersen Wu wrote:
> > at call back of igt_system_suspend_autoresume, linux kernel resume 
> > finish and in d0 state. but user mode components may not be fully out 
> > of sleep mode. add delay wait for system stable before issuing 
> > debugfs_hotplug_trigger.
> > 
> > Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> > ---
> >   tests/amdgpu/amd_hotplug.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c 
> > index 736040a2..1c946ff8 100644
> > --- a/tests/amdgpu/amd_hotplug.c
> > +++ b/tests/amdgpu/amd_hotplug.c
> > @@ -133,6 +133,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
> >   	if (suspend) {
> >   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >   					      SUSPEND_TEST_NONE);
> > +		sleep(30);
> 
> Do we need to wait all of this time? If so, why?
> 
> >   	}
> >   
> >   	/* Trigger hotplug and confirm reference image is the same. */

-- 
Ville Syrjälä
Intel
