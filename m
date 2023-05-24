Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <a19110cd-a8c9-db25-aef8-6915da3cebf1@linux.intel.com>
Date: Wed, 24 May 2023 14:10:49 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>
References: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
 <20230515133630.2163170-3-tvrtko.ursulin@linux.intel.com>
 <20230523105158.wsjsnbjld4knkbr3@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230523105158.wsjsnbjld4knkbr3@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/2] intel_gpu_top: Move
 client name last
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


On 23/05/2023 11:51, Kamil Konieczny wrote:
> On 2023-05-15 at 14:36:30 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Move client name to be the right most field which visually aligns better
>> with top(1) and prepares for inserting memory usage fields somewhere in
>> the middle.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Rob Clark <robdclark@chromium.org>
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks Kamil, I've pushed this now having seen Rob will need to rebase 
his series anyway.

Regards,

Tvrtko

> 
>> ---
>>   tools/intel_gpu_top.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 453090c298bc..937280a7151a 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -1809,9 +1809,7 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>>   			return lines;
>>   
>>   		printf("\033[7m");
>> -		len = printf("%*s %*s ",
>> -			     clients->max_pid_len, "PID",
>> -			     clients->max_name_len, "NAME");
>> +		len = printf("%*s ", clients->max_pid_len, "PID");
>>   
>>   		if (lines++ >= con_h || len >= con_w)
>>   			return lines;
>> @@ -1825,7 +1823,9 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>>   					num_active++;
>>   			}
>>   
>> -			*class_w = width = (con_w - len) / num_active;
>> +			*class_w = width =
>> +				(con_w - len - clients->max_name_len - 1) /
>> +				num_active;
>>   
>>   			for (i = 0; i <= iclients->classes.max_engine_id; i++) {
>>   				const char *name = iclients->classes.names[i];
>> @@ -1846,8 +1846,7 @@ print_clients_header(struct igt_drm_clients *clients, int lines,
>>   			}
>>   		}
>>   
>> -		n_spaces(con_w - len);
>> -		printf("\033[0m\n");
>> +		printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
>>   	} else {
>>   		if (iclients->classes.num_engines)
>>   			pops->open_struct("clients");
>> @@ -1866,6 +1865,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>   	struct igt_drm_clients *clients = c->clients;
>>   	struct intel_clients *iclients = clients->private_data;
>>   	unsigned int i;
>> +	int len;
>>   
>>   	if (output_mode == INTERACTIVE) {
>>   		if (filter_idle && (!c->total_runtime || c->samples < 2))
>> @@ -1873,9 +1873,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>   
>>   		lines++;
>>   
>> -		printf("%*s %*s ",
>> -		       clients->max_pid_len, c->pid_str,
>> -		       clients->max_name_len, c->print_name);
>> +		len = printf("%*s ", clients->max_pid_len, c->pid_str);
>>   
>>   		for (i = 0;
>>   		     c->samples > 1 && i <= iclients->classes.max_engine_id;
>> @@ -1898,9 +1896,10 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>   
>>   			print_percentage_bar(pct, max, *class_w,
>>   					     numeric_clients);
>> +			len += *class_w;
>>   		}
>>   
>> -		putchar('\n');
>> +		printf(" %-*s\n", con_w - len - 1, c->print_name);
>>   	} else if (output_mode == JSON) {
>>   		char buf[64];
>>   
>> -- 
>> 2.37.2
>>
