Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921F889CBC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 11:48:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210225083553.7540-1-petri.latvala@intel.com>
References: <20210225083553.7540-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 02 Mar 2021 11:48:02 +0000
Message-ID: <161468568208.13469.12406365697364305928@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: Stop producing results at all
 for kernel selftests on taint
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

Quoting Petri Latvala (2021-02-25 08:35:53)
> Instead of producing skips for the rest when one selftest taints the
> kernel, stop running them altogether. Having the skips produced yields
> no value and just makes future improvements (like correctly tagging
> tests that cause taints) harder. In effect, this gets us back to the
> old setup when tainting made igt_runner immediately kill the test and
> similarly made us not get spurious results for the rest of the
> selftests.

Skip isn't spurious here. I don't see how this impacts tagging the
earlier tests. So the only question for me is whether SKIP or NOTRUN is
more applicable. And skip is far more informative when run by hand...

Skip means the test exists (and under dynamic we presume applicable) but
could not be run due to an external event.

What improvement do we expect here? If it's just working around
mistaken cibuglog policy, then I don't see anything...
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
