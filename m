Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BEE10E309
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 06:48:20 +0000 (UTC)
Date: Mon, 13 Mar 2023 07:48:16 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
Message-ID: <20230313064816.kwt5lzjjsyrpwtzk@zkempczy-mobl2>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
 <20230310082326.12088-18-zbigniew.kempczynski@intel.com>
 <87e775e9-e63a-1011-ad82-3e1e513c11bc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87e775e9-e63a-1011-ad82-3e1e513c11bc@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 17/18] xe_mmap: skip VRAM tests if no
 VRAM is found
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

On Fri, Mar 10, 2023 at 11:52:15AM +0100, Das, Nirmoy wrote:
> 
> On 3/10/2023 9:23 AM, Zbigniew Kempczyński wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Instead of producing an error, if there's no VRAM, the test
> > should be skipped. There's a logic there that would be doing
> > that, except that it doesn't really work :-)
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   tests/xe/xe_mmap.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> > index 9dce6adbe2..6b313a1895 100644
> > --- a/tests/xe/xe_mmap.c
> > +++ b/tests/xe/xe_mmap.c
> > @@ -42,8 +42,7 @@ test_mmap(int fd, uint32_t flags)
> >   	uint64_t mmo;
> >   	void *map;
> > -	if (flags & vram_memory(fd, 0))
> > -		igt_require(xe_has_vram(fd));
> 
> This check should go to the igt_main instead.

You mean to igt_subtest()? In igt_main() you can't use fd.
IMO change is ok, if there's no region on xe fd flags passed == 0
what will cause skip on require.

--
Zbigniew

> 
> 
> Nirmoy
> 
> > +	igt_require_f(flags, "Device doesn't support such memory region\n");
> >   	bo = xe_bo_create_flags(fd, 0, 4096, flags);
> >   	mmo = xe_bo_mmap_offset(fd, bo);
