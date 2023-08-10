Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC11110E4B9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:03:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------oLSAl4KlaWJdKwC6wlwjAM2W"
Message-ID: <b11abf0b-259d-b404-47ac-e31b7511f7c7@intel.com>
Date: Thu, 10 Aug 2023 11:32:10 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-9-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230629144910.3055377-9-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V5, i-g-t,
 08/81] tests/chamelium/kms_chamelium_frames: Document each subtest
 for testplan
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

This is a multi-part message in MIME format.
--------------oLSAl4KlaWJdKwC6wlwjAM2W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/29/2023 8:17 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem<bhanuprakash.modem@intel.com>
> ---
>   tests/chamelium/kms_chamelium_frames.c | 101 ++++++++++++++++++++++++-
>   1 file changed, 99 insertions(+), 2 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index a56afada4..698681c4c 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -25,10 +25,10 @@
>    */
>   
>   /**
> - * TEST: Tests to capture frames using chamelium
> + * TEST: kms chamelium frames
>    * Category: Display
> + * Description: Tests requiring a Chamelium board
>    */
> -
>   #include "igt_eld.h"
>   #include "igt_infoframe.h"
>   #include "kms_chamelium_helper.h"
> @@ -547,6 +547,7 @@ static void prepare_randomized_plane(chamelium_data_t *data,
>    * Run type: BAT
>    * Functionality: dp
>    * Mega feature: DP
> + * Driver requirement: any
>    *
>    * SUBTEST: hdmi-crc-fast
>    * Description: Pick the first mode of the IGT base EDID, display and capture
> @@ -555,6 +556,23 @@ static void prepare_randomized_plane(chamelium_data_t *data,
>    * Run type: BAT
>    * Functionality: hdmi
>    * Mega feature: HDMI
> + * Driver requirement: any
> + */
> +
> +/**
> + * SUBTEST: hdmi-%s-formats
> + * Description: Pick the first mode of the IGT base EDID, display and capture a
> + *              few frames, then check captured frames are correct
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + *
> + * arg[1]:
> + *
> + * @crc-nonplanar:     CRC with non planar formats
> + * @cmp-planar:        Compare with planar formats
>    */
>   static const char test_display_one_mode_desc[] =
>   	"Pick the first mode of the IGT base EDID, display and capture a few "
> @@ -592,6 +610,39 @@ static void test_display_one_mode(chamelium_data_t *data,
>   	drmModeFreeConnector(connector);
>   }
>   
> +/**
> + * SUBTEST: vga-frame-dump
> + * Description: For each mode of the IGT base EDID, display and capture a few
> + *              frames, then check captured frames are correct
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: vga
> + * Mega feature: VGA
> + * Driver requirement: any
> + *
> + * SUBTEST: dp-crc-%s
> + * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
> + *              frame(s), then check captured frame(s) are correct
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * SUBTEST: hdmi-crc-%s
> + * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
> + *              frame(s), then check captured frame(s) are correct
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + *
> + * arg[1]:
> + *
> + * @single:    single
> + * @multiple:  multiple
> + */
>   static const char test_display_all_modes_desc[] =
>   	"For each mode of the IGT base EDID, display and capture a few "
>   	"frames, then check captured frames are correct";
> @@ -650,6 +701,27 @@ static void test_display_all_modes(chamelium_data_t *data,
>   	} while (++i < count_modes);
>   }
>   
> +/**
> + * SUBTEST: dp-frame-dump
> + * Description: For each mode of the IGT base EDID, display and capture a few
> + *              frames, then download the captured frames and compare them
> + *              bit-by-bit to the sent ones
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * SUBTEST: hdmi-frame-dump
> + * Description: For each mode of the IGT base EDID, display and capture a few
> + *              frames, then download the captured frames and compare them
> + *              bit-by-bit to the sent ones
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + */
>   static const char test_display_frame_dump_desc[] =
>   	"For each mode of the IGT base EDID, display and capture a few "
>   	"frames, then download the captured frames and compare them "
> @@ -718,6 +790,16 @@ static void test_display_frame_dump(chamelium_data_t *data,
>   	} while (++i < count_modes);
>   }
>   
> +/**
> + * SUBTEST: hdmi-aspect-ratio
> + * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
>
> + *              and check they include the relevant fields
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + */
>   static const char test_display_aspect_ratio_desc[] =
>   	"Pick a mode with a picture aspect-ratio, capture AVI InfoFrames and "
>   	"check they include the relevant fields";
> @@ -798,6 +880,21 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
>   	drmModeFreeConnector(connector);
>   }
>   
> +/**
> + * SUBTEST: hdmi-%s-planes-random
> + * Description: Setup a few overlay planes with random parameters, capture the
> + *              frame and check it matches the expected output
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + *
> + * arg[1]:
> + *
> + * @crc:     CRC check
> + * @cmp:     Compare
> + */
>   static const char test_display_planes_random_desc[] =
>   	"Setup a few overlay planes with random parameters, capture the frame "
>   	"and check it matches the expected output";

1) Same for all chamelium tests, we should have a some identifier for 
getting testlist
    for chamelium test

2) Plane random test is not used now, do we need something additional so 
that we don't run it on CI?

3) Here we can add mega feature as frame integrity


--------------oLSAl4KlaWJdKwC6wlwjAM2W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/2023 8:17 PM, Bhanuprakash
      Modem wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230629144910.3055377-9-bhanuprakash.modem@intel.com">
      <pre class="moz-quote-pre" wrap="">Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <a class="moz-txt-link-rfc2396E" href="mailto:bhanuprakash.modem@intel.com">&lt;bhanuprakash.modem@intel.com&gt;</a>
---
 tests/chamelium/kms_chamelium_frames.c | 101 ++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index a56afada4..698681c4c 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -25,10 +25,10 @@
  */
 
 /**
- * TEST: Tests to capture frames using chamelium
+ * TEST: kms chamelium frames
  * Category: Display
+ * Description: Tests requiring a Chamelium board
  */
-
 #include "igt_eld.h"
 #include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
@@ -547,6 +547,7 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: dp
  * Mega feature: DP
+ * Driver requirement: any
  *
  * SUBTEST: hdmi-crc-fast
  * Description: Pick the first mode of the IGT base EDID, display and capture
@@ -555,6 +556,23 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: hdmi
  * Mega feature: HDMI
+ * Driver requirement: any
+ */
+
+/**
+ * SUBTEST: hdmi-%s-formats
+ * Description: Pick the first mode of the IGT base EDID, display and capture a
+ *              few frames, then check captured frames are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * arg[1]:
+ *
+ * @crc-nonplanar:     CRC with non planar formats
+ * @cmp-planar:        Compare with planar formats
  */
 static const char test_display_one_mode_desc[] =
 	"Pick the first mode of the IGT base EDID, display and capture a few "
@@ -592,6 +610,39 @@ static void test_display_one_mode(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: vga-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then check captured frames are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga
+ * Mega feature: VGA
+ * Driver requirement: any
+ *
+ * SUBTEST: dp-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * arg[1]:
+ *
+ * @single:    single
+ * @multiple:  multiple
+ */
 static const char test_display_all_modes_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then check captured frames are correct";
@@ -650,6 +701,27 @@ static void test_display_all_modes(chamelium_data_t *data,
 	} while (++i &lt; count_modes);
 }
 
+/**
+ * SUBTEST: dp-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Test category: functionality test
+ * Run type: BAT
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ */
 static const char test_display_frame_dump_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then download the captured frames and compare them "
@@ -718,6 +790,16 @@ static void test_display_frame_dump(chamelium_data_t *data,
 	} while (++i &lt; count_modes);
 }
 
+/**
+ * SUBTEST: hdmi-aspect-ratio
+ * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames<pre>
</pre>
+ *              and check they include the relevant fields
+ * Test category: functionality test
+ * Run type: BAT
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ */
 static const char test_display_aspect_ratio_desc[] =
 	"Pick a mode with a picture aspect-ratio, capture AVI InfoFrames and "
 	"check they include the relevant fields";
@@ -798,6 +880,21 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: hdmi-%s-planes-random
+ * Description: Setup a few overlay planes with random parameters, capture the
+ *              frame and check it matches the expected output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * arg[1]:
+ *
+ * @crc:     CRC check
+ * @cmp:     Compare
+ */
 static const char test_display_planes_random_desc[] =
 	"Setup a few overlay planes with random parameters, capture the frame "
 	"and check it matches the expected output";</pre>
    </blockquote>
    <p>
      1) Same for all chamelium tests, we should have a some identifier
      for getting testlist<br>
         for chamelium test<br>
      <br>
      2) Plane random test is not used now, do we need something
      additional so that we don't run it on CI?</p>
    <p>3) Here we can add mega feature as frame integrity<br>
    </p>
    <br>
  </body>
</html>

--------------oLSAl4KlaWJdKwC6wlwjAM2W--
