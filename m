Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115210E81D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Feb 2023 21:27:17 +0000 (UTC)
Date: Thu, 16 Feb 2023 13:27:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@linux.intel.com>
Message-ID: <Y+6fpC0MpmoZ0YIh@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-31-umesh.nerlige.ramappa@intel.com>
 <20230216193912.xouv7cxb3lx3s7ov@kamilkon-desk1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216193912.xouv7cxb3lx3s7ov@kamilkon-desk1>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 30/31] tools/perf: Choose the right card
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

On Thu, Feb 16, 2023 at 08:39:12PM +0100, Kamil Konieczny wrote:
>Hi Umesh,
>
>On 2023-02-14 at 16:46:47 -0800, Umesh Nerlige Ramappa wrote:
>> Choose the right dri card to open for perf recorder.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tools/i915-perf/i915_perf_recorder.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
>> index ee8a288d..9337da12 100644
>> --- a/tools/i915-perf/i915_perf_recorder.c
>> +++ b/tools/i915-perf/i915_perf_recorder.c
>> @@ -241,10 +241,10 @@ read_device_param(const char *stem, int id, const char *param)
>>  }
>>
>>  static int
>> -find_intel_render_node(void)
>> +find_intel_card_node(void)
>>  {
>> -	for (int i = 128; i < (128 + 16); i++) {
>> -		if (read_device_param("renderD", i, "vendor") == 0x8086)
>> +	for (int i = 0; i < 128; i++) {
>> +		if (read_device_param("card", i, "vendor") == 0x8086)
>
>These looks like a fix. Btw why do we stick to first card only ?
>May you instroduce params for a tool and use N-th card ?
>Is OA useable for only one card at a moment ?

That's a bug. The tool already supports cards/device, but I don't seem 
to be passing the device/card number to find_intel_card_node().

I think I have lost track of the original patch (not authored by me), so 
I am missing a few changes. Will fix this.

Thanks,
Umesh
>
>Regards,
>Kamil
>
>>  			return i;
>>  	}
>>
>> @@ -273,20 +273,18 @@ open_render_node(uint32_t *devid, int card)
>>  	char *name;
>>  	int ret;
>>  	int fd;
>> -	int render;
>>
>>  	if (card < 0) {
>> -		render = find_intel_render_node();
>> -		if (render < 0)
>> +		card = find_intel_card_node();
>> +
>> +		if (card < 0)
>>  			return -1;
>> -	} else {
>> -		render = 128 + card;
>>  	}
>>
>> -	ret = asprintf(&name, "/dev/dri/renderD%u", render);
>> +	ret = asprintf(&name, "/dev/dri/card%u", card);
>>  	assert(ret != -1);
>>
>> -	*devid = read_device_param("renderD", render, "device");
>> +	*devid = read_device_param("card", card, "device");
>>
>>  	fd = open(name, O_RDWR);
>>  	free(name);
>> --
>> 2.36.1
>>
