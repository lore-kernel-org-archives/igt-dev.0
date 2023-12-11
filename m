Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0E310E07A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 04:16:43 +0000 (UTC)
Message-ID: <0972ba4d-1eab-41d7-8c20-ab9f6f4a875d@intel.com>
Date: Mon, 11 Dec 2023 09:46:30 +0530
Subject: Re: [PATCH i-g-t] tests/intel-ci: Update kms_psr subtest names on bat
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20231208033833.19325-1-karthik.b.s@intel.com>
 <DM4PR11MB6312061D50039E47CAB65725908AA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB6312061D50039E47CAB65725908AA@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks for the Rb Jeevan.

Merging this patch. The issue seen on CI full run are unrelated to this 
patch as this is just an update to the bat testlist.

Thanks,
Karthik.B.S

On 12/8/2023 10:04 AM, B, Jeevan wrote:
> LGTM
>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
>
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Friday, December 8, 2023 9:09 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B, Jeevan
>> <jeevan.b@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t] tests/intel-ci: Update kms_psr subtest names on bat
>>
>> kms_psr subtest names have been changed resulting in skips on CI bat testlist.
>> Update the test names accordingly.
>>
>> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9806
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel-ci/fast-feedback.testlist    | 8 ++++----
>>   tests/intel-ci/xe-fast-feedback.testlist | 6 +++---
>>   2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
>> feedback.testlist
>> index aeba0ab29..60ce1efa4 100644
>> --- a/tests/intel-ci/fast-feedback.testlist
>> +++ b/tests/intel-ci/fast-feedback.testlist
>> @@ -123,10 +123,10 @@ igt@kms_pipe_crc_basic@read-crc-frame-
>> sequence
>>   igt@kms_pm_backlight@basic-brightness
>>   igt@kms_pm_rpm@basic-pci-d3-state
>>   igt@kms_pm_rpm@basic-rte
>> -igt@kms_psr@psr_primary_page_flip
>> -igt@kms_psr@psr_cursor_plane_move
>> -igt@kms_psr@psr_sprite_plane_onoff
>> -igt@kms_psr@psr_primary_mmap_gtt
>> +igt@kms_psr@psr-primary-page-flip
>> +igt@kms_psr@psr-cursor-plane-move
>> +igt@kms_psr@psr-sprite-plane-onoff
>> +igt@kms_psr@psr-primary-mmap-gtt
>>   igt@kms_setmode@basic-clone-single-crtc
>>   igt@i915_pm_rps@basic-api
>>   igt@prime_self_import@basic-llseek-bad
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-
>> feedback.testlist
>> index f48e8fb67..45d115d35 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -214,9 +214,9 @@ igt@kms_pipe_crc_basic@nonblocking-crc-frame-
>> sequence
>>   igt@kms_pipe_crc_basic@read-crc
>>   igt@kms_pipe_crc_basic@read-crc-frame-sequence
>>   igt@kms_prop_blob@basic
>> -igt@kms_psr@psr_primary_page_flip
>> -igt@kms_psr@psr_cursor_plane_move
>> -igt@kms_psr@psr_sprite_plane_onoff
>> +igt@kms_psr@psr-primary-page-flip
>> +igt@kms_psr@psr-cursor-plane-move
>> +igt@kms_psr@psr-sprite-plane-onoff
>>
>>   # All tests that do module unloading and reloading are executed last.
>>   # They will sometimes reveal issues of earlier tests leaving the
>> --
>> 2.39.1
