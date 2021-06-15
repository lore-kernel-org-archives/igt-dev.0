Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92CE6E221
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 09:03:20 +0000 (UTC)
Date: Tue, 15 Jun 2021 12:05:12 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMhtSFZCpdrKFGqk@platvala-desk.ger.corp.intel.com>
References: <20210614164135.1519746-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614164135.1519746-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, Anson.Jacob@amd.com, seanpaul@chromium.org, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 12:41:34PM -0400, Mark Yacoub wrote:
> Some devices such as amdgpu do not support imported buffers.
> Filter out those devices.
> Tested on Zork with chromeos-kernel-5_4.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_prime.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 8cb2ca2a..480c7eb4 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -249,6 +249,16 @@ static void test_crc(int exporter_fd, int importer_fd)
>  	igt_display_fini(&display);
>  }
>  
> +/* The test attempts to import the buffer object from one device to another.
> + * Filter out devices that aren't capable of doing this.
> + */
> +bool does_device_support_dmabuf_import(int fd) {
> +	/* AMDGPU uses VRAM. Any use of the fb will migrate it to VRAM, which is not sensible for
> +	 * an imported dma-buf.
> +	 */
> +	return !is_amdgpu_device(fd);
> +}

How is real (aka non-IGT) userspace supposed to handle this? Will they
need to check if the device is an AMD device before deciding whether
to import?

What happens in this test without this patch?

+Cc Arek. My initial impression for this is that the kernel should
take care of the idiosyncracies but I'm lacking the big picture.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
