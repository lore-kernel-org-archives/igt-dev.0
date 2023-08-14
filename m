Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDAC10E013
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 09:57:28 +0000 (UTC)
Date: Mon, 14 Aug 2023 11:57:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230814115724.3835a486@maurocar-mobl2>
In-Reply-To: <20230810175105.gxxsypvouv3txdkc@kamilkon-desk1>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-2-bhanuprakash.modem@intel.com>
 <20230810175105.gxxsypvouv3txdkc@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 01/81] testplan/kms: Keep category as high
 level entity
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

On Thu, 10 Aug 2023 19:51:05 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Bhanuprakash,
> On 2023-06-29 at 20:17:50 +0530, Bhanuprakash Modem wrote:
> > Update kms testplan to keep the category as high level entity.
> >   
> +cc Mauro
> 
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_test_config.json | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> > index 5fbe40bdc..447a13337 100644
> > --- a/tests/kms_test_config.json
> > +++ b/tests/kms_test_config.json
> > @@ -6,21 +6,21 @@
> >          "Category": {
> >              "_properties_": {
> >                  "description": "Contains the major group for the tested functionality 'Display'"
> > -            }
> > -        },
> > -        "Mega feature": {
> > -            "_properties_": {
> > -                "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
> >              },
> > -            "Functionality": {
> > +            "Mega feature": {
> >                  "_properties_": {
> > -                    "description": "Groups tests on buckets containg more detailed functionality"
> > +                    "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
> > +                },
> > +                "Functionality": {
> > +                    "_properties_": {
> > +                        "description": "Groups tests on buckets containg more detailed functionality"
> > +                    }
> > +                }
> > +            },
> > +            "Run type": {
> > +                "_properties_": {
> > +                    "description": "Defines what category of testlist it belongs"
> >                  }
> > -            }
> > -        },
> > -        "Run type": {
> > -            "_properties_": {
> > -                "description": "Defines what category of testlist it belongs"
> >              }
> >          },
> >          "Test category": {

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
