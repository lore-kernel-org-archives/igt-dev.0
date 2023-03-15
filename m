Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77A10EBD1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 19:58:12 +0000 (UTC)
Date: Wed, 15 Mar 2023 12:58:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZBIjSpj8BD//fdl+@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-19-umesh.nerlige.ramappa@intel.com>
 <87jzzilj3g.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87jzzilj3g.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 18/31] lib/perf" Set missing metric unit
 for some counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 09:44:03PM -0700, Dixit, Ashutosh wrote:
>On Tue, 14 Feb 2023 16:46:35 -0800, Umesh Nerlige Ramappa wrote:
>>
>> Some counters do not have units specified, so use 'number' as the unit.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
>But why isn't this in the internal tree?

The script started failing only when parsing the media metrics xml 
files. Those files are not in internal yet.

Umesh
>
>> ---
>>  lib/i915/perf-configs/mdapi-xml-convert.py | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
>> index 3b7d0663..eee12ad5 100755
>> --- a/lib/i915/perf-configs/mdapi-xml-convert.py
>> +++ b/lib/i915/perf-configs/mdapi-xml-convert.py
>> @@ -819,9 +819,14 @@ for arg in args.xml:
>>              # XXX Not sure why EU metrics tend to just be bundled under 'gpu'
>>              counter.set('mdapi_hw_unit_type', mdapi_counter.get('HWUnitType').lower())
>>
>> +            # Some counters do not have MetricUnits, treat them as number.
>> +            if mdapi_counter.get('MetricUnits') == None:
>> +                units = "number"
>> +            else:
>> +                units = mdapi_counter.get('MetricUnits').lower()
>> +
>>              # There are counters representing cycle counts that have a semantic
>>              # type of 'duration' which doesn't seem to make sense...
>> -            units = mdapi_counter.get('MetricUnits').lower()
>>              if units == "cycles":
>>                  semantic_type = "event"
>>              else:
>> --
>> 2.36.1
>>
