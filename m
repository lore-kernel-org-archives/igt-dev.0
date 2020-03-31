Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8186E841
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 14:30:44 +0000 (UTC)
References: <20200331114746.81898-1-lionel.g.landwerlin@intel.com>
 <158566466722.5852.13316064706500516988@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <d2ea62a5-554a-6f12-968f-61da7246d83b@intel.com>
Date: Tue, 31 Mar 2020 17:30:41 +0300
MIME-Version: 1.0
In-Reply-To: <158566466722.5852.13316064706500516988@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: add tests for triggered OA
 reports
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
List-ID: <igt-dev@lists.freedesktop.org>

On 31/03/2020 17:24, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-03-31 12:47:46)
>> By whitelisting a couple of registers we can allow an application
> By whitelisting, through the i915_perf interface, a couple of...
>
> I was looking for how you found a way to set RING_NONPRIV. :)


Yeah, I'll give a try at whitelisting when OA is enabled.

I have another patch where I whitelist 3 ranges of OA perf counter 
registers (total 72dwords) on Gen12.


>
>> batch to trigger OA reports in the OA buffer by switching back & forth
>> an inverter on the condition logic.
> Test looks reasonable, but the specific mechanics of OA I can't comment


Yeah, I could enhance by adding stalls and verify the deltas, but I've 
checked in Mesa already and came up with piglit tests : 
https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/248


-Lionel

> on.
> -Chris


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
