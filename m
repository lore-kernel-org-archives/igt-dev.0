Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C32110E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:45:49 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:45:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712184544.rf3vw26embxd6h2v@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/13] scripts/test_list.py: allow
 passing a config dict directly
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

On 2023-07-12 at 15:58:49 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Make the logic more generic by allowing to pass a config dict
> directly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 5da471617268..9861306bd777 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -245,8 +245,10 @@ class TestList:
>      Description: test ioctls
>      """
>  
> -    def __init__(self, config_fname, include_plan = False, file_list = False,
> +    def __init__(self, config_fname = None,
> +                 include_plan = False, file_list = None,
>                   built_testlist = None,
> +                 config_dict = None, sources_path = None,
>                   test_tag = "TEST", subtest_tag = "SUBTESTS?",
>                   main_name = "igt", subtest_separator = "@"):
>          self.doc = {}
> @@ -263,18 +265,34 @@ class TestList:
>          self.subtest_separator = subtest_separator
>          self.main_name = main_name
>  
> +        # Exclusive or: either one is needed
> +        if bool(config_fname) == bool(config_dict):
> +            sys.exit("Error: either config filename or config dict shall be used")
> +
>          if self.main_name:
>              self.main_name += subtest_separator
>  
> -        driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
> -
>          implemented_class = None
>  
> -        with open(config_fname, 'r', encoding='utf8') as handle:
> -            self.config = json.load(handle)
> +        if config_fname:
> +            with open(config_fname, 'r', encoding='utf8') as handle:
> +                self.config = json.load(handle)
>  
> -        config_origin = config_fname
> -        cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
> +            config_origin = config_fname
> +            cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
> +            driver_name = re.sub(r'(.*/)?([^\/]+)/.*', r'\2', config_fname).capitalize()
> +
> +        else:
> +            self.config = config_dict
> +            config_origin = "config dict"
> +            cfg_path = "./"
> +            driver_name = main_name
> +
> +        if sources_path:
> +            cfg_path = os.path.realpath(sources_path) + "/"
> +
> +        if not self.config:
> +            sys.exit("Error: configuration is empty!")
>  
>          self.__add_field(None, 0, 0, self.config["fields"])
>  
> -- 
> 2.40.1
> 

