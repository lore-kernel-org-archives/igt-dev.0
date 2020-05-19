Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14DA897C8
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 14:50:26 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200519144157.10075-1-dominik.grzegorzek@intel.com>
References: <20200519144157.10075-1-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158989982262.8153.7260609217170846477@build.alporthouse.com>
Date: Tue, 19 May 2020 15:50:22 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_busy: Remove unnecessary
 non-preemptible workload
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

Quoting Dominik Grzegorzek (2020-05-19 15:41:57)
> Non-preemptible spinners should be avoided as often as possible.
> gem_busy@basic has no reason to use non-preemptible workload, only
> hung subtests need it.

s/hung/hang/

[More grammatically correct would be "hanging subtests", but we infer it
as a compound noun "this is a hang subtest"]
 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
