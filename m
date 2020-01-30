Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
 <20200130205256.2021-1-tvrtko.ursulin@linux.intel.com>
 <158041781735.18112.13290397906308346272@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <09861f70-4ce1-fcc0-7c2f-5c1cb31f116c@linux.intel.com>
Date: Thu, 30 Jan 2020 20:59:45 +0000
MIME-Version: 1.0
In-Reply-To: <158041781735.18112.13290397906308346272@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2]
 tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 30/01/2020 20:56, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-30 20:52:56)
>> @@ -772,91 +787,64 @@ igt_main
>>                  igt_allow_hang(i915, 0, 0);
>>          }
>>   
>> -       igt_subtest("idempotent")
>> -               test_idempotent(i915);
>> -
>> -       igt_subtest("clone")
>> -               test_clone(i915);
>> -
>> -       igt_subtest("file")
>> -               test_nonpersistent_file(i915);
>> -
>> -       igt_subtest("process")
>> -               test_process(i915);
>> -
>> -       igt_subtest("processes")
>> -               test_processes(i915);
>> -
>> -       igt_subtest("hostile")
>> -               test_nohangcheck_hostile(i915);
>> -       igt_subtest("hang")
>> -               test_nohangcheck_hang(i915);
> 
> Could we keep these outside of the engine subtest groups?
> I'd like to keep them distinct as they aren't written with verifying
> engines per se, but the general context parameter.
> 
> There should be per-engine equivalents to the above already where
> appropriate.

Depends how you look at it, I envisioned two subgroups as telling me 
when the default context is really default and when it has been 
configured with an engine map.

Oh right contexts... okay I need a third subgroup.

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
