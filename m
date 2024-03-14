Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC961C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0A10E7F8;
	Thu, 14 Mar 2024 15:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUi7xVfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889EE10E817
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710429757; x=1741965757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cy8OIoux+dN29lnwQ8rgqBIpsVIbfwg4rBSmHtgH2lU=;
 b=YUi7xVfP8DbjQyX0yFwPmAo/Wlp+0JJZlZivIQtpifmFTYPpGvcXiMUN
 J+kRwt5xfWsHZKmxjjZWIRj+cKG4OWEKMrV2yx4zFwgs2mEUdyo3vJR4j
 sWbu+hayHyyXsb6CT3JP7pWvTmloS0cRVTn3AdXJ0MyYbyiS0V3syKqfT
 qZnOIdNtkvoJDDJNNTCRwinnDcG2YY7atfi9SrTfAZj8YgvVgP4Wz0uFK
 JCeHaWkggwNIPIy/3j+/gx5dn3ebU0RKg426nrgqZboXsrlyPChg1RZ6H
 0TRbb0UPM+FIy+We716mmHxSSuzOki+6FGPG/dztMbhgVp4dJcLi2U8jQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="30692769"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30692769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12258745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:22:35 -0700
Date: Thu, 14 Mar 2024 16:22:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 09/10] scripts/xls_to_doc.py: better handle common
 attributes
Message-ID: <20240314152232.22hqrc3fit5lihob@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-10-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-03-14 at 11:29:18 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 

Please describe your changes here, use also pylint,
after your patchset applied it is:

pylint scripts/xls_to_doc.py
************* Module xls_to_doc
scripts/xls_to_doc.py:422:0: W0311: Bad indentation. Found 28 spaces, expected 24 (bad-indentation)
scripts/xls_to_doc.py:27:0: R0902: Too many instance attributes (8/7) (too-many-instance-attributes)
scripts/xls_to_doc.py:145:8: C0103: Variable name "wb" doesn't conform to snake_case naming style (invalid-name)
scripts/xls_to_doc.py:302:8: C0206: Consider iterating with .items() (consider-using-dict-items)
scripts/xls_to_doc.py:366:41: W0613: Unused argument 'args' (unused-argument)

------------------------------------------------------------------
Your code has been rated at 9.84/10 (previous run: 9.82/10, +0.03)

Regards,
Kamil

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/xls_to_doc.py | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 03feae5834d7..60f7536c8839 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -31,9 +31,10 @@ class FillTests(TestList):
>      def __init__(self, config_path, verbose):
>          self.tests = {}
>          self.spreadsheet_data = {}
> -        self.ignore_fields = []
>          self.verbose = verbose
>  
> +        self.update_fields = []
> +
>          # Read current documentation
>          TestList.__init__(self, config_path)
>  
> @@ -78,7 +79,9 @@ class FillTests(TestList):
>              if "sublevel" in item["_properties_"]:
>                  update = item["_properties_"].get("update-from-file")
>                  if update:
> -                    self.ignore_fields.append(field)
> +                    continue
> +
> +            self.update_fields.append(field)
>  
>      def add_field(self, dic, field, value):
>          """
> @@ -276,8 +279,22 @@ class FillTests(TestList):
>  
>              test_nr = self.tests[testname]["Test"]
>  
> +            # Update common fields
>              doc_content = self.orig_doc[test_nr]
> +            fields = set(self.doc[test_nr].keys()) | set(doc_content.keys())
>  
> +            for field in sorted(fields):
> +                if field not in self.update_fields:
> +                    continue
> +
> +                value = self.doc[test_nr].get(field, "")
> +                doc_value = doc_content.get(field, "")
> +
> +                if doc_value == value:
> +                    continue
> +
> +
> +            # Update subtest fields
>              for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
>                  if "line" not in subtest_content:
>                      print(f"Warning: didn't find where {subtest} is documented.")
> @@ -298,11 +315,7 @@ class FillTests(TestList):
>                  fields = set(subtest_content.keys()) | set(doc_content.keys())
>  
>                  for field in sorted(fields):
> -                    if field not in self.props:
> -                        continue
> -
> -                    if args.ignore_lists:
> -                        if field in self.ignore_fields:
> +                    if field not in self.update_fields:
>                              continue
>  
>                      value = subtest_content.get(field, "")
> -- 
> 2.43.2
> 
