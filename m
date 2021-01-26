Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <161169867584.2943.4917889020493124389@build.alporthouse.com>
References: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
 <20210126130505.2938391-2-chris@chris-wilson.co.uk>
 <183f9081-0aeb-ebad-da8e-0dc25c449d2f@linux.intel.com>
 <161169867584.2943.4917889020493124389@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 Jan 2021 22:07:03 +0000
Message-ID: <161169882325.2943.15701595691472062994@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/sysfs_clients: Check that
 client ids are cyclic
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Chris Wilson (2021-01-26 22:04:35)
> I do expect userspace to search for its own client/ upon creation, and I
> expect there to be many clients being opened at once. So I think so long
> as the use of the library readdir is correct (distinct processes with
> distinct directory fd, so I think there's no accidental sharing) this
> represents. Hmm. fsync(dirfd).

fsync(dirfd) makes no difference.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
