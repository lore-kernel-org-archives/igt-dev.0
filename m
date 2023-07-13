Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCBC10E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 05:52:52 +0000 (UTC)
Date: Thu, 13 Jul 2023 07:52:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230713075247.05d4d996@maurocar-mobl2>
In-Reply-To: <20230712191213.mppvkwbnbgihgujt@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-13-mauro.chehab@linux.intel.com>
 <20230712191213.mppvkwbnbgihgujt@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 12/13] scripts/test_list.py: skip
 some internal fields
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

On Wed, 12 Jul 2023 21:12:13 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-07-12 at 15:58:53 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > both subtest_line and _summary_ are used internally at the script
> > logic. They shouldn't be part of the output.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/test_list.py | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > index 1551bc92c010..11aed63cb67a 100644
> > --- a/scripts/test_list.py
> > +++ b/scripts/test_list.py
> > @@ -661,6 +661,10 @@ class TestList:
> >                      continue
> >                  if field == "arg":
> >                      continue
> > +                if field == "_summary_":
> > +                    continue
> > +                if field == "subtest_line":  
> 
> Maybe also _subtest_line_?

Not needed, but maybe I should rename:

	arg -> _arg_
	subtest_line -> _subtest_line_

and use a regex or add those internal fields into a list.

For now, I'll keep it as-is on this patch, but I think on a cleanup
patch to handle those internal fields (either on this series or on a
new one).

> With or without this,
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > +                    continue
> >  
> >                  print(f":{field}: {self.doc[test][field]}")
> >  
> > -- 
> > 2.40.1
> >   
