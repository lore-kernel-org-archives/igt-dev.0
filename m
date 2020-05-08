Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE74C6E14B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 21:41:27 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200508213447.1432-1-ashutosh.dixit@intel.com>
References: <20200508213447.1432-1-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158897408211.22081.10081320446757842794@build.alporthouse.com>
Date: Fri, 08 May 2020 22:41:22 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_shrink: touch each page in
 pwrite_/pread_
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-05-08 22:34:47)
> pwrite_() and pread_() purport to read each page but weren't.
> 
> Reported-by: CQ Tang <cq.tang@intel.com>
> Fixes: 88bfe6ac41 ("igt/gem_shrink: Add pread/pwrite stress)
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Keep the subpage iteration for the variation.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
