Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8666F10E73A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 22:53:05 +0000 (UTC)
Date: Mon, 10 Oct 2022 15:52:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Lionel G Landwerlin
 <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <Y0SiRgL7sFvXLesm@unerlige-ril>
References: <20221010214215.5378-1-umesh.nerlige.ramappa@intel.com>
 <20221010214215.5378-23-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221010214215.5378-23-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 22/36] lib/i915/perf: indentation fix
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


On Mon, Oct 10, 2022 at 09:42:01PM +0000, Umesh Nerlige Ramappa wrote:
>From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> lib/i915/perf_data_reader.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
>index fcdd5ed1..10e78e63 100644
>--- a/lib/i915/perf_data_reader.c
>+++ b/lib/i915/perf_data_reader.c
>@@ -337,8 +337,8 @@ bool
> intel_perf_data_reader_init(struct intel_perf_data_reader *reader,
> 			    int perf_file_fd)
> {
>-        struct stat st;
>-        if (fstat(perf_file_fd, &st) != 0) {
>+	struct stat st;
>+	if (fstat(perf_file_fd, &st) != 0) {
> 		snprintf(reader->error_msg, sizeof(reader->error_msg),
> 			 "Unable to access file (%s)", strerror(errno));
> 		return false;
>-- 
>2.25.1
>
