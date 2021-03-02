Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4805E898A4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 13:43:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <YD48PM60jGITDHni@platvala-desk.ger.corp.intel.com>
References: <20210225083553.7540-1-petri.latvala@intel.com>
 <161468568208.13469.12406365697364305928@build.alporthouse.com>
 <YD4yB/x4tv3Du7vG@platvala-desk.ger.corp.intel.com>
 <161469026970.16094.600012892357124517@build.alporthouse.com>
 <YD48PM60jGITDHni@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 02 Mar 2021 13:42:47 +0000
Message-ID: <161469256779.16094.15428266423214157575@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: Stop producing results at all
 for kernel selftests on taint
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2021-03-02 13:23:08)
> Anyway best practices for dynamic subtests is to never skip, but
> instead not exist at all.

Ok, as that's the prevailing wisdom,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
