Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D29C6E441
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 16:01:09 +0000 (UTC)
References: <20201124141924.108689-1-chris@chris-wilson.co.uk>
 <c2506cc1-4605-224b-5b5d-f2c4ee8d8fd6@linux.intel.com>
 <160623299271.28476.1503734847384709621@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <95e7c59a-4b2c-6406-f92d-fed75edea006@linux.intel.com>
Date: Tue, 24 Nov 2020 16:01:03 +0000
MIME-Version: 1.0
In-Reply-To: <160623299271.28476.1503734847384709621@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Include total
 package power
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 24/11/2020 15:49, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-24 15:30:53)
>>
>> On 24/11/2020 14:19, Chris Wilson wrote:
>>> -static const char *rapl_gpu_power_unit(void)
>>> -{
>>> -     char buf[32];
>>> -
>>> -     if (filename_to_buf(RAPL_EVENT "energy-gpu.unit",
>>> -                         buf, sizeof(buf)) == 0)
>>> -             if (!strcmp(buf, "Joules"))
>>> -                     return strdup("Watts");
>>> -             else
>>> -                     return strdup(buf);
>>
>> We lose this handling of unexpected changes. Hard to decide if that is
>> very important. Should be possible to keep by a simple addition to
>> rapl_parse I think.
> 
> Do you think we need more than a fprintf(stderr) ?
> 
> 	snprintf(buf, sizeof(buf), "events/energy-%s.unit", str);
>          units = igt_sysfs_get(dir, buf);
>          if (units && strcmp(units, "Joules"))
>                  fprintf(stderr, "Unexpected units for RAPL %s: found %s\n",
>                          str, units);
> 	free(units);

That sounds fine to me. "if (!units || strcmp)" probably.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
