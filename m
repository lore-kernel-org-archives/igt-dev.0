Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085816E049
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2020 11:57:53 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200401115513.148311-1-lionel.g.landwerlin@intel.com>
References: <20200401115513.148311-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158574227011.5852.10601410485357232052@build.alporthouse.com>
Date: Wed, 01 Apr 2020 12:57:50 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2] tools/i915-perf-recorder: fix
 topology alignment issue
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-04-01 12:55:13)
> The additional alignment added when writing into the output was not
> accounted in the header. This is preventing reading the recorded data.
> 
> Instead of adding the alignment when writing, just account for it when
> querying the topology.
> 
> v2: Use calloc
>     Drop unused var
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: f08865e58cd3 ("tools: add i915 perf recorder tool")
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
