Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB94CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 09:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0D10E419;
	Wed,  7 Oct 2026 09:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWL/s+TK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5910E419
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791365985; x=1822901985;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FBRwpEV0TobG5ykTIc+thq30q16nmXlRpda2v/AHLAw=;
 b=IWL/s+TKpQ6gUwXY+AbedY32kTpmwo0lpZrDSGEeH9AnkURUrlWRUFJi
 anPKGws54+ue0mhwUktuTnVs/WpQ4eIfmb68/qLlI9AomYIQGEjF3esEu
 vyZLjOx4VEQUOnhwX82yzp90YoB5pSJOwroE5gKTIhkVgexUXLR7+W+65
 bPHhFYTzAwI6jfBdwBn3WICzvLcDEIc3E7+jLqPMgeYcFuW1loA+3wwrw
 54TufpPnBeLrzcfxeDnKWXFjuIhpIc5B4OUV3QxWzLkIrRyvY8trRmd8P
 8Sb3OdkqaKim/LSQlntR1WLQl8Eqwju+7fcRXrrJOVM5p+srgkiYGJITK A==;
X-CSE-ConnectionGUID: oHwlom69QiyRaaNEUJjvbg==
X-CSE-MsgGUID: YQRc8DPkQmu5CWt8pstdog==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="18676"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="18676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:39:45 -0700
X-CSE-ConnectionGUID: xVqXw2YfReWaM/6e9sBipQ==
X-CSE-MsgGUID: KPHOJs34Rpu9LTbk9MCR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="305380256"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:39:43 -0700
Message-ID: <4d92c8d8-2ae9-48a2-94f3-41a9a5636547@linux.intel.com>
Date: Wed, 7 Oct 2026 11:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
To: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 10/6/2026 4:11 PM, Gustavo Sousa wrote:
> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
> its fixture.  Even though the fixture is part of a subtest group, the
> enabling/disabling will happen regardless of whether those subests are
> selected or not (via --run-subtest).
>
> As most subtests in xe_pmu don't need that, avoid doing that as a
> fixture and rather incorporate the enabling/disabling as part of a new
> macro called test_each_engine_with_vfs().
>
> v2:
>    - Add "intel" to commit subject prefix. (Kamil)
>    - Fix argument name of test_each_engine_with_vfs():
>      s/num_vfs/num_fns/. (Kamil)
>    - Enable/disable VFs only once per macro call by moving the call to
>      xe_for_each_engine() inside the for-loop. (Marcin)
>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   tests/intel/xe_pmu.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index d41ebba1faef..eda56c078653 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>   				      hwe->engine_instance)
>   
> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
> +	igt_subtest_with_dynamic(test) \
> +		for (num_fns = enable_and_provision_vfs(fd) + 1; \
> +		     num_fns; \
> +		     unprovision_and_disable_vfs(fd), num_fns = 0) \
> +			xe_for_each_engine(fd, hwe) \
> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
> +					      hwe->engine_instance)
> +

igt_assert (from enable_and_provision_vfs) before entering igt_dynamic 
can hit an internal assertion and abort.

Could we move VF setup into the dynamic case and reuse the enabled VFs 
across engines, like xe_sriov_scheduling does?

Unfortunately it complicates the code, adds state and cleanup logic, but 
I don’t see a simpler way to keep setup assertions safe.

>   static bool has_event(const char *device, const char *event)
>   {
>   	char buf[512];
> @@ -1192,26 +1201,20 @@ int igt_main()
>   	igt_subtest_group() {
>   		unsigned int num_fns;
>   
> -		igt_fixture()
> -			num_fns = enable_and_provision_vfs(fd) + 1;
> -
>   		igt_describe("Validate engine activity on all functions");
> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
>   			engine_activity_all_fn(fd, eci, num_fns);
>   
>   		igt_describe("Validate per-function engine activity");
> -		test_each_engine("fn-engine-activity-load", fd, eci)
> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
>   			for (int fn = 0; fn < num_fns; fn++)
>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>   
>   		igt_describe("Validate per-function engine activity when sched-if-idle is set");
> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
>   			for (int fn = 0; fn < num_fns; fn++)
>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>   		}
> -
> -		igt_fixture()
> -			unprovision_and_disable_vfs(fd);
>   	}
>   
>   	igt_subtest_group() {
>
> ---
> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
>
> Best regards,
> --
> Gustavo Sousa <gustavo.sousa@intel.com>
