Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AD0CE8D49
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 06:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8E510E67B;
	Thu, 19 Sep 2024 06:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYTXvq1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3123810E67B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 06:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726726674; x=1758262674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oaDdlybtjmeHybGaXQr7BmyM0/9HcUTVUldStZNJGPA=;
 b=jYTXvq1V/AK+lbkuDHg5wGhQiD26L5pTm73bKES/AWHyBieIhoZ0mzIK
 RjCV3SjoDb4mgupIHcETXbRYx3wFeyzUiCWa76/1UFGB73QjFzL1ksjtd
 HX0RVBZjOeVDT8qhPr6cCysBGVMwd8di6eY1vK3xMLiJrjMdfVITdRYpT
 fKsqLlYCdHO0HhzG3ecUC9kSypkgHcW+YA2SpA8ItlDu0cwpSdBlRk+Th
 8HL1nihwyt+xad29bOEJ0I1bo05IFBZgjPzL+BVubHE5tOt5MAhj0GM7w
 wurAHGczsg8Mx1K5tBIaQUJfMR7lX/vS5yfo+y+WYF3kIcm15Kz4uC0hi A==;
X-CSE-ConnectionGUID: nnpxHASkRf+Lnh0+mmTh3A==
X-CSE-MsgGUID: 3ekd4zjlRUqCChHjEIAqjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29411352"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29411352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 23:17:53 -0700
X-CSE-ConnectionGUID: uRTQ0M31QxmHubz0Tne3CA==
X-CSE-MsgGUID: G0JTY0QlQhit31m42J6DGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70123966"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 23:17:49 -0700
Date: Thu, 19 Sep 2024 08:17:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v7 11/16] scripts/test_list: Relax treatment of
 non-compiled tests
Message-ID: <20240919061745.iv27nrovjzcne4it@zkempczy-mobl2>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <20240918113017.144687-12-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918113017.144687-12-christoph.manszewski@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 18, 2024 at 01:30:12PM +0200, Christoph Manszewski wrote:
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Some tests could be added and compiled only when non-default
> meson option is given. It will result in no testlist generated
> for such tests but they could appear in our documentation.
> Currently we report an error in such case.
> 
> Create a way to detect and report that and treat this as feature
> and do not report it as an error.  This should allow to relax
> processing of chamelium and other new tests.
> 
> Also while at this, print error information before actually
> exiting with an error code, as previous prints were only
> warnings.
> 
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Works for me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  scripts/test_list.py | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 69c830ca1..d050687fe 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1141,6 +1141,19 @@ class TestList:
>  
>          return sorted(tests)
>  
> +    def get_not_compiled(self):
> +
> +        """ Return a list of tests which were not compiled """
> +        no_binaries = []
> +        for name in self.filenames:
> +            test_basename = re.sub(r"\.c$", "", name.split('/')[-1])
> +            fname = os.path.join(self.igt_build_path, "tests", test_basename)
> +
> +            if not os.path.isfile(fname):
> +                no_binaries.append(test_basename)
> +
> +        return sorted(no_binaries)
> +
>      #
>      # Validation methods
>      #
> @@ -1177,21 +1190,24 @@ class TestList:
>          # Get a list of tests from
>          run_subtests = set(self.get_testlist())
>  
> +        not_compiled = set(self.get_not_compiled())
> +        for test_basename in not_compiled:
> +            print(f"INFO: Found documentation for '{test_basename}' but no binary")
> +
>          # Compare sets
>  
>          run_missing = list(sorted(run_subtests - doc_subtests))
>          doc_uneeded = list(sorted(doc_subtests - run_subtests))
> +        doc_uneeded_build = [t for t in doc_uneeded if t.split('@')[1] not in not_compiled]
>  
> -        if doc_uneeded:
> -            for test_name in doc_uneeded:
> -                print(f"Warning: Documented {test_name} doesn't exist on source files")
> -
> -        if run_missing:
> +        if doc_uneeded_build or run_missing:
>              for test_name in run_missing:
> -                print(f'Warning: Missing documentation for {test_name}')
> -            print('Please refer: docs/test_documentation.md for more details')
> +                print(f'ERROR: Missing documentation for {test_name}')
>  
> -        if doc_uneeded or run_missing:
> +            for test_name in doc_uneeded_build:
> +                print(f'ERROR: Unneeded documentation for {test_name}')
> +
> +            print('Please refer: docs/test_documentation.md for more details')
>              sys.exit(1)
>  
>      #
> -- 
> 2.34.1
> 
