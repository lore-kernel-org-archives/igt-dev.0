Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360089B9E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2020 13:48:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200602085454.22812-1-dominik.grzegorzek@intel.com>
References: <20200602085454.22812-1-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159110571507.29407.5123461518504610045@build.alporthouse.com>
Date: Tue, 02 Jun 2020 14:48:35 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_spin_batch: Remove unncessary
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

Quoting Dominik Grzegorzek (2020-06-02 09:54:54)
> Following the rule "as few non-preemptible spinners as possible", this patch
> removes IGT_SPIN_NO_PREEMPTION flag from spin-all subtest, where it was used
> as a precaution.

Not as a precaution, by design. In part it's testing that the NOPREMPT
does work. Since this is a test case for the library, there does need to
be a NOPREEMPT variant.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
