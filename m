Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072B6E1A7
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 11:51:09 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200929104818.14717-3-dominik.grzegorzek@intel.com>
References: <20200929104818.14717-1-dominik.grzegorzek@intel.com>
 <20200929104818.14717-3-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 29 Sep 2020 12:51:06 +0100
Message-ID: <160138026620.24748.11133389182699068986@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_bufops: Add simple object
 cache
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-09-29 11:48:17)
> +struct cache_entry {
> +       int fd;

So we assume that we are not lazy and completely clean up the cache
between subtests in case we reopen the device with the same fd?

For forking, if the parent opened with CLOEXEC, the child could open
the device with the same fd and not know about the parent's poison in
the cache. (This happens with the libdrm_intel cache, can be quite a
nuisance.)

Or not a concern?

> +       uint32_t size;
> +       uint32_t handle;
> +       uint64_t prev_offset;
> +       bool reserved;
> +       bool busy;
> +       struct igt_list_head link;

Consider member layout to reduce holes.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
