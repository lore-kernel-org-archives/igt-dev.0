Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1559410E74D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 15:56:16 +0000 (UTC)
Date: Wed, 6 Dec 2023 16:56:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231206155610.4riiavkwoaih7txz@kamilkon-desk.igk.intel.com>
References: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
 <20231206144051.150420-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206144051.150420-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/xe_sysfs_defaults: add a
 description for engine-defaults
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
On 2023-12-06 at 15:39:38 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Description for such subtest is missing, cleaning up this warning:
> 
> 	Warning: igt@xe_sysfs_defaults@engine-defaults Description documentation is missing
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_sysfs_defaults.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> index a1cbfb11d7dd..4a6b3ba6dcd7 100644
> --- a/tests/intel/xe_sysfs_defaults.c
> +++ b/tests/intel/xe_sysfs_defaults.c
> @@ -10,6 +10,7 @@
>   * Sub-category: sysman
>   * Test category: functionality test
>   * SUBTEST: engine-defaults
> + * Description: check if the sysfs engine .defaults node has all values.
>   */
>  
>  #include <dirent.h>
> -- 
> 2.43.0
> 

