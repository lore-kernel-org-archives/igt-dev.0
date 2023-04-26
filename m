Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4942210E25E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 09:04:02 +0000 (UTC)
Message-ID: <6c38c4e3-7a14-faf0-7afe-ad1045ddb32b@intel.com>
Date: Wed, 26 Apr 2023 11:03:57 +0200
MIME-Version: 1.0
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-6-zbigniew.kempczynski@intel.com>
 <36a8416f-ba25-555d-3453-1634cd85d868@intel.com>
In-Reply-To: <36a8416f-ba25-555d-3453-1634cd85d868@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 05/15] lib/drmtest: Add driver enum
 for i915/xe
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

On 26.04.2023 10:23, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 25.04.2023 17:40, Zbigniew Kempczyński wrote:
>> Library code like intel-bb and intel-buf which requires adoption
>> to handle both drivers should store driver on which fd they are
>> working on instead of calling costful is_i915/xe_device() helper.
>>
>> Introduce intel_driver enum which will be used on library code
>> adoption to Xe.
> 
> Agree - this is a better place than intel_batchbuffer.
> 
> But then the question arises - how does this relate to the 
> 'DRIVER_INTEL' and 'DRIVER_XE' value above? Looks like we could use 
> those values instead.

As discussed offline - it's flag vs enum. So:

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Christoph


> 
> Christoph
> 
> 
>>
>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   lib/drmtest.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/lib/drmtest.h b/lib/drmtest.h
>> index 5878f65129..3c88b85c6f 100644
>> --- a/lib/drmtest.h
>> +++ b/lib/drmtest.h
>> @@ -62,6 +62,14 @@
>>    */
>>   #define DRIVER_ANY     ~(DRIVER_VGEM)
>> +/*
>> + * Compile friendly enum for i915/xe.
>> + */
>> +enum intel_driver {
>> +    INTEL_DRIVER_I915 = 1,
>> +    INTEL_DRIVER_XE,
>> +};
>> +
>>   void __set_forced_driver(const char *name);
>>   /**
