Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E30F10E7CC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 12:39:41 +0000 (UTC)
Date: Thu, 7 Sep 2023 14:39:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230907123936.mrp7o34h4pcxh76g@kamilkon-desk.igk.intel.com>
References: <20230907101852.522819-1-mauro.chehab@linux.intel.com>
 <20230907101852.522819-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230907101852.522819-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/7] xe_test_config.json: add
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
On 2023-09-07 at 12:17:33 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Specify the testlists and blocklists to be used to store CI
> run type.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_test_config.json | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 8fb65d02d840..408afcbb03bc 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -32,6 +32,12 @@
>                          "_properties_": {
>                              "mandatory": true,
>                              "description": "Defines what category of testlist it belongs",
> +                            "testlists": {
> +                                "Xe BAT": "../intel-ci/xe-fast-feedback.testlist"
> +                            },
> +                            "blocklists": {
> +                                "Xe BAT": "../intel-ci/xe.blocklist.txt"
> +                            },
>                              "order": [
>                                  "boot",
>                                  "__all__",
> -- 
> 2.41.0
> 

