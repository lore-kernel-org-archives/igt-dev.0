Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42206E830
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 00:51:34 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 3 Jun 2021 00:50:59 +0000
Message-ID: <7558560b129a9d78c55b821333d475c6972491a9.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-3-alan.previn.teres.alexis@intel.com>
 <YLfl04+bas0t2r4Q@intel.com>
In-Reply-To: <YLfl04+bas0t2r4Q@intel.com>
Content-Language: en-US
Content-ID: <7BD8742588E4A041BAB6510EAB2C9BEA@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/17] Add PXP UAPI support in i915_drm.h
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Okay - will do. 

On Wed, 2021-06-02 at 16:10 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:29AM -0700, Alan Previn wrote:
> > At the time of this commit, PXP hasnt been merged into
> > upstream kernel so this has no kernel tag reference yet
> 
> chicken egg issue right, but probably better to kill this patch
> and sync directly when merging, right after the kernel merged.
> 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  include/drm-uapi/i915_drm.h | 52
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/include/drm-uapi/i915_drm.h b/include/drm-
> > uapi/i915_drm.h
> > index d9fbf218..e67e3e5c 100644
> > --- a/include/drm-uapi/i915_drm.h
> > +++ b/include/drm-uapi/i915_drm.h
> > @@ -1743,6 +1743,26 @@ struct drm_i915_gem_context_param {
> >   * Default is 16 KiB.
> >   */
> >  #define I915_CONTEXT_PARAM_RINGSIZE	0xc
> > +
> > +/*
> > + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> > + *
> > + * Mark that the context makes use of protected content, which
> > will result
> > + * in the context being invalidated when the protected content
> > session is.
> > + * This flag can only be set at context creation time and, when
> > set to true,
> > + * must be preceded by an explicit setting of
> > I915_CONTEXT_PARAM_RECOVERABLE
> > + * to false. This flag can't be set to true in conjunction with
> > setting the
> > + * I915_CONTEXT_PARAM_BANNABLE flag to false.
> > + *
> > + * Given the numerous restriction on this flag, there are several
> > unique
> > + * failure cases:
> > + *
> > + * -ENODEV: feature not available
> > + * -EEXIST: trying to modify an existing context
> > + * -EPERM: trying to mark a recoverable or not bannable context as
> > protected
> > + * -EACCES: submitting an invalidated context for execution
> > + */
> > +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> >  /* Must be kept compact -- no holes and well documented */
> >  
> >  	__u64 value;
> > @@ -1973,6 +1993,12 @@ struct drm_i915_reg_read {
> >  struct drm_i915_reset_stats {
> >  	__u32 ctx_id;
> >  	__u32 flags;
> > +	/*
> > +	 * contexts marked as using protected content are invalidated
> > when the
> > +	 * protected content session dies. Submission of invalidated
> > contexts
> > +	 * is rejected with -EACCES.
> > +	 */
> > +#define I915_CONTEXT_INVALIDATED 0x1
> >  
> >  	/* All resets since boot/module reload, for all contexts */
> >  	__u32 reset_count;
> > @@ -2645,6 +2671,7 @@ struct drm_i915_gem_create_ext {
> >  	 * struct drm_i915_gem_create_ext_memory_regions.
> >  	 */
> >  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> > +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> >  	__u64 extensions;
> >  };
> >  
> > @@ -2702,6 +2729,31 @@ struct
> > drm_i915_gem_create_ext_memory_regions {
> >  	__u64 regions;
> >  };
> >  
> > +/*
> > + * I915_OBJECT_PARAM_PROTECTED_CONTENT:
> > + *
> > + * If set to true, buffer contents is expected to be protected by
> > PXP
> > + * encryption and requires decryption for scan out and processing.
> > This is
> > + * only possible on platforms that have PXP enabled, on all other
> > scenarios
> > + * setting this flag will cause the ioctl to fail and return
> > -ENODEV.
> > + *
> > + * The buffer contents are considered invalid after a PXP session
> > teardown.
> > + * It is recommended to use protected buffers only with contexts
> > created
> > + * using the I915_CONTEXT_PARAM_PROTECTED_CONTENT flag, as that
> > will enable
> > + * extra checks at submission time on the validity of the objects
> > involved,
> > + * which can lead to the following errors:
> > + *
> > + * -ENODEV: PXP session not currently active
> > + * -EIO: buffer has become invalid after a teardown event
> > + */
> > +struct drm_i915_gem_create_ext_protected_content {
> > +	struct i915_user_extension base;
> > +	__u32 flags;
> > +};
> > +
> > +/* ID of the protected content session managed by i915 when PXP is
> > active */
> > +#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
