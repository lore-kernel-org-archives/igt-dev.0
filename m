Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C955410E4B8
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 19:59:29 +0000 (UTC)
Message-ID: <362513cf-48e6-7b98-6d57-e998f0d5fbd1@intel.com>
Date: Wed, 26 Jul 2023 21:59:20 +0200
To: <igt-dev@lists.freedesktop.org>
References: <20230725071622.206601-1-janga.rahul.kumar@intel.com>
 <20230725071622.206601-2-janga.rahul.kumar@intel.com>
 <20230725174410.nkztvtel5opmjjel@kamilkon-desk1>
Content-Language: pl
From: "Karas, Anna" <anna.karas@intel.com>
In-Reply-To: <20230725174410.nkztvtel5opmjjel@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe: Add support to reset all
 GT's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com, sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi all,
I have a few minor remarks to add.

On 25.07.2023 19:44, Kamil Konieczny wrote:
> Hi Janga,
> 
> On 2023-07-25 at 12:46:21 +0530, janga.rahul.kumar@intel.com wrote:
>> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>>
>> Add library support to check support for GT reset and
>> force reset all GT's.
>>
>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Cc: Kunal Joshi <kunal1.joshi@intel.com>
>> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>> ---
>>   lib/igt_gt.c      |  7 +++++++
>>   lib/xe/xe_ioctl.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_ioctl.h |  2 ++
>>   3 files changed, 61 insertions(+)
>>
>> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
>> index d4a825e66..2ce464ba6 100644
>> --- a/lib/igt_gt.c
>> +++ b/lib/igt_gt.c
>> @@ -45,6 +45,7 @@
>>   #include "intel_chipset.h"
>>   #include "igt_dummyload.h"
>>   
>> +#include "xe/xe_ioctl.h"
> 
> Add newline here.
> 
>>   /**
>>    * SECTION:igt_gt
>>    * @short_description: GT support library
>> @@ -60,6 +61,9 @@ static int reset_query_once = -1;
>>   
>>   static bool has_gpu_reset(int fd)
>>   {
>> +	if (is_xe_device(fd))
>> +		has_xe_gt_reset(fd);
>> +
>>   	if (reset_query_once < 0) {
>>   		reset_query_once = gem_gpu_reset_type(fd);
>>   
>> @@ -395,6 +399,9 @@ void igt_post_hang_ring(int fd, igt_hang_t arg)
>>    */
>>   void igt_force_gpu_reset(int drm_fd)
>>   {
>> +	if (is_xe_device(drm_fd))
>> +		xe_force_gt_reset_all(drm_fd);
>> +
> 
> Move above code after igt_debug below.
> 
>>   	int dir, wedged;
>>   
>>   	igt_debug("Triggering GPU reset\n");
>> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>> index 1f9240cd9..488aa218e 100644
>> --- a/lib/xe/xe_ioctl.c
>> +++ b/lib/xe/xe_ioctl.c
>> @@ -41,6 +41,7 @@
>>   #include "config.h"
>>   #include "drmtest.h"
>>   #include "igt_syncobj.h"
>> +#include "igt_sysfs.h"
>>   #include "ioctl_wrappers.h"
>>   #include "xe_ioctl.h"
>>   #include "xe_query.h"
>> @@ -455,6 +456,57 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>>   	return ts.tv_sec * 1e9 + ts.tv_nsec;
>>   }
>>   
>> +
>> +/**
>> + * has_xe_gt_reset:
>> + * @fd: open xe drm file descriptor
>> + *
>> + * Check gt force reset syfs entry is available or not
Typo: sysfs.

>> + *
>> + * Returns: reset sysfs entry available
>> + */
>> +bool has_xe_gt_reset(int fd)
>> +{
>> +	char reset_sysfs_path[100];
>> +	struct stat st;
>> +	int gt;
>> +	int reset_sysfs_fd = -1;
>> +	int sysfs_fd = -1;
> 
> Add newline here.
> 
>> +	igt_assert_eq(fstat(fd, &st), 0);
>> +
>> +	sysfs_fd = igt_sysfs_open(fd);
>> +	igt_assert(sysfs_fd != -1);
>> +
>> +	xe_for_each_gt(fd, gt) {
>> +		sprintf(reset_sysfs_path, "/sys/kernel/debug/dri/%d/gt%d/force_reset", minor(st.st_rdev), gt);
>> +		reset_sysfs_fd = openat(sysfs_fd, reset_sysfs_path, O_RDONLY);
>> +
>> +		if(reset_sysfs_fd == -1) {

Separate if and ( with space.

>> +			close(sysfs_fd);
>> +			return 0;
>> +		}
>> +
>> +		close(reset_sysfs_fd);
>> +       }
>> +
>> +	close(sysfs_fd);
>> +	return 1;
>> +}
>> +
>> +/**
>> + * xe_force_gt_reset_all:
>> + *
>> + * Forces reset of all the GT's.
>> + *
This line is not necessary.

>> + */
>> +void xe_force_gt_reset_all(int xe_fd)
>> +{
>> +	int gt;
> 
> Add newline.
> 
> Regards,
> Kamil
> 
>> +	xe_for_each_gt(xe_fd, gt)
>> +		xe_force_gt_reset(xe_fd, gt);
>> +}
>> +
>> +
>>   void xe_force_gt_reset(int fd, int gt)
>>   {
>>   	char reset_string[128];
>> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
>> index 320e0f9f6..5a528b345 100644
>> --- a/lib/xe/xe_ioctl.h
>> +++ b/lib/xe/xe_ioctl.h
>> @@ -87,6 +87,8 @@ int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>>   			       struct drm_xe_engine_class_instance *eci,
>>   			       int64_t timeout);
>>   void xe_force_gt_reset(int fd, int gt);
>> +void xe_force_gt_reset_all(int fd);
>> +bool has_xe_gt_reset(int fd);
>>   void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
>>   		   uint32_t property, uint32_t value);
>>   
>> -- 
>> 2.25.1
>>

Apart from my comments, please check your patch with checkpatch before 
sending v2.
Regards,
Anna
