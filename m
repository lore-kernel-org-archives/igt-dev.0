Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E4910E265
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 19:15:26 +0000 (UTC)
Date: Mon, 15 May 2023 21:15:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230515191522.hfbqhgpd2uer6zzm@kamilkon-desk1>
References: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230515143923.1545926-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] meson.build: update minimal version to
 0.48
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-05-15 at 16:39:23 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> changeset 8ac9440e7bec ("meson: add an option to control Xe test builds")
> require updating a dict with values from another dict. This seems
> to be supported only on version 0.48 or above.

I agree but this should wait until we update image fedora-oldest-meson
to have new meson 0.48 binary. Btw as you pointed out,
Debian buster LTS uses 0.49.2 so maybe we should use that ?

Btw maybe we should ask community if anyone is using this old
meson for building igt ? +cc Petri

> 
> So, update meson minimal version.
- ^^^
Please try to avoid starting sentence with "So" word, just:

Updated meson minimal version from 0.47.2 to 0.48

Regards,
Kamil

> 
> Fixes: 8ac9440e7bec ("meson: add an option to control Xe test builds")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 1c872cc9cb02..a1f646ee9239 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
>            'buildtype=debugoptimized',
>          ],
>  	license : 'MIT',
> -	meson_version : '>=0.47.2')
> +	meson_version : '>=0.48')
>  
>  if get_option('b_ndebug') != 'false'
>  	error('Building without -Db_ndebug=false is not supported')
> -- 
> 2.40.1
> 

