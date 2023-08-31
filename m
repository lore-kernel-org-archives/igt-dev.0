Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C910E0E7
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 17:17:41 +0000 (UTC)
Date: Thu, 31 Aug 2023 19:17:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230831171737.3nnydpksoipwu3zv@kamilkon-desk.igk.intel.com>
References: <20230831145509.477543-1-mauro.chehab@linux.intel.com>
 <20230831145509.477543-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230831145509.477543-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 08/11] scripts/test_list.py: add
 support to return a string instead of print
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
On 2023-08-31 at 16:52:10 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Sometimes, we don't want to print a testlist, but instead to return
> it for post-processing. One such example is to add a Sphinx extension
> to parse it and place the results on some existing ReST file.
> 
> Add support for it.
> 
> A side effect is that we don't need to redirect capture anymore to
> to store the output on a file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 79 ++++++++++++++++++++------------------------
>  1 file changed, 36 insertions(+), 43 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index e5bf24f9b5ef..8ef3a136688f 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -596,20 +596,13 @@ class TestList:
>      # Output methods
>      #
>  
> -    def print_rest_flat(self, filename = None):
> +    def print_rest_flat(self, filename = None, return_string = False):
>  
>          """Print tests and subtests ordered by tests"""
>  
> -        handler = None
> -        if filename:
> -            original_stdout = sys.stdout
> -            handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
> -            sys.stdout = handler
> -
> -        print("=" * len(self.title))
> -        print(self.title)
> -        print("=" * len(self.title))
> -        print()
> +        out = "=" * len(self.title) + "\n"
> +        out += self.title + "\n"
> +        out += "=" * len(self.title) + "\n\n"
>  
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
> @@ -631,10 +624,9 @@ class TestList:
>              if not subtest_array:
>                  continue
>  
> -            print(len(name) * '=')
> -            print(name)
> -            print(len(name) * '=')
> -            print()
> +            out += len(name) * '=' + "\n"
> +            out += name + "\n"
> +            out += len(name) * '=' + "\n\n"
>  
>              for field in sorted(self.doc[test].keys()):
>                  if field == "subtest":
> @@ -642,29 +634,30 @@ class TestList:
>                  if field in self.internal_fields:
>                      continue
>  
> -                print(f":{field}: {self.doc[test][field]}")
> +                out += f":{field}: {self.doc[test][field]}\n"
>  
>              for subtest in subtest_array:
>  
> -                print()
> -                print(subtest["_summary_"])
> -                print(len(subtest["_summary_"]) * '=')
> -                print("")
> +                out += "\n" + subtest["_summary_"] + "\n"
> +                out += len(subtest["_summary_"]) * '=' + "\n\n"
>  
>                  for field in sorted(subtest.keys()):
>                      if field in self.internal_fields:
>                          continue
>  
> -                    print(f":{field}:", subtest[field])
> +                    out += f":{field}:" + subtest[field] + "\n"
>  
> -                print()
> +                out += "\n"
>  
> -            print()
> -            print()
> +            out += "\n\n"
>  
> -        if handler:
> -            handler.close()
> -            sys.stdout = original_stdout
> +        if filename:
> +            with open(filename, "w", encoding='utf8') as handle:
> +                handle.write(out)
> +        elif not return_string:
> +            print(out)
> +        else:
> +            return out
>  
>      def get_spreadsheet(self):
>  
> @@ -708,7 +701,7 @@ class TestList:
>                      sheet[row].append('')
>          return sheet
>  
> -    def print_nested_rest(self, filename = None):
> +    def print_nested_rest(self, filename = None, return_string = False):
>  
>          """Print tests and subtests ordered by tests"""
>  
> @@ -718,10 +711,9 @@ class TestList:
>              handler = open(filename, "w", encoding='utf8') # pylint: disable=R1732
>              sys.stdout = handler
>  
> -        print("=" * len(self.title))
> -        print(self.title)
> -        print("=" * len(self.title))
> -        print()
> +        out = "=" * len(self.title) + "\n"
> +        out += self.title + "\n"
> +        out += "=" * len(self.title) + "\n\n"
>  
>          # Identify the sort order for the fields
>          fields_order = []
> @@ -765,14 +757,11 @@ class TestList:
>  
>                  title_str = fields_order[i] + ": " + fields[fields_order[i]]
>  
> -                print(title_str)
> -                print(level_markers[marker] * len(title_str))
> -                print()
> +                out += title_str + "\n"
> +                out += level_markers[marker] * len(title_str) + "\n\n"
>                  marker += 1
>  
> -            print()
> -            print("``" + subtest + "``")
> -            print()
> +            out += "\n``" + subtest + "``" + "\n\n"
>  
>              # print non-hierarchy fields
>              for field in fields_order:
> @@ -780,7 +769,7 @@ class TestList:
>                      continue
>  
>                  if field in fields:
> -                    print(f":{field}: {fields[field]}")
> +                    out += f":{field}: {fields[field]}" + "\n"
>  
>              # Store current values
>              for i in range(cur_level, len(fields_order)):
> @@ -792,11 +781,15 @@ class TestList:
>                  else:
>                      old_fields[i] = ''
>  
> -            print()
> +            out += "\n"
>  
> -        if handler:
> -            handler.close()
> -            sys.stdout = original_stdout
> +        if filename:
> +            with open(filename, "w", encoding='utf8') as handle:
> +                handle.write(out)
> +        elif not return_string:
> +            print(out)
> +        else:
> +            return out
>  
>      def print_json(self, out_fname):
>  
> -- 
> 2.41.0
> 

