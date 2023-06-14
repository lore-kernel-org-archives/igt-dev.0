Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B38610E0F6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:17:19 +0000 (UTC)
Date: Wed, 14 Jun 2023 13:17:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614111715.pqaxqsdkj3bfut66@kamilkon-desk1>
References: <20230614094026.1292703-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230614094026.1292703-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci/xe: Unblock unbind
 rebind test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2023-06-14 at 15:10:26 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Unblock core unbind-rebind test
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 6009b70b..d086f5fe 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -30,7 +30,7 @@ igt@kms_selftest.*
>  ##################################################################
>  # Exclude all other non-Xe tests
>  ##################################################################
> -igt@core.*
> +^igt@core_(?!hotunplug@unbind-rebind).*
-- ^
You do not need to put start of line marker.
With that fixed,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  igt@debugfs.*
>  igt@device_reset
>  igt@drm_fdinfo
> -- 
> 2.25.1
> 
