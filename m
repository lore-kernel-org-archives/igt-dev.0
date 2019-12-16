Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <24ba122e-1213-f230-86b5-152b916833b3@intel.com>
References: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
 <3b79edfe-673a-9cb7-d8a0-7bf5b54748c8@intel.com>
 <157649017142.2285.5855880084447200659@skylake-alporthouse-com>
 <24ba122e-1213-f230-86b5-152b916833b3@intel.com>
Message-ID: <157649101281.2285.10436268369123568391@skylake-alporthouse-com>
Date: Mon, 16 Dec 2019 10:10:12 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Skip OA testing on systems
 too old
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2019-12-16 10:06:53)
> On 16/12/2019 11:56, Chris Wilson wrote:
> 
>     Quoting Lionel Landwerlin (2019-12-16 09:46:56)
> 
>         On 16/12/2019 11:34, Chris Wilson wrote:
> 
>             Don't flat out fail if the system doesn't support OA, just skip.
> 
>             Closes: https://gitlab.freedesktop.org/drm/intel/issues/834
>             Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>             ---
>               tests/perf.c | 4 +---
>               1 file changed, 1 insertion(+), 3 deletions(-)
> 
>             diff --git a/tests/perf.c b/tests/perf.c
>             index f5dd6051e..12f552743 100644
>             --- a/tests/perf.c
>             +++ b/tests/perf.c
>             @@ -884,11 +884,9 @@ init_sys_info(void)
>                   const char *test_set_uuid = NULL;
>                   char buf[256];
> 
>             -     igt_assert_neq(devid, 0);
>             -
>                   timestamp_frequency = get_cs_timestamp_frequency();
>                   igt_debug("timestamp_frequency = %lu\n", timestamp_frequency);
>             -     igt_assert_neq(timestamp_frequency, 0);
>             +     igt_require(timestamp_frequency);
> 
> 
>         This requires a kernel version more recent (4.16) than when perf support
>         was added (4.13).
> 
>         Is this what you intended?
> 
>     You have a fatal assert there. I am just changing it so that it skips
>     when not supported as no testing is being performed.
>     -Chris
> 
> I think there might be a problem in i915 if this returns 0.
> 
> When I added this param I went back and figured the value for each platform.
> 
> What kind of machine is fi-blb-e6850? The number looks like a skylake.

Bearlake-B, gen3.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
