Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196ED10E196
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 12:41:21 +0000 (UTC)
Date: Mon, 17 Apr 2023 14:41:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230417124117.qhxeszl7o5l5ldhn@kamilkon-desk1>
References: <20230413012426.503658-1-zack@kde.org>
 <20230413012426.503658-2-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413012426.503658-2-zack@kde.org>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/8] lib/svga: Add generated headers
 for the svga device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-12 at 21:24:19 -0400, Zack Rusin wrote:
> From: Maaz Mombasawala <mombasawalam@vmware.com>
> 
> Add generated headers for svga device which will be used
> to interface with the vmwgfx driver.
> 
> Signed-off-by: Roye Eshed <reshed@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  lib/svga/svga3d_cmd.h         | 1513 ++++++++++++++++++++++++++++
>  lib/svga/svga3d_devcaps.h     |  375 +++++++
>  lib/svga/svga3d_dx.h          | 1737 +++++++++++++++++++++++++++++++++
>  lib/svga/svga3d_limits.h      |   81 ++
>  lib/svga/svga3d_reg.h         |   46 +
>  lib/svga/svga3d_surfacedefs.h | 1559 +++++++++++++++++++++++++++++
>  lib/svga/svga3d_types.h       | 1560 +++++++++++++++++++++++++++++
>  lib/svga/svga_escape.h        |   56 ++
>  lib/svga/svga_overlay.h       |  117 +++
>  lib/svga/svga_reg.h           |  905 +++++++++++++++++
>  lib/svga/vm_basic_types.h     |  161 +++
>  11 files changed, 8110 insertions(+)
>  create mode 100644 lib/svga/svga3d_cmd.h
>  create mode 100644 lib/svga/svga3d_devcaps.h
>  create mode 100644 lib/svga/svga3d_dx.h
>  create mode 100644 lib/svga/svga3d_limits.h
>  create mode 100644 lib/svga/svga3d_reg.h
>  create mode 100644 lib/svga/svga3d_surfacedefs.h
>  create mode 100644 lib/svga/svga3d_types.h
>  create mode 100644 lib/svga/svga_escape.h
>  create mode 100644 lib/svga/svga_overlay.h
>  create mode 100644 lib/svga/svga_reg.h
>  create mode 100644 lib/svga/vm_basic_types.h
> 
> diff --git a/lib/svga/svga3d_cmd.h b/lib/svga/svga3d_cmd.h
> new file mode 100644
> index 00000000..f53c376c
> --- /dev/null
> +++ b/lib/svga/svga3d_cmd.h
> @@ -0,0 +1,1513 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright 2012-2022 VMware, Inc.
> + *

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

[...]
