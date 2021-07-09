Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D296EA19
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 12:41:38 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:41:26 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210709124126.ta4xfyd2ny62xsxa@hatecraft.localdomain>
References: <20210708160127.1944507-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708160127.1944507-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] lib/igt_debugfs: skip test instead of assert
 if crc/control is invalid
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 08, 2021 at 12:01:27PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Some drivers such as msm do not currently support debugfs yet.
> 
> [How]
> Change igt_assert of opening "crtc-%d/crc/control" to igt_require_f.
> Opening this file doesn't involved a complicated logic so assert isn't
> required to verify that things are smooth. -1 indicates that the file
> isn't supported by the driver.
> 
> Test: kms_atomic:plane-immutable-zpos on ChromeOS Trogdor(msm)

Hey Mark,

I am generally not a fan of hidden requirements that are burried deep in
the helper libraries. It's nice when the tests explicitly state what they
need through the use of functions with _require_ or _skip_ in the name.

When you probably want to do here is to call igt_require_pipe_crc[1] in
plane-immutable-zpos just like the other pipe crc tests do.

[0]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-debugfs.html#igt-require-pipe-crc

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
