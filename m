Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E866E3E1
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2020 11:07:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200104100826.21067-2-ramalingam.c@intel.com>
References: <20200104100826.21067-1-ramalingam.c@intel.com>
 <20200104100826.21067-2-ramalingam.c@intel.com>
Message-ID: <157813602671.11773.15215167026114870941@skylake-alporthouse-com>
Date: Sat, 04 Jan 2020 11:07:06 +0000
Subject: Re: [igt-dev] [RFC 2/2] tests/dumb_duffer: extending for lmem
 coverage.
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-01-04 10:08:26)
> if lmem is available on intel platforms, dumb buffers are created out of
> lmem. Hence tests are extended to cover the dumb buffers from lmem.

Which has what to do with the dumb API?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
