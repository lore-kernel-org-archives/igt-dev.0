Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C16E065
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2020 11:29:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200419104819.349537-1-lionel.g.landwerlin@intel.com>
References: <20200419104819.349537-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158729577559.12400.17108501577850114961@build.alporthouse.com>
Date: Sun, 19 Apr 2020 12:29:35 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: fix
 global-sseu-config-invalid for Gen11
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-04-19 11:48:19)
> In 15e8ffecfd55 ("tests/perf: respect gen11 restriction in disable
> subslices") I fixed the global-sseu-config subtest which was affect by
> the same issue. But global-sseu-config-invalid is also affected by the
> Gen11 restriction.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: 779d43cd ("tests/perf: add global sseu parameter tests")
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1543

Ok,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
