Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6F310E2A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 09:33:21 +0000 (UTC)
Date: Mon, 16 Jan 2023 11:29:58 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Y8UZFleQmhS4yveA@platvala-desk.ger.corp.intel.com>
References: <20230113192553.89460-1-zbigniew.kempczynski@intel.com>
 <20230113192553.89460-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230113192553.89460-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_crc: Remove crc32 table
 from common section
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

On Fri, Jan 13, 2023 at 08:25:52PM +0100, Zbigniew Kempczyński wrote:
> I've incidentally put crc32 table definition to the header file
> instead of exporting it via extern keyword. Remove this symbol
> from common section to be C89 conformant.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/126

Thanks, I was just about to send this same patch.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_crc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_crc.h b/lib/igt_crc.h
> index 5c0b934ea5..bd36cb61d1 100644
> --- a/lib/igt_crc.h
> +++ b/lib/igt_crc.h
> @@ -24,7 +24,7 @@
>   * All crc tables are globals to allow direct in-code use.
>   */
>  
> -const uint32_t igt_crc32_tab[256];
> +extern const uint32_t igt_crc32_tab[256];
>  
>  uint32_t igt_cpu_crc32(const void *buf, size_t size);
>  
> -- 
> 2.34.1
> 
