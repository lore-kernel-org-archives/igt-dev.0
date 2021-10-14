Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E182F6EC1B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 07:14:51 +0000 (UTC)
Date: Thu, 14 Oct 2021 09:14:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211014071446.GA3617@zkempczy-mobl2>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
 <20211008065432.15482-2-zbigniew.kempczynski@intel.com>
 <87k0ihpm3t.wl-ashutosh.dixit@intel.com>
 <20211013052745.GA3586@zkempczy-mobl2>
 <87bl3sibor.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bl3sibor.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib/gem_submission: Add kernel exec
 object alignment capability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 07:26:28PM -0700, Dixit, Ashutosh wrote:
> On Tue, 12 Oct 2021 22:27:45 -0700, Zbigniew Kempczyński wrote:
> >
> > On Tue, Oct 12, 2021 at 09:47:18PM -0700, Dixit, Ashutosh wrote:
> > > On Thu, 07 Oct 2021 23:54:26 -0700, Zbigniew Kempczyński wrote:
> > > >
> > > > +bool gem_allows_passing_alignment(int fd)
> > > > +{
> > > > +	struct drm_i915_gem_exec_object2 obj = {
> > > > +		.handle = gem_create(fd, 4096),
> > > > +	};
> > > > +	struct drm_i915_gem_execbuffer2 execbuf = {
> > > > +		.buffers_ptr = to_user_pointer(&obj),
> > > > +		.buffer_count = 1,
> > > > +	};
> > > > +	bool ret;
> > > > +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> > > > +
> > > > +	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> > > > +	gem_execbuf(fd, &execbuf);
> > > > +
> > > > +	obj.alignment = 0x2000;
> > >
> > > 8K? Shouldn't this be less than 4K?
> >
> > I'm not sure how kernel check will look like so positive value larger
> > than 4K is sane for me. For example if in the kernel we will have:
> >
> > if (entry->alignment != 0 && entry->alignment != 0x1000)
> >	return -EINVAL;
> 
> Sorry I am still not following why the alignment has to be > 4K. Since for
> alignment we generally consider aligned to a 4K page, so an alignment value
> which is multiple of 4K might not even be a correct test. I would just use
> an alignment value of 64 here (kernel requires it to be a power of
> 2). Wouldn't that work? Thanks.

Agree, on input any value which is power of two is correct. I just choosen
8K because it is a) page aligned b) power of two so definitely this value
can be used within kernel. 

alignment = 64 is a little bit tricky - it is correct but will be changed 
to minimum alignment before pinning so I would like to avoid such values.
I've spent some time to go over the pinning path according what has happen
with that 64 and I was surprised it is not used at all anywhere.

Resume: any value which is power of two is correct here, I just took 8K.

--
Zbigniew
