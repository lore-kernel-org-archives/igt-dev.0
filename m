Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22616E8AA
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 09:25:33 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200708085900.4706-4-dominik.grzegorzek@intel.com>
References: <20200708085900.4706-1-dominik.grzegorzek@intel.com>
 <20200708085900.4706-4-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 08 Jul 2020 10:09:14 +0100
Message-ID: <159419935447.17526.11697641510548482209@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] tests/i915/gem_bad_blit: Removal
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

Quoting Dominik Grzegorzek (2020-07-08 09:58:58)
> Replace an intel_batchbuffer with an intel_bb in gem_bad_blit.

Where's the test here? git rm.

Yes we need a corpus of HW handling tests and a model to go with them.
These are not worth the maintenance as they do not actually validate
themselves.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
