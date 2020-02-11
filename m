Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A2B6EA7E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 14:22:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200211141820.29114-1-petri.latvala@intel.com>
References: <20200211141820.29114-1-petri.latvala@intel.com>
Message-ID: <158143093529.2303.13043048196811084567@skylake-alporthouse-com>
Date: Tue, 11 Feb 2020 14:22:15 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Remove blacklist entries for
 removed tests
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-02-11 14:18:20)
> Removed entries in blacklist.txt that no longer match any
> tests. Removals of these tests have been done in these commits:
> 
> - 5c9dea6487d8 ("tests/gem_hangcheck_forcewake: Drop gem_hangcheck_forcewake.c")
> - 31711203f7d6 ("tests/gem_pin: Drop gem_pin.c")
> - 4147bab8e3dc ("i915: Drop prefault controls")
> - ece35d37e6b0 ("tests/gem_seqno_wrap: Drop gem_seqno_wrap.c")
> - 94b866b68d8e ("tests/i915/gem_storedw*: Remove tests")
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>

I thought my due diligence was higher. I really shouldn't be amazed by
how lazy I am.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
