Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B1410E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 10:25:33 +0000 (UTC)
Date: Mon, 16 Jan 2023 11:25:29 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20230116102529.nqsp2dd6uefky2fz@zkempczy-mobl2>
References: <20230113192553.89460-1-zbigniew.kempczynski@intel.com>
 <20230113192553.89460-3-zbigniew.kempczynski@intel.com>
 <Y8UZSlAv7X1N4COr@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8UZSlAv7X1N4COr@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] meson.build: Remove -fcommon flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 11:30:50AM +0200, Petri Latvala wrote:
> On Fri, Jan 13, 2023 at 08:25:53PM +0100, Zbigniew Kempczyński wrote:
> > Ensure global variables are explicitly defined in one place and
> > requires importing via extern keyword instead of duplicating definition
> > resolved during linking time.
> > 
> > Details: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85678
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks, I've merged the series.

Do you need to bump igt version to 1.28? 

--
Zbigniew 

> 
> > ---
> >  meson.build | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/meson.build b/meson.build
> > index bbe1f673e8..7b25627229 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -70,7 +70,6 @@ cc_args = [
> >  # well with longjmp which is heavily used by IGT framework.
> >  	'-fno-builtin-malloc',
> >  	'-fno-builtin-calloc',
> > -	'-fcommon',
> >  ]
> >  
> >  foreach cc_arg : cc_args
> > -- 
> > 2.34.1
> > 
