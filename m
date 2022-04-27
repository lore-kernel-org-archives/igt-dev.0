Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EBF10ED77
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 22:12:32 +0000 (UTC)
Message-ID: <622d248f-9e16-552b-6118-587b56f6fe96@intel.com>
Date: Wed, 27 Apr 2022 15:12:18 -0700
Content-Language: en-US
To: "Ye, Tony" <tony.ye@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220427214436.1815778-1-daniele.ceraolospurio@intel.com>
 <61ed5fb2-6808-5c58-3a1a-e8169357c966@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <61ed5fb2-6808-5c58-3a1a-e8169357c966@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_huc_copy: cover reset and
 suspend/resume scenarios
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 4/27/2022 2:58 PM, Ye, Tony wrote:
>
> On 4/27/2022 2:44 PM, Daniele Ceraolo Spurio wrote:
>> Additional subtests have been added to make sure the HuC keeps working
>> after GT reset and suspend/resume.
>>
>> Cc: Tony Ye <tony.ye@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   tests/i915/gem_huc_copy.c | 118 ++++++++++++++++++++++++++++----------
>>   1 file changed, 89 insertions(+), 29 deletions(-)
>>
>> diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
>> index ea32b705..ef577824 100644
>> --- a/tests/i915/gem_huc_copy.c
>> +++ b/tests/i915/gem_huc_copy.c
>> @@ -40,6 +40,13 @@ IGT_TEST_DESCRIPTION("A very simple workload for 
>> the HuC.");
>>     #define HUC_COPY_DATA_BUF_SIZE    4096
>>   +enum operation {
>> +    GPU_RESET,
>> +    SUSPEND_RESUME,
>> +    HIBERNATE_RESUME,
>> +    SIMPLE_COPY,
>> +};
>> +
>>   static void
>>   compare_huc_copy_result(int drm_fd, uint32_t src_handle, uint32_t 
>> dst_handle)
>>   {
>> @@ -84,12 +91,77 @@ static void test_huc_load(int fd)
>>       igt_fail_on_f(status == 0, "HuC firmware is not running!\n");
>>   }
>>   +static void huc_copy_test(int drm_fd, uint64_t ahnd,
>> +              igt_huc_copyfunc_t huc_copy, enum operation op)
>> +{
>> +    char inputs[HUC_COPY_DATA_BUF_SIZE];
>> +    struct drm_i915_gem_exec_object2 obj[3];
>> +    uint64_t objsize[3] = { HUC_COPY_DATA_BUF_SIZE,
>> +                HUC_COPY_DATA_BUF_SIZE,
>> +                4096 };
>> +
>> +    switch (op) {
>> +    case GPU_RESET:
>> +        igt_force_gpu_reset(drm_fd);
>
> The issue in VLK-33957 is not reproducible with a forced gpu reset 
> through the i915_wedged debugfs. It is also not reproducible with 
> igt_hang_ctx(). Only a real GPU HANG can reproduce the issue.

The bug you're referencing is about recovery of an hung context and it 
is not what these new tests are for. What I want to test here is whether 
the HuC itself is working correctly after a GT reset or suspend/resume 
flow. This is to make sure we don't break anything with the upcoming DG2 
changes, because the flow and timing are completely different with GSC 
loading the HuC. Hibernation/resume is going to be especially tricky, 
because HuC load will happen after i915 resume is complete, so we'll 
have to synchronize.

Daniele

>
> Thanks,
>
> Tony
>
>> +        break;
>> +
>> +    case SUSPEND_RESUME:
>> +        igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> +                          SUSPEND_TEST_NONE);
>> +        break;
>> +
>> +    case HIBERNATE_RESUME:
>> +        igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
>> +                          SUSPEND_TEST_NONE);
>> +        break;
>> +
>> +    case SIMPLE_COPY:
>> +        break;
>> +
>> +    default:
>> +        igt_assert(0);
>> +    }
>> +
>> +    test_huc_load(drm_fd);
>> +    /* Initialize src buffer randomly */
>> +    srand(time(NULL));
>> +    for (int i = 0; i < HUC_COPY_DATA_BUF_SIZE; i++)
>> +        inputs[i] = (char) (rand() % 256);
>> +
>> +    memset(obj, 0, sizeof(obj));
>> +    /* source buffer object for storing input */
>> +    obj[0].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
>> +    /* destination buffer object to receive input */
>> +    obj[1].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
>> +    /* execution buffer object */
>> +    obj[2].handle = gem_create(drm_fd, 4096);
>> +
>> +    gem_write(drm_fd, obj[0].handle, 0, inputs, 
>> HUC_COPY_DATA_BUF_SIZE);
>> +
>> +    huc_copy(drm_fd, ahnd, obj, objsize);
>> +    compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
>> +
>> +    gem_close(drm_fd, obj[0].handle);
>> +    gem_close(drm_fd, obj[1].handle);
>> +    gem_close(drm_fd, obj[2].handle);
>> +}
>> +
>>   igt_main
>>   {
>>       int drm_fd = -1;
>>       uint32_t devid;
>>       igt_huc_copyfunc_t huc_copy;
>>       uint64_t ahnd;
>> +    const struct {
>> +        const char *name;
>> +        enum operation op;
>> +    } ops[] =   {
>> +        { "", SIMPLE_COPY },
>> +        { "-after-reset", GPU_RESET },
>> +        { "-after-suspend-resume", SUSPEND_RESUME },
>> +        { "-after-hibernate-resume", HIBERNATE_RESUME },
>> +        { }
>> +    }, *op;
>>         igt_fixture {
>>           drm_fd = drm_open_driver(DRIVER_INTEL);
>> @@ -106,35 +178,23 @@ igt_main
>>                "by copying a char array using Huc"
>>                "and verifying the copied result");
>>   -    igt_subtest("huc-copy") {
>> -        char inputs[HUC_COPY_DATA_BUF_SIZE];
>> -        struct drm_i915_gem_exec_object2 obj[3];
>> -        uint64_t objsize[3] = { HUC_COPY_DATA_BUF_SIZE,
>> -                    HUC_COPY_DATA_BUF_SIZE,
>> -                    4096 };
>> -
>> -        test_huc_load(drm_fd);
>> -        /* Initialize src buffer randomly */
>> -        srand(time(NULL));
>> -        for (int i = 0; i < HUC_COPY_DATA_BUF_SIZE; i++)
>> -            inputs[i] = (char) (rand() % 256);
>> -
>> -        memset(obj, 0, sizeof(obj));
>> -        /* source buffer object for storing input */
>> -        obj[0].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
>> -        /* destination buffer object to receive input */
>> -        obj[1].handle = gem_create(drm_fd, HUC_COPY_DATA_BUF_SIZE);
>> -        /* execution buffer object */
>> -        obj[2].handle = gem_create(drm_fd, 4096);
>> -
>> -        gem_write(drm_fd, obj[0].handle, 0, inputs, 
>> HUC_COPY_DATA_BUF_SIZE);
>> -
>> -        huc_copy(drm_fd, ahnd, obj, objsize);
>> -        compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
>> -
>> -        gem_close(drm_fd, obj[0].handle);
>> -        gem_close(drm_fd, obj[1].handle);
>> -        gem_close(drm_fd, obj[2].handle);
>> +    for (op = ops; op->name; op++) {
>> +        igt_subtest_group {
>> +            igt_hang_t hang = {};
>> +
>> +            igt_fixture {
>> +                if (op->op == GPU_RESET)
>> +                    hang = igt_allow_hang(drm_fd, 0, 
>> HANG_ALLOW_CAPTURE);
>> +            }
>> +
>> +            igt_subtest_f("huc-copy%s", op->name)
>> +                huc_copy_test(drm_fd, ahnd, huc_copy, op->op);
>> +
>> +            igt_fixture {
>> +                if (op->op == GPU_RESET)
>> +                    igt_disallow_hang(drm_fd, hang);
>> +            }
>> +        }
>>       }
>>         igt_fixture {
