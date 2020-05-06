Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87B96E8D1
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 19:35:36 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200406135709.569315-2-lionel.g.landwerlin@intel.com>
References: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
 <20200406135709.569315-2-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158879373263.927.2919752195989238677@build.alporthouse.com>
Date: Wed, 06 May 2020 20:35:32 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/perf: add tests for multi
 context filtering
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

Quoting Lionel Landwerlin (2020-04-06 14:57:09)
> Iris is using 2 GEM contexts for 3D & compute.
> 
> v2: Check higher number of contexts
> 
> v3: Test unmapped memory pointers (Chris)
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

I trust you know the details of the report layout much better than I do,
so I just looked at the api coverage and was happy,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
