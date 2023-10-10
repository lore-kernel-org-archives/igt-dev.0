Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48ED10E395
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 15:49:35 +0000 (UTC)
Date: Tue, 10 Oct 2023 10:49:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Message-ID: <p3vtsaitav4qftz6wibwk6fh5okqfmq74mt22ph4rx7trazhps@r7rq3k6m6eyr>
References: <20231004154922.3478014-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231004154922.3478014-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 00/13] Adapt copy commands for Xe2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 08:49:09AM -0700, Lucas De Marchi wrote:
>A few copy commands changed for Xe2, mainly adding or moving the bits
>used for MOCS. This adapts the places we are manually adding the
>commands in the batch buffer, the gpu_cmds and the intel_blt libraries.
>
>Missing here is the conversion of lib/intel_batchbuffer.c. I had
>understood that intel_batchbuffer would end up using the new intel_blt.
>So, it may just be that we have some patches being cooked for that. Or
>I understood it wrong. Anyway, it doesn't seem good that we have
>basically 3 ways to do the same thing.
>
>Also it seems that this is the first time we are updating intel_blt for
>a platform with a breaking change. I used 2 different approaches in how
>to adapt the struct: one for xy-block-copy/xy-fast-copy and another for
>ctrl-surf-copy. The reason is that for the former there was just a minor
>change and the latter basically rewrites all the dwords. Going forward I
>think we should keep applying small deltas to at most 1 or 2 breaking
>changes, otherwise it makes it harder to read.
>
>v2: Provide fixes according to the feedback in v1
>v3:
>  - Fix build: for some reason ninja was caching tests/intel/gem_ccs.o,
>    so it was not getting rebuilt
>  - Use mocs index 4 for WB (depends on kernel patch)
>

Patches applied. Thanks for the reviews

Lucas De Marchi
