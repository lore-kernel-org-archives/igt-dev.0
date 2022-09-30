Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C369210EBBB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 09:01:29 +0000 (UTC)
Message-ID: <ee9fdcc9-3703-89a5-58be-d039cbc07eed@intel.com>
Date: Fri, 30 Sep 2022 14:31:10 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220929143018.2502653-1-bhanuprakash.modem@intel.com>
 <YzasUOR/CISPcl4x@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YzasUOR/CISPcl4x@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/igt_kms: New api to iterate over all
 outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-30-09-2022 02:14 pm, Petri Latvala wrote:
> On Thu, Sep 29, 2022 at 08:00:18PM +0530, Bhanuprakash Modem wrote:
>> Few KMS tests are trying to run on all outputs irrespective of
> 
> Make this "A few" instead. English is funky.
> 
> (A few = some, whereas few = not many, emphasis on the amount being
> really small)

Thanks Petri,

:-) I'll fix this in next rev.

> 
> 
> 
>> their connection status. So add a new helper to iterate over all
>> outputs.
>>
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.h | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 3d78c37f..e0786aad 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -544,16 +544,26 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>>   #define for_each_if(condition) if (!(condition)) {} else
>>   
>>   /**
>> - * for_each_connected_output:
>> + * for_each_output:
>>    * @display: a pointer to an #igt_display_t structure
>>    * @output: The output to iterate.
>>    *
>>    * This for loop iterates over all outputs.
>>    */
>> -#define for_each_connected_output(display, output)		\
>> +#define for_each_output(display, output)		\
>>   	for (int i__ = 0;  assert(igt_can_fail()), i__ < (display)->n_outputs; i__++)	\
>> -		for_each_if ((((output) = &(display)->outputs[i__]), \
>> -			      igt_output_is_connected((output))))
>> +		for_each_if (((output) = (&(display)->outputs[i__])))
>> +
>> +/**
>> + * for_each_connected_output:
>> + * @display: a pointer to an #igt_display_t structure
>> + * @output: The output to iterate.
>> + *
>> + * This for loop iterates over all connected outputs.
>> + */
>> +#define for_each_connected_output(display, output)		\
>> +	for_each_output((display), (output))	\
>> +		for_each_if ((igt_output_is_connected((output))))
>>   
> 
> Ah, misunderstood the purpose on that other patch. Fair enough.

hmm, I think we need one more helper to iterate over all disconnected 
outputs.

- Bhanu

> 
> With the commit message change from above,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> 
>>   /**
>>    * for_each_pipe_static:
>> -- 
>> 2.37.3
>>
