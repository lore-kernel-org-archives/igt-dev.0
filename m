Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E910E1C8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 11:56:36 +0000 (UTC)
Date: Fri, 26 May 2023 13:56:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526115632.2sj3yp5kwbea2eml@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522142201.2527800-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] scripts/test_list.py: add support
 to define a name at the config file
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

On 2023-05-22 at 16:21:56 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Instead of inferring the driver name from the test directory, allow
> specifying it at the JSON config file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 21767870b1c1..654ccd8692d4 100755
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -337,16 +337,16 @@ class TestList:
>          if has_implemented:
>              if has_planned:
>                  planned_class = "Planned"
> -                self.title = "Planned and implemented tests for "
> +                self.title = "Planned and implemented "
>              else:
> -                self.title = "Implemented tests for "
> +                self.title = "Implemented "
>          else:
>              if has_planned:
> -                self.title = "Planned tests for "
> +                self.title = "Planned "
>              else:
>                  sys.exit("Need file names to be processed")
>  
> -        self.title += driver_name + " driver"
> +        self.title += self.config.get("name", "tests for " + driver_name + " driver")
>  
>          # Parse files, expanding wildcards
>          field_re = re.compile(r"(" + '|'.join(self.field_list.keys()) + r'):\s*(.*)', re.I)
> -- 
> 2.40.1
> 

