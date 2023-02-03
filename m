Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAB410E768
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 10:53:38 +0000 (UTC)
Message-ID: <fc168b9a-fe35-d12f-0660-321961ed1f02@intel.com>
Date: Fri, 3 Feb 2023 16:23:33 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230202072121.26153-1-swati2.sharma@intel.com>
 <bb717e27b3fdcea17ca83e9b23b4809f41275516.camel@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <bb717e27b3fdcea17ca83e9b23b4809f41275516.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/6] Enable VDSC output formats
 validation
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

Thanks for the review. Pushed 4/6 patches.

On 02-Feb-23 4:22 PM, Hogander, Jouni wrote:
> On Thu, 2023-02-02 at 12:51 +0530, Swati Sharma wrote:
>> This series is split from
>> https://patchwork.freedesktop.org/series/111342/
>>
>> Initial dsc lib related changes got merged. Received review
>> comments on driver debugfs YCBCR420 changes, to make debugfs
>> entry generic so that all supported output formats can be
>> validated.
>>
>> In this series, review comments from above PW are addressed.
>> Along, with that changes are done to make test generic to
>> validate all supported dsc formats.
> 
> For the whole set:
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
> 
>>
>> Swati Sharma (6):
>>    lib/dsc: Fix return value
>>    tests/i915/kms_dsc: Add plane_format as struct data_t member
>>    tests/i915/kms_dsc: Remove pointless struct
>>    tests/i915/kms_dsc: Make bpc_list static
>>    lib/dsc: Add helpers for VDSC output format debugfs entry
>>    tests/i915/kms_dsc: Enable validation for VDSC output formats
>>
>>   lib/igt_dsc.c               |  56 +++++++++++++++-
>>   lib/igt_dsc.h               |   5 ++
>>   lib/igt_kms.c               |  18 +++++
>>   lib/igt_kms.h               |   7 ++
>>   tests/i915/kms_dsc.c        | 128 ++++++++++++++++++++++++++--------
>> --
>>   tests/i915/kms_dsc_helper.c |  40 ++++++++++-
>>   tests/i915/kms_dsc_helper.h |   4 ++
>>   7 files changed, 218 insertions(+), 40 deletions(-)
>>
> 

-- 
~Swati Sharma
