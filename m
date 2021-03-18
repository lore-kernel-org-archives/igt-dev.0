Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Mar 2021 11:17:38 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFMasrshhYVa7daJ@platvala-desk.ger.corp.intel.com>
References: <20210317223827.446803-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317223827.446803-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Introduce the igt_nouveau library
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:38:27PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> This introduces the igt_nouveau library, which enables support for tiling
> formats on nouveau, along with accelerated clears for allocated bos in VRAM
> using the dma-copy engine present on Nvidia hardware since Tesla. Typically
> the latter would be handled by the kernel automatically, which is the
> long-term plan for nouveau, but since the kernel doesn't yet support that
> we implement this in igt in order to fulfill the expectation that most of
> igt has in which newly allocated fbs are expected to be zero-filled by
> default.
> 
> The dma-copy engine is capable of fast blitting, and is also able to
> perform tiling/untiling at the same time. This is worth mentioning because
> unlike many of the other drivers supported in igt, we go out of our way to
> avoid using mmap() in order to perform CPU rendering wherever possible.
> Instead of mmap()ing an fb that we want to draw to on the CPU (whether it
> be for converting formats, or just normal rendering), we instead use
> dma-copy to blit linear/tiled fbs over to linear system memory which we
> mmap() instead. This is primarily because while mmap() is typically
> painfully slow for vram, it's even slower on nouveau due to the current
> lack of dynamic reclocking in our driver. Furthermore, using the dma-copy
> engine for copying things over to system ram is also dramatically faster
> than using igt's memcpy wc helpers even when no tiling is involved. Such
> speed improvements are both quite nice, but also very necessary for certain
> tests like kms_plane that are rather sensitive when it comes to slow
> rendering with drivers.
> 
> This doesn't mean we won't want to provide a way of using mmap() for
> rendering in the future however, as at least basic testing of mmap() is
> certainly something we eventually want for nouveau. However, I think the
> best way for us to do this in the future will be to adapt the igt_draw API
> to work with nouveau so we can explicitly request using mmap() in tests
> which need it.
> 
> Finally, this code also adds a hard dependency on libdrm support for
> nouveau tests. The main reason for this is currently there are no real
> applications that use nouveau's ioctls directly (mesa for instance, uses
> libdrm as well) and also that nouveau's ioctls are currently a bit
> complicated to use by hand. This will likely be temporary however, as Ben
> Skeggs is planning on revamping a lot of nouveau's APIs to simplify them
> and make libdrm support for nouveau obsolete in the future. Note that we
> take care to make sure that users can still disable libdrm support for
> nouveau if needed, with the only caveat being that any tests using
> igt_nouveau will be disabled, along with any tiling support for
> nvidia-specific tiling formats.
> 
> This should enable igt tests which test tiling formats to run on nouveau,
> and fix some seemingly random test failures as a result of not having
> zero-filled buffers in a few other tests like kms_cursor_crc.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  .gitlab-ci.yml                  |   7 +
>  include/drm-uapi/drm_fourcc.h   |   2 +-
>  lib/drmtest.c                   |   5 +
>  lib/igt_fb.c                    |  98 +++++++--
>  lib/igt_fb.h                    |   2 +
>  lib/igt_nouveau.c               | 281 ++++++++++++++++++++++++++
>  lib/igt_nouveau.h               |  65 ++++++
>  lib/meson.build                 |   8 +
>  lib/nouveau/cea0b5.c            | 252 +++++++++++++++++++++++
>  lib/nouveau/nvhw/class/cl906f.h | 103 ++++++++++
>  lib/nouveau/nvhw/class/cla0b5.h | 250 +++++++++++++++++++++++
>  lib/nouveau/nvhw/drf.h          | 209 +++++++++++++++++++
>  lib/nouveau/nvif/push.h         | 345 ++++++++++++++++++++++++++++++++
>  lib/nouveau/nvif/push906f.h     |  70 +++++++
>  lib/nouveau/priv.h              |  57 ++++++
>  meson.build                     |   3 +
>  tests/meson.build               |   2 +-
>  17 files changed, 1745 insertions(+), 14 deletions(-)
>  create mode 100644 lib/igt_nouveau.c
>  create mode 100644 lib/igt_nouveau.h
>  create mode 100644 lib/nouveau/cea0b5.c
>  create mode 100644 lib/nouveau/nvhw/class/cl906f.h
>  create mode 100644 lib/nouveau/nvhw/class/cla0b5.h
>  create mode 100644 lib/nouveau/nvhw/drf.h
>  create mode 100644 lib/nouveau/nvif/push.h
>  create mode 100644 lib/nouveau/nvif/push906f.h
>  create mode 100644 lib/nouveau/priv.h

Do you want to support autotools?

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
