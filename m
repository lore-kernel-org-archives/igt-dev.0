Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E2310E18F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 13:50:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z4so21235371lft.2
 for <igt-dev@lists.freedesktop.org>; Tue, 04 Oct 2022 06:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220929170034.14043-1-nirmoy.das@intel.com>
In-Reply-To: <20220929170034.14043-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 4 Oct 2022 14:49:49 +0100
Message-ID: <CAM0jSHOVbSG4mQMrkzmVnU+xzeg-vDQxZCCdneA8GQmDuhwhKg@mail.gmail.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ringfill: Add 48b address flag
 in store-dword
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

On Thu, 29 Sept 2022 at 18:00, Nirmoy Das <nirmoy.das@intel.com> wrote:
>
> Add EXEC_OBJECT_SUPPORTS_48B_ADDRESS to handle > 32b
> offset.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  tests/i915/gem_ringfill.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index b68c5ae615..8ab00525ff 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -114,7 +114,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
>         memset(reloc, 0, NUMSTORES * sizeof(*reloc));
>
>         execbuf->buffers_ptr = to_user_pointer(obj);
> -       execbuf->flags = ring | (1 << 11) | (1 << 12);
> +       execbuf->flags = ring | I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
>
>         if (gen > 3 && gen < 6)
>                 execbuf->flags |= I915_EXEC_SECURE;
> @@ -124,7 +124,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
>         obj[0].handle = gem_create(fd, 4096);
>         if (ahnd) {
>                 obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
> -               obj[0].flags |= EXEC_OBJECT_PINNED;
> +               obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>         }
>
>         gem_write(fd, obj[0].handle, 0, &bbe, sizeof(bbe));
> @@ -139,7 +139,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
>         if (ahnd) {
>                 obj[1].offset = get_offset(ahnd, obj[1].handle,
>                                 NUMSTORES * 16 + 4096, 0);
> -               obj[1].flags |= EXEC_OBJECT_PINNED;
> +               obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>         }
>
>         batch = gem_mmap__cpu(fd, obj[1].handle, 0, NUMSTORES * 16 + 4096,
> --
> 2.37.3
>
