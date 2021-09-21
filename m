Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE116EA41
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 15:50:49 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id m9so19335620qtk.4
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 08:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210921040330.909964-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20210921040330.909964-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 21 Sep 2021 16:50:19 +0100
Message-ID: <CAM0jSHNKL7wnTVxLZkwg=npr0PAkJhYMwYm8h2j=L7mm87epMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: use device_coherent mmap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, Matthew Auld <matthew.auld@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 21 Sept 2021 at 05:10, <priyanka.dandamudi@intel.com> wrote:
>
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> Update mmap__wc with mmap__device_coherent, as it works
> on discrete platforms, while still using an explicit WC mmap on
> integrated platforms.
> Below are the updated tests:
> gem_exec_capture
> gem_exec_nop
> perf_pmu
> prime_busy
>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
