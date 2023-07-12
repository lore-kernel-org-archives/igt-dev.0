Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5A089048
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:55:26 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:55:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712185521.6wdacaopfluu2hxl@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-12-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-12-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 11/13] scripts/test_list.py: filename
 arguments for print_ methods are optional
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

On 2023-07-12 at 15:58:52 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Add a default to those, as the code doesn't need any arguments.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 6e3cab206e82..1551bc92c010 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -616,7 +616,7 @@ class TestList:
>      # Output methods
>      #
>  
> -    def print_rest_flat(self, filename):
> +    def print_rest_flat(self, filename = None):
>  
>          """Print tests and subtests ordered by tests"""
>  
> @@ -728,7 +728,7 @@ class TestList:
>                      sheet[row].append('')
>          return sheet
>  
> -    def print_nested_rest(self, filename):
> +    def print_nested_rest(self, filename = None):
>  
>          """Print tests and subtests ordered by tests"""
>  
> -- 
> 2.40.1
> 

