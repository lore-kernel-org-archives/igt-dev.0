Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BAB6E037
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 05:27:50 +0000 (UTC)
Date: Wed, 13 Oct 2021 07:27:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211013052745.GA3586@zkempczy-mobl2>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
 <20211008065432.15482-2-zbigniew.kempczynski@intel.com>
 <87k0ihpm3t.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0ihpm3t.wl-ashutosh.dixit@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 12, 2021 at 09:47:18PM -0700, Dixit, Ashutosh wrote:
> On Thu, 07 Oct 2021 23:54:26 -0700, Zbigniew Kempczyński wrote:
> >
> > +bool gem_allows_passing_alignment(int fd)
> > +{
> > +	struct drm_i915_gem_exec_object2 obj = {
> > +		.handle = gem_create(fd, 4096),
> > +	};
> > +	struct drm_i915_gem_execbuffer2 execbuf = {
> > +		.buffers_ptr = to_user_pointer(&obj),
> > +		.buffer_count = 1,
> > +	};
> > +	bool ret;
> > +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> > +
> > +	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
> > +	gem_execbuf(fd, &execbuf);
> > +
> > +	obj.alignment = 0x2000;
> 
> 8K? Shouldn't this be less than 4K?

I'm not sure how kernel check will look like so positive value larger
than 4K is sane for me. For example if in the kernel we will have:

if (entry->alignment != 0 && entry->alignment != 0x1000)
	return -EINVAL;

checking with 0x1000 would give me kernel supports alignment what
is not true. I'm saying I'm not sure because there's no patch 
kernel which land upstream yet. My trybot patch is in:

https://patchwork.freedesktop.org/series/95087/

but there's only generation check. 

--
Zbigniew

> 
> > +	ret = __gem_execbuf(fd, &execbuf) == 0;
> > +	gem_close(fd, obj.handle);
> > +
> > +	return ret;
> > +}
