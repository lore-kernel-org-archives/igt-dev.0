Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FD510E619
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:52 +0000 (UTC)
Date: Fri, 13 Oct 2023 16:43:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231013144348.co7emkcu7zzup36d@kamilkon-desk.igk.intel.com>
References: <20231013093152.737239-1-mauro.chehab@linux.intel.com>
 <20231013093152.737239-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013093152.737239-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] intel/kms_test_config.json: set
 testlist read parser to ignore case
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

On 2023-10-13 at 11:29:28 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As KMS ports are described in upper case, relax testlist parser to
> ignore case, as the regular expressions at intel-ci may be in lower
> case.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index ad3a3aa7abb5..6c9b7194a58f 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -4,6 +4,7 @@
>      "files": [ "../chamelium/kms_*.c", "../kms_*.c", "../testdisplay.c", "kms_*.c" ],
>      "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
>                         "kms_dsc_helper.c" ],
> +    "case_insensitive_testlist": true,
>      "fields": {
>          "Category": {
>              "_properties_": {
> -- 
> 2.41.0
> 

