Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AF16E18E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 11:22:54 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id t4so2516866qkb.9
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Sep 2021 04:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210901103402.1253909-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210901103402.1253909-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 1 Sep 2021 12:22:25 +0100
Message-ID: <CAM0jSHPAOv5BF3YKnfLs1irDmtC+rx1OZ1RLCRvxVKwUBFA=DA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t,
 V4 1/2] lib/i915: Use FIXED mapping only for discrete memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 1 Sept 2021 at 11:41, Tejas Upadhyay
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
> The FIXED mapping is only used for discrete, and mapping type
> is pre-defined. This disables the other type of mmap
> offsets when discrete memory is used.
>
> Taken from kernel commit:
> commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")
>
> Changes since V3:
>         - Split change in two commits - Matthew Auld
> Changes since V2:
>         - Add previous logic check for GTT offset type - Ashutosh Dixit
>         - Added documentation for library API change - Daniel Vetter
> Changes since V1:
>         - Make logic more readable - Petri Latvala
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
