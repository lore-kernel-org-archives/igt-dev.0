Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896E6E158
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2020 11:08:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200916105932.908590-1-maarten.lankhorst@linux.intel.com>
References: <20200916105932.908590-1-maarten.lankhorst@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Sep 2020 12:07:58 +0100
Message-ID: <160025447892.2193.17838748605576152008@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_reloc: Cap max amount of
 active relocations in basic-many-active.
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

Quoting Maarten Lankhorst (2020-09-16 11:59:32)
> Especially with -EDEADLK handling we can add relocations many times,
> cap the amount of relocations tested, so that we still correctly
> test that we can fill more than PAGE_SIZE / sizeof(relocation)
> relocations.

This is purposefully breaking the test. Again.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
