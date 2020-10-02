Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BD86E912
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2020 09:36:44 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200930034029.64316-1-ashutosh.dixit@intel.com>
References: <20200930034029.64316-1-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 02 Oct 2020 10:36:41 +0100
Message-ID: <160163140103.4780.15903052662841878821@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Keep IGT working
 without pread/pwrite ioctls
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

Quoting Ashutosh Dixit (2020-09-30 04:40:29)
> The general direction at this time is to phase out pread/write ioctls
> and not support them in future products. This means IGT must handle
> the absence of these ioctls. This patch does this by modifying
> gem_read() and gem_write() to do the read/write using the pread/pwrite
> ioctls first but when these ioctls are unavailable fall back to doing
> the read/write using a combination of mmap and memcpy.

Note that not all pread/pwrite can be replaced by a mmap(bo) + mempcy.
Removing pread/pwrite support for arbitrary bo is a significant ABI
regression.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
