Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <c9f5c2b9-b560-93f1-47e1-a4771111385d@linux.intel.com>
Date: Mon, 6 Dec 2021 08:49:36 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211203155456.3954189-1-tvrtko.ursulin@linux.intel.com>
 <87k0glup34.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <87k0glup34.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel-gpu-top: Add support
 for per client stats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 04/12/2021 01:38, Dixit, Ashutosh wrote:
> On Fri, 03 Dec 2021 07:54:56 -0800, Tvrtko Ursulin wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Use the i915 exported data in /proc/<pid>/fdinfo to show GPU utilization
>> per DRM client.
> 
> Didn't we just remove it? Adding it back now? Sorry for the probably dumb
> question :/

Same feature two implementation flavours. :) Removed the version using 
API removed from i915 back in April (or so), proposing to add a version 
using different API (https://patchwork.freedesktop.org/series/92574/).

Regards,

Tvrtko
