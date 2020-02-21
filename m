Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DD16F472
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 15:04:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200221134134.1275235-1-lionel.g.landwerlin@intel.com>
Message-ID: <158229749227.6499.4384301944862761954@skylake-alporthouse-com>
Date: Fri, 21 Feb 2020 15:04:52 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: reuse the new i915-perf
 library
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

Quoting Lionel Landwerlin (2020-02-21 13:41:34)
> Now that most configs are stored inside IGT along with their uuid, we
> can just source the correct one for that internal library.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Looked at several replacements, and the intel_perf_for_fd(), looks sane.

Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
