Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539BF10E5C0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 13:22:44 +0000 (UTC)
Date: Fri, 24 Feb 2023 14:22:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230224132240.ezwehzi24inprda3@kamilkon-desk1>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-19-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215004648.2100655-19-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 18/31] lib/perf" Set missing metric unit
 for some counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh,

please replace '"' with ':' in Subject: line,

[PATCH i-g-t 18/31] lib/perf" Set missing metric unit
--------------------------- ^

Regards,
Kamil

On 2023-02-14 at 16:46:35 -0800, Umesh Nerlige Ramappa wrote:
> Some counters do not have units specified, so use 'number' as the unit.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  lib/i915/perf-configs/mdapi-xml-convert.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/perf-configs/mdapi-xml-convert.py b/lib/i915/perf-configs/mdapi-xml-convert.py
> index 3b7d0663..eee12ad5 100755
> --- a/lib/i915/perf-configs/mdapi-xml-convert.py
> +++ b/lib/i915/perf-configs/mdapi-xml-convert.py
> @@ -819,9 +819,14 @@ for arg in args.xml:
>              # XXX Not sure why EU metrics tend to just be bundled under 'gpu'
>              counter.set('mdapi_hw_unit_type', mdapi_counter.get('HWUnitType').lower())
>  
> +            # Some counters do not have MetricUnits, treat them as number.
> +            if mdapi_counter.get('MetricUnits') == None:
> +                units = "number"
> +            else:
> +                units = mdapi_counter.get('MetricUnits').lower()
> +
>              # There are counters representing cycle counts that have a semantic
>              # type of 'duration' which doesn't seem to make sense...
> -            units = mdapi_counter.get('MetricUnits').lower()
>              if units == "cycles":
>                  semantic_type = "event"
>              else:
> -- 
> 2.36.1
> 
