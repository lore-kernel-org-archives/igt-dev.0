Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621DF89FC0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 11:17:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210216092453.8620-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210216092453.8620-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 16 Feb 2021 11:17:35 +0000
Message-ID: <161347425532.27357.2110533879857465097@build.alporthouse.com>
Subject: Re: [igt-dev] [i-g-t] test/i915/gem_exec_reloc: set max practical
 relocation limit
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org
Cc: hariom.pandey@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tejas Upadhyay (2021-02-16 09:24:53)
> practically lets assume we will have < 512 relocations per page and
> multiple object relocations will continue to work. Its highly unlike
> to get as many relocations which basic-many-active test is testing
> thus setting max limit to 2048 should suffice reloactions test.

But is exercising a severe exploitable bug in the code.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
