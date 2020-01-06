Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA8889359
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2020 06:43:36 +0000 (UTC)
Date: Mon, 6 Jan 2020 12:13:04 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20200106064302.GA29868@intel.com>
References: <20200104100826.21067-1-ramalingam.c@intel.com>
 <20200104100826.21067-2-ramalingam.c@intel.com>
 <157813602671.11773.15215167026114870941@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157813602671.11773.15215167026114870941@skylake-alporthouse-com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-01-04 at 11:07:06 +0000, Chris Wilson wrote:
> Quoting Ramalingam C (2020-01-04 10:08:26)
> > if lmem is available on intel platforms, dumb buffers are created out of
> > lmem. Hence tests are extended to cover the dumb buffers from lmem.
> 
> Which has what to do with the dumb API?
Chris,

API is agnostic to memory region agnostic. But the page boundary that
needs to be considered for tests are different between LMEM and SMEM.
And also we need to get the total local memory available for the
create-clear test.

These changes were done in this patch.

-Ram
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
