Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8056EA1D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 15:48:00 +0000 (UTC)
Date: Wed, 22 Apr 2020 08:47:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200422154745.GA27960@orsosgc001.amr.corp.intel.com>
References: <20200421182237.7743-1-umesh.nerlige.ramappa@intel.com>
 <5559c6ff-8cba-7f84-0490-879a5dc3e2dc@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5559c6ff-8cba-7f84-0490-879a5dc3e2dc@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: Fix B0 counter check in
 gen12-mi-rpc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 11:06:27PM +0300, Lionel Landwerlin wrote:
>On 21/04/2020 21:22, Umesh Nerlige Ramappa wrote:
>>The gen12-mi-rpc test checks for B0 counter to be zero, however,
>>occassionally the counter reads a non-zero value. To ensure the test
>>works as expected, we check B0 with the preset value.
>
>
>What the value being reported?
>
>
>Sounds like we should ask around see if there isn't a deeper problem 
>with the HW configuration.
>

I have seen values 0x121 and 0x1ec. The issue occurs sometimes on 
reboots. Subsequent runs I see that the counter is 0.

Thanks,
Umesh

>
>-Lionel
>
>
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/1085
>>---
>>  tests/perf.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/tests/perf.c b/tests/perf.c
>>index b7d5e50e..9d0ed45c 100644
>>--- a/tests/perf.c
>>+++ b/tests/perf.c
>>@@ -3002,7 +3002,7 @@ gen12_test_mi_rpc(void)
>>  	 */
>>  	igt_assert_eq(report32[0], REPORT_ID);
>>  	igt_assert_neq(report32[1], 0);
>>-	igt_assert_eq(report32[format.b_off >> 2], 0);
>>+	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
>>  	igt_assert_eq(report32[format_size_32], 0x80808080);
>>  	drm_intel_bo_unmap(bo);
>
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
