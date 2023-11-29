Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6310E61A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 15:39:40 +0000 (UTC)
Date: Wed, 29 Nov 2023 16:39:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231129153936.arw2luufjpmovcgu@kamilkon-desk.igk.intel.com>
References: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
 <20231129123221.98948-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129123221.98948-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] igt_doc: Add driver name list at
 JSON configuration
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
On 2023-11-29 at 13:25:34 +0100, Mauro Carvalho Chehab wrote:

subject is still wrong: 

[PATCH i-g-t 1/3] igt_doc: Add driver name list at JSON configuration

imho should be:

[PATCH i-g-t 1/3] scripts/test_list: Add driver name list at configuration

With that fixed you can add my r-b.

Regards,
Kamil

> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Add an optional field at JSON configuration to allow specifying
> driver name(s).
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/test_list.py | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/test_list.py b/scripts/test_list.py
> index 3954e883ada3..7e0e45ca3732 100644
> --- a/scripts/test_list.py
> +++ b/scripts/test_list.py
> @@ -289,6 +289,11 @@ class TestList:
>              cfg_path = "./"
>              driver_name = main_name
>  
> +        if "drivers" in self.config:
> +            self.drivers = self.config["drivers"]
> +        else:
> +            self.drivers = [driver_name]
> +
>          if sources_path:
>              cfg_path = os.path.realpath(sources_path) + "/"
>  
> -- 
> 2.42.0
> 

