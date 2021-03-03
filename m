Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586866E422
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 23:59:53 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210302225334.361966-10-alan.previn.teres.alexis@intel.com>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
 <20210302225334.361966-10-alan.previn.teres.alexis@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 03 Mar 2021 23:59:49 +0000
Message-ID: <161481598955.25897.1702124270692264198@build.alporthouse.com>
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>, igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Alan Previn (2021-03-02 22:53:32)
> +static void trigger_powermgt_suspend_cycle(int i915,
> +       struct powermgt_data *pm)
> +{
> +       igt_pm_enable_sata_link_power_management();
> +
> +
> +       igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
> +
> +       igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED);
> +       gem_test_engine(i915, I915_EXEC_RENDER);
> +       while ((!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE))) {

With an autosuspend delay of 0, this is not guaranteed to ever report
ACTIVE.

Just drop everything after wait_for_pm_status(SUSPENDED) as clearly
using the protected rendercopy must wake the device.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
