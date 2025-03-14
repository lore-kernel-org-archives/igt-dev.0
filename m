Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD461C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 16:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487610EA0E;
	Fri, 14 Mar 2025 16:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8NKk951";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66B410EA0E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741969981; x=1773505981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1PObspH4T+JLV9K/bImAvuLO5t48ys5PuRFv8VoBqd4=;
 b=i8NKk951GsvYCoiLFZl9X57/CccqYKsWvbHIN6tLfpuBqytOWYeDK2fK
 2+OGsbtYn7l8lVXs67cRjP+3nxfhdl6uPpVaqjCoAqp+tvWIY9TlR42Er
 z+XMYvWr4e3/75MiLupCE06QTYg6VuPBbNk7ag0lypiu62ptqm9MdLr5H
 +v0RV5sxLdft7Pfvu1xVkj1QzkwFXJgEo3UIgm3qnLLcoIzx0X++RhIxv
 n3tPojfT+E1rTIEb7HxbaDLPPvERKgEbmlsm+PJWOsvFotJ/brXH6HS45
 fT0SVOyMX71YbWzdbA0eKLQPV1YCdD5GTqkf5U/1PLWLzBmdDOku9CD88 g==;
X-CSE-ConnectionGUID: X0p3RhW3Qn6a5FS/OhQ5Kw==
X-CSE-MsgGUID: wuZ6H2MWSUeTd4kuWSq28Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68494016"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68494016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 09:33:00 -0700
X-CSE-ConnectionGUID: JgN9hu/KS3KDVb4FAk8UBw==
X-CSE-MsgGUID: lUriC5qOSFC6T+Je6diYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="158477403"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 09:32:56 -0700
Date: Fri, 14 Mar 2025 17:32:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/amdgpu/amd_hotplug: add missing include file fcntl.h
Message-ID: <20250314163229.imuy36rgkvrxtzx7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20250314033249.2426485-1-alex.hung@amd.com>
 <535959ef-c399-415f-b5c8-c3a26a47a4d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <535959ef-c399-415f-b5c8-c3a26a47a4d2@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Chung,,
On 2025-03-14 at 15:57:24 +0800, Chung, ChiaHsuan (Tom) wrote:
> Thank you so much.
> 
> Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
> 

Applied, thank you for quick fix.

Regards,
Kamil

> On 3/14/2025 11:32 AM, Alex Hung wrote:
> > Add missing include file to fix cross-compilation errors:
> > 
> > ../tests/amdgpu/amd_hotplug.c: In function ‘is_system_s2idle’:
> > ../tests/amdgpu/amd_hotplug.c:110:7: error: implicit declaration of function ‘open’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
> >    fd = open(MEM_SLEEP_PATH, O_RDONLY);
> >         ^~~~
> >         popen
> > ../tests/amdgpu/amd_hotplug.c:110:7: warning: nested extern declaration of ‘open’ [-Wnested-externs]
> > ../tests/amdgpu/amd_hotplug.c:110:28: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
> >    fd = open(MEM_SLEEP_PATH, O_RDONLY);
> >                              ^~~~~~~~
> >                              STA_RONLY
> > 
> > Fixes: 6796e79abba2 ("tests/amdgpu/amd_hotplug: Check the suspend state after resume")
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > ---
> >   tests/amdgpu/amd_hotplug.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> > index ee3256c0b..bbd50452b 100644
> > --- a/tests/amdgpu/amd_hotplug.c
> > +++ b/tests/amdgpu/amd_hotplug.c
> > @@ -20,6 +20,8 @@
> >    * OTHER DEALINGS IN THE SOFTWARE.
> >    */
> > +#include <fcntl.h>
> > +
> >   #include "igt.h"
> >   #include "igt_amd.h"
