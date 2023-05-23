Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1B510E3DD
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:45:16 +0000 (UTC)
Date: Tue, 23 May 2023 08:45:11 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230523084511.6b80275f@maurocar-mobl2>
In-Reply-To: <20230523063243.669540-5-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
 <20230523063243.669540-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 04/82] testplan/kms: Include testdisplay to
 kms testplan config
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

On Tue, 23 May 2023 12:01:25 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> As testdisplay.c is belongs to display, add it to the kms
> testplan config.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
> index d2d6357d1..b81b3ba55 100644
> --- a/tests/kms_test_config.json
> +++ b/tests/kms_test_config.json
> @@ -1,6 +1,6 @@
>  {
>      "description": "JSON file to be used to parse KMS documentation",
> -    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
> +    "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c", "testdisplay.c" ],
>      "fields": {
>          "Category": {
>              "_properties_": {
