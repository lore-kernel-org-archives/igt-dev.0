Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB64AC46CD2
	for <igt-dev@archiver.kernel.org>; Sat, 27 Jan 2024 13:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D37611241D;
	Sat, 27 Jan 2024 13:44:48 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EC6F11241D
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Jan 2024 13:44:45 +0000 (UTC)
Received: from loongson.cn (unknown [114.249.168.89])
 by gateway (Coremail) with SMTP id _____8AxuujKCLVlqgkHAA--.3500S3;
 Sat, 27 Jan 2024 21:44:42 +0800 (CST)
Received: from [192.168.0.105] (unknown [114.249.168.89])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx_c7KCLVlozwfAA--.65206S3; 
 Sat, 27 Jan 2024 21:44:42 +0800 (CST)
Subject: Re: [PATCH i-g-t] lib/intel_compute: Support testing multiple compute
 kernels
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240118121218.1674694-1-zhoumin@loongson.cn>
 <20240126072642.d5axk62733lagzt5@zkempczy-mobl2>
From: zhoumin <zhoumin@loongson.cn>
Message-ID: <ea4dfd50-7452-129f-5560-5eaf131cd5aa@loongson.cn>
Date: Sat, 27 Jan 2024 21:44:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20240126072642.d5axk62733lagzt5@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Cx_c7KCLVlozwfAA--.65206S3
X-CM-SenderInfo: 52kr3ztlq6z05rqj20fqof0/1tbiAQAJAWW0vuEASAABsO
X-Coremail-Antispam: 1Uk129KBj93XoW3Aw4UCry5CrWfGFW5JFyruFX_yoWktrWDpr
 47Gay5uFWfXr13uwsrJFsF9FyFqa1rtan8KryDta1fuFnFqw17Jr42gry3uF98urWF934Y
 yF1UJF4I93W5ArgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
 14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
 c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
 CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
 MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
 4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
 WIevJa73UjIFyTuYvjxU2BT5DUUUU
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
Cc: igt-dev@lists.freedesktop.org, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Zbigniew,

Thanks for your reply and for providing a detailed explanation.

I have indeed found this change is insufficient and it's hard to support 
testing multiple compute kernels with different number of arguments 
within the current framework. The checking of testing results of compute 
kernels is also hardcoded. I also think it may be unnecessary to test a 
variety of compute kernels.


Best Regards,

Min

On Fri, Jan 26, 2024 at 3:26PM, Zbigniew Kempczyński wrote:
> On Thu, Jan 18, 2024 at 08:12:18PM +0800, Min Zhou wrote:
>> It seems that we will add more and more compute kernels for testing.
>> The function name of `run_intel_compute_kernel` seems to be able to
>> test multiple compute kernels. However it's hard to test other
>> compute kernel in testcases because the compute kernel is hardcoded
>> in the lib/intel_compute.c. So if we want to test multiple compute
>> kernels in testcases in the future, it's better to support it in
>> lib/intel_compute.
> I'm sorry for late answer.
>
> For TL;DR jump to the bottom.
>
> Regarding commit messagee - it's partially true.
> run_intel_compute_kernel() is able to run only kernels which arguments
> passed to the shader are same, I mean:
>
> opencl/compute_square_kernel.cl:
>
> __kernel void square(__global float* input, __global float* output, const unsigned int count) {
>    int i = get_global_id(0);
>    if(i < count)
>      output[i] = input[i] * input[i];
> }
>
> has direct reflection to binding table elements - see
> xehp_create_surface_state(), binding table is at 0x00001080 and
> contains
>
> 	addr_bo_buffer_batch[b++] = 0x00001000;
> 	addr_bo_buffer_batch[b++] = 0x00001040;
> 	addr_bo_buffer_batch[b++] = 0x00000000;
>
> what points to input and output data. To support different kernels
> we should generate pipelines more generic. Current code is reversed
> from compute-runtime (neo) what narrows it to use shaders with known
> in advance number of arguments.
>
> Additionally extracting shader from elf files (ocloc produces shader
> which is packed to elf) varies - for different platforms you may notice
> different sections and file arragement. If I recall correctly for some
> shaders compiled there's some prologue omitted in shader hex form packed
> to the code (I'm not sure what is for, but keeping it hangs the engine).
> That prologue is also omitted by compute-runtime by shifting kernel
> start address after this prologue.
>
> TL;DR
> -----
> This refactor doesn't support shaders with different number of
> arguments than current compute square. In IGT we just need to
> run simple compute workflow to verify submission to compute
> engine. Current code shape was made by folks in intention to
> be extendible, but mimicing of compute-runtime is hard and
> I'm not sure needed in IGT.
>
> --
> Zbigniew
>
>
>> Signed-off-by: Min Zhou <zhoumin@loongson.cn>
>> ---
>>   lib/intel_compute.c              | 66 +++++++++++++++++++++++++++-----
>>   lib/intel_compute.h              | 13 +++++--
>>   opencl/README                    |  6 +--
>>   tests/intel/gem_compute.c        |  3 +-
>>   tests/intel/xe_compute.c         |  9 +++--
>>   tests/intel/xe_compute_preempt.c |  3 +-
>>   6 files changed, 78 insertions(+), 22 deletions(-)
>>
>> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>> index eab407a0d..9c21c10c5 100644
>> --- a/lib/intel_compute.c
>> +++ b/lib/intel_compute.c
>> @@ -64,6 +64,30 @@ struct bo_execenv {
>>   	struct drm_i915_gem_exec_object2 *obj;
>>   };
>>   
>> +/*
>> + * Supported compute kernels
>> + */
>> +struct {
>> +	const char *name;
>> +	const struct intel_compute_kernels *kernels;
>> +} intel_compute_kernels_set[] = {
>> +	{ .name = COMPUTE_SQUARE,
>> +	  .kernels = intel_compute_square_kernels },
>> +	{}
>> +};
>> +
>> +static const struct intel_compute_kernels *find_intel_compute_kernels(const char *name)
>> +{
>> +	int i = 0;
>> +
>> +	for (; intel_compute_kernels_set[i].name; ++i) {
>> +		if (strcmp(intel_compute_kernels_set[i].name, name) == 0)
>> +			return intel_compute_kernels_set[i].kernels;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>   static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>>   			      struct drm_xe_engine_class_instance *eci)
>>   {
>> @@ -1435,11 +1459,11 @@ static const struct {
>>   };
>>   
>>   static bool __run_intel_compute_kernel(int fd,
>> -				       struct drm_xe_engine_class_instance *eci)
>> +				       struct drm_xe_engine_class_instance *eci,
>> +				       const struct intel_compute_kernels *kernels)
>>   {
>>   	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>>   	unsigned int batch;
>> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
>>   	enum intel_driver driver = get_intel_driver(fd);
>>   
>>   	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
>> @@ -1472,9 +1496,16 @@ static bool __run_intel_compute_kernel(int fd,
>>   	return true;
>>   }
>>   
>> -bool run_intel_compute_kernel(int fd)
>> +bool run_intel_compute_kernel(int fd, const char *kernel_name)
>>   {
>> -	return __run_intel_compute_kernel(fd, NULL);
>> +	const struct intel_compute_kernels *kernels;
>> +
>> +	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
>> +		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
>> +		return false;
>> +	}
>> +
>> +	return __run_intel_compute_kernel(fd, NULL, kernels);
>>   }
>>   
>>   /**
>> @@ -1487,8 +1518,11 @@ bool run_intel_compute_kernel(int fd)
>>    * Returns true on success, false otherwise.
>>    */
>>   bool xe_run_intel_compute_kernel_on_engine(int fd,
>> -					   struct drm_xe_engine_class_instance *eci)
>> +					   struct drm_xe_engine_class_instance *eci,
>> +					   const char *kernel_name)
>>   {
>> +	const struct intel_compute_kernels *kernels;
>> +
>>   	if (!is_xe_device(fd)) {
>>   		igt_debug("Xe device expected\n");
>>   		return false;
>> @@ -1506,7 +1540,12 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
>>   		return false;
>>   	}
>>   
>> -	return __run_intel_compute_kernel(fd, eci);
>> +	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
>> +		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
>> +		return false;
>> +	}
>> +
>> +	return __run_intel_compute_kernel(fd, eci, kernels);
>>   }
>>   
>>   /**
>> @@ -1683,11 +1722,11 @@ static const struct {
>>   	},
>>   };
>>   
>> -static bool __run_intel_compute_kernel_preempt(int fd)
>> +static bool __run_intel_compute_kernel_preempt(int fd,
>> +				const struct intel_compute_kernels *kernels)
>>   {
>>   	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>>   	unsigned int batch;
>> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
>>   	enum intel_driver driver = get_intel_driver(fd);
>>   
>>   	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
>> @@ -1732,7 +1771,14 @@ static bool __run_intel_compute_kernel_preempt(int fd)
>>    *
>>    * Returns true on success, false otherwise.
>>    */
>> -bool run_intel_compute_kernel_preempt(int fd)
>> +bool run_intel_compute_kernel_preempt(int fd, const char *kernel_name)
>>   {
>> -	return __run_intel_compute_kernel_preempt(fd);
>> +	const struct intel_compute_kernels *kernels;
>> +
>> +	if ((kernels = find_intel_compute_kernels(kernel_name)) == NULL) {
>> +		igt_debug("Compute kernels not found for \"%s\"\n", kernel_name);
>> +		return false;
>> +	}
>> +
>> +	return __run_intel_compute_kernel_preempt(fd, kernels);
>>   }
>> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
>> index bba8bed94..9faf070b3 100644
>> --- a/lib/intel_compute.h
>> +++ b/lib/intel_compute.h
>> @@ -11,6 +11,11 @@
>>   
>>   #include "xe_drm.h"
>>   
>> +/*
>> + * Supported compute kernels name
>> + */
>> +#define COMPUTE_SQUARE	"compute-square"
>> +
>>   /*
>>    * OpenCL Kernels are generated using:
>>    *
>> @@ -33,7 +38,9 @@ struct intel_compute_kernels {
>>   
>>   extern const struct intel_compute_kernels intel_compute_square_kernels[];
>>   
>> -bool run_intel_compute_kernel(int fd);
>> -bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
>> -bool run_intel_compute_kernel_preempt(int fd);
>> +bool run_intel_compute_kernel(int fd, const char *kernel_name);
>> +bool xe_run_intel_compute_kernel_on_engine(int fd,
>> +					   struct drm_xe_engine_class_instance *eci,
>> +					   const char *kernel_name);
>> +bool run_intel_compute_kernel_preempt(int fd, const char *kernel_name);
>>   #endif	/* INTEL_COMPUTE_H */
>> diff --git a/opencl/README b/opencl/README
>> index 2fd0687a2..4dfbe2865 100644
>> --- a/opencl/README
>> +++ b/opencl/README
>> @@ -5,10 +5,10 @@ multiple platforms.
>>   For instance, to generate compute square Kernel binaries for TGL and ADL
>>   variants, use this:
>>   
>> -    opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl \
>> -	   xe_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
>> +    opencl/gen_opencl_kernel intel_compute_square opencl/compute_square_kernel.cl \
>> +	   intel_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
>>   
>> -    cp build/opencl/xe_compute_square_kernels.c lib/xe/
>> +    cp build/opencl/intel_compute_square_kernels.c lib/
>>   
>>   The opencl/gen_opencl_kernel requires the Intel compute runtime[1].
>>   
>> diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
>> index 8d0214c4d..ce368d2c3 100644
>> --- a/tests/intel/gem_compute.c
>> +++ b/tests/intel/gem_compute.c
>> @@ -27,7 +27,8 @@
>>   static void
>>   test_compute_square(int fd)
>>   {
>> -	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
>> +	igt_require_f(run_intel_compute_kernel(fd, COMPUTE_SQUARE),
>> +		      "GPU not supported\n");
>>   }
>>   
>>   igt_main
>> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
>> index 42f42ca0c..bc81dc04f 100644
>> --- a/tests/intel/xe_compute.c
>> +++ b/tests/intel/xe_compute.c
>> @@ -114,7 +114,7 @@ test_ccs_mode(int num_gt)
>>    * Functionality: CCS mode funtionality
>>    */
>>   static void
>> -test_compute_kernel_with_ccs_mode(int num_gt)
>> +test_compute_kernel_with_ccs_mode(int num_gt, const char *kernel_name)
>>   {
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	u32 gt, m, num_slices;
>> @@ -139,7 +139,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>>   
>>   				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
>>   					 gt, m, hwe->engine_instance);
>> -				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
>> +				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, kernel_name),
>>   					     "Unable to run compute kernel successfully\n");
>>   			}
>>   			drm_close_driver(fd);
>> @@ -163,7 +163,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
>>   static void
>>   test_compute_square(int fd)
>>   {
>> -	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
>> +	igt_require_f(run_intel_compute_kernel(fd, COMPUTE_SQUARE),
>> +		      "GPU not supported\n");
>>   }
>>   
>>   igt_main
>> @@ -186,5 +187,5 @@ igt_main
>>   		test_ccs_mode(num_gt);
>>   
>>   	igt_subtest("ccs-mode-compute-kernel")
>> -		test_compute_kernel_with_ccs_mode(num_gt);
>> +		test_compute_kernel_with_ccs_mode(num_gt, COMPUTE_SQUARE);
>>   }
>> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
>> index 31703638e..e4adefd2a 100644
>> --- a/tests/intel/xe_compute_preempt.c
>> +++ b/tests/intel/xe_compute_preempt.c
>> @@ -26,7 +26,8 @@
>>   static void
>>   test_compute_preempt(int fd)
>>   {
>> -	igt_require_f(run_intel_compute_kernel_preempt(fd), "GPU not supported\n");
>> +	igt_require_f(run_intel_compute_kernel_preempt(fd, COMPUTE_SQUARE),
>> +		      "GPU not supported\n");
>>   }
>>   
>>   igt_main
>> -- 
>> 2.39.3
>>

