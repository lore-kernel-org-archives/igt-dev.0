Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9732E10F2B6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 07:52:15 +0000 (UTC)
Message-ID: <3d686117da6cd248176f470db76c857d918d24b0.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 07 Feb 2022 08:52:11 +0100
In-Reply-To: <20220204200333.6383-1-arjun.melkaveri@intel.com>
References: <20220204200333.6383-1-arjun.melkaveri@intel.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_engines: Added out
 fence for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, 2022-02-05 at 01:33 +0530, Arjun Melkaveri wrote:
> Resolved __gem_execbuf error seen, by passing spin->execbuf.rsvd2 >>
> 32.
> As we are creating ctx for each engine .
> Error resolved:-
> (gem_ctx_engines:4117) CRITICAL: Failed assertion:
> __gem_execbuf(i915, &execbuf) == expected
> (gem_ctx_engines:4117) CRITICAL: Failed to report the valid engine
> for slot 0 (valid at 0)
> 
> Introducing IGT_SPIN_FENCE_OUT means we can stop using the
> no-preemption in spinner. Added
> I915_EXEC_FENCE_IN to the execbuf.flags so that it
> is executed after the spinner.
> This is enhancement to the code .
> 
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


