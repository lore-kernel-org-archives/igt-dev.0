Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA736E9C4
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 11:14:54 +0000 (UTC)
Date: Fri, 10 Jan 2020 13:14:51 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200110111451.tjzcatw4bf5yor6i@ahiler-desk1.fi.intel.com>
References: <20191217113017.2595-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217113017.2595-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] intel-ci: Blacklist v3d tests from
 shards
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 01:30:17PM +0200, Petri Latvala wrote:
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>

Acked-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index a48163c6..9bd1b396 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -86,6 +86,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>  # Broadcom
>  ###############################################
>  igt@vc4_.*
> +igt@v3d_.*
>  ###############################################
>  # AMD
>  ###############################################
> -- 
> 2.19.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
