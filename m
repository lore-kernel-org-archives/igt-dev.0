Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089B8929F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 09:31:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
References: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158443744294.29852.17561209181016515023@build.alporthouse.com>
Date: Tue, 17 Mar 2020 09:30:42 +0000
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_ring_sync_copy:
 Removal of test
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
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting priyanka.dandamudi@intel.com (2020-03-17 05:32:47)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test is trying to verify the implicit order fencing. Similar scenario can
> be found in gem_exec_schedule. This test doesn't add anything to other
> tests. So, removing the test.
> 
> Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/Makefile.sources          |   3 -
>  tests/i915/gem_ring_sync_copy.c | 375 --------------------------------

You can also send a patch to remove gem_ring_sync_loop.c as that is
covered by one the many gem_sync subtests.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
