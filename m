Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20201117135918.354284-1-tvrtko.ursulin@linux.intel.com>
References: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
 <20201117135918.354284-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 14:06:26 +0000
Message-ID: <160562198607.22621.14513375230209122787@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] gem_wsim: Implement device selection
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-11-17 13:59:18)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> -L and -D <device> on the command line.
> 
> With no device specified tool tries to find i915 discrete or integrated in
> that order.
> 
> v2:
>  * Fix error handling and support render devices.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Hmm, optarg should be a pointer into the argv, so is the copy necessary?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
