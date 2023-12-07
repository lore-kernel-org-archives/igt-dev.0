Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2B10E958
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 19:25:23 +0000 (UTC)
Date: Thu, 7 Dec 2023 11:25:17 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/3] lib/intel_compute: Update
 intel_compute to run on specified engine
Message-ID: <ZXIcHd6Nl6aSHiPq@nvishwa1-DESK>
References: <20231206200055.20417-1-niranjana.vishwanathapura@intel.com>
 <20231206200055.20417-3-niranjana.vishwanathapura@intel.com>
 <20231207115618.xojuxvgphjqe2sme@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207115618.xojuxvgphjqe2sme@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
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

On Thu, Dec 07, 2023 at 12:56:18PM +0100, Kamil Konieczny wrote:
>Hi Niranjana,
>On 2023-12-06 at 12:00:54 -0800, Niranjana Vishwanathapura wrote:
>> With CCS_MODE setting, available compute slices can be assigned
>> to specific compute engines. Update intel_compute library to
>> be able to run compute kernel on specified compute or render
>> engine.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

<snip>

>> --- a/lib/intel_compute.h
>> +++ b/lib/intel_compute.h
>> @@ -9,6 +9,8 @@
>>  #ifndef INTEL_COMPUTE_H
>>  #define INTEL_COMPUTE_H
>>
>> +#include "xe_drm.h"
>
>With this it looks like Xe only header.
>

Hmm...
Not sure if we can keep these library headers purly driver (i915/xe) agnostic
for long. The library *.c files already include xe_drm.h and deal xe drivers
differently. I am seeing some library header files include structures
defined in xe_drm.h, but let the *.c files to include xe_drm.h header (cheeky
in my opinion).

>> +
>>  /*
>>   * OpenCL Kernels are generated using:
>>   *
>> @@ -28,5 +30,6 @@ struct intel_compute_kernels {
>>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>>
>>  bool run_intel_compute_kernel(int fd);
>> +bool run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
>
>What about using *void here?
>

Not sure if masking it as 'void *' is a good approach.
Besides, I don't think we are going to support this for i915 (not worth the
effort, validation etc). And I don't think we are going to compile the igt
repo without xe_drm.h.
I can add a function descriptor saying that this function is only supported
for xe driver and return error if this function is ever invoked with non-xe
driver.

Is that fine?

>>
>>  #endif	/* INTEL_COMPUTE_H */
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>--  ^^
>Please update your git to at least 2.3x or 2.4x (current lastest is 2.43.0).

Sure.

Thanks,
Niranjana

>
>Regards,
>Kamil
