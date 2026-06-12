Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B06CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 07:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85310F2AD;
	Fri, 12 Jun 2026 07:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTbRskMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03D10F2AD
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781248430; x=1812784430;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cYZue8CytvqnMouF7dvD7YpovmL/Kl4dgYFTJb5HhMg=;
 b=mTbRskMUu+q25XBe7i/8ps1NRj1fNiyurFU+QJHEdP0E5rFnR8AE6vzH
 F3jXd9r9mJdNw9eHzkk3StOV8Dh93oGvYJLMRaUKzuMnS7DTO4KXD+d3E
 3BAIa885HyFiApNMt7gREaHUou2haBAJXtqMblWy7qBxPnkb0hGy6l5/J
 5Hy7bb09RF3pwMXU6J9Y0GfcwsuZq69uq5iatUkbFrycUt6g3pnHu1FnN
 PXd8E/UI9dB8nmPGJhRuZnLzd/smgC1OXqsnHuknow+6R6tAEUXPJn1er
 SP+K/NYmndq4BIysfYxaBmBtBUjxX8kQ+pMDHoqLczCsJlU2mtl36BeYm w==;
X-CSE-ConnectionGUID: z4tBpKYoS56fLVBXpmtdpw==
X-CSE-MsgGUID: 30qStfc1RYeCJbQ9vGqkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104746087"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="104746087"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 00:13:50 -0700
X-CSE-ConnectionGUID: zvL2oo19SXefHrfabDYogA==
X-CSE-MsgGUID: Z9LMbGbFQzmsIRffbisPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="245851355"
Received: from wporebin-mobl2.ger.corp.intel.com (HELO [10.246.20.78])
 ([10.246.20.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 00:13:48 -0700
Message-ID: <b2902e62-231a-46b6-8757-0a2c4cd420a1@linux.intel.com>
Date: Fri, 12 Jun 2026 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/core_hotunplug: Add
 exec-fork-unbind-rebind subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com, stuart.summers@intel.com
References: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
 <20260611142438.260647-3-marcin.bernatowicz@linux.intel.com>
 <20260611152652.kbtmzajle6difmk7@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260611152652.kbtmzajle6difmk7@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 6/11/2026 5:26 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2026-06-11 at 16:24:38 +0200, Marcin Bernatowicz wrote:
>> Add coverage for unbind/rebind with live child-process GPU handles.
>>
> There is already a change proposed by Nitin here:
> https://patchwork.freedesktop.org/series/166744/
> tests/core_hotunplug: add *-with-load subtests exercising GPU workload during hotplug
>
> If there are bugs uncovered with it then it should be merged
> first.
>
> +cc Nitin Gote <nitin.r.gote@intel.com>

Thanks for pointing out the series! Took a quick look - my scenario is a 
bit more basic.

We create the handles (for Xe vm, exec_queue, etc.), start the workload, 
and stop it right before
unbind to avoid timeouts, all while keeping the device fd open. It runs 
in a separate process
to simulate an independent userspace app (maybe overkill, but that was 
the idea).

Anyway, this could easily be added to Nitin's series. If so, I'd still 
like to keep my
first patch since it ensures the spinner actually starts.

--

Marcin

>
> Regards,
> Kamil
>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> ---
>>   tests/core_hotunplug.c | 98 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>
>> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
>> index 7c9dae1bf..2e5aa8d5c 100644
>> --- a/tests/core_hotunplug.c
>> +++ b/tests/core_hotunplug.c
>> @@ -605,6 +605,92 @@ static void hotunbind_rebind(struct hotunplug *priv)
>>   	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
>>   }
>>   
>> +/*
>> + * Start a spinner in a child process, then end it while keeping child-side
>> + * handles alive. Verifies the parent can unbind and rebind the driver while
>> + * those child handles are still open.
>> + */
>> +static void exec_fork_unbind_rebind_run(struct hotunplug *priv)
>> +{
>> +	struct igt_helper_process child = {};
>> +	int ready_pipe[2], stop_pipe[2];
>> +	char msg = 0;
>> +
>> +	igt_assert_eq(pipe(ready_pipe), 0);
>> +	igt_assert_eq(pipe(stop_pipe), 0);
>> +
>> +	igt_fork_helper(&child) {
>> +		const intel_ctx_t *ctx = NULL;
>> +		uint64_t ahnd = 0;
>> +		igt_spin_t *spin;
>> +		int fd;
>> +
>> +		close(ready_pipe[0]);
>> +		close(stop_pipe[1]);
>> +
>> +		fd = local_drm_open_driver(false, "", " for spinner workload child");
>> +
>> +		if (is_i915_device(fd)) {
>> +			ctx = intel_ctx_create_all_physical(fd);
>> +			ahnd = get_reloc_ahnd(fd, ctx->id);
>> +			spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx,
>> +					    .flags = IGT_SPIN_POLL_RUN);
>> +		} else {
>> +			ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +			spin = igt_spin_new(fd, .ahnd = ahnd);
>> +		}
>> +
>> +		igt_spin_busywait_until_started(spin);
>> +		igt_spin_end(spin);
>> +
>> +		msg = 1;
>> +		igt_assert_eq(write(ready_pipe[1], &msg, sizeof(msg)), sizeof(msg));
>> +		close(ready_pipe[1]);
>> +
>> +		/*
>> +		 * Block until parent completes the driver unbind.
>> +		 * Intentionally skip spinner teardown: we want handles (ex. exec_queue) to
>> +		 * remain alive until fd close.
>> +		 */
>> +		read(stop_pipe[0], &msg, sizeof(msg));
>> +		close(stop_pipe[0]);
>> +
>> +		if (ahnd)
>> +			put_ahnd(ahnd);
>> +		fd = close_device(fd, "child late ", "rebound ");
>> +		igt_assert_eq(fd, -1);
>> +	}
>> +
>> +	close(ready_pipe[1]);
>> +	close(stop_pipe[0]);
>> +
>> +	igt_assert_eq(read(ready_pipe[0], &msg, sizeof(msg)), sizeof(msg));
>> +	close(ready_pipe[0]);
>> +
>> +	driver_unbind(priv, "", 0);
>> +
>> +	close(stop_pipe[1]);
>> +	igt_wait_helper(&child);
>> +
>> +	driver_bind(priv, 0);
>> +}
>> +
>> +/**
>> + * SUBTEST: exec-fork-unbind-rebind
>> + * Description: Check if the driver can be cleanly unbound and rebound while
>> + *		child-process handles remain open
>> + */
>> +static void exec_fork_unbind_rebind(struct hotunplug *priv)
>> +{
>> +	igt_require(priv->chipset == DRIVER_INTEL || priv->chipset == DRIVER_XE);
>> +
>> +	pre_check(priv);
>> +
>> +	exec_fork_unbind_rebind_run(priv);
>> +
>> +	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
>> +}
>> +
>>   static void hotunplug_rescan(struct hotunplug *priv)
>>   {
>>   	pre_check(priv);
>> @@ -757,6 +843,18 @@ int igt_main()
>>   			recover(&priv);
>>   	}
>>   
>> +	igt_fixture()
>> +		post_healthcheck(&priv);
>> +
>> +	igt_subtest_group() {
>> +		igt_describe("Check if the driver can be cleanly unbound and rebound while child-process handles remain open");
>> +		igt_subtest("exec-fork-unbind-rebind")
>> +			exec_fork_unbind_rebind(&priv);
>> +
>> +		igt_fixture()
>> +			recover(&priv);
>> +	}
>> +
>>   	igt_fixture()
>>   		post_healthcheck(&priv);
>>   
>> -- 
>> 2.43.0
>>
