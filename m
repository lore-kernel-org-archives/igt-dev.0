Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0150F11330A
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 14:26:47 +0000 (UTC)
Date: Tue, 31 May 2022 17:24:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <YpYlI5CRHGqc3VM4@platvala-desk.ger.corp.intel.com>
References: <20220525191801.2746592-1-markyacoub@chromium.org>
 <YpXbrVsKbDWNPoEz@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpXbrVsKbDWNPoEz@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH] kms_prop_blob: Add new subtest for write-only
 blobs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 31, 2022 at 12:11:09PM +0300, Petri Latvala wrote:
> On Wed, May 25, 2022 at 03:18:01PM -0400, Mark Yacoub wrote:
> > [Why]
> > Some blobs support secret data injected into the kernel that should be
> > retrieved back to user space (like HDCP key provisioned from a server
> > and injected to the kernel)
> > 
> > [How]
> > Create a blob using the write only flag and validate that the data it
> > holds can't be read again by the user space.
> > Compare this behavior against a blob created without the flag.
> > 
> > TEST=blob-write-only
> > TESTED-ON=Trogdor
> > 
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  include/drm-uapi/drm_mode.h |  6 ++++++
> >  tests/kms_prop_blob.c       | 39 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> > index e4a2570a..38d6c1f0 100644
> > --- a/include/drm-uapi/drm_mode.h
> > +++ b/include/drm-uapi/drm_mode.h
> > @@ -1075,6 +1075,9 @@ struct drm_format_modifier {
> >  	__u64 modifier;
> >  };
> >  
> > +#define DRM_MODE_CREATE_BLOB_WRITE_ONLY                                        \
> > +       (1 << 0) /* data of the blob can't be read by user space */
> > +
> >  /**
> >   * struct drm_mode_create_blob - Create New blob property
> >   *
> > @@ -1088,6 +1091,9 @@ struct drm_mode_create_blob {
> >  	__u32 length;
> >  	/** @blob_id: Return: new property ID. */
> >  	__u32 blob_id;
> > +	/** Flags for special handling. */
> > +       __u32 flags;
> > +       __u32 pad;
> >  };
> >  
> >  /**
> 
> Have the changes to drm-uapi in a separate commit and state which
> kernel sha they're copied from. And actually copy, no hand editing.
> 
> 
> > diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
> > index 96aa6d8d..c130a432 100644
> > --- a/tests/kms_prop_blob.c
> > +++ b/tests/kms_prop_blob.c
> > @@ -75,6 +75,7 @@ validate_prop(int fd, uint32_t prop_id)
> >  {
> >  	struct drm_mode_get_blob get;
> >  	struct drm_mode_modeinfo ret_mode;
> > +	ret_mode.clock = 0;
> >  
> >  	get.blob_id = prop_id;
> >  	get.length = 0;
> > @@ -94,12 +95,13 @@ validate_prop(int fd, uint32_t prop_id)
> >  }
> >  
> >  static uint32_t
> > -create_prop(int fd)
> > +create_prop_with_flags(int fd, uint32_t flags)
> >  {
> >  	struct drm_mode_create_blob create;
> >  
> >  	create.length = sizeof(test_mode_valid);
> > -	create.data = (uintptr_t) &test_mode_valid;
> > +	create.data = (uintptr_t)&test_mode_valid;
> > +	create.flags = flags;
> >  
> >  	do_ioctl(fd, DRM_IOCTL_MODE_CREATEPROPBLOB, &create);
> 
> How does this behave if the running kernel doesn't have flags support
> at all? Is that discoverable from userspace somehow?


As for how this behaves, answering myself:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7175/shard-snb6/igt@kms_prop_blob@blob-write-only.html


-- 
Petri Latvala
