Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C210E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 18:52:05 +0000 (UTC)
Date: Wed, 12 Jul 2023 20:52:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230712185201.g2ol2jpttxgps4kr@kamilkon-desk1>
References: <20230712135854.957128-1-mauro.chehab@linux.intel.com>
 <20230712135854.957128-11-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230712135854.957128-11-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 10/13] scripts/test_list.py: add a
 check before deleting properties
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
On 2023-07-12 at 15:58:51 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If the config file doesn't have empty _properties_, the current
> logic causes an error. Well, if one is passing a dictionary via
> config_dict, it may end using a simplified dict without any
> _properties_ on it.
> 
> Add an extra check to avoid an error.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/test_list.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 9861306bd777..6e3cab206e82 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -325,7 +325,8 @@ class TestList:
>                  if sublevel_count[level - 1] == 1:
>                      del item["_properties_"]["level"]
>                      del item["_properties_"]["sublevel"]
> -        del self.props["_properties_"]
> +        if "_properties_" in self.props:
> +            del self.props["_properties_"]
>  
>          has_implemented = False
>          if not self.filenames:
> -- 
> 2.40.1
> 

