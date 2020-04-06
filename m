Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990496E055
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 09:57:45 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Date: Mon, 6 Apr 2020 09:57:41 +0000
Message-ID: <5734061626B4B34D8BE569E3846B57A2C26183@BGSMSX107.gar.corp.intel.com>
References: <20200226130241.31558-1-sai.gowtham.ch@intel.com>
 <158272279684.2462.11970247480138062303@skylake-alporthouse-com>
In-Reply-To: <158272279684.2462.11970247480138062303@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available engines.
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Patch has been sent  https://patchwork.freedesktop.org/patch/360240/

Thanks,
Gowtham

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Wednesday, February 26, 2020 6:43 PM
To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available engines.

Quoting sai gowtham (2020-02-26 13:02:41)
> @@ -1221,56 +1252,113 @@ igt_main
>  
>                 igt_fork_hang_detector(fd);
>         }

To be safe, I need one to cover the legacy API. To check the bare essential that we can wait on a newly submitted request. A sync_ring, and a sync_all.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
