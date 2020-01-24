Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0A272BE3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 22:54:09 +0000 (UTC)
References: <20200124211819.1796-1-vinay.belgaumkar@intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <abc1e800-c85a-37d1-b5bd-5a3fc23bd869@intel.com>
Date: Fri, 24 Jan 2020 14:54:09 -0800
MIME-Version: 1.0
In-Reply-To: <20200124211819.1796-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH-i-g-t] tests/i915/gem_mmap_wc: Skip gtt test
 if aperture is missing
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
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 24/01/20 13:18, Vinay Belgaumkar wrote:
> Skip subtest on platforms that do not have mappable aperture.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/i915/gem_mmap_wc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
> index 375a9b50..d1f023d3 100644
> --- a/tests/i915/gem_mmap_wc.c
> +++ b/tests/i915/gem_mmap_wc.c
> @@ -599,8 +599,10 @@ igt_main
>   		test_write_cpu_read_wc(fd, 1);
>   	igt_subtest("write-cpu-read-wc-unflushed")
>   		test_write_cpu_read_wc(fd, 0);
> -	igt_subtest("write-gtt-read-wc")
> +	igt_subtest("write-gtt-read-wc") {
> +		gem_require_mappable_ggtt(fd);
>   		test_write_gtt_read_wc(fd);
> +	}

"write-gtt" needs some love as well (Even tough it is not doing what it 
should right now).

Antonio

>   	igt_subtest("pf-nonblock")
>   		test_pf_nonblock(fd);
>   	igt_subtest("set-cache-level")
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
