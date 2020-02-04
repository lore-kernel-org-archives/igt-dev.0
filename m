Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200131153123.25254-1-janusz.krzysztofik@linux.intel.com>
References: <20200131153123.25254-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <158083243313.1394.7470071904734111804@skylake-alporthouse-com>
Date: Tue, 04 Feb 2020 16:07:13 +0000
Subject: Re: [igt-dev] [RFC PATCH v2] drm/i915: Never allow userptr into the
 new mapping types
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-01-31 15:31:23)
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 9ddcf17230e6..334a578ce85f 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -923,7 +923,7 @@ i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
>         struct i915_vma *vma;
>         int ret;
>  
> -       if (i915_gem_object_never_bind_ggtt(obj))
> +       if (i915_gem_object_never_mmap(obj))
>                 return ERR_PTR(-ENODEV);

I think never_mmap() is more strictly correct than bind_ggtt() and it
was a mistake to prevent ggtt_pin() itself. Though I'll need to check
the revocation to make sure.

Right we should only revoke_mmap if i915_vma_has_userfault, which will
never be the case.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
