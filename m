Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200508135631.8099-2-janusz.krzysztofik@linux.intel.com>
References: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
 <20200508135631.8099-2-janusz.krzysztofik@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158895996053.30605.3233207844142672435@build.alporthouse.com>
Date: Fri, 08 May 2020 18:46:00 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_nop: Kill obsolete
 pass/fail metric
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2020-05-08 14:56:30)
> Commit 870c774b866c ("igt/gem_exec_nop: Add expectancy of independent
> execution between engines") extended a "basic" subtest (now
> "basic-series") with a pass/fail metric based on comparison of parallel
> execution time to be less than an average * 2.  Since then, that limit
> has been raised quite a few times:
> - by commit 41a26b5152a5 ("igt/gem_exec_nop: Relax parallel assertion
>   for short rings") to maximum + minimum,
> - by commit 7bd4f918c461 ("igt/gem_exec_nop: Explain the parallel
>   execution assertion") to maximum + minimum * 10/9,
> - by commit a0eebbddecaa ("igt/gem_exec_nop: Relax assertion for
>   parallel execution") to sum * 2.
> 
> With the criteria relaxed up to that extent, the purpose of that check
> has been limited to a showcase for an old GuC failure.  Since that is
> now obsolete, kill that assert.
> 
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
