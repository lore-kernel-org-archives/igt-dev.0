Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650110E5A9
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:08:29 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:08:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230906090819.boig554cyoiadcus@kamilkon-desk.igk.intel.com>
References: <20230905165033.187749-1-mauro.chehab@linux.intel.com>
 <20230905165033.187749-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230905165033.187749-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [RFC 1/3] xe_test_config.json: add testlists and
 blacklists
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

in Subject: xe_test_config.json: add testlists and blacklists
---------------------------------------------------- ^
s/blacklists/blocklists/

Regards,
Kamil

On 2023-09-05 at 18:48:28 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Specify the testlists and blacklists to be used to store CI
> run type.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel/xe_test_config.json | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 8fb65d02d840..27e3f273fb2a 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -32,6 +32,13 @@
>                          "_properties_": {
>                              "mandatory": true,
>                              "description": "Defines what category of testlist it belongs",
> +                            "testlists": {
> +                                "BAT": "../intel-ci/xe-fast-feedback.testlist",
> +                                "BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist"
> +                            },
> +                            "blocklists": {
> +                                "__all__": "../intel-ci/xe.blocklist.txt"
> +                            },
>                              "order": [
>                                  "boot",
>                                  "__all__",
> -- 
> 2.41.0
> 

