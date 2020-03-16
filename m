Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A6D6E395
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 09:05:54 +0000 (UTC)
Date: Mon, 16 Mar 2020 11:05:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200316090551.GC9497@platvala-desk.ger.corp.intel.com>
References: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313152911.580802-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/intel-ci/blacklist: Blacklist
 kms_chamelium@hdmi-*-planes-random
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 05:29:10PM +0200, Arkadiusz Hiler wrote:
> Tends to generate invalid configurations using CCS planes or
> configurations that exceed HW capabilities resulting in sporadic failure
> with -EINVAL.
> 
> Maintaining extra constraints for Intel's HW is too costly in comparison
> to the value provided.
> 
> Seems like the test is used by other vendors, so unless they are fine
> with removal we'll keep it. In the meantime let's blacklist it for our
> CI.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1404
> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/239
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Martin Peres <martin.peres@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/intel-ci/blacklist.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 8085719f..a7bd1e68 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -69,6 +69,17 @@ igt@gen7_exec_parse@.*lri.*
>  ###############################################
>  igt@kms_frontbuffer_tracking@.*drrs.*
>  ###############################################
> +# Tends to generate invalid configurations
> +# using CCS planes or configurations that
> +# exceed HW capabilities resulting in sporadic
> +# failure with -EINVAL.
> +#
> +# Maintaining extra constraints for Intel's HW
> +# is too costly in comparison to the value
> +# provided.
> +###############################################
> +igt@kms_chamelium@hdmi-.*-planes-random
> +###############################################
>  # Broadcom
>  ###############################################
>  igt@vc4_.*
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
