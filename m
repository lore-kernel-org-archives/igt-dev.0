Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716ED6E03D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 02:40:39 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Mon, 12 Apr 2021 02:40:37 +0000
Message-ID: <ef5ba00dac504ad2b09872de578b3a76@intel.com>
References: <20210409182544.1595343-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210409182544.1595343-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add subtest
 description
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
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com> 
Sent: Friday, April 9, 2021 11:56 PM
To: igt-dev@lists.freedesktop.org
Cc: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>; Gupta; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Subject: [PATCH i-g-t] tests/kms_big_fb: Add subtest description

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
The description looks good to me.
Reviewed-by: Nidhi Gupta 

 tests/kms_big_fb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index 5260176e..001673f7 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -673,6 +673,7 @@ igt_main
 	 * and thus the kenrnel rounding up to the next tile
 	 * height won't do anything.
 	 */
+	igt_describe("Sanity check if addfb ioctl fails correctly for given 
+modifier with small bo");
 	for (int i = 1; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb-size-overflow",
 			      modifiers[i].name) {
@@ -681,6 +682,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Sanity check if addfb ioctl fails correctly for given 
+modifier and offsets with small bo");
 	for (int i = 1; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb-size-offset-overflow",
 			      modifiers[i].name) {
@@ -689,6 +691,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Sanity check if addfb ioctl works correctly for given 
+size and strides of fb");
 	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb", modifiers[i].name) {
 			data.modifier = modifiers[i].modifier; @@ -706,6 +709,8 @@ igt_main
 			for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
 				data.rotation = rotations[k].rotation;
 
+				igt_describe("Sanity check if addfb ioctl works correctly for given "
+						"combination of modifier formats and rotation");
 				igt_subtest_f("%s-%dbpp-rotate-%d", modifiers[i].name,
 					      formats[j].bpp, rotations[k].angle) {
 					igt_require(data.format == DRM_FORMAT_C8 ||
--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
