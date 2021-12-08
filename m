Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B876F46B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 11:32:52 +0000 (UTC)
Date: Wed, 8 Dec 2021 13:32:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbCXtrjiSHq9sDTW@platvala-desk.ger.corp.intel.com>
References: <20211208105446.1410270-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208105446.1410270-1-mastanx.katragadda@intel.com>
Subject: Re: [igt-dev] [i-g-t] intel-ci: balcklist
 gem_exec_alignment@pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 04:24:46PM +0530, Mastan Katragadda wrote:
> The reason for this is that it doesn't work with the dma-resv-object locking introduced
> recently in the code,and it's not going to be fixed anytime soon.
> 
> drm/i915: Perform execbuffer object locking as a separate step
> To help avoid evicting already resident buffers from the batch we're
> processing, perform locking as a separate step.
> 
> Link:https://cgit.freedesktop.org/drm-tip/commit/?id=5cd57f676bb946a00275408f0dd0d75dbc466d25
> 
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>

Should the test be deleted instead?


-- 
Petri Latvala


> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index ca361fde..0d307730 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -62,6 +62,7 @@ igt@sysfs_timeslice_duration@off
>  # GEM: Not worth fixing
>  ###############################################
>  igt@gen7_exec_parse@.*lri.*
> +igt@gem_exec_alignment@pi-shared
>  ###############################################
>  # There are no DRRS capable displays in CI lab
>  ###############################################
> -- 
> 2.25.1
> 
