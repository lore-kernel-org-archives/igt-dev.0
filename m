Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A717C89823
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 12:09:25 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200331115313.82148-1-lionel.g.landwerlin@intel.com>
References: <20200331115313.82148-1-lionel.g.landwerlin@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158565656174.18289.8088590257093001034@build.alporthouse.com>
Date: Tue, 31 Mar 2020 13:09:21 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/perf: add tests for multi
 context filtering
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-03-31 12:53:13)
> +       /* Missing DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY. */
> +       {
> +               uint32_t context_ids[] = {
> +                       0,
> +                       0,
> +               };
> +               uint64_t properties[] = {
> +                       /* Note: we have to specify at least one sample property even
> +                        * though we aren't interested in samples in this case
> +                        */
> +                       DRM_I915_PERF_PROP_SAMPLE_OA, true,
> +
> +                       /* OA unit configuration */
> +                       DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> +                       DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +
> +                       /* Note: no OA exponent specified in this case */
> +
> +                       DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, ARRAY_SIZE(context_ids),
> +               };
> +               struct drm_i915_perf_open_param param = {
> +                       .flags = I915_PERF_FLAG_FD_CLOEXEC,
> +                       .num_properties = sizeof(properties) / 16,
> +                       .properties_ptr = to_user_pointer(properties),
> +               };
> +
> +               do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EFAULT);
> +       }
> +}

Also
(CTX_HANDLE_ARRAY = -1, CTX_HANDLE_ARRAY_LENGTH = 4)
(CTX_HANDLE_ARRAY = &context_ids[], !IS_ALIGNED(CTX_HANDLE_ARRAY_LENGTH, 4))
(CTX_HANDLE_ARRAY = &context_ids[], CTX_HANDLE_ARRAY_LENGTH = -4)

I'll take it as a given that passing unmapped pointers doesn't work :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
