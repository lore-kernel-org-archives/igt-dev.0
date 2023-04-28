Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0510ED00
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 12:06:16 +0000 (UTC)
Date: Fri, 28 Apr 2023 14:06:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230428120612.c6ixanhlchjzfcsj@kamilkon-desk1>
References: <20230426062248.3110901-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230426062248.3110901-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 eviction tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: janga.rahul.kumar@intel.com, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

I just spotted some problems, see below.

On 2023-04-26 at 11:52:48 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add VRAM eviction tests.
> 
> CC: Katarzyna Dec <katarzyna.dec@intel.com>
-- ^
Cc:

> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 987e72ef..7c052a78 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -140,6 +140,17 @@ igt@xe_vm@munmap-style-unbind-userptr-front
>  igt@xe_vm@munmap-style-unbind-userptr-inval-end
>  igt@xe_vm@munmap-style-unbind-userptr-inval-front
>  igt@xe_waitfence@test
> +igt@xe_evict@evict-small

These should be in alphabetical order, please correct and
resend, you can keep my a-b tag.

Regards,
Kamil

> +igt@xe_evict@evict-small-external
> +igt@xe_evict@evict-small-multi-vm
> +igt@xe_evict@evict-beng-small
> +igt@xe_evict@evict-beng-small-external
> +igt@xe_evict@evict-beng-small-multi-vm
> +igt@xe_evict@evict-small-cm
> +igt@xe_evict@evict-small-external-cm
> +igt@xe_evict@evict-small-multi-vm-cm
> +igt@xe_evict@evict-beng-small-cm
> +igt@xe_evict@evict-beng-small-external-cm
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
>  igt@kms_addfb_basic@bad-pitch-0
> -- 
> 2.25.1
> 
