Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C662F10E083
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 08:54:25 +0000 (UTC)
Message-ID: <645b5246-2b22-e09f-06c8-ea90129d8249@intel.com>
Date: Mon, 18 Sep 2023 10:54:14 +0200
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
 <20230915051617.9361-2-sai.gowtham.ch@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230915051617.9361-2-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/intel_cmds_info: Add copy
 commands to blt_cmd_type
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

On 15.09.2023 07:16, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy commands to blt_cmd_type which is used latter,
> to check it they are supported by fd.

Hm, I'm slightly confused. I thought you'll merge this one with the "Add 
check to see if blt commands are supported by the platforms." patch.

This would count as one logical change, now it's mixed up a bit.

All the best,
Karolina

> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   lib/intel_cmds_info.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 91d0f15ec..ec8312d56 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -20,6 +20,8 @@ enum blt_tiling_type {
>   
>   enum blt_cmd_type {
>   	SRC_COPY,
> +	MEM_SET,
> +	MEM_COPY,
>   	XY_SRC_COPY,
>   	XY_FAST_COPY,
>   	XY_BLOCK_COPY,
