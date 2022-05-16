Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1EE10E2D6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 04:31:17 +0000 (UTC)
Message-ID: <d6416890-5a98-e07c-06e1-7b2313fa86cd@intel.com>
Date: Mon, 16 May 2022 10:01:05 +0530
Content-Language: en-US
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220513040830.30939-1-karthik.b.s@intel.com>
 <6ed293b2-7ae4-3170-861e-ac1ac13e326a@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <6ed293b2-7ae4-3170-861e-ac1ac13e326a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: Skip
 clock-too-high subtest on DSC panel
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

On 5/13/2022 2:07 PM, Sharma, Swati2 wrote:
> Karthik, please add "Fixes" tag
> https://gitlab.freedesktop.org/drm/intel/-/issues/4402

Thanks for the review Swati. Added this and sent V2.

Thanks,
Karthik.B.S
>
> On 13-May-22 9:38 AM, Karthik B S wrote:
>> Max clock limit calculation isn't valid with DSC.
>> Skip the test on DSC panels.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_invalid_mode.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>> index bb92a94e..cf011a17 100644
>> --- a/tests/kms_invalid_mode.c
>> +++ b/tests/kms_invalid_mode.c
>> @@ -73,6 +73,8 @@ adjust_mode_clock_too_high(data_t *data, 
>> drmModeModeInfoPtr mode)
>>       int max_dotclock = data->max_dotclock;
>>         igt_require(max_dotclock != 0);
>> +    igt_require(!igt_is_dsc_supported(data->drm_fd,
>> +                      data->output->config.connector));
>>         /*
>>        * FIXME When we have a fixed mode, the kernel will ignore
>
