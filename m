Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67FA10E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 10:31:10 +0000 (UTC)
Message-ID: <31975c2c-3605-78d2-50a6-9cd7950c38c8@intel.com>
Date: Wed, 21 Jun 2023 12:30:32 +0200
MIME-Version: 1.0
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230621090032.611560-1-swati2.sharma@intel.com>
 <20230621090032.611560-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230621090032.611560-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] i915/kms_mmap_write_crc: Free the
 mmap and dma-buf fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 21.06.2023 11:00, Swati Sharma wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> Release the dma-buf fd (held also by the mmap) after testing so
> that we can check for kernel resource leaks at exit.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index bc51975f..87f51153 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -165,6 +165,9 @@ static void test(data_t *data)
>   	/* check that the crc is as expected, which requires that caches got flushed */
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&crc, &data->ref_crc);
> +
> +	munmap(ptr, fb->size);
> +	close(dma_buf_fd);

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   }
>   
>   static void prepare_crtc(data_t *data)
