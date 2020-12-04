Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4796D6E138
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Dec 2020 10:18:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <899d5b123777447dae328207e2d35f05@intel.com>
References: <20201202091747.409-1-nidhi1.gupta@intel.com>
 <160690139620.2037.12501279123485164291@build.alporthouse.com>
 <899d5b123777447dae328207e2d35f05@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 04 Dec 2020 10:17:57 +0000
Message-ID: <160707707719.6805.2057053252335449198@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Check for available outputs
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
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Gupta, Nidhi1 (2020-12-04 08:15:03)
> Thanks for the review Chris, what I am trying to do is to execute 
> subtest only on the available output not on all, as all the tests which 
> I grouped together are dual display tests so I merged them together , 
> can you suggest some way to achieve the same if not using dynamic subtest?

It's not an issue if tests skip for a known/static reason such as HW
configuration.

The issue is that some tools don't believe skips are valid. Approach it
from that angle: why do we waste time treating skips as a bug, when the
skip is expected.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
