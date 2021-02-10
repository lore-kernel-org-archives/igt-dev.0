Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210210093756.61424-1-tvrtko.ursulin@linux.intel.com>
 <20210210093756.61424-2-tvrtko.ursulin@linux.intel.com>
 <161295335978.6673.9313077497176923458@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <554d9a81-771d-b709-5986-48dd71171f02@linux.intel.com>
Date: Wed, 10 Feb 2021 10:55:44 +0000
MIME-Version: 1.0
In-Reply-To: <161295335978.6673.9313077497176923458@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] intel_gpu_top: Aggregate clients by
 PID by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 10/02/2021 10:35, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-02-10 09:37:55)
>> +static struct clients *aggregated_clients(struct clients *clients)
>> +{
>> +       struct client *ac, *c, *cp = NULL;
>> +       struct clients *aggregated;
>> +       int tmp, num = 0;
>> +
>> +       /* Sort by pid first to make it easy to aggregate while walking. */
>> +       sort_clients(clients, client_pid_cmp);
> 
> You could eliminate this tiny bit of duplication by always calling
> aggregated_clients() and returning here for !aggregate_pids.

Okay, I did something like that.

>> +       aggregated = calloc(1, sizeof(*clients));
>> +       assert(aggregated);
>> +
>> +       ac = calloc(clients->num_clients, sizeof(*c));
>> +       assert(ac);
>> +
>> +       aggregated->num_classes = clients->num_classes;
>> +       aggregated->class = clients->class;
>> +       aggregated->client = ac;
>> +
>> +       for_each_client(clients, c, tmp) {
>> +               unsigned int i;
>> +
>> +               if (c->status == FREE)
>> +                       break;
>> +
>> +               assert(c->status == ALIVE);
>> +
>> +               if ((cp && c->pid != cp->pid) || !cp) {
>> +                       ac = &aggregated->client[num];
>> +
>> +                       /* New pid. */
>> +                       ac->clients = aggregated;
>> +                       ac->status = ALIVE;
>> +                       ac->id = ++num;
>> +                       ac->pid = c->pid;
>> +                       strcpy(ac->name, c->name);
>> +                       strcpy(ac->print_name, c->print_name);
>> +                       ac->engines = c->engines;
>> +                       ac->val = calloc(clients->num_classes,
>> +                                        sizeof(ac->val[0]));
>> +                       assert(ac->val);
>> +                       ac->samples = 1;
>> +               }
>> +
>> +               cp = c;
>> +
>> +               if (c->samples < 2)
>> +                       continue;
>> +
>> +               ac->samples = 2; /* All what matters for display. */
>> +               ac->total_runtime += c->total_runtime;
>> +               ac->last_runtime += c->last_runtime;
>> +
>> +               for (i = 0; i < clients->num_classes; i++)
>> +                       ac->val[i] += c->val[i];
>> +       }
>> +
>> +       aggregated->num_clients = num;
>> +       aggregated->active_clients = num;
>> +
>> +       return sort_clients(aggregated, client_cmp);
>>   }
> 
> Ok, that works very well. Hmm. The sort order does seem a little jumpy
> though. May I suggest ac->id = -c->pid; instead of num;

Done it although I thought 1st pass being sort by pid already, num as id 
would follow a stable order. I guess your point was inversion to 
preserve order when cycling sort modes?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
