Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F9D6E57E
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 12:44:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
References: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 01 Feb 2021 12:44:45 +0000
Message-ID: <161218348573.27906.6447374675845481495@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_vgem: Skip userptr test on
 !llc.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Maarten Lankhorst (2021-02-01 12:36:54)
> It's bad form to change caching on userptr; it's always assumed
> to be cached memory.

No, it isn't.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
