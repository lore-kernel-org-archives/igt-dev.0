Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3087B6F3F5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:32:28 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id w9so3037963qvi.13
 for <igt-dev@lists.freedesktop.org>; Thu, 03 Jun 2021 05:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210602201028.12494-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210602201028.12494-1-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 3 Jun 2021 13:32:00 +0100
Message-ID: <CAM0jSHNDqQDtK-HJEwnY0Kf+OiT+G_jZ0FFxXg8WzYS4zPEKKw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: free
 query_info in gem_get_lmem_region_count
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 21:10, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
>
> query_info calloc'd in gem_get_query_memory_regions should be freed in
> gem_get_lmem_region_count.
>
> Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Fixes: f32993a2ed ("lib/i915/intel_memory_region: Add new memory region lib")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
