Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEB110E299
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 07:16:59 +0000 (UTC)
Date: Tue, 4 Jul 2023 09:16:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230704091630.7db59243@maurocar-mobl2>
In-Reply-To: <20230626160106.2632928-4-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
 <20230626160106.2632928-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V3 i-g-t 3/4] testplan/i915: Exclude non-i915 tests
 from i915 testplan
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

On Mon, 26 Jun 2023 21:31:05 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Using wildcards in testplan configs, and keeping other configs
> (Xe & kms) in same dir may leads to the problem. Hence, exclude
> non-i915 tests from i915 testplan.

LGTM. Still, it needs to be applied before patch 1/4.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/i915_test_config.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index 83317e65d..dda29bf9c 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -10,7 +10,8 @@
>                 "../dumb_buffer.c", "../prime_vgem.c", "../sw_sync.c",
>                 "../syncobj_basic.c", "../syncobj_timeline.c", "../syncobj_wait.c",
>                 "../vgem_basic.c", "../vgem_slow.c" ],
> -    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c" ],
> +    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
> +                       "xe_*" ],
>      "fields": {
>  	"Mega feature": {
>                  "_properties_": {
