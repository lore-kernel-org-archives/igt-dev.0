Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A013510E5CC
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:51:15 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:50:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712185053.pyyekuqfhudvn7ln@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-10-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-10-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 09/13] scripts/igt_doc.py: use field
 names when create a TestList instance
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
On 2023-07-12 at 15:58:50 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Makes the caller more generic by explicitly passing the field
> name when calling TestList. This allows updating the class and
> eventually re-ordering fields without the need of changes on
> igt_doc.py.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index c02029e03a31..4f4c5c755c44 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -48,8 +48,10 @@ parser.add_argument('--files', nargs='+',
>  
>  parse_args = parser.parse_args()
>  
> -tests = TestList(parse_args.config, parse_args.include_plan, parse_args.files,
> -                 parse_args.built_testlist)
> +tests = TestList(config_fname = parse_args.config,
> +                 include_plan = parse_args.include_plan,
> +                 file_list = parse_args.files,
> +                 built_testlist = parse_args.built_testlist)
>  
>  if parse_args.filter_field:
>      for filter_expr in parse_args.filter_field:
> -- 
> 2.40.1
> 

