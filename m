Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7B989FA5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 11:39:30 +0000 (UTC)
References: <20210922074308.35769-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <b6f994ab-3a4e-de45-42da-a9f355409e9c@intel.com>
Date: Mon, 27 Sep 2021 17:09:17 +0530
In-Reply-To: <20210922074308.35769-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Handle memory
 allocation failures for CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/22/2021 1:13 PM, Bhanuprakash Modem wrote:
> Throw assert if failed to allocate memory for pipe crc.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_debugfs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 2f58519a2..a5bb95ca3 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -688,6 +688,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>   	igt_assert(debugfs != -1);
>   
>   	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
> +	igt_assert(pipe_crc);
>   
>   	sprintf(buf, "crtc-%d/crc/control", pipe);
>   	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);

