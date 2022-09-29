Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37AE10E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 08:21:44 +0000 (UTC)
Date: Thu, 29 Sep 2022 10:21:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20220929102136.4e1a18bf@maurocar-mobl2>
In-Reply-To: <YzR1ypRVkKtVXt22@kamilkon-desk1>
References: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
 <20220928085842.34107-3-mauro.chehab@linux.intel.com>
 <YzQXFRYCk8Alj4zR@platvala-desk.ger.corp.intel.com>
 <YzR1ypRVkKtVXt22@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH RFC 2/2] lib/igt_core: print card sysfs node
 at subtest results
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 28 Sep 2022 18:26:50 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2022-09-28 at 12:43:20 +0300, Petri Latvala wrote:
> > On Wed, Sep 28, 2022 at 10:58:42AM +0200, Mauro Carvalho Chehab wrote:  
> > > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > 
> > > This helps to identify what GPU failed on multi-GPU tests.  
> > 
> > And completely breaks igt_runner when it tries to parse the result
> > logs.

Yes. That's btw one of the reasons why I submitted it as a RFC: depending
on how CI check IGT logs, it can break the test results there as well.

Anyway, this is fixable.

The point is, once we have multi-GPU tests, we need to have a way to
report what GPU failed.

Once integrated with some upcoming multi-gpu support patch series,
we can enable this log only if multi-gpu tests are enabled.

On other words, I expect that this series, and in particular patch 2/2,
will be changed and sent together on its final version with the 
multi-GPU patch series that Kamil has been working with.

> First thing is to decide where such info should be printed,
> imho it is worth to have it with maybe some new IGT_PRINT_GPU
> environment var ?
> This var can configure how it will work, what it will store,
> where to print message about used GPU, on begin of error message
> or at end.
>
> If not defined, we should not print any additional info.

No need to have a separate IGT_PRINT_GPU, as the additional GPU log data
is only needed when more than one GPUs is used. So, it can be enabled based
on IGT_DEVICE selection and/or --device parameter, at the tests that use 
multiple GPUs.

> btw I did not received you RFC from mailist server,
> are there any known problems with ML ?

Weird. The series reached patchwork: https://patchwork.freedesktop.org/series/109171/
Yet, as you were c/c, maybe the mail list server decided to exclude
you from its own c/c (this is configurable on some mailing list servers).

> Second thought, after reading RFC on patchwork, please put your
> comments from cover letter into commit description in first
> patch so it will be in git history.

Ok. Btw, if you prefer to place this patch together with the next
version of your multi-gpu RFC, feel free to do so and edit the
patch descriptions to better fit the needs.

Regards,
Mauro
