Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A075610E4A8
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 04:23:54 +0000 (UTC)
Date: Thu, 10 Aug 2023 06:23:50 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230810062350.71afd6eb@maurocar-mobl2>
In-Reply-To: <s6zyr7q5oxyvonnajcyede5bgvoumbhdaofggsoglw2fzmmfdd@oljt3wpc2yoy>
References: <20230809144845.653231-1-mauro.chehab@linux.intel.com>
 <s6zyr7q5oxyvonnajcyede5bgvoumbhdaofggsoglw2fzmmfdd@oljt3wpc2yoy>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: remove wa from the
 testlist
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

On Wed, 9 Aug 2023 09:00:28 -0600
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Wed, Aug 09, 2023 at 04:48:45PM +0200, Mauro Carvalho Chehab wrote:
> >From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> >The workaround selftest is not a live test. It is meant to run
> >via kunit.py, as part of the driver-independent validation.  
> 
> s/driver-independent/device-independent/
> 
> 
> >
> >So, remove it from IGT.
> >
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >---
> > tests/xe/xe_live_ktest.c | 1 -
> > 1 file changed, 1 deletion(-)
> >
> >diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
> >index f0cbf4f623bc..53cc8c186215 100644
> >--- a/tests/xe/xe_live_ktest.c
> >+++ b/tests/xe/xe_live_ktest.c
> >@@ -40,7 +40,6 @@ static const struct kunit_tests live_tests[] = {
> > 	{ "xe_migrate_test",	"migrate" },
> > 	{ "xe_pci_test",	"pci" },
> > 	{ "xe_rtp_test",	"rtp" },  
> 
> this on too, but could be a separate patch

Do you mean xe_rtp_test? I'll send a separate patch for it.

> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, patch applied.

> 
> Lucas De Marchi
> 
> 
> >-	{ "xe_wa_test",		"wa" },
> > };
> >
> > igt_main
> >-- 
> >2.41.0
> >  
