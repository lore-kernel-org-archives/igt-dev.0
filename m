Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5592CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1380B1126A8;
	Mon, 11 Mar 2024 13:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwmaeale";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8012F1126A8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710164856; x=1741700856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cT+ZJBrTQVzcmhwCH50Gz271HIC8DvSLxsN54NcCI3o=;
 b=jwmaeale6fqqYQFMNJlgZmHnlCJkHoOMUFD3nxqCpytxy+OYTLwDXgZi
 HG24vRzRWqW9EcYcVQuswQO+T1piyHofmIDgJfcPkIiaKhVtmu2rx+ANI
 JGB9I9lhoVriuP0DDC0iKJqrKVeYRYlIXW6qXeDwfGv8Lw+GNP1k+eDLn
 Esvntyw1gP//iUFlHAD5Kr+QsnT7hqZXvm7KOj9uODtrwdKeJGtg3042S
 8S/3smojiEpKfq5EvPQ1G84eXDd4Mi3133CV9vzpYG+dfqRgw4oNEB1uY
 nfFYkj8+/zNPaNyEdBYmLIL1a/0RAS59Rhb0Ada3BHshhl+BY1WGcPucE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15387639"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15387639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11164944"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 06:47:35 -0700
Date: Mon, 11 Mar 2024 14:47:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] scripts/doc_to_xls.py: split code into a XLS
 conversion and main()
Message-ID: <20240311134731.ahmhvdkabgojdm5d@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240311131116.983384-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240311131116.983384-1-mauro.chehab@linux.intel.com>
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
On 2024-03-11 at 14:11:16 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Such change allows using the code on some other python script that
> would be converting IGT doc test documentation into XLS files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

While I am not python expert, I checked your code with pylint,
there are some warnings:

************* Module doc_to_xls
scripts/doc_to_xls.py:109:0: C0305: Trailing newlines (trailing-newlines)
scripts/doc_to_xls.py:25:0: C0413: Import "import argparse" should be placed at the top of the module (wrong-import-position)
scripts/doc_to_xls.py:27:0: E0401: Unable to import 'openpyxl' (import-error)
scripts/doc_to_xls.py:27:0: C0413: Import "from openpyxl import Workbook" should be placed at the top of the module (wrong-import-position)
scripts/doc_to_xls.py:28:0: E0401: Unable to import 'openpyxl.utils' (import-error)
scripts/doc_to_xls.py:28:0: C0413: Import "from openpyxl.utils import get_column_letter" should be placed at the top of the module (wrong-import-position)
scripts/doc_to_xls.py:29:0: E0401: Unable to import 'openpyxl.styles' (import-error)
scripts/doc_to_xls.py:29:0: C0413: Import "from openpyxl.styles import Font" should be placed at the top of the module (wrong-import-position)
scripts/doc_to_xls.py:31:0: C0413: Import "from test_list import TestList" should be placed at the top of the module (wrong-import-position)
scripts/doc_to_xls.py:86:0: C0116: Missing function or method docstring (missing-function-docstring)

After move of import statements just after Copyright comments, there are:

************* Module doc_to_xls
scripts/doc_to_xls.py:109:0: C0305: Trailing newlines (trailing-newlines)
scripts/doc_to_xls.py:1:0: C0114: Missing module docstring (missing-module-docstring)
scripts/doc_to_xls.py:19:0: W0105: String statement has no effect (pointless-string-statement)
scripts/doc_to_xls.py:86:0: C0116: Missing function or method docstring (missing-function-docstring)

First one imho could be ignored (one newline at end of file),
I do not know if others are also to be ignored?

Regards,
Kamil

> ---
>  scripts/doc_to_xls.py | 113 ++++++++++++++++++++++++------------------
>  1 file changed, 65 insertions(+), 48 deletions(-)
> 
> diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
> index 12c0223920ae..a4b1d9d8be1b 100755
> --- a/scripts/doc_to_xls.py
> +++ b/scripts/doc_to_xls.py
> @@ -30,63 +30,80 @@ from openpyxl.styles import Font
>  
>  from test_list import TestList
>  
> -parser = argparse.ArgumentParser(description=__doc__,
> -                                 formatter_class = argparse.RawDescriptionHelpFormatter,
> -                                 epilog = EPILOG)
> -parser.add_argument("--config", required = True,  nargs='+',
> -                    help="JSON file describing the test plan template")
> -parser.add_argument("--include-plan", action="store_true",
> -                    help="Include test plans, if any.")
> -parser.add_argument("--xls", required = True,
> -                    help="Output XLS file.")
> +def tests_to_xls(tests, fname):
> +    """
> +    Convert an array of IGT documentation tests into a XLS file
> +    """
>  
> -parse_args = parser.parse_args()
> +    wb = Workbook()
> +    ws = None
>  
> -tests = []
> -for config_file in parse_args.config:
> -    # Implemented tests
> -    tests.append(TestList(config_file, parse_args.include_plan))
> +    expand_fields = {
> +        "GPU excluded platform": "blocklist "
> +    }
>  
> -wb = Workbook()
> -ws = None
> +    for row in range(len(tests)):
> +        test = tests[row]
> +        sheet_name = test.title
>  
> -expand_fields = {
> -    "GPU excluded platform": "blocklist "
> -}
> +        if not ws:
> +            ws = wb.active
> +            ws.title = sheet_name
> +        else:
> +            ws = wb.create_sheet(sheet_name)
>  
> -for row in range(len(tests)):
> -    test = tests[row]
> -    sheet_name = test.title
> +        sheet = test.get_spreadsheet(expand_fields)
>  
> -    if not ws:
> -        ws = wb.active
> -        ws.title = sheet_name
> -    else:
> -        ws = wb.create_sheet(sheet_name)
> -
> -    sheet = test.get_spreadsheet(expand_fields)
> -
> -    max_length = []
> -    for col in range(len(sheet[row])):
> -        max_length.append(0)
> -
> -    for row in range(len(sheet)):
> +        max_length = []
>          for col in range(len(sheet[row])):
> -            c = ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
> -            if row == 0:
> -                c.font = Font(bold=True)
> +            max_length.append(0)
>  
> -            if len(sheet[row][col]) > max_length[col]:
> -                max_length[col] = len(sheet[row][col])
> +        for row in range(len(sheet)):
> +            for col in range(len(sheet[row])):
> +                c = ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
> +                if row == 0:
> +                    c.font = Font(bold=True)
>  
> -    # Estimate column length
> -    for col in range(len(sheet[0])):
> -        column = get_column_letter(col + 1)
> +                if len(sheet[row][col]) > max_length[col]:
> +                    max_length[col] = len(sheet[row][col])
>  
> -        adjusted_width = (max_length[col] + 2) * 1.2
> -        ws.column_dimensions[column].width = adjusted_width
> +        # Estimate column length
> +        for col in range(len(sheet[0])):
> +            column = get_column_letter(col + 1)
>  
> -    # Turn on auto-filter
> -    ws.auto_filter.ref = ws.dimensions
> +            adjusted_width = (max_length[col] + 2) * 1.2
> +            ws.column_dimensions[column].width = adjusted_width
> +
> +        # Turn on auto-filter
> +        ws.auto_filter.ref = ws.dimensions
> +
> +    wb.save(fname)
> +
> +######
> +# Main
> +######
> +
> +def main():
> +
> +    parser = argparse.ArgumentParser(description=__doc__,
> +                                     formatter_class = argparse.RawDescriptionHelpFormatter,
> +                                     epilog = EPILOG)
> +    parser.add_argument("--config", required = True,  nargs='+',
> +                        help="JSON file describing the test plan template")
> +    parser.add_argument("--include-plan", action="store_true",
> +                        help="Include test plans, if any.")
> +    parser.add_argument("--xls", required = True,
> +                        help="Output XLS file.")
> +
> +    parse_args = parser.parse_args()
> +
> +    tests = []
> +    for config_file in parse_args.config:
> +        # Implemented tests
> +        tests.append(TestList(config_file, parse_args.include_plan))
> +
> +    tests_to_xls(tests, fname = parse_args.xls)
> +
> +if __name__ == '__main__':
> +    main()
>  
> -wb.save(parse_args.xls)
> -- 
> 2.43.2
> 
