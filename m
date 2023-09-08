Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843B710E18A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:20:24 +0000 (UTC)
Date: Fri, 8 Sep 2023 10:20:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908102019.3ddb9a11@maurocar-mobl2>
In-Reply-To: <20230907130916.cwrl3pqduaa46gys@kamilkon-desk.igk.intel.com>
References: <20230907101852.522819-1-mauro.chehab@linux.intel.com>
 <20230907101852.522819-7-mauro.chehab@linux.intel.com>
 <20230907130916.cwrl3pqduaa46gys@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/7] scripts/test_list.py: move
 "FULL" testlist to config file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tomasz.mistat@intel.com,
 jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 7 Sep 2023 15:09:16 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> On 2023-09-07 at 12:17:37 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Don't assume that the default testlist is "FULL". Instead, read
> > it from the configuration file.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  scripts/test_list.py             | 6 ++++--
> >  tests/intel/kms_test_config.json | 1 +
> >  tests/intel/xe_test_config.json  | 1 +
> >  3 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/test_list.py b/scripts/test_list.py
> > index c1518a904baf..bd03fcfc7efd 100644
> > --- a/scripts/test_list.py
> > +++ b/scripts/test_list.py
> > @@ -484,6 +484,8 @@ class TestList:
> >              if "testlist" not in self.props[field]["_properties_"]:
> >                  continue
> >  
> > +            default_value = self.props[field]["_properties_"].get("default-testlist")
> > +
> >              testname = subtest_dict["_summary_"]
> >  
> >              value = subtest_dict.get(field)
> > @@ -510,8 +512,8 @@ class TestList:
> >                                  set_full_if_empty = False
> >                              values.discard(deleted_names)
> >  
> > -            if set_full_if_empty and not values:
> > -                values = set(["FULL"])
> > +            if default_value and set_full_if_empty and not values:
> > +                values = set([default_value])  
> 
> What if someone forget to add default? imho here this should be:
> 
>                if set_full_if_empty and not values:
>                    if default_value:
>                        values = set([default_value])
>                    else
>                        values = set(["FULL"])

No, the intent here is to let values be empty if there is no default.

I mean, when this is used for "Run type", a default testlist called
"FULL" makes sense, but if this is used for some other field, the
default may be to leave the field empty.

Regards,
Mauro
