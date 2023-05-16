Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FA510E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:57:41 +0000 (UTC)
Date: Tue, 16 May 2023 17:57:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516155735.kqqkkkmmulw553tv@kamilkon-desk1>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
 <20230509090738.1157939-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509090738.1157939-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/6] scripts/test_list.py: add
 support to exclude files
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

On 2023-05-09 at 11:07:34 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Specially when using wildcards, it is interesting to have a
> way to exclude some files. This is needed to support some kms
> helper functions that, instead of being part of the IGT library,
> are stored inside the tests sub-directories.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index e68a4cb3df71..7153b06df015 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -208,6 +208,7 @@ class TestList:
>  
>      {
>          "files": [ "tests/driver/*.c" ],
> +        "exclude_files": [ "tests/driver/*-helper.c" ],
>          "fields": {
>              "Category": {
>                  "Sub-category": {
> @@ -302,10 +303,19 @@ class TestList:
>              has_implemented = False
>              if not self.filenames:
>                  self.filenames = []
> +                exclude_files = []
>                  files = self.config["files"]
> +                exclude_file_glob = self.config.get("exclude_files", [])
> +                for cfg_file in exclude_file_glob:
> +                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
> +                    for fname in glob.glob(cfg_file):
> +                        exclude_files.append(fname)
> +
>                  for cfg_file in files:
>                      cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
>                      for fname in glob.glob(cfg_file):
> +                        if fname in exclude_files:
> +                            continue
>                          self.filenames.append(fname)
>                          has_implemented = True
>              else:
> -- 
> 2.40.1
> 

