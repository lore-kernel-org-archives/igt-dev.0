Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469610E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 12:18:12 +0000 (UTC)
Date: Fri, 26 May 2023 14:18:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526121808.t5azwfolhhcttuue@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522142201.2527800-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] scripts/test_list.py: add a method
 to return an spreadsheet-like array
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

On 2023-05-22 at 16:22:00 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> It can be useful to convert the contents of the tests into a
> spreadsheet. Add a method for doing that at the TestList class.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 654ccd8692d4..58a2457d6e77 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -651,6 +651,48 @@ class TestList:
>              handler.close()
>              sys.stdout = original_stdout
>  
> +    def get_spreadsheet(self):
> +
> +        """
> +        Return a bidimentional array with the test contents.
> +
> +        Its output is similar to a spreadsheet, so it can be used by a
> +        separate python file that would create a workbook's sheet.
> +        """
> +
> +        sheet = []
> +        row = 0
> +        sheet.append([])
> +        sheet[row].append('Test name')
> +
> +        subtest_dict = self.expand_dictionary(True)
> +
> +                # Identify the sort order for the fields
> +        fields_order = []
> +        fields = sorted(self.props.items(), key = _sort_per_level)
> +        for item in fields:
> +            fields_order.append(item[0])
> +            sheet[row].append(item[0])
> +
> +        # Receives a flat subtest dictionary, with wildcards expanded
> +        subtest_dict = self.expand_dictionary(True)
> +
> +        subtests = sorted(subtest_dict.items(),
> +                          key = lambda x: _sort_using_array(x, fields_order))
> +
> +        for subtest, fields in subtests:
> +            row += 1
> +            sheet.append([])
> +
> +            sheet[row].append(subtest)
> +
> +            for field in fields_order:
> +                if field in fields:
> +                    sheet[row].append(fields[field])
> +                else:
> +                    sheet[row].append('')
> +        return sheet
> +
>      def print_nested_rest(self, filename):
>  
>          """Print tests and subtests ordered by tests"""
> -- 
> 2.40.1
> 

