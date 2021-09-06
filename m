Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1778996E
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 06:18:38 +0000 (UTC)
Date: Mon, 6 Sep 2021 09:21:42 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YTWzdjyUV49hy5/f@platvala-desk.ger.corp.intel.com>
References: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
 <20210902173043.821318-2-alan.previn.teres.alexis@intel.com>
 <YTH5gdy/GGp1LT6C@platvala-desk.ger.corp.intel.com>
 <0ec0c1e9f6e06a7cdf9b87f377c892f542d10ece.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec0c1e9f6e06a7cdf9b87f377c892f542d10ece.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v9 01/16] Add PXP UAPI support in
 i915_drm.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Sep 04, 2021 at 12:11:47AM +0300, Teres Alexis, Alan Previn wrote:
> oops - my bad - didnt realize we had that - will do.
> 
> While on this, would it make sense to permanently include lib/i915/i915_drm_local.h from include/drm-
> uapi/i915_drm.h (but latter would always remain empty on upstream)?. This way, when kernel support is
> added for UAPI changes, we move the definitions across but dont add and need remove the '#include
> "lib/i915/i915_drm_local.h" from the other source files (requiring another change)?

It would, but it's impossible. include/drm-uapi/i915_drm.h is supposed
to be a pristine unchanged drop from the kernel.

The other way around might work but looks more odd from the .c side.


-- 
Petri Latvala



> 
> ...alan
> 
> On Fri, 2021-09-03 at 13:31 +0300, Petri Latvala wrote:
> > On Thu, Sep 02, 2021 at 10:30:28AM -0700, Alan Previn wrote:
> > > At the time of this commit, PXP hasnt been merged into
> > > upstream kernel so this has no kernel tag reference yet
> >
> > Please use the newly added lib/i915/i915_drm_local.h for these
> > additions then.
> >
> >
> > --
> > Petri Latvala
> >
> >
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >  include/drm-uapi/i915_drm.h | 53 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 53 insertions(+)
> > >
> > > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> > > index b9632bb2..98149a7d 100644
> > > --- a/include/drm-uapi/i915_drm.h
> > > +++ b/include/drm-uapi/i915_drm.h
> > > @@ -1815,6 +1815,25 @@ struct drm_i915_gem_context_param {
> > >   * attempted to use it, never re-use this context param number.
> > >   */
> > >  #define I915_CONTEXT_PARAM_RINGSIZE        0xc
> > > +
> > > +/*
> > > + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> > > + *
> > > + * Mark that the context makes use of protected content, which will result
> > > + * in the context being invalidated when the protected content session is.
> > > + * This flag can only be set at context creation time and, when set to true,
> > > + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
> > > + * to false. This flag can't be set to true in conjunction with setting the
> > > + * I915_CONTEXT_PARAM_BANNABLE flag to false.
> > > + *
> > > + * Given the numerous restriction on this flag, there are several unique
> > > + * failure cases:
> > > + *
> > > + * -ENODEV: feature not available
> > > + * -EPERM: trying to mark a recoverable or not bannable context as protected
> > > + * -EACCES: submitting an invalidated context for execution
> > > + */
> > > +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> > >  /* Must be kept compact -- no holes and well documented */
> > >
> > >     __u64 value;
> > > @@ -2931,8 +2950,12 @@ struct drm_i915_gem_create_ext {
> > >      *
> > >      * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
> > >      * struct drm_i915_gem_create_ext_memory_regions.
> > > +    *
> > > +    * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> > > +    * struct drm_i915_gem_create_ext_protected_content.
> > >      */
> > >  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> > > +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> > >     __u64 extensions;
> > >  };
> > >
> > > @@ -2990,6 +3013,36 @@ struct drm_i915_gem_create_ext_memory_regions {
> > >     __u64 regions;
> > >  };
> > >
> > > +/**
> > > + * struct drm_i915_gem_create_ext_protected_content - The
> > > + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
> > > + *
> > > + * If this extension is provided, buffer contents are expected to be
> > > + * protected by PXP encryption and requires decryption for scan out
> > > + * and processing. This is only possible on platforms that have PXP enabled,
> > > + * on all other scenarios ysing this extension will cause the ioctl to fail
> > > + * and return -ENODEV. The flags parameter is reserved for future expansion and
> > > + * must currently be set to zero.
> > > + *
> > > + * The buffer contents are considered invalid after a PXP session teardown.
> > > + *
> > > + * The encryption is guaranteed to be processed correctly only if the object
> > > + * is submitted with a context created using the
> > > + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
> > > + * at submission time on the validity of the objects involved, which can lead to
> > > + * the following errors being returned from the execbuf ioctl:
> > > + *
> > > + * -ENODEV: PXP session not currently active
> > > + * -ENOEXEC: buffer has become invalid after a teardown event
> > > + */
> > > +struct drm_i915_gem_create_ext_protected_content {
> > > +   struct i915_user_extension base;
> > > +   __u32 flags;
> > > +};
> > > +
> > > +/* ID of the protected content session managed by i915 when PXP is active */
> > > +#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > > --
> > > 2.25.1
> > >
> 
