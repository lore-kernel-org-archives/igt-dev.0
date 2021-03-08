Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC426E82B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 08:46:34 +0000 (UTC)
Date: Mon, 8 Mar 2021 10:47:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YEXkhTnlwCaFo9Fk@platvala-desk.ger.corp.intel.com>
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
 <20210305164253.11788-2-jcline@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305164253.11788-2-jcline@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] kms_hdr: Skip HDR tests on
 pre-Kaby Lake Intel devices
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
To: Jeremy Cline <jcline@redhat.com>, Swati Sharma <swati2.sharma@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 11:42:52AM -0500, Jeremy Cline wrote:
> According to the Intel documentation[0] I could find, HDR support is
> only in Kaby Lake+. Skip tests in kms_hdr if the hardware doesn't
> support HDR.
> 
> [0] https://www.intel.com/content/dam/support/us/en/documents/graphics/HDR_Intel_Graphics_TechWhitePaper.pdf
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>


While that might be true, strictly speaking IGT tests are not testing
the HW capabilities but the kernel interfaces. The difference is often
only interesting for nitpicking.

However, in this case a good argument can be made either way, with
what the correct behaviour with setting the "max bpc" property when
the HW doesn't support HDR _output_ should be. IGT tests should be
written the way one would expect "real" userspace to behave; does the
documented kernel interface require userspace to detect the device id
somehow? The connector property is there so one would assume setting
it should work and do something.

A good argument can also be made that even though we're testing "just
the interface", we (Intel) should have a separate test that requires
actual HW support...

Swati, Maarten, thoughts on this? Are we even testing the right things
for i915 at all? Are we able to express the HW requirement for HDR
with something other than comparing devid? Should we? (If we should
not, please suggest a better way to get around the issue being fixed
here)


-- 
Petri Latvala




> ---
>  tests/kms_hdr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index e9dd7f27..7617e8a5 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -644,6 +644,12 @@ igt_main
>  		igt_require(data.display.is_atomic);
>  
>  		igt_display_require_output(&data.display);
> +
> +		/* According to Intel documentation, hardware prior to Kaby Lake does
> +		 * not support HDR.
> +		 */
> +		if (is_i915_device(data.fd))
> +			igt_require(AT_LEAST_GEN(intel_get_drm_devid(data.fd), 9));
>  	}
>  
>  	igt_describe("Tests switching between different display output bpc modes");
> -- 
> 2.30.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
