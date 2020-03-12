Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079FA89D00
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 10:09:52 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200312095944.7477-3-petri.latvala@intel.com>
References: <20200312095944.7477-1-petri.latvala@intel.com>
 <20200312095944.7477-3-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158400778911.10732.9893379942780927697@build.alporthouse.com>
Date: Thu, 12 Mar 2020 10:09:49 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] runner: Read all kernel logs when
 there are logs
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-03-12 09:59:44)
> Instead of reading one record at a time between select() calls and
> tainted-checks etc, use the same at-the-end dmesg dumper whenever
> there's activity in /dev/kmsg. It's possible that the occasional chunk
> of missing dmesg we're sometimes hitting is due to reading too slowly,
> especially if there's a huge gem traceback.
> 
> Also print a clear message if we hit a log buffer underrun so we know
> it.
> 
> Reference: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/79
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>

Looks reasonable, the proof is in the pudding.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
for the series.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
