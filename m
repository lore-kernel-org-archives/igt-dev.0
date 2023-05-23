Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F17510E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:45:42 +0000 (UTC)
Date: Tue, 23 May 2023 08:45:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230523084536.5715692b@maurocar-mobl2>
In-Reply-To: <20230523063243.669540-6-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
 <20230523063243.669540-6-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 05/82] testplan/kms: Add support to
 differentiate b/w drivers
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

On Tue, 23 May 2023 12:01:26 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Add support to differentiate the subtests based on the driver
> support, since many kms tests supports both i915 & xe drivers.
> 
> Add a new field "Driver requirement" to test_config.json
> 
> Example:
> - Driver requirement: i915 (i915 specific test)
> - Driver requirement: xe   (xe specific test)
> - Driver requirement: any  (tests supports both i915 & xe)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/kms_test_config.json | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> index b81b3ba55..e563bbd12 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/kms_test_config.json
> @@ -22,6 +22,11 @@
>                  "description": "Defines what category of testlist it belongs"
>              }
>          },
> +        "Driver requirement": {
> +            "_properties_": {
> +                "description": "Describes any Driver specific requrirement, like i915/xe."
> +            }
> +        },
>          "Test category": {
>              "_properties_": {
>                  "description": "Defines the test category. Usually used at subtest level."
