Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8AC6EA5F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Mar 2021 18:27:59 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 4 Mar 2021 18:27:56 +0000
Message-ID: <BYAPR11MB37844B2D370C96A363021DF88A979@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-10-alan.previn.teres.alexis@intel.com>
 <161481598955.25897.1702124270692264198@build.alporthouse.com>
In-Reply-To: <161481598955.25897.1702124270692264198@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t 09/11] Add test to verify session key
 renewed after suspend-resume cycle
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Right - got it. Thanks.
...alan

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Wednesday, March 3, 2021 4:00 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; igt-dev@lists.freedesktop.org
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 09/11] Add test to verify session key renewed after suspend-resume cycle

Quoting Alan Previn (2021-03-02 22:53:32)
> +static void trigger_powermgt_suspend_cycle(int i915,
> +       struct powermgt_data *pm)
> +{
> +       igt_pm_enable_sata_link_power_management();
> +
> +
> +       igt_system_suspend_autoresume(SUSPEND_STATE_MEM, 
> + SUSPEND_TEST_DEVICES);
> +
> +       igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +       gem_test_engine(i915, I915_EXEC_RENDER);
> +       while 
> + ((!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE))) {

With an autosuspend delay of 0, this is not guaranteed to ever report ACTIVE.

Just drop everything after wait_for_pm_status(SUSPENDED) as clearly using the protected rendercopy must wake the device.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
