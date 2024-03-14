Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D740DC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 15:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ACC10E30D;
	Thu, 14 Mar 2024 15:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ceio2sMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7510E30D
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710430710; x=1741966710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=braN7clf5VYV0mN2H5xYpHbsSpWMDQVM0MOOFoxF1uQ=;
 b=Ceio2sMb5QoaNuoyO9vOVgIrW5wV/f12BLuiWtreY7h3v8ND/XHtXa+i
 vh7nO/AAuaEdlZzu1X+4xPTb5TDUQ57j1SKyeTc5oLv8XYzqHk/aUddjj
 DPtGkW4MLcP+wnimQHF+BWpmKKfsKVQhNjxWILy8WNzwx5Ibsu2RIp7TX
 XS99OW/spWvCJvS28LvqkPn5+FB4iQurJxLN3pu3HU2GnQlvC1xVBN3Po
 gvuLInul7KnTaDRxsiKaTvOHOkdugzzEL5dgbRnK1E1unWJCvEjgLg3nB
 6dimiZSIZeum6m2l8xwfbaiS3/HfiHKrDKqEI+5Sbzf/CaK4WUijYWiDm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15896998"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="15896998"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12389230"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:38:25 -0700
Date: Thu, 14 Mar 2024 16:38:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 04/10] scripts/xls_to_doc.py: detect field removal
Message-ID: <20240314153822.7qqtngcxr7um6zt6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-5-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:13 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Eventually, a field may have been removed. Add support for
> detecting it at the write logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 5e79a725c1d3..a090dcffe98e 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -37,6 +37,8 @@ class FillTests(TestList):
>          # Read current documentation
>          TestList.__init__(self, config_path)
>  
> +        self.orig_doc = self.doc.copy()
> +
>          self.testname_regex = re.compile(r'^\s*(igt@[^\n\@]+)\@?(\S*)\s*')
>          self.key_has_wildcard = re.compile(r'\%?arg\[(\d+)\]')
>          self.field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
> @@ -202,7 +204,8 @@ class FillTests(TestList):
>  
>                      content[i] = ""
>  
> -        content.insert(i, f' * {field}: {value}\n')
> +        if value != "":
> +            content.insert(i, f' * {field}: {value}\n')
>  
>      def parse_spreadsheet(self, fname, sheets=None):
>          """
> @@ -265,6 +268,8 @@ class FillTests(TestList):
>  
>              test_nr = self.tests[testname]["Test"]
>  
> +            doc_content = self.orig_doc[test_nr]
> +
>              for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
>                  if "line" not in subtest_content:
>                      print(f"Warning: didn't find where {subtest} is documented.")
> @@ -280,26 +285,29 @@ class FillTests(TestList):
>                          print(f"Warning: test {testname}, subtest {subtest} is not documented.")
>                      continue
>  
> -                doc_content = self.doc[test_nr]["subtest"][subtest_nr]
> +                doc_content = self.orig_doc[test_nr]["subtest"][subtest_nr]
>  
> -                # Handling wildcards is not easy. Let's just skip those
> -                for field, value in sorted(subtest_content.items()):
> -                    if field in ['line', 'subtest_nr']:
> +                fields = set(subtest_content.keys()) | set(doc_content.keys())
> +
> +                for field in sorted(fields):
> +                    if field not in self.props:
>                          continue
>  
>                      if args.ignore_lists:
>                          if field in self.ignore_fields:
>                              continue
>  
> -                    doc_value = doc_content.get(field)
> -                    if doc_value:
> -                        if self.key_has_wildcard.search(doc_value):
> -                            print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
> -                            continue
> -                        if doc_value == value:
> -                            if self.verbose > 1:
> -                                print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
> -                            continue
> +                    value = subtest_content.get(field, "")
> +                    doc_value = doc_content.get(field, "")
> +
> +                    # Handling wildcards is not easy. Let's just skip those
> +                    if self.key_has_wildcard.search(doc_value):
> +                        print(f"Warning: {subtest} field {field} has wildcards. Skipping it.")
> +                        continue
> +                    if doc_value == value:
> +                        if self.verbose > 1:
> +                            print(f"{testname}@{subtest} field {field}: Value unchanged: {value}. Ignoring it")
> +                        continue
>  
>                      if self.verbose > 0:
>                          print(f"Update {testname}@{subtest} field {field} on line {line}:")
> -- 
> 2.43.2
> 
