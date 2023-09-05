Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9B10E25C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 07:29:24 +0000 (UTC)
Message-ID: <3d002323-5ebb-dddf-696a-3ce5506f5f63@linux.intel.com>
Date: Tue, 5 Sep 2023 09:29:19 +0200
MIME-Version: 1.0
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, joonas.lahtinen@intel.com,
 tvrtko.ursulin@intel.com, janusz.krzysztofik@linux.intel.com
References: <20230825131913.600667-1-marcin.bernatowicz@linux.intel.com>
 <20230825131913.600667-3-marcin.bernatowicz@linux.intel.com>
 <20230828170534.umqx2ysgnpzusseh@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230828170534.umqx2ysgnpzusseh@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_device_scan: Xe get
 integrated/discrete card functions
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



On 8/28/2023 7:05 PM, Kamil Konieczny wrote:
> Hi Marcin,
> 
> On 2023-08-25 at 13:19:12 +0000, Marcin Bernatowicz wrote:
>> Xe functions to get integrated/discrete card.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/igt_device_scan.c | 34 +++++++++++++++++++++++++---------
>>   lib/igt_device_scan.h |  2 ++
>>   2 files changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index ae69ed09f..f8b8ca281 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -769,25 +769,27 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>>    * Iterate over all igt_devices array and find first discrete/integrated card.
>>    * card->pci_slot_name will be updated only if a card is found.
>>    */
>> -static bool __find_first_i915_card(struct igt_device_card *card, bool discrete)
>> +static bool __find_first_intel_card(struct igt_device_card *card, bool want_discrete,
>> +				    const char *drv_name)
>>   {
>>   	struct igt_device *dev;
>> -	int cmp;
>> +	int is_integrated;
>>   
>> +	igt_assert(drv_name);
>>   	memset(card, 0, sizeof(*card));
>>   
>>   	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>>   
>> -		if (!is_pci_subsystem(dev) || strcmp(dev->driver, "i915"))
>> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
> --------------------------------------------------------- ^^^^^^^^
> 
> May you extend this to cover also "intel" card here?
> I mean both cases, i915 or xe.
> 

I didn't want to complicate the code too much, but isn't it
__find_first_intel_card(...,"i915") || __find_first_intel_card(...,"xe")
?


>>   			continue;
>>   
>> -		cmp = strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
>> -			      PCI_SLOT_NAME_SIZE);
>> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
>> +					 PCI_SLOT_NAME_SIZE);
>>   
>> -		if (discrete && cmp) {
>> +		if (want_discrete && !is_integrated) {
>>   			__copy_dev_to_card(dev, card);
>>   			return true;
>> -		} else if (!discrete && !cmp) {
>> +		} else if (!want_discrete && is_integrated) {
>>   			__copy_dev_to_card(dev, card);
>>   			return true;
>>   		}
>> @@ -800,14 +802,28 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>>   {
>>   	igt_assert(card);
>>   
>> -	return __find_first_i915_card(card, true);
>> +	return __find_first_intel_card(card, true, "i915");
>> +}
>> +
> 
> Document all new public lib functions.
> 
>> +bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card)
>> +{
>> +	igt_assert(card);
>> +
>> +	return __find_first_intel_card(card, true, "xe");
>>   }
>>   
>>   bool igt_device_find_integrated_card(struct igt_device_card *card)
>>   {
>>   	igt_assert(card);
>>   
>> -	return __find_first_i915_card(card, false);
>> +	return __find_first_intel_card(card, false, "i915");
>> +}
>> +
> 
> Same here.
> 
> Regards,
> Kamil
> 
>> +bool igt_device_find_xe_integrated_card(struct igt_device_card *card)
>> +{
>> +	igt_assert(card);
>> +
>> +	return __find_first_intel_card(card, false, "xe");
>>   }
>>   
>>   static struct igt_device *igt_device_from_syspath(const char *syspath)
>> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
>> index e6b0f1b90..b8f6a843d 100644
>> --- a/lib/igt_device_scan.h
>> +++ b/lib/igt_device_scan.h
>> @@ -87,6 +87,8 @@ bool igt_device_card_match_pci(const char *filter,
>>   	struct igt_device_card *card);
>>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>>   bool igt_device_find_integrated_card(struct igt_device_card *card);
>> +bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>> +bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
>>   char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>>   int igt_open_card(struct igt_device_card *card);
>>   int igt_open_render(struct igt_device_card *card);
>> -- 
>> 2.30.2
>>
