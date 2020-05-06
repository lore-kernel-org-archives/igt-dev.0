Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630F66E8D5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 20:25:01 +0000 (UTC)
References: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
 <20200406135709.569315-2-lionel.g.landwerlin@intel.com>
 <158879373263.927.2919752195989238677@build.alporthouse.com>
 <158879382464.927.7925876876584308575@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <f3bf4f51-fea3-a5fa-0b55-ac9d6b4476f3@intel.com>
Date: Wed, 6 May 2020 23:24:58 +0300
MIME-Version: 1.0
In-Reply-To: <158879382464.927.7925876876584308575@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/perf: add tests for multi
 context filtering
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

On 06/05/2020 22:37, Chris Wilson wrote:
> Quoting Chris Wilson (2020-05-06 20:35:32)
>> Quoting Lionel Landwerlin (2020-04-06 14:57:09)
>>> Iris is using 2 GEM contexts for 3D & compute.
>>>
>>> v2: Check higher number of contexts
>>>
>>> v3: Test unmapped memory pointers (Chris)
>>>
>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> I trust you know the details of the report layout much better than I do,
>> so I just looked at the api coverage and was happy,
>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> That being said, I didn't spot feeding in ctx->engine[rcs0, rcs0...] and
> checking that all are reported?
> -Chris

Thanks a lot for looking at this.


Unfortunately the libdrm has no support for this, so all the render copy 
cannot be used there :(


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
