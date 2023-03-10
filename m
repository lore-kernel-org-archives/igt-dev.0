Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4907E10E01F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 10:52:23 +0000 (UTC)
Message-ID: <87e775e9-e63a-1011-ad82-3e1e513c11bc@linux.intel.com>
Date: Fri, 10 Mar 2023 11:52:15 +0100
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
 <20230310082326.12088-18-zbigniew.kempczynski@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230310082326.12088-18-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 17/18] xe_mmap: skip VRAM tests if no
 VRAM is found
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


On 3/10/2023 9:23 AM, Zbigniew Kempczyński wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> Instead of producing an error, if there's no VRAM, the test
> should be skipped. There's a logic there that would be doing
> that, except that it doesn't really work :-)
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tests/xe/xe_mmap.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 9dce6adbe2..6b313a1895 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -42,8 +42,7 @@ test_mmap(int fd, uint32_t flags)
>   	uint64_t mmo;
>   	void *map;
>   
> -	if (flags & vram_memory(fd, 0))
> -		igt_require(xe_has_vram(fd));

This check should go to the igt_main instead.


Nirmoy

> +	igt_require_f(flags, "Device doesn't support such memory region\n");
>   
>   	bo = xe_bo_create_flags(fd, 0, 4096, flags);
>   	mmo = xe_bo_mmap_offset(fd, bo);
