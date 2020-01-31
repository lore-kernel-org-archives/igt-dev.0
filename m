Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B346E237
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 20:04:47 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580499870.git.ashutosh.dixit@intel.com>
 <fe554b5b42e3e4aad658c4eda46045d8b12fbfa8.1580499870.git.ashutosh.dixit@intel.com>
In-Reply-To: <fe554b5b42e3e4aad658c4eda46045d8b12fbfa8.1580499870.git.ashutosh.dixit@intel.com>
Message-ID: <158050108298.9260.1661015850610035561@skylake-alporthouse-com>
Date: Fri, 31 Jan 2020 20:04:43 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] benchmarks/gem_mmap: Add feature
 checks and use mmap_offset
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

Quoting Ashutosh Dixit (2020-01-31 19:47:01)
> Add checks for particular features to be available before invoking
> those tests. Also use function versions with mmap_offset.

Kind of missing the point for exercising any and every available path?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
