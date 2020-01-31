Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 31 Jan 2020 15:39:17 +0100
Message-ID: <1753010.1nAikX5oWX@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <158048114147.2430.6882438649434461232@skylake-alporthouse-com>
References: <20200131132037.23319-1-janusz.krzysztofik@linux.intel.com>
 <20200131132037.23319-2-janusz.krzysztofik@linux.intel.com>
 <158048114147.2430.6882438649434461232@skylake-alporthouse-com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH 1/1] drm/i915: Never allow userptr into
 the new mapping types
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, January 31, 2020 3:32:21 PM CET Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2020-01-31 13:20:37)
> > Commit 4f2a572eda67 ("drm/i915/userptr: Never allow userptr into the
> > mappable GGTT") made I915_GEM_MMAP_GTT IOCTLs to fail when atepmted
> > on a userptr object in order to protect from a lockdep splat.  Later
> > on, new mapping types were introduced by commit cc662126b413
> > ("drm/i915: Introduce DRM_I915_GEM_MMAP_OFFSET").  Those new mapping
> > types suffer from the same lockdep splat issue but they now succeed
> > when tried on top of a userptr object.  Fix it.
> > 
> > While being at it, return -EINVAL which seems to better reflect the
> > reason for the failure than -ENODEV.
> 
> No. It is not a user error, it's a failure to implement support for it,
> so we parcel it off as an incompatible device.

OK, if there is no better option I'll revert that to -ENODEV and resubmit.

Thanks,
Janusz


> -Chris
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
