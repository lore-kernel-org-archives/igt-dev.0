Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEF789D4F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 09:21:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200708085900.4706-2-dominik.grzegorzek@intel.com>
References: <20200708085900.4706-1-dominik.grzegorzek@intel.com>
 <20200708085900.4706-2-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 08 Jul 2020 10:05:34 +0100
Message-ID: <159419913419.17526.14950077719067853381@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] tests/i915/gem_bad_address: Removal
 libdrm dependency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-07-08 09:58:56)
> Replace an intel_batchbuffer with an intel_bb in gem_bad_address.

Doesn't even need intel_bb. But git rm.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
