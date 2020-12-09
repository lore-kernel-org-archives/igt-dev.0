Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA816EAB4
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:25:59 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201209160642.6317-3-anshuman.gupta@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
 <20201209160642.6317-3-anshuman.gupta@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 09 Dec 2020 16:25:55 +0000
Message-ID: <160753115527.595.15173510320238280650@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] i915/i915_pm_rpm.c: create PC state
 subtest group
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Anshuman Gupta (2020-12-09 16:06:38)
> Create a separate igt test group and move package C
> state in to this subgroup.
> Run powertop --auto-tune to tune SOC power configuration
> for package C state tests.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index af55b569..42bc44d9 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -832,6 +832,25 @@ static void basic_subtest(void)
>         /* XXX Also we can test wake up via exec nop */
>  }
>  
> +static bool setup_powertop(void)
> +{
> +       FILE *fp;
> +       char tmp[512];
> +
> +       fp = popen("powertop --auto-tune", "r");

Doesn't this defeat the point of having it work out of the box?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
