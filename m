Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC4410E075
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 05:25:52 +0000 (UTC)
Date: Thu, 30 Mar 2023 07:25:46 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230330072546.13ec0786@maurocar-mobl2>
In-Reply-To: <20230329175925.uwtid4tthnc5fzgg@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230329175925.uwtid4tthnc5fzgg@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 00/11] Improve igt_doc.py
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

On Wed, 29 Mar 2023 19:59:25 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-03-27 at 15:31:44 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > This series do some improvements at the igt_doc.py tool:
> > 
> > - It does some tweaks at the Xe documentation hierarchy;
> > - It adds support to generate test lists from documentation;
> > - It splits the script on two parts: one with the TestList
> >   class definition and another one with the toll itself;
> > - While here, add missing documentation for two new tests;
> > - Check if the documentation matches the actual tests at
> >   build time, in order to prevent it to become outdated.
> > 
> > Mauro Carvalho Chehab (11):
> >   xe_test_config.json: do some adjustments at the output hierarchy
> >   scripts/igt_doc.py: move show_subtests logic to the class
> >   scripts/igt_doc.py: add support to generate testlists
> >   scripts/igt_doc.py: prepare to place TestList class on a separate file
> >   scripts/test_list.py: prepare to place class on a separate file
> >   scripts/igt_doc.py: re-introduce it by calling test_list.py
> >   scripts/test_list.py: better handle documentation validation issues
> >   scripts/test_list.py: add support for igt_simple_main
> >   testplan/meson.build: Validate documentation at build time  

Kamil,

Thanks for the review!

> Shouldn't you merge this with your other patch:
> runner/meson.build: fix minimal build
> 
> as now GitLab shows warning during build ?

Yeah, it makes sense to apply both this series and the one
addressing the warning together. I'll submit a new version of
this series with your R-B + the warning fix, in order to let
CI test them altogether.

Regards,
Mauro
