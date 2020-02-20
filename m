Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F936ECE0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 07:48:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
Message-ID: <158218486195.8112.17792417633553495989@skylake-alporthouse-com>
Date: Thu, 20 Feb 2020 07:47:41 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_request_retire: Removal of test
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

Quoting priyanka.dandamudi@intel.com (2020-02-20 05:14:32)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test is trying to hit a race condition by submitting same buffer object
> between two contexts on different rings.Similar scenario can be found in
> gem_ctx_param and gem_exec_ctx.This test doesn't add anything to other
> tests.So,removing the test.

Neither of those try to replicate the bug found in this regression test.
gem_ctx_persistence does have similar patterns. Are you sure we do have
it covered?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
