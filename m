Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200603100751.304637-1-matthew.auld@intel.com>
References: <20200603100751.304637-1-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159117907576.25109.10669419078526321419@build.alporthouse.com>
Date: Wed, 03 Jun 2020 11:11:15 +0100
Subject: Re: [igt-dev] [PATCH] i915: purge i915_gem_create_v2
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
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Matthew Auld (2020-06-03 11:07:51)
> The gem_create_v2 uapi was never merged, which would have been a nice
> addition to allow userspace to utilise stolen memory. Since it can only
> get in the way at this point, let's just remove it.

Just imagine all the trouble we could have saved had we been doing
asynchronous clearing of stolen memory for userspace 5+ years ago :|
 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
