Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC4C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 08:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3A310E4D2;
	Mon, 27 Jan 2025 08:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Vt+8nhx0";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D2510E4D2
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 08:53:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso25931515e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737967983; x=1738572783;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r5qHckLXbwoiwJ7LTBCCIHu+73wwaHEYI26HAejHu1k=;
 b=Vt+8nhx0zxg00UIHQWXxzqd2BUNgB0m2aOMjHRGChvsm0HpVV2Q4tfQRxWhz6GerfQ
 4XmMCHXeABGG4ajT7BzO2OpE7MVafiw5RbMoBl8L9MDmsAv8XEGM7jiZyyJ9rb0oy9zb
 KNCi1f7aUl6mCcGdXr8azLCTgBOm0OjeJP5nczp/A0Dc8qBcMUhZsZSecq5uS2Z/f0ro
 vtT+c+ck/wxt/sgHnwhhAXi9+fX0xmhmlqeSQp6UE+fnvvd3YHaXwkZ76ZbYY+/2yFoy
 BBfvHM5Mi/FGwmWhAZsmdqr1/xWQ5AsytU6dyCDy7xc+iKQ05a1Ds7NaQ0CvE3e/t7zM
 rPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737967983; x=1738572783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5qHckLXbwoiwJ7LTBCCIHu+73wwaHEYI26HAejHu1k=;
 b=rAoKYA1ARY4y0woVufq6uESAc3Gs6EFcqZGiLDOSq9Tyjq50+o/w5wSQ6jK3huRte3
 vrpUKvmB0d6tfeCGe5rkGxoZenAe5glw2sdQuqE2fE2d7NxL/2oBDtxDrSQeVVOFheh2
 wVJpU4HJY+IZkctLsvLEclpCNOVFyrlmiw19F42PhnCaQUu1rR4zqHlwW/h25so3/0aO
 giwWOFCavqqMlUW/o7TlRYHDgpnHnOgevigNRgaX1QbXj0N1UfW9P7s/IeKisMPuQ6rG
 7aQaeC4cDTngFPOkpOgJ86dDxo+0AFR9RHc1ToyIXuIw/rLzXTfJTS/F/NFVDqfC4xqM
 m46A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt2joscfJmF8Ix/UPRfhRGNGOhJd20e8Sr9ZvViRN1gxCbsoDLPp1U667sZ5foouTvroM4CfjW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjJLZZV0DOAoFo86CGb2qTHI7oJimGtONYv1qziTPv1ainD3JK
 arOH9/io/sJTSiBwyJ0U/1QdFZYyjij4KCtkMGCPQOxGV8uIlZu0c0QP9pb9OvLNHj0gea1y6+D
 RoqQ=
X-Gm-Gg: ASbGncvM+lYqTDTW7vQ+HwBc5kj+hQd1XRoN1wuE9H0gaNh1hrBol+4AP/FgMXwMm05
 /SKjYA+9pvda7dCYkWk0uy1cY5Ui0j5IK7aUHYaCLxjs5hSeQfEr6me99J/R11LcnkXd+5XoLDP
 0V6FmKuLPXTA560bacp1/sK3lt9neLQGncY3itMHLJ4PiR5JoVSMkERGDbk8vRK4M2feb8j5J6A
 4FKWEmVoRy8zrp+h6B5jvq9cn8KJ+kEkRqNSeM4FGIijUE30XJOo0YaTlSK7JAOPOCF3ksEpCZk
 YHDFJGyKgmc9XJGWRUBL
X-Google-Smtp-Source: AGHT+IHy1riOw7O8qQlTdyjNks9asxprMtui+RqU+dwCereuWGndfKBUJXjSLxys8I9URgLZnSfx+w==
X-Received: by 2002:a7b:cc07:0:b0:438:a313:cda9 with SMTP id
 5b1f17b1804b1-438bd0a8597mr104222575e9.10.1737967983350; 
 Mon, 27 Jan 2025 00:53:03 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48a906sm126596365e9.18.2025.01.27.00.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 00:53:02 -0800 (PST)
Message-ID: <386b2877-2768-4880-94d9-765216a5fd20@ursulin.net>
Date: Mon, 27 Jan 2025 08:53:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/perf_pmu: Drop cpu-hotplug subtest
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20250123053039.1948302-1-lucas.demarchi@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250123053039.1948302-1-lucas.demarchi@intel.com>
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


On 23/01/2025 05:30, Lucas De Marchi wrote:
> This test has been skipping since a long time (forever?) in CI. The
> reason is that cpu0 is not really hot pluggable. There was an initial
> attempt that got removed with kernel commits 5475abbde77f ("x86/smpboot:
> Remove the CPU0 hotplug kludge") and e59e74dc48a3 ("x86/topology: Remove
> CPU0 hotplug option").
> 
> With those commits there are no more cpu0_hotplug kernel parameter and
> no more BOOTPARAM_HOTPLUG_CPU0 build config.
> 
> The current i915 pmu integration always returns the first cpu in the
> system, which means that it's always cpu0.  The cpu migration is also
> currently wrong and was never detected by this test: it tries to find a
> sibling cpu rather than allowing to migrate to any cpu in the system.
> In order to clean up the i915 side, the hotplug code is being removed in
> favor of the generic one, provided by perf infra. That too has the same
> "issue" that there's no easy way to test, but hopefully receives more
> visibility since it's shared by several drivers.
> 
> If we ever find a way to instrument the kernel to test the hotplug, this
> code can be partially restored.

After your i915 PMU patches to use the common hotplug infrastructure the 
test still cannot work? Still strictly requires cpu0 to be hotpluggable? 
Or could the test be changed so it skips cpu0 if not hotpluggable?

Regards,

Tvrtklo

> 
> References: https://lore.kernel.org/all/20250116222426.77757-1-lucas.demarchi@intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/intel/perf_pmu.c | 142 -----------------------------------------
>   1 file changed, 142 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 5d0467c02..084ef9631 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -101,9 +101,6 @@
>    * SUBTEST: busy-start
>    * Description: Test to verify gpu busyness through engine business pmu counters
>    *
> - * SUBTEST: cpu-hotplug
> - * Description: Test the i915 pmu perf interface
> - *
>    * SUBTEST: enable-race
>    * Description: Test the i915 pmu perf interface
>    *
> @@ -1362,139 +1359,6 @@ static void open_invalid(int i915)
>   	igt_assert_lt(fd, 0);
>   }
>   
> -static bool cpu0_hotplug_support(void)
> -{
> -	return access("/sys/devices/system/cpu/cpu0/online", W_OK) == 0;
> -}
> -
> -static void cpu_hotplug(int gem_fd)
> -{
> -	igt_spin_t *spin[2];
> -	uint64_t ts[2];
> -	uint64_t val;
> -	int link[2];
> -	int fd, ret;
> -	int cur = 0;
> -	char buf;
> -	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
> -
> -	igt_require(cpu0_hotplug_support());
> -
> -	fd = open_pmu(gem_fd,
> -		      I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
> -
> -	/*
> -	 * Create two spinners so test can ensure shorter gaps in engine
> -	 * busyness as it is terminating one and re-starting the other.
> -	 */
> -	spin[0] = igt_spin_new(gem_fd, .ahnd = ahnd,
> -			       .engine = I915_EXEC_DEFAULT);
> -	spin[1] = __igt_spin_new(gem_fd, .ahnd = ahnd,
> -				 .engine = I915_EXEC_DEFAULT);
> -
> -	val = __pmu_read_single(fd, &ts[0]);
> -
> -	ret = pipe2(link, O_NONBLOCK);
> -	igt_assert_eq(ret, 0);
> -
> -	/*
> -	 * Toggle online status of all the CPUs in a child process and ensure
> -	 * this has not affected busyness stats in the parent.
> -	 */
> -	igt_fork(child, 1) {
> -		int cpu = 0;
> -
> -		close(link[0]);
> -
> -		for (;;) {
> -			char name[128];
> -			int cpufd;
> -
> -			igt_assert_lt(snprintf(name, sizeof(name),
> -					       "/sys/devices/system/cpu/cpu%d/online",
> -					       cpu), sizeof(name));
> -			cpufd = open(name, O_WRONLY);
> -			if (cpufd == -1) {
> -				igt_assert_lt(0, cpu);
> -				/*
> -				 * Signal parent that we cycled through all
> -				 * CPUs and we are done.
> -				 */
> -				igt_assert_eq(write(link[1], "*", 1), 1);
> -				break;
> -			}
> -
> -			/* Offline followed by online a CPU. */
> -
> -			ret = write(cpufd, "0", 2);
> -			if (ret < 0) {
> -				/*
> -				 * If we failed to offline a CPU we don't want
> -				 * to proceed.
> -				 */
> -				igt_warn("Failed to offline cpu%u! (%d)\n",
> -					 cpu, errno);
> -				igt_assert_eq(write(link[1], "s", 1), 1);
> -				break;
> -			}
> -
> -			usleep(1e6);
> -
> -			ret = write(cpufd, "1", 2);
> -			if (ret < 0) {
> -				/*
> -				 * Failed to bring a CPU back online is fatal
> -				 * for the sanity of a test run so stop further
> -				 * testing.
> -				 */
> -				igt_warn("Failed to online cpu%u! (%d)\n",
> -					 cpu, errno);
> -				igt_fatal_error();
> -			}
> -
> -			close(cpufd);
> -			cpu++;
> -		}
> -	}
> -
> -	close(link[1]);
> -
> -	/*
> -	 * Very long batches can be declared as GPU hangs so emit shorter ones
> -	 * until the CPU core shuffler finishes one loop.
> -	 */
> -	for (;;) {
> -		usleep(500e3);
> -		end_spin(gem_fd, spin[cur], 0);
> -
> -		/* Check if the child is signaling completion. */
> -		ret = read(link[0], &buf, 1);
> -		if ( ret == 1 || (ret < 0 && errno != EAGAIN))
> -			break;
> -
> -		igt_spin_free(gem_fd, spin[cur]);
> -		spin[cur] = __igt_spin_new(gem_fd, .ahnd = ahnd,
> -					   .engine = I915_EXEC_DEFAULT);
> -		cur ^= 1;
> -	}
> -
> -	val = __pmu_read_single(fd, &ts[1]) - val;
> -
> -	end_spin(gem_fd, spin[0], FLAG_SYNC);
> -	end_spin(gem_fd, spin[1], FLAG_SYNC);
> -	igt_spin_free(gem_fd, spin[0]);
> -	igt_spin_free(gem_fd, spin[1]);
> -	igt_waitchildren();
> -	close(fd);
> -	close(link[0]);
> -	put_ahnd(ahnd);
> -
> -	/* Skip if child signals a problem with offlining a CPU. */
> -	igt_skip_on(buf == 's');
> -
> -	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
> -}
> -
>   static int target_num_interrupts(int i915)
>   {
>   	const intel_ctx_cfg_t cfg = intel_ctx_cfg_all_physical(i915);
> @@ -2650,12 +2514,6 @@ igt_main
>   		all_busy_check_all(fd, ctx, num_engines,
>   				   TEST_BUSY | TEST_TRAILING_IDLE);
>   
> -	/**
> -	 * Test counters are not affected by CPU offline/online events.
> -	 */
> -	igt_subtest("cpu-hotplug")
> -		cpu_hotplug(fd);
> -
>   	/**
>   	 * Test GPU frequency.
>   	 */
