Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <158170587922.15393.4799274587942949539@skylake-alporthouse-com>
References: <20200213192606.63025-1-dale.b.stimson@intel.com>
 <9d522af3-470d-52f2-51e1-fef2ffdcfaa8@intel.com>
 <158170587922.15393.4799274587942949539@skylake-alporthouse-com>
Message-ID: <158170648335.15393.7332630257064965325@skylake-alporthouse-com>
Date: Fri, 14 Feb 2020 18:54:43 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/gem_engine_topology.c -
 intel_get_current_engine invalid result
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Dale B Stimson <dale.b.stimson@intel.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

+static void libapi(int i915)
+{
+       I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 0);
+       struct drm_i915_gem_context_param p = {
+               .ctx_id = gem_context_create(i915),
+               .param = I915_CONTEXT_PARAM_ENGINES,
+               .value = to_user_pointer(&engines),
+               .size = sizeof(engines),
+       };
+       const struct intel_execution_engine2 *e;
+       unsigned int count = 0;
+
+       gem_context_set_param(i915, &p);
+
+       for_each_context_engine(i915, p.ctx_id, e)
+               count++;
+       igt_assert_eq(count, 0);
+
+       ____for_each_physical_engine(i915, p.ctx_id, e)
+               count++;
+       igt_assert_eq(count, 0);
+
+       gem_context_destroy(i915, p.ctx_id);
+}

I leave find a home and correcting the whitespace to the reader.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
