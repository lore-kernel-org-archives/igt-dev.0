Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436810E0D4
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 13:56:04 +0000 (UTC)
Message-ID: <2a23551c-f80c-c259-9341-03e4ef8dc139@intel.com>
Date: Mon, 7 Aug 2023 19:25:58 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
References: <20230807091538.3172571-1-ankit.k.nautiyal@intel.com>
 <f6550b4ee9b6b1ccbb99a7e6e68b99272253aa28.camel@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <f6550b4ee9b6b1ccbb99a7e6e68b99272253aa28.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc_helper.c: Fix helper
 to check dsc with output_format
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

Hi Ankit,

Thanks for the patch.
Nitpick: Please remove .c from binary name in subject.
Also, please add
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9062

Rest LGTM.
Tested-by: Swati Sharma <swati2.sharma@intel.com>

On 07-Aug-23 4:12 PM, Hogander, Jouni wrote:
> On Mon, 2023-08-07 at 14:45 +0530, Ankit Nautiyal wrote:
>> Fix the condition that checks whether DSC is supported with given
>> output format in is_dsc_output_format_supported.
>>
>> Fixes: c365922f01c12 (tests/i915/kms_dsc: Enable validation for VDSC
>> output formats)
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Jouni H_gander <jouni.hogander@intel.com>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
>> ---
>>   tests/i915/kms_dsc_helper.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/i915/kms_dsc_helper.c
>> b/tests/i915/kms_dsc_helper.c
>> index ae59edb6bec9..160364cd28bf 100644
>> --- a/tests/i915/kms_dsc_helper.c
>> +++ b/tests/i915/kms_dsc_helper.c
>> @@ -133,13 +133,12 @@ static bool
>> is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_ou
>>   bool is_dsc_output_format_supported(int drmfd, int disp_ver,
>> igt_output_t *output,
>>                                      enum dsc_output_format
>> output_format)
>>   {
>> -       if (!(igt_is_dsc_output_format_supported_by_sink(drmfd,
>> output->name, output_format)) &&
>> -            (is_dsc_output_format_supported_by_platform(disp_ver,
>> output_format))) {
>> -                   igt_debug("DSC %s output format not supported on
>> connector %s\n",
>> -
>> kmstest_dsc_output_format_str(output_format),
>> -                              output->name);
>> -                       return false;
>> -               }
>> +       if (is_dsc_output_format_supported_by_platform(disp_ver,
>> output_format) &&
>> +           igt_is_dsc_output_format_supported_by_sink(drmfd, output-
>>> name, output_format))
>> +               return true;
>>   
>> -       return true;
>> +       igt_debug("DSC %s output format not supported on connector
>> %s\n",
>> +                 kmstest_dsc_output_format_str(output_format),
>> output->name);
>> +
>> +       return false;
>>   }
> 
