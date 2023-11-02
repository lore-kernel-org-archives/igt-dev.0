Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098FC10E09D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 14:25:07 +0000 (UTC)
Date: Thu, 2 Nov 2023 15:24:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231102142445.7bw5jsvd4rgjrgy2@kamilkon-desk.igk.intel.com>
References: <20231102114256.297063-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231102114256.297063-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] intel/intel_hwmon.c: Fix test
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-11-02 at 12:42:56 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The test documentation is incomplete, causing warnings:
> 
> Warning: igt@intel_hwmon@hwmon-read Category documentation is missing
> Warning: igt@intel_hwmon@hwmon-read Functionality documentation is missing
> Warning: igt@intel_hwmon@hwmon-read Sub-category documentation is missing
> Warning: igt@intel_hwmon@hwmon-write Category documentation is missing
> Warning: igt@intel_hwmon@hwmon-write Functionality documentation is missing
> Warning: igt@intel_hwmon@hwmon-write Sub-category documentation is missing
> 
> Reported-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/intel_hwmon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 1cc9cd399c85..c3e5033d52ff 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -11,7 +11,9 @@
>  /**
>   * TEST: intel hwmon
>   * Description: Tests for intel hwmon
> - * Feature: hwmon
> + * Category: Software Building Block
> + * Sub-category: RAS
> + * Functionality: hwmon
>   * Run type: FULL
>   * Test category: functionality
>   *
> -- 
> 2.41.0
> 

