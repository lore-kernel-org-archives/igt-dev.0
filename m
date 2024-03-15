Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6952C54E66
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E0710F092;
	Fri, 15 Mar 2024 08:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RV5J1UPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0A10F092
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710492183; x=1742028183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UQpnavKYN0jfyIhToMtKvcqbAUjfYPyVTiXQJwkdpNk=;
 b=RV5J1UPAqwt6FMrp69gaVc7vP5OUk6bmC8/4M2xEAeSK+/ckkoIgK1SA
 5bbh5aD/kqAB1bYpoRPLhfsum2Ndm4C4uIkFQltjD/xR2e6kXkG0N75ug
 EukNnUW/8iq4tE4ezg5fhvwWd+CexahuJHOIpZ0izs5T4PeT/YJeJ1Kh/
 onptExVAUMYuZFzv8TmWsBkT1T/UKoKq8X5jFA0sdS22uB/QdjcnhYaw/
 CjsgLVz8v8lllrZfXVHry9wjrtoiL5vqjb0Fw6fBvSBxTNVOxitTNFjHS
 a4jR5y4EPO6p2A3P6hUEJatwQjz/RSOuHyaaEwfZPfzmRBLaRapODeQdd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="27821236"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="27821236"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17066759"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:43:01 -0700
Date: Fri, 15 Mar 2024 09:42:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 09/10] scripts/xls_to_doc.py: better handle common
 attributes
Message-ID: <20240315084258.jgrnbtpkseh2ilw2@kamilkon-desk.igk.intel.com>
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

Please add description here, with that:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
