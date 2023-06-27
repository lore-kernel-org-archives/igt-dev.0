Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA4110E010
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 15:25:35 +0000 (UTC)
Date: Tue, 27 Jun 2023 17:25:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230627152531.mpec5yqkr33aztbd@zkempczy-mobl2>
References: <20230627105348.1980061-1-katarzyna.dec@intel.com>
 <20230627105348.1980061-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627105348.1980061-2-katarzyna.dec@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Add
 xe_waitfence@abstime test to f-f
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

On Tue, Jun 27, 2023 at 10:53:48AM +0000, Katarzyna Dec wrote:
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a956e10e0..d35e82d75 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -223,6 +223,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
>  igt@xe_vm@munmap-style-unbind-userptr-front
>  igt@xe_vm@munmap-style-unbind-userptr-inval-end
>  igt@xe_vm@munmap-style-unbind-userptr-inval-front
> +igt@xe_waitfence@abstime
>  igt@xe_waitfence@reltime
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> -- 
> 2.34.1
> 
