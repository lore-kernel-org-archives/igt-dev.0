Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0848AC0218B
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 17:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786110E100;
	Fri, 24 Jan 2025 17:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iC0EBebK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F3E10E100
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737738935; x=1769274935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oLqo1aelxfjORu+PECR3xYpu5myf0BhE8uq1pB9D5xk=;
 b=iC0EBebKHMfHlau6kQcXVAZAP9uRi66kIVmKcXNUBXYPxOAFSRJNeu2W
 d6CzcLa+29nzkhCRWjbh9mY0aWrb3tWlVjAE8Jfd0iobPFhx7EYmZv+m0
 cv7XvtakaVUSIxemjiFJscCsalN7bLCwdqCL5oaSEChhdcxnF/h8eXp+5
 iE+yD4LTx9bDwhts6Fov633nApef37HQMay3GI8i+04Dloux8VU2r/wn4
 RhCqPYmPrpZHkJIZgbs7iACQa0jgpaYpbmuBYqwndEmuhsR8y8RuzN7TW
 o/YcvFjxeV5Dbqghd7sLhXapesbXJyY71II1MBXLmZAlP39QUYy3tSnyO Q==;
X-CSE-ConnectionGUID: BZAqKyfDQIeZdlmncmhxFQ==
X-CSE-MsgGUID: gFl5CYP9SEeGzg1DdCodyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42040328"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="42040328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 09:15:35 -0800
X-CSE-ConnectionGUID: WbEra/puQsejnuyC5AFvNQ==
X-CSE-MsgGUID: OJZcNa1ERMikDjy9ZbGCUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112957014"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 09:15:34 -0800
Date: Fri, 24 Jan 2025 18:15:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>, ashutosh.dixit@intel.com,
 james.ausmus@intel.com, felix.j.degrood@intel.com,
 matias.a.cabral@intel.com, joshua.santosh.ranjan@intel.com,
 shubham.kumar@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_eu_stall: Add tests for EU
 stall sampling
Message-ID: <20250124171530.kvyg4k5newenvpqk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Harish Chegondi <harish.chegondi@intel.com>,
 ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com
References: <cover.1735637542.git.harish.chegondi@intel.com>
 <254d672d442bef8d6a628b8bff10a7b1d75f2ad6.1735637542.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <254d672d442bef8d6a628b8bff10a7b1d75f2ad6.1735637542.git.harish.chegondi@intel.com>
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

Hi Harish,
On 2024-12-31 at 01:46:29 -0800, Harish Chegondi wrote:
> A new hardware feature first introduced in PVC gives capability to
> periodically sample EU stall state and record counts for different stall
> reasons, on a per IP basis, aggregate across all EUs in a subslice and
> record the samples in a buffer in each subslice. Eventually, the aggregated
> data is written out to a buffer in the memory. This feature is also
> supported in XE2 and later architecture GPUs.
> 
> Add tests to test EU stall sampling functionality in the Xe driver.
> These tests accept several inputs from the user, enable EU stall counters,
> run a given workload on a child process while the parent process reads
> the stall data and parses the data. The EU stall counters are disabled
> once the workload completes execution.
> 
> If the user doesn't provide any input workload, GPGPU fill is used as
> the workload. gpgpu_fill() and related functions have been reused from
> xe_gpgpu_fill.c.
> 
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

I have only few nits, please ask others for fuller review.
Please also use Linux script checkpatch.pl for finding few style/code
problems, you could ignore some like line too long or typedef,
while there are others which imho should be corrected. See also
CONTRIBUTING.md for few helpful options.

> ---
>  include/drm-uapi/xe_drm.h |  74 +++++

Please split this into a separate patch, also remember to use
install_headers (see README.md)

For what to write in such drm change see

git log -- include/drm-uapi/xe_drm.h

>  tests/intel/xe_eu_stall.c | 579 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   2 +
>  3 files changed, 655 insertions(+)
>  create mode 100644 tests/intel/xe_eu_stall.c
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 56163eb91..d4aff5d01 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -700,6 +700,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_EU_STALL		9
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -1397,6 +1398,8 @@ struct drm_xe_wait_user_fence {
>  enum drm_xe_observation_type {
>  	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
>  	DRM_XE_OBSERVATION_TYPE_OA,
> +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
>  };
>  
>  /**
> @@ -1713,6 +1716,77 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> + *
> + * These properties are passed to the driver at open as a chain of
> + * @drm_xe_ext_set_property structures with @property set to these
> + * properties' enums and @value set to the corresponding values of these
> + * properties. @drm_xe_user_extension base.name should be set to
> + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + *
> + * With the file descriptor obtained from open, user space must enable
> + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> + * calling read(). EIO errno from read() indicates HW dropped data
> + * due to full buffer.
> + */
> +enum drm_xe_eu_stall_property_id {
> +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> +	 * EU stall data will be captured.
> +	 */
> +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> +	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> +	 */
> +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> +	 * EU stall data reports to be present in the kernel buffer
> +	 * before unblocking poll or read that is blocked.
> +	 */
> +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> +};
> +
> +/**
> + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> + *
> + * If a query is made with a struct @drm_xe_device_query where .query
> + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> + * struct @drm_xe_query_eu_stall in .data.
> + */
> +struct drm_xe_query_eu_stall {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @capabilities: EU stall capabilities bit-mask */
> +	__u64 capabilities;
> +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> +
> +	/** @record_size: size of each EU stall data record */
> +	__u64 record_size;
> +
> +	/** @per_xecore_buf_size: Per XeCore buffer size */
> +	__u64 per_xecore_buf_size;
> +
> +	/** @num_sampling_rates: Number of sampling rates supported */
> +	__u64 num_sampling_rates;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[5];
> +
> +	/**
> +	 * @sampling_rates: Flexible array of sampling rates
> +	 * sorted in the fastest to slowest order.
> +	 * Sampling rates are specified in GPU clock cycles.
> +	 */
> +	__u64 sampling_rates[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> new file mode 100644
> index 000000000..754d2c379
> --- /dev/null
> +++ b/tests/intel/xe_eu_stall.c
> @@ -0,0 +1,579 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +/**
> + * TEST: Basic tests for EU stall sampling functionality
> + * Category: Core
> + * Functionality: EU stall sampling
> + * Mega feature: Performance interface
> + * Test category: xe
> + * Sub-category: Performance

Sort fields alphabetically, 'S' before 'T'

> + * Run type: FULL

Remove this field, it is no longer used.

> + *
> + * SUBTEST: non-blocking-read
> + * Description: Verify non-blocking read of EU stall data during a workload run
> + *
> + * SUBTEST: blocking-read
> + * Description: Verify blocking read of EU stall data during a workload run
> + *
> + * SUBTEST: unprivileged-access
> + * Description: Verify unprivileged open of a EU stall data stream fd
> + */
> +
> +#include <poll.h>

Move pollh after fcntl.h

> +#include <fcntl.h>
> +#include <sys/wait.h>

Same here, sys/wait.h after sys/ioctl.h

> +#include <sys/ioctl.h>
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "xe_drm.h"
> +#include "xe/xe_oa.h"
> +#include "xe/xe_ioctl.h"
> +
> +#define OBSERVATION_PARANOID	"/proc/sys/dev/xe/observation_paranoid"
> +
> +#define NUM_ITERS_GPGPU_FILL	100
> +#define DEFAULT_GT_ID		0
> +#define DEFAULT_NUM_REPORTS	1
> +#define DEFAULT_SAMPLE_RATE	(251 * 4)
> +#define DEFAULT_USER_BUF_SIZE	(64 * 512 * 1024)
> +
> +#define WIDTH		64
> +#define HEIGHT		64
> +#define COLOR_88	0x88
> +#define COLOR_4C	0x4c
> +
> +static char *p_args[8];
> +static uint8_t p_gt_id = DEFAULT_GT_ID;
> +static uint32_t p_rate = DEFAULT_SAMPLE_RATE;
> +static uint32_t p_user = DEFAULT_USER_BUF_SIZE;
> +static uint32_t p_num_reports = DEFAULT_NUM_REPORTS;
> +
> +static volatile bool child_is_running = true;
> +
> +/**
> + * struct xe_eu_stall_data_pvc - EU stall data format for PVC
> + *
> + * Bits		Field
> + * 0  to 28	IP (addr)
> + * 29 to 36	active count
> + * 37 to 44	other count
> + * 45 to 52	control count
> + * 53 to 60	pipestall count
> + * 61 to 68	send count
> + * 69 to 76	dist_acc count
> + * 77 to 84	sbid count
> + * 85 to 92	sync count
> + * 93 to 100	inst_fetch count
> + */
> +struct xe_eu_stall_data_pvc {
> +	__u64 ip_addr:29;
> +	__u64 active_count:8;
> +	__u64 other_count:8;
> +	__u64 control_count:8;
> +	__u64 pipestall_count:8;
> +	__u64 send_count:8;
> +	__u64 dist_acc_count:8;
> +	__u64 sbid_count:8;
> +	__u64 sync_count:8;
> +	__u64 inst_fetch_count:8;
> +	__u64 unused_bits:27;
> +	__u64 unused[6];
> +} __attribute__((packed));
> +
> +/**
> + * struct xe_eu_stall_data_xe2 - EU stall data format for LNL, BMG
> + *
> + * Bits		Field
> + * 0  to 28	IP (addr)
> + * 29 to 36	Tdr count
> + * 37 to 44	other count
> + * 45 to 52	control count
> + * 53 to 60	pipestall count
> + * 61 to 68	send count
> + * 69 to 76	dist_acc count
> + * 77 to 84	sbid count
> + * 85 to 92	sync count
> + * 93 to 100	inst_fetch count
> + * 101 to 108	Active count
> + * 109 to 111	Exid
> + * 112		EndFlag (is always 1)
> + */
> +struct xe_eu_stall_data_xe2 {
> +	__u64 ip_addr:29;
> +	__u64 tdr_count:8;
> +	__u64 other_count:8;
> +	__u64 control_count:8;
> +	__u64 pipestall_count:8;
> +	__u64 send_count:8;
> +	__u64 dist_acc_count:8;
> +	__u64 sbid_count:8;
> +	__u64 sync_count:8;
> +	__u64 inst_fetch_count:8;
> +	__u64 active_count:8;
> +	__u64 ex_id:3;
> +	__u64 end_flag:1;
> +	__u64 unused_bits:15;
> +	__u64 unused[6];
> +} __attribute__((packed));
> +
> +union xe_eu_stall_data {
> +	struct xe_eu_stall_data_pvc pvc;
> +	struct xe_eu_stall_data_xe2 xe2;
> +};
> +
> +typedef struct {
> +	int drm_fd;
> +	uint32_t devid;
> +	struct buf_ops *bops;
> +} data_t;
> +
> +static struct intel_buf *
> +create_buf(data_t *data, int width, int height, uint8_t color, uint64_t region)
> +{
> +	struct intel_buf *buf;
> +	uint8_t *ptr;
> +	int i;
> +
> +	buf = calloc(1, sizeof(*buf));
> +	igt_assert(buf);
> +
> +	buf = intel_buf_create(data->bops, width/4, height, 32, 0,
> +			       I915_TILING_NONE, 0);
> +
> +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> +
> +	for (i = 0; i < buf->surface[0].size; i++)
> +		ptr[i] = color;
> +
> +	munmap(ptr, buf->surface[0].size);
> +
> +	return buf;
> +}
> +
> +static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
> +{
> +	uint8_t val;
> +
> +	val = ptr[y * width + x];
> +	igt_assert_f(val == color,
> +		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> +		     color, val, x, y);
> +}
> +
> +static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
> +		       uint32_t surf_width, uint32_t surf_height,
> +		       uint32_t x, uint32_t y,
> +		       uint32_t width, uint32_t height)
> +{
> +	struct intel_buf *buf;
> +	uint8_t *ptr;
> +	int i, j;
> +
> +	buf = create_buf(data, surf_width, surf_height, COLOR_88, region);
> +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> +
> +	for (i = 0; i < surf_width; i++)
> +		for (j = 0; j < surf_height; j++)
> +			buf_check(ptr, surf_width, i, j, COLOR_88);
> +
> +	fill(data->drm_fd, buf, x, y, width, height, COLOR_4C);
> +
> +	for (i = 0; i < surf_width; i++)
> +		for (j = 0; j < surf_height; j++)
> +			if (i >= x && i < width + x &&
> +			    j >= y && j < height + y)
> +				buf_check(ptr, surf_width, i, j, COLOR_4C);
> +			else
> +				buf_check(ptr, surf_height, i, j, COLOR_88);
> +
> +	munmap(ptr, buf->surface[0].size);
> +}
> +
> +static int run_gpgpu_fill(int drm_fd, uint32_t devid)
> +{
> +	data_t data = {drm_fd, devid, NULL};
> +	igt_fillfunc_t fill_fn = NULL;
> +	unsigned i;
> +
> +	data.bops = buf_ops_create(drm_fd);
> +	fill_fn = igt_get_gpgpu_fillfunc(devid);
> +
> +	for (i = 0; i < NUM_ITERS_GPGPU_FILL; i++)
> +		gpgpu_fill(&data, fill_fn, 0, WIDTH, HEIGHT, 16, 16, WIDTH / 2, HEIGHT / 2);
> +
> +	buf_ops_destroy(data.bops);
> +
> +	return EXIT_SUCCESS;
> +}
> +
> +static uint64_t
> +read_u64_file(const char *path)
> +{
> +	FILE *f;
> +	uint64_t val;
> +
> +	f = fopen(path, "r");
> +	igt_assert(f);
> +
> +	igt_assert_eq(fscanf(f, "%"PRIu64, &val), 1);
> +
> +	fclose(f);
> +
> +	return val;
> +}
> +
> +static void
> +write_u64_file(const char *path, uint64_t val)
> +{
> +	FILE *f;
> +
> +	f = fopen(path, "w");
> +	igt_assert(f);
> +
> +	igt_assert(fprintf(f, "%"PRIu64, val) > 0);
> +
> +	fclose(f);
> +}
> +
> +static void set_fd_flags(int fd, int flags)
> +{
> +	int old = fcntl(fd, F_GETFL, 0);
> +
> +	igt_assert_lte(0, old);
> +	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
> +}
> +
> +static inline void enable_paranoid(void)
> +{
> +	write_u64_file(OBSERVATION_PARANOID, 1);
> +}
> +
> +static inline void disable_paranoid(void)
> +{
> +	write_u64_file(OBSERVATION_PARANOID, 0);
> +}
> +
> +/*
> + * Test to verify that only a privileged process can open
> + * a EU stall data stream file descriptor.

s/s EU/an EU/

> + */
> +static void
> +test_non_privileged_access(int drm_fd)
> +{
> +	int paranoid, stream_fd;
> +
> +	paranoid = read_u64_file(OBSERVATION_PARANOID);
> +
> +	igt_fork(child, 1) {
> +		uint64_t properties[] = {
> +			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> +			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> +			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> +		};
> +
> +		struct intel_xe_oa_open_prop props = {
> +			.num_properties = sizeof(properties) / 16,
> +			.properties_ptr = to_user_pointer(properties),
> +		};
> +
> +		if (!paranoid)
> +			enable_paranoid();
> +
> +		igt_drop_root();
> +
> +		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> +					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props, EACCES);
> +	}
> +
> +	igt_waitchildren();
> +
> +	igt_fork(child, 1) {
> +		uint64_t properties[] = {
> +			DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> +			DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> +			DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> +		};
> +
> +		struct intel_xe_oa_open_prop props = {
> +			.num_properties = sizeof(properties) / 16,
> +			.properties_ptr = to_user_pointer(properties),
> +		};
> +
> +		disable_paranoid();
> +
> +		igt_drop_root();
> +
> +		stream_fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> +						DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> +		igt_require_fd(stream_fd);
> +		close(stream_fd);
> +	}
> +
> +	igt_waitchildren();
> +
> +	/* restore paranoid state */
> +	if (paranoid)
> +		enable_paranoid();
> +}
> +
> +static int wait_child(struct igt_helper_process *child_proc)
> +{
> +	int status;
> +
> +	status = igt_wait_helper(child_proc);
> +	if (WIFEXITED(status))
> +		return WEXITSTATUS(status);
> +	if (WIFSIGNALED(status))
> +		return (128 + WTERMSIG(status));
> +	return 0;
> +}
> +
> +static void sighandler(int sig)
> +{
> +	child_is_running = false;
> +}
> +
> +static void parse_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
> +{
> +	int i;
> +	uint8_t *sample_addr;
> +	union xe_eu_stall_data stall_data;
> +
> +	for (i = 0; i < size / sizeof(stall_data); i++) {
> +		sample_addr = buf + (i * sizeof(stall_data));
> +		memcpy(&stall_data, sample_addr, sizeof(stall_data));
> +		if (IS_PONTEVECCHIO(devid)) {
> +			igt_info("ip: 0x%08x ", stall_data.pvc.ip_addr);
> +			igt_info("active: %u ", stall_data.pvc.active_count);
> +			igt_info("other: %u ", stall_data.pvc.other_count);
> +			igt_info("control: %u ", stall_data.pvc.control_count);
> +			igt_info("pipestall: %u ", stall_data.pvc.pipestall_count);
> +			igt_info("send: %u ", stall_data.pvc.send_count);
> +			igt_info("dist_acc: %u ", stall_data.pvc.dist_acc_count);
> +			igt_info("sbid: %u ", stall_data.pvc.sbid_count);
> +			igt_info("sync: %u ", stall_data.pvc.sync_count);
> +			igt_info("inst_fetch: %u\n", stall_data.pvc.inst_fetch_count);
> +		} else {
> +			igt_info("ip: 0x%08x ", stall_data.xe2.ip_addr);
> +			igt_info("tdr: %u ", stall_data.xe2.tdr_count);
> +			igt_info("other: %u ", stall_data.xe2.other_count);
> +			igt_info("control: %u ", stall_data.xe2.control_count);
> +			igt_info("pipestall: %u ", stall_data.xe2.pipestall_count);
> +			igt_info("send: %u ", stall_data.xe2.send_count);
> +			igt_info("dist_acc: %u ", stall_data.xe2.dist_acc_count);
> +			igt_info("sbid: %u ", stall_data.xe2.sbid_count);
> +			igt_info("sync: %u ", stall_data.xe2.sync_count);
> +			igt_info("inst_fetch: %u ", stall_data.xe2.inst_fetch_count);
> +			igt_info("active: %u ", stall_data.xe2.active_count);
> +			igt_info("ex_id: %u ", stall_data.xe2.ex_id);
> +			igt_info("end_flag: %u\n", stall_data.xe2.end_flag);

Do we really need those all prints here? Why not adding some
option and printing this only when that option is given?
Please keep a log to bare minimum. Or you could save this to
a file given in option.

Regards,
Kamil

> +		}
> +	}
> +}
> +
> +/*
> + * Test enables EU stall counters, runs a given workload on a child process
> + * while the parent process reads the stall counters data, disables EU stall
> + * counters once the workload completes execution.
> + */
> +static void
> +test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> +{
> +	uint32_t num_samples = 0, num_drops = 0;
> +	struct igt_helper_process work_load = { };
> +	struct sigaction sa = { 0 };
> +	int ret, flags, stream_fd;
> +	uint64_t total_size = 0;
> +	uint8_t *buf;
> +
> +	uint64_t properties[] = {
> +		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
> +		DRM_XE_EU_STALL_PROP_SAMPLE_RATE, p_rate,
> +		DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS, p_num_reports,
> +	};
> +
> +	struct intel_xe_oa_open_prop props = {
> +		.num_properties = sizeof(properties) / 16,
> +		.properties_ptr = to_user_pointer(properties),
> +	};
> +
> +	struct drm_xe_query_eu_stall *eu_stall_data;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_info("User buffer size: %u\n", p_user);
> +	if (p_args[0])
> +		igt_info("Workload: %s\n", p_args[0]);
> +	else
> +		igt_info("Workload: GPGPU fill\n");
> +
> +	buf = malloc(p_user);
> +	igt_assert(buf);
> +
> +	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	eu_stall_data = malloc(query.size);
> +	igt_assert(eu_stall_data);
> +
> +	query.data = to_user_pointer(eu_stall_data);
> +	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	igt_assert(eu_stall_data->num_sampling_rates > 0);
> +	/* Set sampling rate to the fastest available one */
> +	properties[3] = eu_stall_data->sampling_rates[0];
> +	igt_info("Sampling Rate: %u\n", (unsigned)eu_stall_data->sampling_rates[0]);
> +
> +	stream_fd = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_TYPE_EU_STALL,
> +					DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
> +	igt_require_fd(stream_fd);
> +
> +	if (!blocking_read)
> +		flags = O_CLOEXEC | O_NONBLOCK;
> +	else
> +		flags = O_CLOEXEC;
> +
> +	set_fd_flags(stream_fd, flags);
> +
> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> +
> +	sa.sa_handler = sighandler;
> +	if (sigaction(SIGCHLD, &sa, NULL) == -1) {
> +		igt_critical("Failed to register SIGCHLD signal handler \n");
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +
> +	child_is_running = true;
> +	/* Child process runs the workload */
> +	igt_fork_helper(&work_load) {
> +		setpgid(0, 0);
> +		if (p_args[0]) {
> +			execv(p_args[0], p_args);
> +			_exit(EXIT_FAILURE);
> +		} else {
> +			_exit(run_gpgpu_fill(drm_fd, devid));
> +		}
> +	}
> +	/* Parent process reads the EU stall counters data */
> +	do {
> +		if (!blocking_read) {
> +			struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
> +			ret = poll(&pollfd, 1, 0);
> +			if (ret <= 0)
> +				continue;
> +			igt_assert_eq(ret, 1);
> +			igt_assert(pollfd.revents & POLLIN);
> +		}
> +		ret = read(stream_fd, buf, p_user);
> +		if (ret > 0) {
> +			total_size += ret;
> +			parse_eu_stall_data(devid, buf, ret);
> +			num_samples += ret / eu_stall_data->record_size;
> +		} else if ((ret < 0) && (errno != EAGAIN)) {
> +			if (errno == EINTR)
> +				continue;
> +			if (errno == EIO) {
> +				num_drops++;
> +				continue;
> +			}
> +			igt_critical("read() - ret: %d, errno: %d \n", ret, errno);
> +			kill(-work_load.pid, SIGTERM);
> +			break;
> +		}
> +	} while(child_is_running);
> +
> +	igt_info("Total size read: %lu\n", total_size);
> +	igt_info("Number of samples: %u\n", num_samples);
> +	igt_info("Number of drops reported: %u\n", num_drops);
> +
> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> +
> +	close(stream_fd);
> +	free(buf);
> +
> +	ret = wait_child(&work_load);
> +	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d \n", ret, errno);
> +	igt_assert_f(num_samples, "No EU stalls detected during the workload \n");
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		p_num_reports = strtoul(optarg, NULL, 0);
> +		break;
> +	case 'g':
> +		p_gt_id = strtoul(optarg, NULL, 0);
> +		break;
> +	case 'r':
> +		p_rate = strtoul(optarg, NULL, 0);
> +		break;
> +	case 'u':
> +		p_user = strtoul(optarg, NULL, 0);
> +		break;
> +	case 'w':
> +		p_args[0] = optarg;
> +		p_args[1] = NULL;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =  "  --rate | -r\t\tSampling rate in GPU cycles\n"
> +			"  --user_buf_sz | -u\t\tUser buffer size\n"
> +			"  --gt_id | -g\t\tGT ID for the GT to sample EU stalls\n"
> +			"  --event_count | -e\t\tPoll event report count\n"
> +			"  --workload | -w\t\tWorkload to run\n";
> +
> +static struct option long_options[] = {
> +	{"rate", 0, 0, 'r'},
> +	{"user_buf_sz", 0, 0, 'u'},
> +	{"gt_id", 0, 0, 'g'},
> +	{"event_count", 0, 0, 'e'},
> +	{"workload", 0, 0, 'w'},
> +	{ NULL, 0, 0, 0 }
> +};
> +
> +igt_main_args("e:g:r:u:w:", long_options, help_str, opt_handler, NULL)
> +{
> +	int drm_fd;
> +	uint32_t devid;
> +	bool blocking_read = true;
> +
> +	igt_fixture {
> +		drm_fd = drm_open_driver(DRIVER_XE);
> +		igt_require_fd(drm_fd);
> +		devid = intel_get_drm_devid(drm_fd);
> +		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> +		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> +	}
> +
> +	igt_describe("Verify non-blocking read of EU stall data during a workload run");
> +	igt_subtest("non-blocking-read") {
> +		test_eustall(drm_fd, devid, !blocking_read);
> +	}
> +
> +	igt_describe("Verify blocking read of EU stall data during a workload run");
> +	igt_subtest("blocking-read") {
> +		test_eustall(drm_fd, devid, blocking_read);
> +	}
> +
> +	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
> +	igt_subtest("unprivileged-access")
> +		test_non_privileged_access(drm_fd);
> +
> +	igt_fixture {
> +		drm_close_driver(drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 89bba6454..b60f0f1ec 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -281,6 +281,7 @@ intel_xe_progs = [
>  	'xe_dma_buf_sync',
>  	'xe_debugfs',
>  	'xe_drm_fdinfo',
> +	'xe_eu_stall',
>  	'xe_evict',
>  	'xe_evict_ccs',
>  	'xe_exec_atomic',
> @@ -387,6 +388,7 @@ extra_dependencies = {
>  	'perf': [ lib_igt_i915_perf ],
>  	'perf_pmu':  [ lib_igt_perf ],
>  	'sw_sync': [ libatomic ],
> +	'xe_eu_stall': [ lib_igt_xe_oa ],
>  	'xe_oa': [ lib_igt_xe_oa ],
>  }
>  
> -- 
> 2.47.1
> 
