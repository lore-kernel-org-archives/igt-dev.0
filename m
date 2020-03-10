Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4039389107
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2020 17:00:24 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200310170928.109826-1-don.hiatt@intel.com>
References: <20200310170928.109826-1-don.hiatt@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158385962097.28297.12822720029591988949@build.alporthouse.com>
Date: Tue, 10 Mar 2020 17:00:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_pm: Adjust pm status check
 timeout and log timing
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
To: don.hiatt@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting don.hiatt@intel.com (2020-03-10 17:09:28)
> From: Don Hiatt <don.hiatt@intel.com>
> 
> Increase the overall time we wait to achieve the desired runtime
> status to 15 seconds to fix an occasional timeout and do so
> in 1 second increments to speed up exiting. Also log the
> amount of time we waited to get a handle on how much variation
> we run into.

Ahem. But it is still an error, whereas this is now hiding severe
failures.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
