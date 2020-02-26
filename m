Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5556E29D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 13:13:31 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200226130241.31558-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200226130241.31558-1-sai.gowtham.ch@intel.com>
Message-ID: <158272279684.2462.11970247480138062303@skylake-alporthouse-com>
Date: Wed, 26 Feb 2020 13:13:16 +0000
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
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting sai gowtham (2020-02-26 13:02:41)
> @@ -1221,56 +1252,113 @@ igt_main
>  
>                 igt_fork_hang_detector(fd);
>         }

To be safe, I need one to cover the legacy API. To check the bare
essential that we can wait on a newly submitted request. A sync_ring,
and a sync_all.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
