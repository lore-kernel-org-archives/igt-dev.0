Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6E16E1B8
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Feb 2021 10:07:04 +0000 (UTC)
References: <20210227144900.3961632-1-richard.purdie@linuxfoundation.org>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <4b0ea6a7-92a7-566a-ce32-f8548eb87092@mupuf.org>
Date: Sun, 28 Feb 2021 12:06:42 +0200
MIME-Version: 1.0
In-Reply-To: <20210227144900.3961632-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Allow source location to be
 configurable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 27/02/2021 16:49, Richard Purdie wrote:
> Hardcoding a build source path into a binary when cross compiling isn't
> appropriate and breaks build reproducibility. Allow the srcdir to be
> specified by an optional configuration option to meson.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   lib/meson.build   | 6 +++++-
>   meson_options.txt | 4 ++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 114eadde..672b4206 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -125,7 +125,11 @@ if chamelium.found()
>   	lib_sources += 'igt_chamelium_stream.c'
>   endif
>   
> -srcdir = join_paths(meson.source_root(), 'tests')
> +if get_option('srcdir') != ''
> +    srcdir = join_paths(get_option('srcdir'), 'tests')
> +else
> +    srcdir = join_paths(meson.source_root(), 'tests')
> +endif
>   
>   lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>   		      fallback : 'NO-GIT',
> diff --git a/meson_options.txt b/meson_options.txt
> index ff3abf08..a0a1aaed 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -50,3 +50,7 @@ option('use_rpath',
>          type : 'boolean',
>          value : false,
>          description : 'Set runpath on installed executables for libigt.so')
> +
> +option('srcdir',
> +       type : 'string',
> +       description : 'Path to source code to be compiled into binaries (optional)')

Shouldn't this read: "Path to THE source code to be compiled 
(optional)"? Compiling into binaries is a little redundant, so I would 
drop it.

Other than this, the rationale seems sane, but I am not 
knowledgeable-enough about IGT's build system to comment more on it:

Acked-by: Martin Peres <martin.peres@mupuf.org>

> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
