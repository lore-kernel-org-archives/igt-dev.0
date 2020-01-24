Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D96E191
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 00:43:04 +0000 (UTC)
References: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
 <87muaddb6z.wl-ashutosh.dixit@intel.com>
From: vbelgaum <vinay.belgaumkar@intel.com>
Message-ID: <c38d4045-923a-e7c2-9559-3df5ab45439b@intel.com>
Date: Thu, 23 Jan 2020 16:42:40 -0800
MIME-Version: 1.0
In-Reply-To: <87muaddb6z.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_mmap_wc: Update test to use
 mmap_wc IOCTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 01/23/2020 03:07 PM, Dixit, Ashutosh wrote:
> On Wed, 22 Jan 2020 15:33:26 -0800, Vinay Belgaumkar wrote:
>> Purpose of this test is to validate the mmap_wc ioctl. After recent
>> additions to library wrappers, the local wrapper ended up calling
>> the unintended mmap. Also check for presence of mappable GGTT before
>> testing it.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> ---
>>   tests/i915/gem_mmap_wc.c | 59 ++++++++++++++++++++++++----------------
>>   1 file changed, 35 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
>> index 375a9b50..27334b6d 100644
>> --- a/tests/i915/gem_mmap_wc.c
>> +++ b/tests/i915/gem_mmap_wc.c
>> @@ -51,19 +51,36 @@ struct local_i915_gem_mmap_v2 {
>>
>>   static int OBJECT_SIZE = 16*1024*1024;
>>
>> +static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
>> +{
>> +	int err = 0;
>> +
>> +	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_MMAP, arg))
>> +		err = -errno;
>> +
>> +	errno = 0;
>> +	return err;
>> +}
>> +
>>   /*
>>    * Local WC mmap wrapper. This is used to make sure we go through
>>    * the GEM_MMAP IOCTL.
>>    * */
>>   static void *
>> -local_gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot)
>> +local_gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size)
>>   {
>> -	void *ptr;
>>
>> -	ptr = __gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
>> -	igt_assert(ptr);
>> +	struct drm_i915_gem_mmap arg = {
>> +		.handle = handle,
>> +		.offset = offset,
>> +		.size = size,
>> +		.flags = I915_MMAP_WC,
>> +	};
>>
>> -	return ptr;
>> +	igt_assert_eq(mmap_ioctl(fd, &arg), 0);
> Sorry maybe I am missing something but could you please explain which
> unintended mmap is being called, at least at this point it seems
> __gem_mmap__wc() is also calling the DRM_IOCTL_I915_GEM_MMAP ioctl? I agree
> the protection flags are unused and can be removed.

Agree. This change is not needed.

>
>> @@ -593,14 +600,18 @@ igt_main
>> 		run_without_prefault(fd, test_read);
>> 	igt_subtest("write-no-prefault")
>> 		run_without_prefault(fd, test_write);
>> -	igt_subtest("write-gtt-no-prefault")
>> +	igt_subtest("write-gtt-no-prefault") {
>> +		gem_require_mappable_ggtt(fd);
>> 		run_without_prefault(fd, test_write_gtt);
> test_write_gtt() is actually named incorrectly, it is actually setting up a
> WC mapping so no need to skip?

Agree. The bigger question is whether pre-faulting is any different when 
there is/isn't a mappable aperture,
and if so, should this subtest be renamed.

>
>> +	}
>> 	igt_subtest("write-cpu-read-wc")
>> 		test_write_cpu_read_wc(fd, 1);
>> 	igt_subtest("write-cpu-read-wc-unflushed")
>> 		test_write_cpu_read_wc(fd, 0);
>> -	igt_subtest("write-gtt-read-wc")
>> +	igt_subtest("write-gtt-read-wc") {
>> +		gem_require_mappable_ggtt(fd);
>> 		test_write_gtt_read_wc(fd);
> Here it is ok to skip I think.

Thanks for the review,
Vinay.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
