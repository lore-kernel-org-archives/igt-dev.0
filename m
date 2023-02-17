Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7107110E1E5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 17:51:00 +0000 (UTC)
Date: Fri, 17 Feb 2023 18:50:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>,
 Zack Rusin <zackr@kde.org>, reshed@vmware.com,
 Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Michael Banack <banackm@vmware.com>, Petri Latvala <adrinael@adrinael.net>
Message-ID: <20230217175054.dtwevriepo2flmtf@kamilkon-desk1>
References: <20221129172718.151773-1-zack@kde.org>
 <20221129172718.151773-2-zack@kde.org>
 <20230126181321.adqxdug627qve3dv@kamilkon-desk1>
 <90f64ab34d810000b03ce8dcdf5e432a1c70ce35.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90f64ab34d810000b03ce8dcdf5e432a1c70ce35.camel@vmware.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] igt/vmwgfx: Add support for testing
 vmwgfx
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

Hi Zack,

On 2023-01-26 at 19:06:49 +0000, Zack Rusin wrote:
> On Thu, 2023-01-26 at 19:13 +0100, Kamil Konieczny wrote:
> > !! External Email
> > 
> > Hi,
> > 
> > please rebase and resend. Please also shorten licence,
> > we use SPDX to not write out big text (see one example below).
> > You can also use checkpatch script from Linux kernel, it will
> > provide some hints for improvement.
> > 
> > Please also find someone from vmware for review of vmware
> > specific parts of your tests and libs.
> 
> I did that. This was written by Maaz and Roy and reviewed by me. I know that some
> projects use signed-off differently, usually it implies review, but I'm happy to
> provide both reviewed-by and signed-off if that's what you prefer.
> 
> z

Please rebase, drop 3/3 patch (it was already merged) and resend.
Also address comments about your patches. Btw if the patches were
developed by Maaz and Roy, then there should be signed-off-by
from Maaz but there are only s-o-b from Roye and you.

Please consider splitting this patchseries into smaller portions
like very basic functionality first, then adding step by step
more into libs and tests.

After you will address all comments and patches will be ready
for merge you may add then your r-b tag.

+cc Petri

Regards,
Kamil
