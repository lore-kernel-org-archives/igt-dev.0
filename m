Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14606E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Dec 2019 16:02:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
References: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
Message-ID: <157746251322.14652.4981143123664101356@skylake-alporthouse-com>
Date: Fri, 27 Dec 2019 16:01:53 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 0/1] tests/i915/gem_ctx_persistence:
 pre-emption
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
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Bommu, Krishnaiah (2019-12-20 15:40:29)
> Check for I915_SCHEDULER_CAP_PREEMPTION support, if driver has support for
> pre-emption test will continue otherwise skip the test

No. The subtests that depend upon preemption do check first, the rest do
not and are expected and are tested to work on all generations.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
