Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608E56E0D1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 11:23:14 +0000 (UTC)
Date: Mon, 18 Oct 2021 14:21:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YW1Yvg8GsFcHzwfu@platvala-desk.ger.corp.intel.com>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
 <20211015203238.133163-2-casey.g.bowman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015203238.133163-2-casey.g.bowman@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Alter arm64 cross compile
 pkg-config library selections
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Casey Bowman <casey.g.bowman@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 15, 2021 at 01:32:37PM -0700, Casey Bowman wrote:
> Specifies to use 'aarch64-linux-gnu-pkg-config' as the
> pkg-config binary to use, as the normal /usr/bin/pkg-config
> binary will be used on a host system. If we use this binary
> we will observe that the shared object libraries will be
> pulled from the x86_64 libraries instead of the aarch64 ones.

PKG_CONFIG_PATH can also be set accordingly, as is done in
.gitlab-ci.yml

> 
> We also specify nouveau here as our libdrm driver library
> because there is no support for libdrm-intel on arm64 yet.

Why the automatic option doesn't work here? There's no reason to
limit/enforce everyone to libdrm-nouveau, and only libdrm-nouveau.


-- 
Petri Latvala


> 
> Signed-off-by: Casey Bowman <casey.g.bowman@intel.com>
> ---
>  meson-cross-arm64.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meson-cross-arm64.txt b/meson-cross-arm64.txt
> index d96f180e2..6f69e3f69 100644
> --- a/meson-cross-arm64.txt
> +++ b/meson-cross-arm64.txt
> @@ -2,7 +2,7 @@
>  c = '/usr/bin/aarch64-linux-gnu-gcc'
>  ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
>  strip = '/usr/bin/aarch64-linux-gnu-strip'
> -pkgconfig = 'pkg-config'
> +pkgconfig = 'aarch64-linux-gnu-pkg-config'
>  exe_wrapper = 'qemu-aarch64'
>  
>  [host_machine]
> @@ -10,3 +10,6 @@ system = 'linux'
>  cpu_family = 'aarch64'
>  cpu = 'aarch64'
>  endian = 'little'
> +
> +[project options]
> +libdrm_drivers = 'nouveau'
> -- 
> 2.25.1
> 
