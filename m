Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B410EA2C
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 11:43:29 +0000 (UTC)
Date: Wed, 19 Oct 2022 13:43:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0/i3Nfzj31QA/Y8@kamilkon-desk1>
References: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
 <640e3f12-db6d-1ea1-9a43-441b36540776@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <640e3f12-db6d-1ea1-9a43-441b36540776@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] lib/igt_device_scan: add filer
 card=all
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

Hi Tvrtko,

On 2022-10-18 at 17:06:29 +0100, Tvrtko Ursulin wrote:
> 
> On 18/10/2022 10:09, Kamil Konieczny wrote:
> > Allow to select all (up to 16) discrete cards with the help of
> > card=all or card=*, for example:
> > 
> > ./gem_basic --device=pci:vendor=intel,device=discrete,card=all
> 
> What should this do btw? Run the tests on more than one card in sequence?
> Isn't that test runner's job?
> 
> Regards,
> Tvrtko

The purpose it to run test in parallel with the help of new fork
helper or with threads. See my RFC patchset (using fork)

https://patchwork.freedesktop.org/series/109487/
Add multi-process subtests for multi-GPUs

Regards,
Kamil

> 
> > Kamil Konieczny (2):
> >    lib/igt_device_scan: refactor filer adding
> >    lib/igt_device_scan: add card=all filter selector
> > 
> >   lib/igt_device_scan.c | 36 ++++++++++++++++++++++++++++++++++--
> >   1 file changed, 34 insertions(+), 2 deletions(-)
> > 
