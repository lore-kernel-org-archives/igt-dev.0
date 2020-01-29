Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDAB6F8A1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 22:37:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129223507.27743-1-antonio.argenziano@intel.com>
References: <20200129223507.27743-1-antonio.argenziano@intel.com>
Message-ID: <158033743974.13511.7439414380114490727@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 22:37:19 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_persistent_relocs:
 remove test
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-01-29 22:35:07)
> Test has been superseded by a more complete collection of tests in
> gem_exec_reloc, therefore, remove the test.
> 
> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

What felt unique about this test (other than every test is special) is
that it included an interruptible pass, which we duly added to
gem_exec_reloc.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
