Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62CA10E5C6
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:39:04 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:38:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712183859.bafpcr4ylxinjktg@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 06/13] scripts/test_list.py: close
 config file before start processing
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

On 2023-07-12 at 15:58:47 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Reduce the identation level of the code which parses the config
> file, as this can be done after closing the file.
----- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Where it is? Maybe should be dropped?

> 
> This is a preparation for the next patch that will offer a different
> way to pass the configuration.

Could you change description? Now it is a little confusing,
you only change indentation but it state:

v2 06/13 scripts/test_list.py: close config file before start processing
------------------------------ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Maybe something like: change indentation of code

Regards,
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 114 +++++++++++++++++++++----------------------
>  1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 0452be8d7994..cfcf6712bdc0 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -274,71 +274,71 @@ class TestList:
>          with open(config_fname, 'r', encoding='utf8') as handle:
>              self.config = json.load(handle)
>  
> -            self.__add_field(None, 0, 0, self.config["fields"])
> +        self.__add_field(None, 0, 0, self.config["fields"])
>  
> -            sublevel_count = [ 0 ] * self.level_count
> +        sublevel_count = [ 0 ] * self.level_count
>  
> -            for field, item in self.props.items():
> -                if "sublevel" in item["_properties_"]:
> -                    level = item["_properties_"]["level"]
> -                    sublevel = item["_properties_"]["sublevel"]
> -                    if sublevel > sublevel_count[level - 1]:
> -                        sublevel_count[level - 1] = sublevel
> +        for field, item in self.props.items():
> +            if "sublevel" in item["_properties_"]:
> +                level = item["_properties_"]["level"]
> +                sublevel = item["_properties_"]["sublevel"]
> +                if sublevel > sublevel_count[level - 1]:
> +                    sublevel_count[level - 1] = sublevel
>  
> -                field_lc = field.lower()
> -                self.field_list[field_lc] = field
> -                field_plural = _plural(field_lc)
> -                if field_lc != field_plural:
> -                    self.field_list[field_plural] = field
> +            field_lc = field.lower()
> +            self.field_list[field_lc] = field
> +            field_plural = _plural(field_lc)
> +            if field_lc != field_plural:
> +                self.field_list[field_plural] = field
>  
> -            if include_plan:
> -                self.props["Class"] = {}
> -                self.props["Class"]["_properties_"] = {}
> -                self.props["Class"]["_properties_"]["level"] = 1
> -                self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
> +        if include_plan:
> +            self.props["Class"] = {}
> +            self.props["Class"]["_properties_"] = {}
> +            self.props["Class"]["_properties_"]["level"] = 1
> +            self.props["Class"]["_properties_"]["sublevel"] = sublevel_count[0] + 1
>  
> -            # Remove non-multilevel items, as we're only interested on
> -            # hierarchical item levels here
> -            for field, item in self.props.items():
> -                if "sublevel" in item["_properties_"]:
> -                    level = item["_properties_"]["level"]
> -                    if sublevel_count[level - 1] == 1:
> -                        del item["_properties_"]["level"]
> -                        del item["_properties_"]["sublevel"]
> -            del self.props["_properties_"]
> +        # Remove non-multilevel items, as we're only interested on
> +        # hierarchical item levels here
> +        for field, item in self.props.items():
> +            if "sublevel" in item["_properties_"]:
> +                level = item["_properties_"]["level"]
> +                if sublevel_count[level - 1] == 1:
> +                    del item["_properties_"]["level"]
> +                    del item["_properties_"]["sublevel"]
> +        del self.props["_properties_"]
>  
> -            has_implemented = False
> -            if not self.filenames:
> -                self.filenames = []
> -                exclude_files = []
> -                files = self.config["files"]
> -                exclude_file_glob = self.config.get("exclude_files", [])
> -                for cfg_file in exclude_file_glob:
> -                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> -                    for fname in glob.glob(cfg_file):
> -                        exclude_files.append(fname)
> +        has_implemented = False
> +        if not self.filenames:
> +            self.filenames = []
> +            exclude_files = []
> +            files = self.config["files"]
> +            exclude_file_glob = self.config.get("exclude_files", [])
> +            for cfg_file in exclude_file_glob:
> +                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                for fname in glob.glob(cfg_file):
> +                    exclude_files.append(fname)
>  
> -                for cfg_file in files:
> -                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> -                    for fname in glob.glob(cfg_file):
> -                        if fname in exclude_files:
> -                            continue
> -                        self.filenames.append(fname)
> -                        has_implemented = True
> -            else:
> -                for cfg_file in self.filenames:
> -                    if cfg_file:
> -                        has_implemented = True
> +            for cfg_file in files:
> +                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                for fname in glob.glob(cfg_file):
> +                    if fname in exclude_files:
> +                        continue
> +                    self.filenames.append(fname)
> +                    has_implemented = True
> +        else:
> +            for cfg_file in self.filenames:
> +                if cfg_file:
> +                    has_implemented = True
>  
> -            has_planned = False
> -            if include_plan and "planning_files" in self.config:
> -                implemented_class = "Implemented"
> -                files = self.config["planning_files"]
> -                for cfg_file in files:
> -                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> -                    for fname in glob.glob(cfg_file):
> -                        self.plan_filenames.append(fname)
> -                        has_planned = True
> +        has_planned = False
> +        if include_plan and "planning_files" in self.config:
> +            implemented_class = "Implemented"
> +            files = self.config["planning_files"]
> +            for cfg_file in files:
> +                cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                for fname in glob.glob(cfg_file):
> +                    self.plan_filenames.append(fname)
> +                    has_planned = True
>  
>          planned_class = None
>          if has_implemented:
> -- 
> 2.40.1
> 

