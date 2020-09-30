Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD46E7E6
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 18:33:26 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id y17so1506706qky.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 11:33:23 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:33:20 -0400
From: Jeremy Cline <jcline@redhat.com>
Message-ID: <20200930183320.GB518504@xps13>
References: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
Content-Disposition: inline
Subject: Re: [igt-dev] [PATCH i-g-t v5 0/5] Add nouveau-crc tests
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 01:31:45PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Nouveau has finally gotten CRC support, and at this point that support
> has made its way upstream. Hooray!
> 
> So, let's start adding some relevant tests for it since nvidia's CRC
> implementation has some rather interesting design choices that needed to
> be worked around.
> 
> Lyude Paul (5):
>   lib/igt_core: Fix igt_assert_fd() documentation
>   lib/igt_core: Add igt_require_fd()
>   lib/igt_debugfs: Add igt_debugfs_pipe_dir()
>   lib/igt_kms: Hook up connector dithering prop
>   tests: Add nouveau-crc tests
> 
>  .gitlab-ci.yml      |   2 +-
>  lib/drmtest.c       |  10 ++
>  lib/drmtest.h       |   2 +
>  lib/igt_core.h      |  16 +-
>  lib/igt_debugfs.c   |  21 +++
>  lib/igt_debugfs.h   |   1 +
>  lib/igt_kms.c       |   5 +
>  lib/igt_kms.h       |   1 +
>  tests/meson.build   |   1 +
>  tests/nouveau_crc.c | 414 ++++++++++++++++++++++++++++++++++++++++++++
>  10 files changed, 470 insertions(+), 3 deletions(-)
>  create mode 100644 tests/nouveau_crc.c
> 
> -- 
> 2.26.2
> 

Looks good, all the tests pass now that I've removed the serial cable.
For the series:

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
