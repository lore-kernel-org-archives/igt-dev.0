Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B8DD3516F
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 10:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2210EC65;
	Wed,  1 Apr 2026 10:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCBXw7mQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B65310E9E0
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775039381; x=1806575381;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1A6TVmyvAnA0wTz5F5sX/7W+Fay9xXdCzegxzwYWNRg=;
 b=OCBXw7mQn/852AbMLh/j2hPyVlo6XxgwjLod91J7w56pyZVvmwRiEMSn
 K7yMnY2L346YF+TNHY5e6k5IzSiehld2eBqBoyodqA/lC6GbppMHsX+rz
 gWRoDk0PaISvDCrr6mSWEeYxeyqUzWcgfvawYPsJDQeLsHb78Kp1SNkdI
 eeY9P7KORSBOWHVrwwo47iPq285yEPpuepYdWmukXCN2nZ7oKEeh2tk+5
 xd14KVt3wk+VvnhJDhz4JBAQYQjaCgfldfEbGuzRmKMgYdRTdbvsmg3Tr
 VmqMXqwzyOaeTBdyJ7bWI3pKYyxlGDD/giQBJ64/t7YK+98p+aloOPA4j A==;
X-CSE-ConnectionGUID: PKAAu+pAQO6gMaN2im2bOg==
X-CSE-MsgGUID: hzk2NPmhSiSf2vDeqgoFWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101524373"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="101524373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:29:41 -0700
X-CSE-ConnectionGUID: rpHdHsvNQveYeEQ1HUFs/Q==
X-CSE-MsgGUID: Z6TCQm8zRB+AfI422zUvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="264566045"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.182])
 ([10.245.244.182])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:29:39 -0700
Message-ID: <ea87318d-3405-4083-a5d9-b4a04ce91343@intel.com>
Date: Wed, 1 Apr 2026 11:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] drm/xe/xe_pm: Have high VRAM usage during
 system suspend
To: Karthik Poosa <karthik.poosa@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com, 
 rodrigo.vivi@intel.com, raag.jadav@intel.com
References: <20260331181356.4133309-1-karthik.poosa@intel.com>
 <20260331181356.4133309-2-karthik.poosa@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260331181356.4133309-2-karthik.poosa@intel.com>
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

On 31/03/2026 19:13, Karthik Poosa wrote:
> Create high VRAM usage by allocating a large BO prior to system suspend.
> This increases eviction time, helping to expose any unknown issues in the
> suspend‑resume flow.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 54f2e9d18..bff3b1cac 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -69,6 +69,8 @@ static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
>   static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
>   static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
>   static bool child_ready = false;
> +uint32_t *map_large_buf;
> +uint64_t buf_size = 0;
>   
>   typedef struct {
>   	device_t device;
> @@ -871,6 +873,75 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
>   	close(i2c_fd);
>   }
>   
> +static void alloc_large_buf(int fd_xe)
> +{
> +	struct drm_xe_query_mem_regions *mem_regions;
> +	uint64_t vram_used_mb = 0, vram_total_mb = 0;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_REGIONS,
> +		.size = 0,
> +		.data = 0,
> +	};
> +	uint32_t bo, placement;
> +	int i = 0;
> +
> +	igt_require(xe_has_vram(fd_xe));

IIUC this is going to now skip the entire subtest on igpu?

> +	placement = vram_memory(fd_xe, 0);
> +	igt_require_f(placement, "Device doesn't support vram memory region\n");
> +
> +	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	mem_regions = malloc(query.size);
> +	igt_assert(mem_regions);
> +
> +	query.data = to_user_pointer(mem_regions);
> +	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	for (i = 0; i < mem_regions->num_mem_regions; i++) {
> +		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
> +			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
> +			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
> +		}

Will this be well behaved on multi-tile? Maybe add a break on the first 
instance?

Also will this potentially run into issues with RAM sizing? When we move 
stuff out of VRAM we kick it out to RAM, so needs to fit.

> +	}
> +
> +	igt_debug("Before large_buf alloc vram total %lu MB, used vram_used %lu MB\n", vram_total_mb, vram_used_mb);
> +
> +	// Allocate a BO of the size of available free VRAM
> +	buf_size = (vram_total_mb-vram_used_mb-1)*1024*1024;
> +	buf_size = ALIGN(buf_size, xe_get_default_alignment(fd_xe));
> +	igt_debug("Creating large_buf of size %lu MB\n", (buf_size/(1024*1024)));
> +	bo = xe_bo_create(fd_xe, 0, buf_size , placement, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	igt_require(bo);
> +	map_large_buf = xe_bo_map(fd_xe, bo, buf_size);
> +	igt_assert(map_large_buf != MAP_FAILED);
> +	memset(map_large_buf, 0, buf_size);
> +
> +	for (i = 0; i < buf_size / sizeof(*map_large_buf); i++) {
> +		map_large_buf[i] = 0xDEADBEAF;

Is this not going to be too slow, if this massive BO? Also do we need 
non-zero pages for this scenario?

Other option is maybe creating a few hundred small VRAM BOs, and then 
trigger suspend. I think that was roughly my original repro. Main thing 
is just to somehow get a good number of GPU jobs from the suspend, with 
the hope that at least one is signalled but not yet freed. There should 
be at least one job per BO. Big BO also works though, with roughly one 
GPU job per ~8M. Maybe if we go with one big BO we can make the size 
something like ~80% or perhaps even way smaller? RAM sizing is one 
concern, but also some small allocation triggering eviction before the 
suspend kicks in. It might be that going really big doesn't actually 
help much with hitting the race.

> +	}
> +
> +	query.data = to_user_pointer(mem_regions);
> +	igt_assert_eq(igt_ioctl(fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	for (i = 0; i < mem_regions->num_mem_regions; i++) {
> +		if (mem_regions->mem_regions[i].mem_class == DRM_XE_MEM_REGION_CLASS_VRAM) {
> +			vram_used_mb +=  (mem_regions->mem_regions[i].used / (1024 * 1024));
> +			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
> +		}
> +	}
> +	igt_info("After alloc vram total %lu MB, used vram_used %lu MB\n", vram_total_mb, vram_used_mb);
> +
> +	free(mem_regions);
> +}
> +
> +static void free_large_buf(int fd_xe)
> +{
> +	igt_info("Freeing large_buf\n");
> +	if (map_large_buf)
> +		munmap(map_large_buf, buf_size);
> +}
> +
>   int igt_main()
>   {
>   	device_t device;
> @@ -925,26 +996,34 @@ int igt_main()
>   	}
>   
>   	for (const struct s_state *s = s_states; s->name; s++) {
> +
>   		igt_subtest_f("%s-basic", s->name) {
>   			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>   				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +			alloc_large_buf(device.fd_xe);
>   			igt_system_suspend_autoresume(s->state, test);
> +			free_large_buf(device.fd_xe);
>   		}
>   
>   		igt_subtest_f("%s-basic-exec", s->name) {
> +			alloc_large_buf(device.fd_xe);
>   			test_exec(device, 1, 2, s->state, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>   		}
>   
>   		igt_subtest_f("%s-exec-after", s->name) {
>   			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>   				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
> +			alloc_large_buf(device.fd_xe);
>   			igt_system_suspend_autoresume(s->state, test);
>   			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>   		}
>   
>   		igt_subtest_f("%s-multiple-execs", s->name) {
> +			alloc_large_buf(device.fd_xe);
>   			test_exec(device, 16, 32, s->state, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>   		}
>   
>   		for (const struct vm_op *op = vm_op; op->name; op++) {
> @@ -962,8 +1041,11 @@ int igt_main()
>   			}
>   		}
>   
> -		igt_subtest_f("%s-mocs", s->name)
> +		igt_subtest_f("%s-mocs", s->name) {
> +			alloc_large_buf(device.fd_xe);
>   			test_mocs_suspend_resume(device, s->state, NO_RPM);
> +			free_large_buf(device.fd_xe);
> +		}
>   	}
>   
>   	igt_fixture() {

