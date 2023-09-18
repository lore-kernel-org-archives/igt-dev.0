Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB4C10E228
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 09:03:06 +0000 (UTC)
Message-ID: <c97fafe2-07e0-9c8d-bb7d-448bbcc78a6c@intel.com>
Date: Mon, 18 Sep 2023 11:01:46 +0200
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
 <20230915051617.9361-3-sai.gowtham.ch@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230915051617.9361-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/intel_reg: Add copy commands in
 the lib
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
> Add memory copy and set commands to the lib.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   lib/intel_reg.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index 3bf3676dc..322aec9fd 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2564,6 +2564,10 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   
>   #define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
>   
> +/* RAW memory commands */
> +#define MEM_COPY_CMD                    ((0x2 << 29)|(0x5a << 22)|0x8)
> +#define MEM_SET_CMD                     ((0x2 << 29)|(0x5b << 22)|0x5)
> +

This is inserted in the middle of BLT commands and their arguments. 
Could you move it so it's either before the BLT block or after 
XY_FAST_COPY_COLOR_DEPTH_128?

Many thanks,
Karolina

>   #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>   /* dword 0 */
>   #define   XY_FAST_COPY_SRC_TILING_LINEAR		(0 << 20)
