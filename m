Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F82D730A2
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 06:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A610E449;
	Fri,  3 Apr 2026 06:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i502FRbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909E10E43B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775198628; x=1806734628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f+F57ZJjGwzpBCXOjFjitpVJv79jEa7Ss0JhoS+FBHo=;
 b=i502FRbqUTCE1BfmYqWAPpPOkbTJVzfkiP1gI2DgG/60mZfr1bznkRsf
 RiXdoJF2VUpDJncVq1m1N3nBVN1utfacjs6a2jpnlds+ZAHWhqotvIlyY
 W4YVFA457z9urokK4Jrfj527X+usv8/aTjHUuZyLAzVqSu9pe1BW/AVhk
 i7VNtJtnmoGP6M1Np0NaAG2FWaXaUYta2v6jODZlljN2umS7NXVqiBdKx
 td4UGAFNg0Vs8EmO7Y/OUCbQG9BAUQr+Cnny/Hvs1e9O4VvycKQU6muoI
 2n7IIr02eklTxypI9+SRVfCEk8mELgil+Y9HumW4mPmSVXA25DY88HqSM w==;
X-CSE-ConnectionGUID: vdjEpcXMTCKZNl+gaUEjrA==
X-CSE-MsgGUID: LJikJBUHSneaX1A1dGJ8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93659161"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="93659161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 23:43:47 -0700
X-CSE-ConnectionGUID: iAHz5P3vRz+dqz6Zpq9eOA==
X-CSE-MsgGUID: auUCOgb+RHOCXoFMvC715g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="222335041"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 23:43:45 -0700
Date: Fri, 3 Apr 2026 08:43:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com, 
 badal.nilawar@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com, 
 matthew.auld@intel.com, raag.jadav@intel.com
Subject: Re: [PATCH i-g-t v1 1/1] drm/xe/xe_pm: Have high VRAM usage during
 system suspend
Message-ID: <f4q7luk2x6mipt4cm2kgi7mdjtkegb7dfvmzh62ri7rymaa35l@hgtci7p7un67>
References: <20260331181356.4133309-1-karthik.poosa@intel.com>
 <20260331181356.4133309-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331181356.4133309-2-karthik.poosa@intel.com>
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

On Tue, Mar 31, 2026 at 11:43:56PM +0530, Karthik Poosa wrote:
> Create high VRAM usage by allocating a large BO prior to system suspend.
> This increases eviction time, helping to expose any unknown issues in the
> suspend‑resume flow.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  tests/intel/xe_pm.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 54f2e9d18..bff3b1cac 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -69,6 +69,8 @@ static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
>  static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
>  static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
>  static bool child_ready = false;
> +uint32_t *map_large_buf;
> +uint64_t buf_size = 0;
>  
>  typedef struct {
>  	device_t device;
> @@ -871,6 +873,75 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
>  	close(i2c_fd);
>  }
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

It will be a little more readable: 1024 * 1024 => SZ_1M

--
Zbigniew


> +			vram_total_mb += (mem_regions->mem_regions[i].total_size / (1024 * 1024));
> +		}
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
>  int igt_main()
>  {
>  	device_t device;
> @@ -925,26 +996,34 @@ int igt_main()
>  	}
>  
>  	for (const struct s_state *s = s_states; s->name; s++) {
> +
>  		igt_subtest_f("%s-basic", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +			alloc_large_buf(device.fd_xe);
>  			igt_system_suspend_autoresume(s->state, test);
> +			free_large_buf(device.fd_xe);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", s->name) {
> +			alloc_large_buf(device.fd_xe);
>  			test_exec(device, 1, 2, s->state, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
> +			alloc_large_buf(device.fd_xe);
>  			igt_system_suspend_autoresume(s->state, test);
>  			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
> +			alloc_large_buf(device.fd_xe);
>  			test_exec(device, 16, 32, s->state, NO_RPM, 0);
> +			free_large_buf(device.fd_xe);
>  		}
>  
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
> @@ -962,8 +1041,11 @@ int igt_main()
>  			}
>  		}
>  
> -		igt_subtest_f("%s-mocs", s->name)
> +		igt_subtest_f("%s-mocs", s->name) {
> +			alloc_large_buf(device.fd_xe);
>  			test_mocs_suspend_resume(device, s->state, NO_RPM);
> +			free_large_buf(device.fd_xe);
> +		}
>  	}
>  
>  	igt_fixture() {
> -- 
> 2.25.1
> 
