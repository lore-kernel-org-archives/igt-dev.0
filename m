Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8410E1D0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:15:44 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:15:39 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230906111539.5651abd0@maurocar-mobl2>
In-Reply-To: <20230906085135.1724832-1-bhanuprakash.modem@intel.com>
References: <20230906085135.1724832-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] scripts/test_list: Add test_documentation ref
 to the logs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed,  6 Sep 2023 14:21:35 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> For new IGT users, it's helpful to have the ref (in case of
> missing documentation) in IGT logs to refer igt documentation
> page.
> 
> Example log:
>  Warning: Missing documentation for igt@kms_color@degamma
>  Warning: Missing documentation for igt@kms_flip@basic-plain-flip
>  Please refer: docs/test_documentation.md for more details
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  scripts/test_list.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 4cd976c8d..2171f8b50 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -1027,6 +1027,8 @@ class TestList:
>          if run_missing:
>              for test_name in run_missing:
>                  print(f'Warning: Missing documentation for {test_name}')
> +            print(f'Please refer: docs/test_documentation.md for more details')
> +
>          if doc_uneeded or run_missing:
>              sys.exit(1)
>  
