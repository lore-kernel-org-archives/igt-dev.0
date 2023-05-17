Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723F710E428
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 14:14:39 +0000 (UTC)
Date: Wed, 17 May 2023 16:14:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230517141427.acl6hxurx3gm2po5@kamilkon-desk1>
References: <20230515184604.64135-1-kamil.konieczny@linux.intel.com>
 <563af8f9-cdeb-4259-4b8a-3bf3edc67bd0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <563af8f9-cdeb-4259-4b8a-3bf3edc67bd0@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Use new procps library libproc2
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

Hi,

On 2023-05-16 at 09:48:06 +0100, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 15/05/2023 19:46, Kamil Konieczny wrote:
> > This is resend of following patch with minor corrections:
> > 
> > https://patchwork.freedesktop.org/series/111015/
> > Use the new procps library libproc2
> 
> Is this series required to build on latest distros by any chance?
> 
> Regards,
> 
> Tvrtko

Yes on latest Ubuntu 23.04

Regards,
Kamil

> > I also added second patch with some simplifications suggested
> > by Mauro in:
> > 
> > https://patchwork.freedesktop.org/series/116896/
> > Use new library libproc2
> > 
> > v2: corrected 2/2 "lib/igt_aux: unify procps processing"
> >      on old lib path
> > 
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > 
> > Craig Small (1):
> >    Use the new procps library libproc2
> > 
> > Kamil Konieczny (1):
> >    lib/igt_aux: unify procps processing
> > 
> >   lib/igt_aux.c   | 276 +++++++++++++++++++++++++++++++-----------------
> >   lib/meson.build |   7 +-
> >   meson.build     |  10 +-
> >   3 files changed, 194 insertions(+), 99 deletions(-)
> > 
