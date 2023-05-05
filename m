Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BB10E627
 for <igt-dev@lists.freedesktop.org>; Fri,  5 May 2023 15:05:31 +0000 (UTC)
Message-ID: <adae800e-c234-7f0e-2559-a2a401ade155@intel.com>
Date: Fri, 5 May 2023 20:34:58 +0530
MIME-Version: 1.0
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20230505000555.1916763-1-lucas.demarchi@intel.com>
 <v7hmocsbafml52pb6ie24tfcwfj5hb57ppg4pt2eunj2zmd5zg@m675ievofyl7>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <v7hmocsbafml52pb6ie24tfcwfj5hb57ppg4pt2eunj2zmd5zg@m675ievofyl7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Update dmesg error
 message
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 05-May-23 8:09 PM, Lucas De Marchi wrote:
> On Thu, May 04, 2023 at 05:05:56PM -0700, Lucas De Marchi wrote:
>> Error message changed in the kernel in commit
>> e5eef23e267c ("drm/display: Don't block HDR_OUTPUT_METADATA on
>> unknown EOTF"). We should probably have a better way to get this
>> error, but this should bring it back to a pass.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Still to be tested.... didn't have a machine available to reproduce it
> 
> from CI results:
> 
> igt@kms_hdr@invalid-hdr@pipe-a-dp-1:
>      shard-apl: FAIL (i915#8253) -> PASS
> 
> Lucas De Marchi
> 
>>
>> tests/kms_hdr.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index 23f12c14a..cbc0f3a55 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -418,7 +418,7 @@ static void test_static_toggle(data_t *data, enum 
>> pipe pipe,
>>     igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>     igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 
>> NULL);
>>     if (flags & TEST_INVALID_HDR) {
>> -        igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"EOTF Not 
>> Supported\""), 0);
>> +        igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown 
>> EOTF [0-9]+\""), 0);
>>         goto cleanup;
>>     }
>>     igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>> -- 
>> 2.40.1
>>
