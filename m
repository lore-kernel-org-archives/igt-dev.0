Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3510E7A4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:32:37 +0000 (UTC)
Date: Fri, 26 May 2023 08:32:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526083229.7650ded3@maurocar-mobl2>
In-Reply-To: <20230525204255.ejzjyfxpfji4n7it@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-7-mauro.chehab@linux.intel.com>
 <20230525204255.ejzjyfxpfji4n7it@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 06/11] i915/perf_*: better document
 tests
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

On Thu, 25 May 2023 22:42:55 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-25 at 11:05:30 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Merge data from some ancillary internal documentation to improve
> > i915 perf test descriptions.
> > 
> > This patch was auto-generated via script.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> >   * SUBTEST: non-zero-reason
> > - * Description: Test that reason field in OA reports is never 0 on Gen8+
> > - * Feature: oa
> > + * Description:
> > + *   Test that reason field in OA reports is never 0 on Gen8+.
> > + *   Test that reason field in OA reports is never 0 on Gen8+  
> ------- ^
> Repeated without ending dot.
> 
> Rest looks good, you can add my r-b if you feel this can be
> corrected later.

I'll fix it now. Basically, "+" needs to be escaped at the regex
I'm using to drop duplicated comment. A single-line change on my
import script fixed it.

I'll merge the change on this patch and add your R-B.

Regards,
Mauro
