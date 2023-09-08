Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B9D10E0D8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:58:02 +0000 (UTC)
Date: Fri, 8 Sep 2023 19:57:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908175758.uz75ggqhkthgp4bt@kamilkon-desk.igk.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
 <20230908083734.1084351-12-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908083734.1084351-12-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/11] scripts/doc_to_xls.py: improve
 XLS output format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-09-08 at 10:27:47 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> - Use a bold font for column names;
> - enable auto-filter;
> - make it backward compatible with versions of openpyxl
>   shipped on LTS distros.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/doc_to_xls.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
> index 3af3488928cf..c2eaef8fd4b4 100755
> --- a/scripts/doc_to_xls.py
> +++ b/scripts/doc_to_xls.py
> @@ -25,6 +25,8 @@ Examples:
>  import argparse
>  
>  from openpyxl import Workbook
> +from openpyxl.utils import get_column_letter
> +from openpyxl.styles import Font
>  
>  from test_list import TestList
>  
> @@ -70,17 +72,21 @@ for row in range(len(tests)):
>  
>      for row in range(len(sheet)):
>          for col in range(len(sheet[row])):
> -            ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
> +            c = ws.cell(row = row + 1, column = col + 1, value = sheet[row][col])
> +            if row == 0:
> +                c.font = Font(bold=True)
> +
>              if len(sheet[row][col]) > max_length[col]:
>                  max_length[col] = len(sheet[row][col])
>  
> -    col = 0
> -    for c in ws.columns:
> -        column = c[0].column_letter
> +    # Estimate column length
> +    for col in range(len(sheet[0])):
> +        column = get_column_letter(col + 1)
>  
>          adjusted_width = (max_length[col] + 2) * 1.2
>          ws.column_dimensions[column].width = adjusted_width
>  
> -        col += 1
> +    # Turn on auto-filter
> +    ws.auto_filter.ref = ws.dimensions
>  
>  wb.save(parse_args.xls)
> -- 
> 2.41.0
> 

