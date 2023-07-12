Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8FF10E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:43:03 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:42:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712184259.gh6z5646odywk5yl@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-8-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-8-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 07/13] scripts/test_list.py: don't
 rely on file name to parse config
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

On 2023-07-12 at 15:58:48 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Currently, config_fname should not be empty, as the class init
> will fail. Make the logic more generic to prepare to optionally pass
> the configuration dict directly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index cfcf6712bdc0..5da471617268 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -255,7 +255,6 @@ class TestList:
>          self.filenames = file_list
>          self.plan_filenames = []
>          self.props = {}
> -        self.config_fname = config_fname
>          self.built_testlist = built_testlist
>          self.level_count = 0
>          self.field_list = {}
> @@ -274,6 +273,9 @@ class TestList:
>          with open(config_fname, 'r', encoding='utf8') as handle:
>              self.config = json.load(handle)
>  
> +        config_origin = config_fname
> +        cfg_path = os.path.realpath(os.path.dirname(config_fname)) + "/"
> +
>          self.__add_field(None, 0, 0, self.config["fields"])
>  
>          sublevel_count = [ 0 ] * self.level_count
> @@ -314,12 +316,12 @@ class TestList:
>              files = self.config["files"]
>              exclude_file_glob = self.config.get("exclude_files", [])
>              for cfg_file in exclude_file_glob:
> -                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                cfg_file = cfg_path + cfg_file
>                  for fname in glob.glob(cfg_file):
>                      exclude_files.append(fname)
>  
>              for cfg_file in files:
> -                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                cfg_file = cfg_path + cfg_file
>                  for fname in glob.glob(cfg_file):
>                      if fname in exclude_files:
>                          continue
> @@ -335,7 +337,7 @@ class TestList:
>              implemented_class = "Implemented"
>              files = self.config["planning_files"]
>              for cfg_file in files:
> -                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                cfg_file = cfg_path + cfg_file
>                  for fname in glob.glob(cfg_file):
>                      self.plan_filenames.append(fname)
>                      has_planned = True
> @@ -363,12 +365,12 @@ class TestList:
>                  continue
>  
>              self.__add_file_documentation(fname, implemented_class, field_re,
> -                                          test_tag, subtest_tag)
> +                                          test_tag, subtest_tag, config_origin)
>  
>          if include_plan:
>              for fname in self.plan_filenames:
>                  self.__add_file_documentation(fname, planned_class, field_re,
> -                                              test_tag, subtest_tag)
> +                                              test_tag, subtest_tag, config_origin)
>  
>      #
>      # ancillary methods
> @@ -1003,7 +1005,7 @@ class TestList:
>      #
>  
>      def __add_file_documentation(self, fname, implemented_class, field_re,
> -                                 test_tag, subtest_tag):
> +                                 test_tag, subtest_tag, config_origin):
>  
>          """Adds the contents of test/subtest documentation form a file"""
>  
> @@ -1215,7 +1217,7 @@ class TestList:
>  
>                  file_line.rstrip(r"\n")
>                  sys.exit(f"{fname}:{file_ln + 1}: Error: unrecognized line. Need to add field at %s?\n\t==> %s" %
> -                         (self.config_fname, file_line))
> +                         (config_origin, file_line))
>  
>      def show_subtests(self, sort_field):
>  
> -- 
> 2.40.1
> 

