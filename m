Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192CE10E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 10:15:07 +0000 (UTC)
Message-ID: <917ad227-fbae-a57a-a539-5dd878157ada@intel.com>
Date: Mon, 16 Jan 2023 15:44:54 +0530
Content-Language: en-US
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
 <Y7/+4sEWGELI2unz@intel.com>
 <IA1PR11MB6266EA7F413938CAE8CBE29BE2C19@IA1PR11MB6266.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <IA1PR11MB6266EA7F413938CAE8CBE29BE2C19@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: skip pipe on invalid
 connector in cursor size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On Mon-16-01-2023 12:12 pm, Bhadane, Dnyaneshwar wrote:
> Hi Ville,
> 
>> -----Original Message-----
>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Sent: Thursday, January 12, 2023 6:07 PM
>> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Kurmi, Suresh Kumar
>> <suresh.kumar.kurmi@intel.com>; Heikkila, Juha-pekka <juha-
>> pekka.heikkila@intel.com>
>> Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: skip pipe on invalid
>> connector in cursor size test
>>
>> On Thu, Jan 12, 2023 at 04:27:02PM +0530, Dnyaneshwar Bhadane wrote:
>>> Only the valid pipe connector combination reach to the igt commit.
>>> Cursor max-size test will not affect existing flow as only skip for
>>> invalid connector.
>>> For cursor-dpms and cursor-suspend not require to check
>>> require_cursor_size becuase the cursor height and width used from drm
>> capablities.
>>>
>>> Signed-off-by: Dnyaneshwar Bhadane
>> <dnyaneshwar.bhadane@intel.com>
>>>
>>> ---
>>>   tests/kms_cursor_crc.c | 21 +++++++++++++++------
>>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
>>> d5a4b30b..4ab4c005 100644
>>> --- a/tests/kms_cursor_crc.c
>>> +++ b/tests/kms_cursor_crc.c
>>> @@ -752,6 +752,13 @@ static void run_size_tests(data_t *data, int w, int
>> h)
>>>   			for_each_pipe(&data->display, pipe) {
>>>   				data->pipe = pipe;
>>>
>>> +				if(!igt_pipe_connector_valid(pipe, data-
>>> output)) {
>>
>> Isn't there a for_each_something() that does all of that?
> 
> Yes, I found for_each_pipe_with_valid_output()  and this macro loop checks for the invalid connectors on
> each pipe. I will update the code using for_each_pipe_with_valid_output().
> Thanks for the suggestion.

As for_each_pipe_with_valid_output() will iterate over all possible 
pipe/output combinations which is not required (one output is enough).

I think you can use for_each_pipe_with_single_output();

- Bhanu

> 
> Dnyaneshwar Bhadane,
> Intel
> 
>>
>>> +					igt_debug("Invalid connector on
>> pipe-%s-%s\n",
>>> +						kmstest_pipe_name(pipe),
>>> +						data->output->name);
>>> +					continue;
>>> +				}
>>> +
>>>   				if (require_cursor_size(data, w, h)) {
>>>   					igt_info("Cursor size %dx%d not
>> supported by driver\n", w, h);
>>>   					continue;
>>> @@ -854,9 +861,10 @@ static void run_tests_on_pipe(data_t *data)
>>>   			data->pipe = pipe;
>>>   			data->flags = TEST_DPMS;
>>>
>>> -			if (require_cursor_size(data, data->cursor_max_w,
>> data->cursor_max_h)) {
>>> -				igt_debug("Cursor size %dx%d not supported
>> by driver\n",
>>> -					  data->cursor_max_w, data-
>>> cursor_max_h);
>>> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
>>> +				igt_debug("Invalid connector on pipe-%s-
>> %s\n",
>>> +					kmstest_pipe_name(pipe),
>>> +					data->output->name);
>>>   				continue;
>>>   			}
>>>
>>> @@ -875,9 +883,10 @@ static void run_tests_on_pipe(data_t *data)
>>>   			data->pipe = pipe;
>>>   			data->flags = TEST_SUSPEND;
>>>
>>> -			if (require_cursor_size(data, data->cursor_max_w,
>> data->cursor_max_h)) {
>>> -				igt_debug("Cursor size %dx%d not supported
>> by driver\n",
>>> -					  data->cursor_max_w, data-
>>> cursor_max_h);
>>> +			if(!igt_pipe_connector_valid(pipe, data->output)) {
>>> +				igt_debug("Invalid connector on pipe-%s-
>> %s\n",
>>> +					kmstest_pipe_name(pipe),
>>> +					data->output->name);
>>>   				continue;
>>>   			}
>>>
>>> --
>>> 2.35.1
>>
>> --
>> Ville Syrjälä
>> Intel
