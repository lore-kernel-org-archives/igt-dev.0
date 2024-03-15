Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B7FC54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 08:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7DA112010;
	Fri, 15 Mar 2024 08:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBpZLEb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EC211200C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710492085; x=1742028085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BZsu7H2PWI26/qgiDoW+9sUDVnTxF7BUDQcAZva/8zo=;
 b=DBpZLEb3/YEqTbAmUkRKh/WR0+Jb3H5Vk/h5dZRWTJWanxAf2QbX3xbl
 MyOzHW1o/2IUbEerK2ZpXSqzeQeGwxI08ki0rKBbD3SoZ6xu1PlnY6U1b
 589NxpILsi/bmBxyiX0iDTUQzAreY7FvS/f73/Q28MHU+yTx3qO9MfsBB
 Rwq16IIH9rXVkLj4Bt8ZMuBnxPvgi2FY8xhBJA8V/nsKgg4TPj36YGhgM
 6kN3FDpQ74aQpa7irKIsSkwjoRgkoonNwHFYC8rWKqlctQyYZfFPnbmwW
 tsMyGrClGtMhJyYIFl+XKkcDE/cnNpuTiNX2DJt6JQjaodWVJDY3omjAB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="27821080"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="27821080"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 01:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12659056"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 01:41:22 -0700
Date: Fri, 15 Mar 2024 09:40:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 10/10] scripts/xls_to_doc.py: add a logic to
 simplify tags
Message-ID: <20240315084058.5tbgo5l2pp37y5f6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240314103014.1170437-1-mauro.chehab@linux.intel.com>
 <20240314103014.1170437-11-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314103014.1170437-11-mauro.chehab@linux.intel.com>
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
On 2024-03-14 at 11:29:19 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When there are common fields at the test and they were updated,
> reflect the changes at the test level if all subtests have equal
> values at the same field(s).
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/xls_to_doc.py | 133 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 121 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 60f7536c8839..6492c5d8337a 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -8,6 +8,7 @@
>  """Import contents of a XLS file into testplan documentation."""
>  
>  import argparse
> +import copy
>  import json
>  import os
>  import re
> @@ -38,7 +39,7 @@ class FillTests(TestList):
>          # Read current documentation
>          TestList.__init__(self, config_path)
>  
> -        self.orig_doc = self.doc.copy()
> +        self.orig_doc = copy.deepcopy(self.doc)
>  
>          self.testname_regex = re.compile(r'^\s*(igt@[^\n\@]+)\@?(\S*)\s*')
>          self.key_has_wildcard = re.compile(r'\%?arg\[(\d+)\]')
> @@ -152,11 +153,26 @@ class FillTests(TestList):
>  
>          return self.spreadsheet_data
>  
> -    def change_value(self, content, subtest, line, field, value):
> +    def change_value(self, content, test, subtest, line, field, value):
>          """
>          Change the contents of a source file to update its documentation.
>          """
>  
> +        if test:
> +            line = 0
> +            while True:
> +                line += 1
> +                if line >= len(content):
> +                    break
> +
> +                file_line = content[line]
> +
> +                match = re.match(r'^\s*\* ?TEST:\s*(.*)', file_line)
> +                if match:
> +                    break
> +
> +            line += 1
> +
>          current_field = None
>          found_line = None
>          i = line
> @@ -173,11 +189,14 @@ class FillTests(TestList):
>              file_line = re.sub(r'^\s*\* ?', '', file_line)
>  
>              match = re.match(r'^SUBTESTS?:\s*(.*)', file_line)
> -            if match and match.group(1) != subtest:
> -                break
> +            if match:
> +                if subtest and match.group(1) != subtest:
> +                    break
> +                if test:
> +                    break
>  
>              match = re.match(r'^TEST:\s*(.*)', file_line)
> -            if match and match.group(1) != subtest:
> +            if match:
>                  break
>  
>              match = re.match(r'arg\[(\d+)\]:\s*(.*)', file_line)
> @@ -208,11 +227,22 @@ class FillTests(TestList):
>  
>                      content[i] = ""
>  
> -        if value != "":
> -            if found_line:
> +        if i > len(content):
> +            if test:
> +                print(f"Warning: coun't find doc string for test {subtest}, field {field}")
> +            else:
> +                print(f"Warning: coun't find doc string for subtest {subtest}, field {field} on line {line}")
> +
> +            return
> +
> +        if found_line:
> +            if value != "":
>                  content[found_line] = f' * {field}: {value}\n'
> -                return
> +            else:
> +                content[found_line] = ""
> +            return
>  
> +        if value != "":
>              if i > 2 and re.match(r'\s*\*\s*$', content[i - 1]):
>                  i -= 1
>  
> @@ -261,6 +291,78 @@ class FillTests(TestList):
>              for key, value in row.items():
>                  self.tests[testname]["subtests"][subtest][key] = value
>  
> +    def simplify_doc_strings(self):
> +        """
> +        Group common properties at TEST level if all subtests have identical
> +        values for such property.
> +        """
> +
> +        print("Handling common information on test from subtests")
> +
> +        for testname in self.tests:
> +            # Get common properties
> +            common = {}
> +            test_nr = self.tests[testname].get("Test")
> +            for key, value in self.doc[test_nr].items():
> +                # Ignore description when checking common fields
> +                if key.lower() == "description":
> +                    continue
> +
> +                if key in self.update_fields:
> +                    common[key] = value
> +
> +            # Step 1: verify common items
> +            first = True
> +            for subtest in sorted(list(self.tests[testname]["subtests"].keys())):
> +                if subtest.count("@") > 1:
> +                    print(f"Warning: don't simplify dynamic subtest: {testname}{subtest}")
> +                    continue
> +
> +                # Store common items
> +                subtest_fields = sorted(self.tests[testname]["subtests"][subtest].keys())
> +                for k in subtest_fields:
> +                    # Ignore description when checking common fields
> +                    if k.lower() == "description":
> +                        continue
> +
> +                    # Ignore internal fields
> +                    if k not in self.update_fields:
> +                        continue
> +
> +                    val = self.tests[testname]["subtests"][subtest][k]
> +                    val = val.strip()
> +                    val = re.sub(r" +", " ", val)
> +                    val = re.sub(r"([^\.])\s?\n\s*([A-Z])", r"\1.\n\2", val)
> +                    self.tests[testname]["subtests"][subtest][k] = val
> +
> +                    if first and val != '':
> +                        common[k] = val
> +                    else:
> +                        if k not in common:
> +                            continue
> +                        if common[k] != val:
> +                            del common[k]
> +
> +                first = False
> +
> +                # Remove keys that aren't common to all subtests
> +                for k in list(common.keys()):
> +                    if k not in subtest_fields:
> +                        del common[k]
> +
> +            # Step 2: drop common items from subtests
> +            for subtest, fields in list(self.tests[testname]["subtests"].items()):
> +                for k, val in list(fields.items()):
> +                    if k not in common:
> +                        continue
> +
> +                    if val == common[k]:
> +                        self.tests[testname]["subtests"][subtest][k] = ""
> +
> +            # Step 3: store the modified common properties
> +            for k, val in common.items():
> +                self.doc[test_nr][k] = val
> +
>      def update_test_file(self, testname, args):
>          """
>          Update a C source file using the contents of self.tests as
> @@ -293,6 +395,7 @@ class FillTests(TestList):
>                  if doc_value == value:
>                      continue
>  
> +                self.change_value(content, True, testname, 0, field, value)
>  
>              # Update subtest fields
>              for subtest, subtest_content in sorted(self.tests[testname]["subtests"].items()):
> @@ -300,7 +403,6 @@ class FillTests(TestList):
>                      print(f"Warning: didn't find where {subtest} is documented.")
>                      continue
>  
> -                line = subtest_content['line']
>                  subtest_nr = subtest_content['subtest_nr']
>  
>                  if subtest_nr not in self.doc[test_nr]["subtest"]:
> @@ -310,6 +412,7 @@ class FillTests(TestList):
>                          print(f"Warning: test {testname}, subtest {subtest} is not documented.")
>                      continue
>  
> +                line = self.doc[test_nr]["_subtest_line_"][subtest_nr]
>                  doc_content = self.orig_doc[test_nr]["subtest"][subtest_nr]
>  
>                  fields = set(subtest_content.keys()) | set(doc_content.keys())
> @@ -342,7 +445,7 @@ class FillTests(TestList):
>                      # Just in case, handle continuation lines
>                      value = re.sub(r"\n", "\n *   ", value)
>  
> -                    self.change_value(content, subtest, line, field, value)
> +                    self.change_value(content, False, subtest, line, field, value)
>  
>                      # Update line numbers after insert
>                      skip = True
> @@ -391,7 +494,7 @@ def main():
>      parser = argparse.ArgumentParser(description=__doc__)
>      parser.add_argument("--config", required=True,
>                          help="JSON file describing the test plan template")
> -    parser.add_argument("--xls", required=True,
> +    parser.add_argument("--xls",
>                          help="Input XLS file.")
>      parser.add_argument("--sheets", nargs="*",
>                          help="Input only some specific sheets from the XLS file.")
> @@ -399,13 +502,19 @@ def main():
>                          help='Ignore fields that are updated via test lists')
>      parser.add_argument("--store-json", action="store_true",
>                          help="Generate JSON files with documentation. Useful for debugging purposes.")
> +    parser.add_argument("--simplify", action="store_true",
> +                        help="Run a simplify logic to cleanup TEST common fields.")
>      parser.add_argument('-v', '--verbose', action='count', default=0)
>  
>      parse_args = parser.parse_args()
>  
>      fill_test = FillTests(parse_args.config, parse_args.verbose)
>  
> -    fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
> +    if parse_args.xls:
> +        fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
> +
> +    if parse_args.simplify:
> +        fill_test.simplify_doc_strings()
>  
>      if "store_json" in parse_args:
>          print("Generating fill_test.json debug file")
> -- 
> 2.43.2
> 
