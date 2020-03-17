Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD5189B97
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 06:34:19 +0000 (UTC)
Date: Tue, 17 Mar 2020 08:34:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200317063415.GF9497@platvala-desk.ger.corp.intel.com>
References: <20200316161132.29833-1-lyude@redhat.com>
 <20200316161132.29833-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316161132.29833-5-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] meson: Add -fcommon to cc_flags
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 12:11:32PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Now that we've fixed a bunch of build breakages on systems where
> -fcommon is the default (gcc 10+), let's start building with -fcommon by
> default so we can make sure things don't break with this in the future.
> Supposedly it's supposed to be able to generate better code anyway!

The documentation claims otherwise, "on many targets implies a speed
and code size penalty on global variable references". In fact the
documentation even claims you get the multiple definition errors for
variables with -fno-common and -fcommon helps avoiding them in legacy
code! It's completely backwards to what happens. Oh well.

With that said, the code was clearly wrong, thanks for the series.

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>

What this series proves is that no one is able to understand how
tentative definitions and tentative declarations work in C.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
