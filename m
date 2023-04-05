Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652AF10E87C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 08:31:45 +0000 (UTC)
Message-ID: <8917ac42-3882-9e1b-eba0-a1c3abf9a507@linux.intel.com>
Date: Wed, 5 Apr 2023 09:31:41 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230405000909.51175-1-umesh.nerlige.ramappa@intel.com>
 <20230405000909.51175-3-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230405000909.51175-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/drm_fdinfo: Drop active
 busyness tests for GuC backend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 05/04/2023 01:09, Umesh Nerlige Ramappa wrote:
> With GuC scheduling backends, the context busyness for an active context is
> obtained from the GuC FW. The support for this is WIP, so disable tests that
> check TEST_BUSY until the feature is implemented.
> 
> v2: Drop fixture (Tvrtko)
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/i915/drm_fdinfo.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
> index 65b8b830..1b124755 100644
> --- a/tests/i915/drm_fdinfo.c
> +++ b/tests/i915/drm_fdinfo.c
> @@ -197,6 +197,9 @@ single(int gem_fd, const intel_ctx_t *ctx,
>   	int spin_fd;
>   	uint64_t ahnd;
>   
> +	if (flags & TEST_BUSY)
> +		igt_require(!gem_using_guc_submission(gem_fd));
> +
>   	if (flags & TEST_ISOLATION) {
>   		spin_fd = gem_reopen_driver(gem_fd);
>   		ctx = intel_ctx_create_all_physical(spin_fd);
> @@ -287,6 +290,8 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	igt_spin_t *spin;
>   	unsigned int i;
>   
> +	igt_require(!gem_using_guc_submission(gem_fd));
> +
>   	memset(tval, 0, sizeof(tval));
>   
>   	spin = spin_sync(gem_fd, ahnd, ctx, e);
> @@ -346,6 +351,8 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	uint64_t val[16];
>   	unsigned int i;
>   
> +	igt_require(!gem_using_guc_submission(gem_fd));
> +
>   	memset(busy_class, 0, sizeof(busy_class));
>   	memset(tval, 0, sizeof(tval));
>   
> @@ -404,6 +411,8 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
>   	uint64_t val[16];
>   	unsigned int i;
>   
> +	igt_require(!gem_using_guc_submission(gem_fd));
> +
>   	memset(busy_class, 0, sizeof(busy_class));
>   	memset(tval, 0, sizeof(tval));
>   
> @@ -525,6 +534,9 @@ virtual(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   {
>   	intel_ctx_cfg_t cfg = {};
>   
> +	if (flags & TEST_BUSY)
> +		igt_require(!gem_using_guc_submission(i915));
> +
>   	cfg.vm = gem_vm_create(i915);
>   
>   	for (int class = 0; class < 32; class++) {
> @@ -624,6 +636,8 @@ virtual_all(int i915, const intel_ctx_cfg_t *base_cfg, unsigned int flags)
>   	const unsigned int num_engines = base_cfg->num_engines;
>   	intel_ctx_cfg_t cfg = {};
>   
> +	igt_require(!gem_using_guc_submission(i915));
> +
>   	cfg.vm = gem_vm_create(i915);
>   
>   	for (int class = 0; class < 32; class++) {

This looks fine to me.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
