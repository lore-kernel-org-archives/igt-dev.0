Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1354E10E358
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 07:08:40 +0000 (UTC)
Date: Mon, 13 Mar 2023 08:08:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313070836.pkr7a2f2thvilnds@zkempczy-mobl2>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
 <20230310194125.14781-12-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310194125.14781-12-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 11/19] scripts/igt_doc.py: use a
 different logic to get IGT prefix
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 08:41:17PM +0100, Zbigniew Kempczyński wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The past logic was dependent on how the initial Xe IGT support
> was conceived. Change it to be more generic and use
> os.path.commonprefix.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 5b08ac1442..f1b6d64615 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -235,7 +235,6 @@ class TestList:
>      def __init__(self, config_fname, include_plan, file_list):
>          self.doc = {}
>          self.test_number = 0
> -        self.min_test_prefix = ''
>          self.config = None
>          self.filenames = file_list
>          self.plan_filenames = []
> @@ -494,7 +493,7 @@ class TestList:
>          for test in self.doc:                   # pylint: disable=C0206
>              fname = self.doc[test]["File"]
>  
> -            name = re.sub(r'.*tests/', '', fname)
> +            name = re.sub(r'.*/', '', fname)
>              name = re.sub(r'\.[\w+]$', '', name)
>              name = "igt@" + name
>  
> @@ -548,7 +547,7 @@ class TestList:
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
>  
> -            name = re.sub(r'.*tests/', '', fname)
> +            name = re.sub(r'.*/', '', fname)
>              name = re.sub(r'\.[ch]', '', name)
>              name = "igt@" + name
>  
> @@ -720,7 +719,7 @@ class TestList:
>          for test in sorted(self.doc.keys()):
>              fname = self.doc[test]["File"]
>  
> -            test_name = re.sub(r'.*tests/', '', fname)
> +            test_name = re.sub(r'.*/', '', fname)
>              test_name = re.sub(r'\.[ch]', '', test_name)
>              test_name = "igt@" + test_name
>  
> @@ -759,10 +758,12 @@ class TestList:
>          for i in range(0, len(doc_subtests)): # pylint: disable=C0200
>              doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
>  
> +        test_prefix = os.path.commonprefix(doc_subtests)
> +
>          # Get a list of tests from
>          try:
>              result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
> -                                    "-L", "-t",  self.min_test_prefix,
> +                                    "-L", "-t",  test_prefix,
>                                      f"{IGT_BUILD_PATH}/tests"], check = True,
>                                      stdout=subprocess.PIPE, universal_newlines=True)
>          except subprocess.CalledProcessError as sub_err:
> @@ -824,14 +825,6 @@ class TestList:
>          cur_arg = -1
>          cur_arg_element = 0
>  
> -        prefix = re.sub(r'.*tests/', '', fname)
> -        prefix = r'igt\@' + re.sub(r'(.*/).*', r'\1', prefix)
> -
> -        if self.min_test_prefix == '':
> -            self.min_test_prefix = prefix
> -        elif len(prefix) < len(self.min_test_prefix):
> -            self.min_test_prefix = prefix
> -
>          with open(fname, 'r', encoding='utf8') as handle:
>              arg_ref = None
>              current_test = ''
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
