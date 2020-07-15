Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824A46EBDA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 16:54:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so6234423wmi.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 09:54:24 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:54:16 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20200715165416.eotgiw6etglyj7nb@smtp.gmail.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
 <20200715131511.hgm6sby3hvj7aatb@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715131511.hgm6sby3hvj7aatb@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 0/2] minor improvements to
 the kms_cursor_crc doc and some comments cleanup
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

On 07/15, Arkadiusz Hiler wrote:
> On Wed, Jun 24, 2020 at 06:54:00AM -0300, Melissa Wen wrote:
> > Hi,
> > 
> > I was studying the code of kms_cursor_crc test, and I just adjusted some comments
> > and added descriptions for subtests.
> > 
> > Melissa Wen (2):
> >   lib/igt_fb: change comments with fd description
> >   test/kms_cursor_crc: update subtests descriptions and some comments
> 
> Seems like there's a conflict caused by your patch removing unused
> parameters from igt_put_cairo_ctx().
> 
> Can you an send updated version and CC me on it?

Hi,

I just sent a v2.

Thanks,

Melissa
> 
> In case of false positives please comment on the CI results with a short
> explanation and CC Lakshmi <lakshminarayana.vudum@intel.com>
> 
> Thanks for the cleanup!
> 
> -- 
> Cheers,
> Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
