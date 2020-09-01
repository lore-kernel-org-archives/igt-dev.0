Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3D6E069
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 14:12:11 +0000 (UTC)
Date: Tue, 1 Sep 2020 16:41:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200901134132.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20200811093241.19910-1-guillaume.tucker@collabora.com>
 <20200811094615.GJ7444@platvala-desk.ger.corp.intel.com>
 <53b257af-6243-8c70-6276-031cd4523f6f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53b257af-6243-8c70-6276-031cd4523f6f@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Dockerfile.build-debian-mips: use
 buster with libunwind fix
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
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 02:09:39PM +0100, Guillaume Tucker wrote:
> On 11/08/2020 10:46, Petri Latvala wrote:
> > On Tue, Aug 11, 2020 at 10:32:41AM +0100, Guillaume Tucker wrote:
> >> We can now use libunwind 1.2.1-10~deb10u1 from Debian Buster as per
> >> this bug report which has now been resolved:
> >>
> >>   https://bugs.debian.org/932725
> >>
> >> Drop stretch-backports for MIPS and use Buster like the other
> >> architectures.
> >>
> >> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> > 
> > Happy birthday, bug 932725!
> > 
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Thanks!
> 
> It looks like this hasn't been applied yet, is there anything
> blocking it?

Just me not realizing you don't have commit rights, sorry for
that. Merged now.

Speaking of commit rights, you meet the criteria for them, they're one
gitlab request away... :P


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
