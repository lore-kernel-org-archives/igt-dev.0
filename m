Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2AC5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 04:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D8110E5FA;
	Mon, 10 Aug 2026 04:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntT7/dks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B043D10E5FA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 04:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786336800; x=1817872800;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=maWNaFzuL41Wr+Yv4GmiLPG1KzUxRA0TyuCUTeO3EH8=;
 b=ntT7/dksN4PVA6ICeB6g9XrXg65VPMTxMtdV0R2cC7pyxFQqw9UrIuvC
 Dlhpu2vN7XFY4oq/aDYj5aLIikapXtFRLGvBEpG85/hQ9/Cvc6LaND45U
 /dJPBUlfAkGg5j4YrcF3LkyUL+BVLsLO7gCjAccOSwJ/dbR26TdFt3P5o
 y33cZKypb/6E9cm+Q3+B47MOwKhFSp9G79W58WFpGikX1AWEmmMKqmgD5
 JC2pjzEvhCchN80T1rpWapYTsV9KUusppaTkEv7/YLxCHPBpqa+3aGTvV
 B9CMGkp/f4JHiDFFu2bkyU1n9DeU3gLhyHe50MH5Zdum/pxaAL0oKIeM4 w==;
X-CSE-ConnectionGUID: ArG3RErNRma7wH2JXRzgWg==
X-CSE-MsgGUID: Cy709mkWT1Og+f9yBsuoCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="112388057"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="112388057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:40:00 -0700
X-CSE-ConnectionGUID: /ndIK6wyQt+jR7z3zkdt4A==
X-CSE-MsgGUID: O0zIyY+CRK++BYkMHOblqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="261192005"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.114.153])
 ([10.66.114.153])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 21:39:57 -0700
Message-ID: <44f7667d-c6cb-411c-90d2-a2bb8b715db7@intel.com>
Date: Mon, 10 Aug 2026 10:09:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/3] lib/i915/i915_dp: add UHBR helpers and
 const-correct set_link_params
To: Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20260805084428.708501-1-sowmiya.s@intel.com>
 <20260805084428.708501-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260805084428.708501-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hello Sowmiya,

On 05-08-2026 14:14, Sowmiya S wrote:
> - const char * for i915_dp_set_link_params() to allow string literals
> - Add i915_dp_is_uhbr_rate(): returns true for link rates >= 10 Gbps
> - Add i915_dp_get_next_lower_rate(): parses force_link_rate debugfs list
>    using strtok_r(), base-10 strtol() with errno/endptr checks
The message is a bare bullet list of what changed, with no "why". For a lib
patch that is fine as far as it goes, but please add a line saying these are
prep for 3/3 - as it stands, 1/3 adds two exported functions with no 
caller in
the tree, and a bisector landing here has no idea they are about to be 
used.

Also, imperative mood for the subject/body is the usual convention here

>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   lib/i915/i915_dp.c | 62 +++++++++++++++++++++++++++++++++++++++++++++-
>   lib/i915/i915_dp.h |  4 ++-
>   2 files changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
> index e54058580..bf66347f5 100644
> --- a/lib/i915/i915_dp.c
> +++ b/lib/i915/i915_dp.c
> @@ -334,7 +334,7 @@ void i915_dp_reset_link_params(int drm_fd, igt_output_t *output)
>    * to set link rate and lane count to auto on exit
>    */
>   void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
> -			     char *link_rate, char *lane_count)
> +			     const char *link_rate, const char *lane_count)
>   {
>   	bool valid;
>   	drmModeConnector *temp;
> @@ -390,3 +390,63 @@ int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output)
>   
>   	return max_rate;
>   }
> +
> +/**
> + * i915_dp_is_uhbr_rate:
> + * @link_rate: DP link rate in 10 kbit/s units, as reported by the
> + *	       i915_dp_*_link_rate debugfs files
> + *
> + * UHBR (Ultra High Bit Rate) link rates use 128b/132b channel encoding,
> + * everything below uses legacy 8b/10b. UHBR10 is 10 Gbps, i.e. 1000000 in
> + * 10 kbit/s units. Mirrors the kernel's drm_dp_is_uhbr_rate().
> + *
> + * Returns: true if @link_rate is a UHBR rate, false otherwise.
> + */
> +bool i915_dp_is_uhbr_rate(int link_rate)
> +{
> +	return link_rate >= 1000000;
> +}
  The magic 1000000 is now spelled out only in the doc block above. A named
  constant next to it would make the body self-documenting and would 
give the
  next test something to print in an error message:

         /* 10 kbit/s units */
         #define I915_DP_UHBR10_LINK_RATE        1000000

  Since this is a one-line predicate on an int, static inline in i915_dp.h
  (which is what I suggested last time) avoids a cross-TU call for a
  comparison. Not important, purely a preference - if you keep it 
out-of-line,
  fine.
> +
> +/**
> + * i915_dp_get_next_lower_rate:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @rate: reference link rate in 10 kbit/s units
> + *
> + * Parses the i915_dp_force_link_rate debugfs list (the source rates, printed
> + * with an "auto" entry and "[..]"/"*" markers) and returns the highest
> + * supported link rate strictly below @rate.
> + *
> + * Returns: highest supported rate below @rate in 10 kbit/s units, or 0 if none.
> + */
> +int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate)
> +{
> +	char buf[512], *token, *saveptr = NULL;
> +	int res, next = 0;
> +
> +	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
> +					      "i915_dp_force_link_rate",
> +					      buf, sizeof(buf));
> +	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
> +		     igt_output_name(output));
> +
> +	/* Delimiters strip the "auto" whitespace and the [ ] * markers. */
> +	for (token = strtok_r(buf, " \t\n[]*", &saveptr); token;
> +	     token = strtok_r(NULL, " \t\n[]*", &saveptr)) {
> +		char *endptr;
> +		long r;
> +
> +		if (!strcmp(token, "auto"))
> +			continue;
> +
> +		errno = 0;
> +		r = strtol(token, &endptr, 10);
> +		if (errno || endptr == token || *endptr)
> +			continue;
> +
> +		if (r < rate && r > next)
> +			next = r;
> +	}
> +
> +	return next;
> +}

this is still the source-rate list, which was point (b) on the v2 posting,
and I do not think it survives contract with the kernel. 
i915_dp_force_link_rate
is written by i915_dp_force_link_rate_write() ->

         static int parse_link_rate(...)
         {
                 ...
                 if (intel_dp_rate_index(intel_dp->source_rates,
intel_dp->num_source_rates,
                                         rate) < 0)
                         ret = -EINVAL;
         }

i.e. the write only validates against source_rates and *succeeds* for a rate
the sink never advertised. It is then consumed by:

         static int forced_link_rate(struct intel_dp_link_caps *link_caps)
         {
                 ...
                 len = intel_dp_common_len_rate_limit(link_caps,
  link_caps->forced_params.rate);
                 if (len == 0)
                         return intel_dp_common_rate(link_caps, 0);

                 return intel_dp_common_rate(link_caps, len - 1);
         }

so the effective pin is silently clamped down to the highest *common*
(source AND sink) rate <= what you wrote. Concretely, on a sink that 
advertises
UHBR20 and UHBR10 but not UHBR13.5 - which is legal, the three UHBR 
rates are
advertised independently - the caller in 3/3 does:

         write 2000000   -> pinned at 2000000, not sustained
         write 1350000   -> silently pinned at 1000000, logs
                            "Link rate 1350000 not sustained (got ...)"
         write 1000000   -> pinned at 1000000 again

so you get one log line naming a rate the hardware was never at, and one
full extra modeset (plus a fresh FB set - see my comment on 3/3) 
re-testing a
configuration that already failed.

intel_dp_allowed_link_configs is the file that gives you source AND sink AND
the current limits, printed as "<lanes>x<rate>". Parsing that instead would
make this function do what its name says.

Minor while you are here: r is a long and next is an int, so "next = r" 
is an
implicit narrowing. Harmless for link rates, but making r an int (or next a
long) keeps -Wconversion-clean builds happy for whoever turns that on.


Thanks and Regards
Kunal Joshi

> diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h
> index b13629147..6b39d0560 100644
> --- a/lib/i915/i915_dp.h
> +++ b/lib/i915/i915_dp.h
> @@ -17,7 +17,9 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output);
>   int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
>   void i915_dp_reset_link_params(int drm_fd, igt_output_t *output);
>   void i915_dp_set_link_params(int drm_fd, igt_output_t *output,
> -			     char *link_rate, char *lane_count);
> +			     const char *link_rate, const char *lane_count);
>   int i915_dp_get_max_supported_rate(int drm_fd, const igt_output_t *output);
> +int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int rate);
> +bool i915_dp_is_uhbr_rate(int link_rate);
>   
>   #endif
