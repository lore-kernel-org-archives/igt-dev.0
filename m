Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE96110E45F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 07:10:54 +0000 (UTC)
Date: Mon, 13 Mar 2023 08:10:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313071050.pxkj2fjkicwx632v@zkempczy-mobl2>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
 <20230310194125.14781-20-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310194125.14781-20-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 19/19] scripts/igt_doc.py: set
 have_implemented when --files is used
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 08:41:25PM +0100, Zbigniew Kempczyński wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Without that, the option won't work:
> 
> 	$ ../../scripts/igt_doc.py  --config xe_test_config.json   --files xe_compute.c
> 	$ Need file names to be processed
> 
> Reported-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index f1b6d64615..67ab7984dd 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -293,6 +293,10 @@ class TestList:
>                      for fname in glob.glob(cfg_file):
>                          self.filenames.append(fname)
>                          has_implemented = True
> +            else:
> +                for cfg_file in self.filenames:
> +                    if cfg_file:
> +                        has_implemented = True
>  
>              has_planned = False
>              if include_plan and "planning_files" in self.config:
> -- 
> 2.34.1
>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
