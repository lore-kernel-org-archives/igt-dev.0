Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4FC10E0D8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:53:34 +0000 (UTC)
Date: Fri, 8 Sep 2023 19:53:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908175329.b5bjw5s4fcj5x3zs@kamilkon-desk.igk.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
 <20230908083734.1084351-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908083734.1084351-10-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 09/11] scripts/test_list.py: add
 support for expanding fields on spreadsheet
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
On 2023-09-08 at 10:27:45 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Sometimes, it is desired to expand a field into multiple columns
> when generating a spreadsheet. Add support for it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 01f6528ac84c..74abdc5ebe65 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -759,7 +759,7 @@ class TestList:
>          else:
>              return out
>  
> -    def get_spreadsheet(self):
> +    def get_spreadsheet(self, expand_fields = {}):
>  
>          """
>          Return a bidimentional array with the test contents.
> @@ -768,6 +768,7 @@ class TestList:
>          separate python file that would create a workbook's sheet.
>          """
>  
> +        expand_field_name = {}
>          sheet = []
>          row = 0
>          sheet.append([])
> @@ -779,6 +780,9 @@ class TestList:
>          fields_order = []
>          fields = sorted(self.props.items(), key = _sort_per_level)
>          for item in fields:
> +            if item[0] in expand_fields.keys():
> +                expand_field_name[item[0]] = set()
> +                continue
>              fields_order.append(item[0])
>              sheet[row].append(item[0])
>  
> @@ -799,6 +803,35 @@ class TestList:
>                      sheet[row].append(fields[field])
>                  else:
>                      sheet[row].append('')
> +
> +            for field in expand_fields.keys():
> +                names = fields.get(field)
> +                if not names:
> +                    continue
> +
> +                names = set(re.split(r",\s*", names))
> +                expand_field_name[field].update(names)
> +
> +        # Add expanded fields, if any
> +        for item in sorted(expand_fields.keys(), key=str.lower):
> +            prefix = expand_fields[item]
> +
> +            for field in sorted(list(expand_field_name[item]), key=str.lower):
> +                row = 0
> +                sheet[row].append(prefix + field)
> +
> +                for subtest, fields in subtests:
> +                    row += 1
> +                    value = ""
> +                    names = fields.get(item)
> +                    if names:
> +                        names = set(re.split(r",\s*", names))
> +
> +                        if field in names:
> +                            value = "Yes"
> +
> +                    sheet[row].append(value)
> +
>          return sheet
>  
>      def print_nested_rest(self, filename = None, return_string = False):
> -- 
> 2.41.0
> 

