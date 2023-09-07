Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFEF10E7CC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 12:42:29 +0000 (UTC)
Date: Thu, 7 Sep 2023 14:42:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230907124206.vdmufbldwjgecuxc@kamilkon-desk.igk.intel.com>
References: <20230907101852.522819-1-mauro.chehab@linux.intel.com>
 <20230907101852.522819-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230907101852.522819-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/7] kms_test_config.json: add
 testlists and blocklists
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
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-09-07 at 12:17:34 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Specify the testlists and blocklists to be used to store CI
> run type.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_test_config.json | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 4130b7d6dae0..7ab288685677 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -21,7 +21,19 @@
>              },
>              "Run type": {
>                  "_properties_": {
> -                    "description": "Defines what category of testlist it belongs"
> +                    "description": "Defines what category of testlist it belongs",
> +                    "testlists": {
> +                        "i915 BAT": "../intel-ci/fast-feedback.testlist",
> +                        "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist",
> +                        "i915 chamelium": "../intel-ci/chamelium-only.testlist",
> +
> +                        "Xe BAT": "../intel-ci/xe-fast-feedback.testlist",
> +                        "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist"
> +                    },
> +                    "blocklists": {
> +                        "i915 BAT, i915 BAT chamelium, i915 chamelium": "../intel-ci/blacklist.txt",
> +                        "Xe BAT, Xe BAT chamelium": "../intel-ci/xe.blocklist.txt"
> +                    }
>                  }
>              }
>          },
> -- 
> 2.41.0
> 

