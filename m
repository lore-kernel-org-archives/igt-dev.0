Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35F26E288
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 14:50:56 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201117144356.1253838-1-imre.deak@intel.com>
References: <20201117144356.1253838-1-imre.deak@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 14:50:52 +0000
Message-ID: <160562465275.22621.7389784130169909263@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/fbdev: Add mmap readback subtest
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-11-17 14:43:56)
> Add a simple subtest checking that the mmap address we get for an FB
> corresponds to the content that we read back from the FB via the read
> syscall.

Please coordinate with https://patchwork.freedesktop.org/series/83955/
and decide what is the best approach since you both implement the same
test.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
