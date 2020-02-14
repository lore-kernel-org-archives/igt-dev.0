Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200214130826.31004-1-matthew.auld@intel.com>
References: <20200214130826.31004-1-matthew.auld@intel.com>
Message-ID: <158168728490.10420.13572145718849775172@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 13:34:44 +0000
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_exec_store: remove hard coded
 engine limit
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

Quoting Matthew Auld (2020-02-14 13:08:26)
> Prep for having an arbitrary context engine[], since that can be
> whatever we like.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

Arrays allocated, cleared and freed for nengine.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
