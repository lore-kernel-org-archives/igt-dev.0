Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0B86F475
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 15:09:45 +0000 (UTC)
References: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
 <158229749227.6499.4384301944862761954@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <91f8e287-e9b5-6888-80cc-fabb4804b1ef@intel.com>
Date: Fri, 21 Feb 2020 17:09:42 +0200
MIME-Version: 1.0
In-Reply-To: <158229749227.6499.4384301944862761954@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: reuse the new i915-perf
 library
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

On 21/02/2020 17:04, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-02-21 13:41:34)
>> Now that most configs are stored inside IGT along with their uuid, we
>> can just source the correct one for that internal library.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Looked at several replacements, and the intel_perf_for_fd(), looks sane.
>
> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

Thanks. Next step : removing generated code from i915.


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
