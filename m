Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F1610E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 15:15:15 +0000 (UTC)
Message-ID: <ee3c9acd-4604-b6f2-c131-3b7ab133c16a@intel.com>
Date: Mon, 29 May 2023 20:45:11 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230524090954.289229-1-swati2.sharma@intel.com>
 <20230524181625.hymzq2qkoqvqasar@kamilkon-desk1>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230524181625.hymzq2qkoqvqasar@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: add extended flag
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



On 24-May-23 11:46 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-05-24 at 14:39:54 +0530, Swati Sharma wrote:
>> Add extended flag to limit test execution to one valid pipe-output
> ----- ^ -------------- ^
> Confusing name, see below.

Tried to reuse same name which we are using in other test cases.
Though usually we limit execution if this flag is *not* enabled
but if this flag is enabled we do execution on all pipes.
However, here intent is opposite.
Will rename to limited.

> 
>> combination. By default all tests will run on all valid pipe-output
>> combinations.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/i915/kms_dsc.c | 25 +++++++++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index 3ce28f84..b40bcf47 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -51,6 +51,7 @@ typedef struct {
>>   	int input_bpc;
>>   	int disp_ver;
>>   	enum pipe pipe;
>> +	bool extended;
>>   } data_t;
>>   
>>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>> @@ -250,13 +251,33 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>>   
>>   		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
>>   			update_display(data, test_type);
>> +
>> +		if (data->extended)
> ------------------------- ^
> This name is confusing, maybe: only_once ? run_once_only ?
> 
> Regards,
> Kamil
> 
>> +			break;
>>   	}
>>   }
>>   
>> -igt_main
>> +static int opt_handler(int opt, int opt_index, void *_data)
>>   {
>> -	data_t data = {};
>> +	data_t *data = _data;
>>   
>> +	switch (opt) {
>> +	case 'e':
>> +		data->extended = true;
>> +		break;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +/* Limit execution to 1 valid pipe-output combo */
>> +static const char help_str[] =
>> +	"  --extended";
>> +
>> +static data_t data = {};
>> +
>> +igt_main_args("e", NULL, help_str, opt_handler, &data)
>> +{
>>   	igt_fixture {
>>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>   		data.devid = intel_get_drm_devid(data.drm_fd);
>> -- 
>> 2.25.1
>>
