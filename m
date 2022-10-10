Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DDC10E73A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 22:56:00 +0000 (UTC)
Date: Mon, 10 Oct 2022 15:55:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0Si+/5keYskNFYQ@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-27-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-27-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 26/36] tools/i915-perf: record
 remaining perf data on exit
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

On Mon, Oct 10, 2022 at 09:42:05PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tools/i915-perf/i915_perf_recorder.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
>index f8f9b737..0c164ef7 100644
>--- a/tools/i915-perf/i915_perf_recorder.c
>+++ b/tools/i915-perf/i915_perf_recorder.c
>@@ -1144,6 +1144,11 @@ main(int argc, char *argv[])
>
> 	fprintf(stdout, "Exiting...\n");
>
>+	if (!write_i915_perf_data(ctx.output_stream, ctx.perf_fd)) {
>+		fprintf(stderr, "Failed to write i915-perf data: %s\n",
>+			strerror(errno));
>+	}
>+	
> 	if (!write_correlation_timestamps(ctx.output_stream, ctx.drm_fd)) {
> 		fprintf(stderr,
> 			"Failed to write final i915 timestamp correlation data: %s\n",
>-- 
>2.25.1
>
