Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <ed4d3024-78d7-558a-fe74-abef5dfa5e73@linux.intel.com>
Date: Fri, 27 May 2022 10:44:54 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220527075304.2226456-1-tvrtko.ursulin@linux.intel.com>
 <YpCRMT+Q9/ujewRq@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <YpCRMT+Q9/ujewRq@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Don't show
 client header if no kernel support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 27/05/2022 09:52, Petri Latvala wrote:
> On Fri, May 27, 2022 at 08:53:04AM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> On kernels without support for the feature we should skip showing the
>> clients header to avoid confusing users.
>>
>> Simply briefly open a render node to the selected device during init and
>> look if the relevant fields are present in the fdinfo data.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/120
>> ---
>>   tools/intel_gpu_top.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 1984c10dca29..26986a822bb7 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -2389,6 +2389,23 @@ static void process_stdin(unsigned int timeout_us)
>>   		process_normal_stdin();
>>   }
>>   
>> +static bool has_drm_fdinfo(const struct igt_device_card *card)
>> +{
>> +	struct drm_client_fdinfo info;
>> +	unsigned int cnt;
>> +	int fd;
>> +
>> +	fd = open(card->render, O_RDWR);
>> +	if (fd < 0)
>> +		return false;
>> +
>> +	cnt = igt_parse_drm_fdinfo(fd, &info);
>> +
>> +	close(fd);
>> +
>> +	return cnt > 0;
>> +}
>> +
>>   static void show_help_screen(void)
>>   {
>>   	printf(
>> @@ -2545,8 +2562,9 @@ int main(int argc, char **argv)
>>   
>>   	ret = EXIT_SUCCESS;
>>   
>> -	clients = init_clients(card.pci_slot_name[0] ?
>> -			       card.pci_slot_name : IGPU_PCI);
>> +	if (has_drm_fdinfo(&card))
>> +		clients = init_clients(card.pci_slot_name[0] ?
>> +				       card.pci_slot_name : IGPU_PCI);
> 
> Checked all usage of 'clients' below this, and everything handles NULL
> properly.
> 
> That said, nothing seems to free() it, am I reading that correctly?

Process exit does ;) (or every loop iteration in pid aggregation mode) - 
but okay, it is inconsistent that I free some bits but not all.

> Anyway, that can be left for another patch, this change is
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks!

Regards,

Tvrtko

> 
> 
>>   	init_engine_classes(engines);
>>   	if (clients) {
>>   		clients->num_classes = engines->num_classes;
>> -- 
>> 2.32.0
>>
