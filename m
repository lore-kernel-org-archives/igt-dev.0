Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840A76F45A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 08:52:06 +0000 (UTC)
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-8-alan.previn.teres.alexis@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <c9378366-acf3-6dd2-cfbd-371751ef70d8@intel.com>
Date: Thu, 3 Jun 2021 10:52:00 +0200
MIME-Version: 1.0
In-Reply-To: <20210518103344.2264397-8-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 07/17] Add MI_SET_APPID instruction
 definition
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 18.05.2021 12:33, Alan Previn wrote:
> Add MI_SET_APPID instruction and param definitions
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  lib/intel_reg.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index ac1fc6cb..46b5da20 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2546,6 +2546,15 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
>  #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
>  
> +#define MI_SET_APPID                    (0x0E << 23)
> +#define APPID_CTXSAVE_INHIBIT           (1 << 8)
> +#define APPID_CTXREST_INHIBIT           (1 << 9)
> +#define DISPLAY_APPTYPE                 (0)
> +#define TRANSCODE_APPTYPE               (1)
> +#define APPTYPE(n)                      (n << 7)
> +#define APPID(n)                        (n & 0x7f)

macro params shall be wrapped by ()

#define APPTYPE(n)                      ((n) << 7)
#define APPID(n)                        ((n) & 0x7f)

> +
> +
>  /* Dword 0 */
>  #define MI_VERTEX_BUFFER		(0x17<<23)
>  #define MI_VERTEX_BUFFER_IDX(x)		(x<<20)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
