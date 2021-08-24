Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBA6898D9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 18:58:45 +0000 (UTC)
Date: Tue, 24 Aug 2021 11:58:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210824185842.GB18188@unerlige-ril-10.165.21.208>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
 <20210803200737.30843-2-umesh.nerlige.ramappa@intel.com>
 <87czq326h1.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <87czq326h1.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH 2/5] i915/perf: Add tests for mapped OA buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 02:31:38PM -0700, Dixit, Ashutosh wrote:
>On Tue, 03 Aug 2021 13:07:34 -0700, Umesh Nerlige Ramappa wrote:
>>
>> For applications that need a faster way to access reports in the OA
>> buffer, i915 now provides a way to map the OA buffer to privileged user
>> space. Validate the mapped OA buffer.
>>
>> v2: Fail on forked-privileged access to mapped oa buffer (Chris)
>
>A few nits/questions below otherwise this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>> index a1c0030c..bb7d5e73 100644
>> --- a/include/drm-uapi/i915_drm.h
>> +++ b/include/drm-uapi/i915_drm.h
>> @@ -2151,6 +2151,39 @@ struct drm_i915_perf_open_param {
>>   */
>>  #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
>>
>> +/*
>> + * Returns OA buffer properties to be used with mmap.
>> + *
>> + * This ioctl is available in perf revision 8.
>> + */
>> +#define I915_PERF_IOCTL_GET_OA_BUFFER_INFO _IOWR('i', 0x3, struct drm_i915_perf_oa_buffer_info)
>> +
>> +/**
>> + * OA buffer size and offset.
>> + *
>> + * OA output buffer
>> + *   type: 0
>> + *   flags: mbz
>> + *
>> + *   After querying the info, pass (size,offset) to mmap(),
>> + *
>> + *   mmap(0, info.size, PROT_READ, MAP_PRIVATE, perf_fd, info.offset).
>> + *
>> + *   Note that only a private (not shared between processes, or across fork())
>> + *   read-only mmapping is allowed.
>> + *
>> + *   Userspace must treat the incoming data as tainted, but it conforms to the OA
>
>What does tainted mean?

I'd assume the data is changing as OA buffer reports are captured. I can 
change the comment to say that instead of tainted.

>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index fa3840eb..4d4808ce 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -5156,6 +5156,266 @@ static void test_oa_regs_whitelist(int paranoid)
>>	intel_register_access_fini(&mmio_data);
>>  }
>>
>> +#define OA_BUFFER_DATA(tail, head, oa_buffer_size) \
>> +	(((tail) - (head)) & ((oa_buffer_size) - 1))
>> +
>> +#ifndef MAP_FAILED
>> +#define MAP_FAILED ((void *)-1)
>> +#endif
>
>Shouldn't need this, should just '#include <sys/mman.h>'.
>
>> +static uint32_t oa_status_reg(void)
>> +{
>> +	uint32_t status;
>> +
>> +	intel_register_access_init(&mmio_data, intel_get_pci_device(),
>> +				   0, drm_fd);
>> +	if (IS_HASWELL(devid))
>> +		status = intel_register_read(&mmio_data, 0x2346) & 0x7;
>> +	else if (IS_GEN12(devid))
>> +		status = intel_register_read(&mmio_data, 0xdafc) & 0x7;
>> +	else
>> +		status = intel_register_read(&mmio_data, 0x2b08) & 0xf;
>
>OK, looks like these can be read directly after they are whitelisted by the
>kernel.

This is reading from pci mmio space which can happen regardless of 
whitelisting. This is just for verification. Ideally we want to read 
these registers from a batch which I plan to do in a future series.

Regards,
Umesh

>
>> +static void try_invalid_access(void *vaddr)
>> +{
>> +	sighandler_t old_sigsegv;
>> +	uint32_t dummy;
>> +
>> +	old_sigsegv = signal(SIGSEGV, sigtrap);
>> +	switch (sigsetjmp(jmp, SIGSEGV)) {
>> +	case SIGSEGV:
>> +		break;
>> +	case 0:
>> +		dummy = READ_ONCE(*((uint32_t *)vaddr + 1));
>
>I would just read vaddr, not (vaddr + 1).
>
>> +static void *map_oa_buffer(uint32_t *size)
>> +{
>> +	struct drm_i915_perf_oa_buffer_info oa_buffer = { 0 };
>> +	void *vaddr;
>> +
>> +	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
>> +
>> +	igt_debug("size        = %llu\n", oa_buffer.size);
>> +	igt_debug("offset      = %llx\n", oa_buffer.offset);
>> +
>> +	igt_assert_eq(oa_buffer.size & (oa_buffer.size - 1), 0);
>> +	igt_assert_eq(oa_status_reg(), 0);
>> +
>> +	vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, oa_buffer.offset);
>> +	igt_assert(vaddr != NULL);
>
>Should probably be:
>	igt_assert(vaddr != MAP_FAILED && vaddr != NULL);
