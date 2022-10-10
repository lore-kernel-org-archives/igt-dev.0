Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6310E730
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 22:08:21 +0000 (UTC)
Date: Mon, 10 Oct 2022 15:08:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0SXxja+OThZ6Tm9@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-20-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-20-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 19/36] lib/i915/perf: fixup report
 validity
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

On Mon, Oct 10, 2022 at 09:41:58PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>It appears that on Gfx12+ there is no more validity bit in the
>reports.
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/i915/perf_data_reader.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
>index e69189ac..857bcd3a 100644
>--- a/lib/i915/perf_data_reader.c
>+++ b/lib/i915/perf_data_reader.c
>@@ -45,13 +45,14 @@ oa_report_ctx_is_valid(const struct intel_perf_devinfo *devinfo,
> {
> 	const uint32_t *report = (const uint32_t *) _report;
>
>-	if (devinfo->graphics_ver < 8) {
>+	if (devinfo->graphics_ver < 8)
> 		return false; /* TODO */
>-	} else if (devinfo->graphics_ver == 8) {
>+	if (devinfo->graphics_ver >= 12)
>+		return true; /* Always valid */
>+	if (devinfo->graphics_ver == 8)
> 		return report[0] & (1ul << 25);
>-	} else if (devinfo->graphics_ver > 8) {
>+	if (devinfo->graphics_ver > 8)
> 		return report[0] & (1ul << 16);
>-	}
>
> 	return false;
> }
>-- 
>2.25.1
>
