Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FCA6E13A
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Dec 2020 12:06:51 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 04 Dec 2020 12:06:48 +0000
Message-ID: <160708360801.1246.16281098489778669426@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Don't kill a test on taint if
 watching timeouts
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: drm-intel@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-12-04 11:51:38)
> We may still be interested in results of a test even if it has tainted
> the kernel.  On the other hand, we need to kill the test on taint if no
> other means of killing it on a jam is active.

Just so long as we are confident that the original error is preserved,
and not lost under a deluge of what may come next. E.g. is there
sufficient syncs after detecting the taint to record the kernel logs
asap?

Although that the kernel taints is a strong indicator the test results
are unreliable (or even irrelevant), imo.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
