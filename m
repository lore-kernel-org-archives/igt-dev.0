Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B30410E44F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 15:00:40 +0000 (UTC)
Date: Wed, 9 Aug 2023 09:00:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <s6zyr7q5oxyvonnajcyede5bgvoumbhdaofggsoglw2fzmmfdd@oljt3wpc2yoy>
References: <20230809144845.653231-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230809144845.653231-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: remove wa from the
 testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 04:48:45PM +0200, Mauro Carvalho Chehab wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>The workaround selftest is not a live test. It is meant to run
>via kunit.py, as part of the driver-independent validation.

s/driver-independent/device-independent/


>
>So, remove it from IGT.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
> tests/xe/xe_live_ktest.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
>index f0cbf4f623bc..53cc8c186215 100644
>--- a/tests/xe/xe_live_ktest.c
>+++ b/tests/xe/xe_live_ktest.c
>@@ -40,7 +40,6 @@ static const struct kunit_tests live_tests[] = {
> 	{ "xe_migrate_test",	"migrate" },
> 	{ "xe_pci_test",	"pci" },
> 	{ "xe_rtp_test",	"rtp" },

this on too, but could be a separate patch

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>-	{ "xe_wa_test",		"wa" },
> };
>
> igt_main
>-- 
>2.41.0
>

