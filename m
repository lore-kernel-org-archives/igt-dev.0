Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20210331091241.2566311-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <876b4758-0240-50b6-5343-5b84f7096f25@linux.intel.com>
Date: Wed, 31 Mar 2021 10:16:16 +0100
MIME-Version: 1.0
In-Reply-To: <20210331091241.2566311-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Document how to use JSON
 output
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
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 31/03/2021 10:12, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Put a note on how to use JSON output into the man page.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/100
> ---
>   man/intel_gpu_top.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index f6d74852558b..94fdc6520fd3 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -81,6 +81,11 @@ Filter types: ::
>       pci      pci:[vendor=%04x/name][,device=%04x][,card=%d]
>                vendor is hex number or vendor name
>   
> +JSON OUTPUT
> +===========
> +
> +To parse the JSON as output by the tool the consumer should wrap its entirety into square brackets ([ ]). This will make each sample point an JSON array element and will avoid "Multiple root elements" JSON validation error.
> +

Or as an alternative we make the tool do this, but it'd need a signal 
handler to print the closing bracket at which point I thought it could 
be a complication too far. Could be convinced either way I guess.

Regards,

Tvrtko

>   LIMITATIONS
>   ===========
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
