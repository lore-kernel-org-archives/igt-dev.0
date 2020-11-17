Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
References: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 12:18:04 +0000
Message-ID: <160561548452.22621.12237070971991385724@build.alporthouse.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t] gem_wsim: Implement device selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-11-17 11:40:50)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> -L and -D <device> on the command line.
> 
> With no device specified tool tries to find i915 discrete or integrated in
> that order.

Ok, looks straightforward enough. (I still like having an idiot's guide
with examples of -L output and what to pass to -D).

> +       fd = igt_open_card(&card);
> +       igt_require(fd);

Does igt_require() still generate weirdness when used outside of igt
tests?

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
