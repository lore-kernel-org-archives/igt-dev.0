Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ABC10E5F6
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 11:59:25 +0000 (UTC)
Date: Fri, 5 Jan 2024 10:56:21 -0100
From: Melissa Wen <mwen@igalia.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_fb: fix documentation of
 igt_create_color_fb return
Message-ID: <p7tvezsdk2ujj5hbeaiftzryf7stfkguzbkhwz5hlmpwrovnfk@zhmky3npcxjn>
References: <20231226191054.23794-1-mwen@igalia.com>
 <20231226191054.23794-3-mwen@igalia.com>
 <20240104182427.4btfzapnbt3zyfl2@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104182427.4btfzapnbt3zyfl2@kamilkon-desk.igk.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 01/04, Kamil Konieczny wrote:
> Hi Melissa,
> On 2023-12-26 at 17:57:33 -0100, Melissa Wen wrote:
> > igt_create_fb fails without returning a negative error code (unsigned
> > int), so does igt_create_color_fb. Remove the `negative error code on
> > failure` from function docs to avoid misleading usage.
> 
> Why not just make it correct?
> 
> int igt_create_color_fb(int fd, int width, int height,
> 
> and check for errors and return -errno or what is received.

The return value of igt_create_color_fb() derives from
igt_create_fb_with_bo_size() and igt_create_fb(). Therefore, changing it
requires modification in those three functions and, at least, all
occurences of igt_create_fb_with_bo_size and igt_create_color_fb (many).

When checking the usage of these functions, the unsigned int return for
both seems to me the current understanding because inside
igt_create_fb_with_bo_size() we have a do_or_die() call that asserts
negative errors.

I've considered changing it, but I don't have a different usage for the
function so far to justify the whole change, that's why I chose not
modifying the behavior of those functions. But let me know if I'm
missing anything that would make the change appropriate and sure I can
go for it.

Anyway, thanks for raising this point.

Best Regards,

Melissa
> 
> Regards,
> Kamil
> 
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  lib/igt_fb.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 2cf94013e..2446edd2b 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -2174,8 +2174,7 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
> >   * with the given color, which is useful for some simple pipe crc based tests.
> >   *
> >   * Returns:
> > - * The kms id of the created framebuffer on success or a negative error code on
> > - * failure.
> > + * The kms id of the created framebuffer on success.
> >   */
> >  unsigned int igt_create_color_fb(int fd, int width, int height,
> >  				 uint32_t format, uint64_t modifier,
> > -- 
> > 2.43.0
> > 
