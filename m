Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232996E872
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 06:35:40 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Wed, 18 Mar 2020 06:35:35 +0000
Message-ID: <F959E33BDD0A9E4E9BE35174E15E72EC019950F8@BGSMSX109.gar.corp.intel.com>
References: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
 <158443744294.29852.17561209181016515023@build.alporthouse.com>
In-Reply-To: <158443744294.29852.17561209181016515023@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "'igt-dev@lists.freedesktop.org'" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Chris,

Sent a patch to remove gem_ring_sync_loop.c. Below is the URL for the same.
https://patchwork.freedesktop.org/patch/357980/

Regards,
Priyanka

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: 17 March 2020 03:01 PM
To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_ring_sync_copy: Removal of test

Quoting priyanka.dandamudi@intel.com (2020-03-17 05:32:47)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test is trying to verify the implicit order fencing. Similar scenario 
> can be found in gem_exec_schedule. This test doesn't add anything to 
> other tests. So, removing the test.
> 
> Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/Makefile.sources          |   3 -
>  tests/i915/gem_ring_sync_copy.c | 375 
> --------------------------------

You can also send a patch to remove gem_ring_sync_loop.c as that is covered by one the many gem_sync subtests.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
