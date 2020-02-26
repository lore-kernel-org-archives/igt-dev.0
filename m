Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC786E49D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 11:12:00 +0000 (UTC)
References: <20200226082348.1575427-1-lionel.g.landwerlin@intel.com>
 <158271502508.2462.4527574856224400832@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <78730600-8292-88f4-8993-e8cb941e05bb@intel.com>
Date: Wed, 26 Feb 2020 13:12:03 +0200
MIME-Version: 1.0
In-Reply-To: <158271502508.2462.4527574856224400832@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/perf: reenable perf tests on
 cometlake
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

On 26/02/2020 13:03, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-02-26 08:23:48)
>> The perf code coming from gputop assumed that devinfo for
>> cometlake/coffeelake used the same entry (devinfo->is_coffeelake).
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Fixes: 53f8f541ca ("lib: Add i915_perf library")
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

Thanks a lot,


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
