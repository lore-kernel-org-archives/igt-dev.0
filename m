Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 23 Jan 2020 11:21:45 -0800
From: Dale B Stimson <dale.b.stimson@intel.com>
Message-ID: <20200123192143.GA1284@dbstims-dev.fm.intel.com>
References: <cover.1579731227.git.dale.b.stimson@intel.com>
 <76818a8047c4b9da76d0619c7b8f58c89449b4ed.1579731227.git.dale.b.stimson@intel.com>
 <225f88d1044053674cbd632998c69c0c677a530e.1579731227.git.dale.b.stimson@intel.com>
 <157977054018.18920.9879323586181021015@skylake-alporthouse-com>
 <c192e00d-1997-c714-50be-91fc64f9cc29@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c192e00d-1997-c714-50be-91fc64f9cc29@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] DBS: tests/i915/gem_ctx_isolation:
 use the gem_engine_topology library, part 2
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Bommu Krishnaiah <krishnaiah.bommu@intel.com>, "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-01-23 15:59:33, Tvrtko Ursulin wrote:
> gem_context_clone_with_engines was agreed upon in principle some time ago
> but never implemented. I have now posted this as
> https://patchwork.freedesktop.org/series/72464/ and plan to merge it once it
> passes CI.
> 
> Dale, Arjun, Krishnaiah and Sreedhar - you have in progress patches which
> use gem_context_set_all_engines which will be gone and you will need to
> adjust your work accordingly.
> 
> Sreedhar specifically for your change in gem_exec_parallel we will need to
> add a new helper which transfers the engine map from one fd/context to
> another. I will copy you on a patch which will add it.

I have a new iteration of the gem_ctx_isolation patches (on top of your
patch and using gem_context_clone_with_engines) which I will submit to the
ML as soon as your patch merges.

Thanks,
Dale
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
