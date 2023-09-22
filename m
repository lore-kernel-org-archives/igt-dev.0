Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EE610E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 08:55:23 +0000 (UTC)
Date: Fri, 22 Sep 2023 10:55:19 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <20230922085519.abindt54hlvczlv5@zkempczy-mobl2>
References: <20230920204632.730526-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920204632.730526-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_compute: Fix Incorrect array
 size for XEHPC platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 02:16:32AM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Correct the STATE_BASE_ADDRESS Instruction data size.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_compute.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 4f6716d23..0c30f39c1 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1030,7 +1030,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  			       unsigned int size)
>  {
>  #define XEHPC_BO_DICT_ENTRIES 6
> -	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
> +	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {

Eh, copy paste issue. Thanks for spotting this. Luckily for me
XEHP_BO_DICT_ENTRIES >= XEHP_BO_DICT_ENTRIES so nothing wrong happened.

Go ahead and merge:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
>  		  .name = "instr state base"},
>  		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> -- 
> 2.25.1
> 
