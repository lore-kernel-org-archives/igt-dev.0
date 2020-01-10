Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A4C6E9D7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 11:15:09 +0000 (UTC)
Date: Fri, 10 Jan 2020 13:15:05 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200110111505.c4pdmjswlfzqgazz@ahiler-desk1.fi.intel.com>
References: <20191217112746.1172-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217112746.1172-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] intel-ci: Blacklist panfrost tests
 from shards
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

On Tue, Dec 17, 2019 at 01:27:46PM +0200, Petri Latvala wrote:
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>

Acked-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

> ---
>  tests/intel-ci/blacklist.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index a48163c6..092a673d 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -91,6 +91,10 @@ igt@vc4_.*
>  ###############################################
>  igt@amdgpu/.*
>  ###############################################
> +# Panfrost
> +###############################################
> +igt@panfrost_.*
> +###############################################
>  # Hibernate: not configured correctly on CI
>  ###############################################
>  igt@.*@.*-hibernate
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
